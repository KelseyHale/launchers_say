class VideosController < ApplicationController
  def index
    @videos = Video.all
    @clips_array = clips_array
    binding.pry
  end

  def clips_array
    @array = []
    @videos.each do |v|
      @array << v.clip
    end
    @array
  end

  def new
    @videos = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      uploader = ClipUploader.new
      uploader.store!(@video)
      flash[:notice] = "Video saved"
      redirect_to videos_path
    else
      flash[:alert] = @video.errors.full_messages.join(". ")
      render :new
    end
  end

  protected

  def video_params
    params.require(:video).permit(:clip)
  end
end
