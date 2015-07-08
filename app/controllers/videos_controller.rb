class VideosController < ApplicationController
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
