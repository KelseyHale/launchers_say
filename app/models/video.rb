class Video < ActiveRecord::Base
  validates :clip, presence: true

  mount_uploader :clip, ClipUploader
end
