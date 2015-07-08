require 'rails_helper'

feature "As a visitor
I want to upload a video
so that they are saved to a database" do
  scenario "upload clip" do
  visit new_video_path

  attach_file "Clip", "#{Rails.root}/spec/suport/images/sample_vid.mov"

  click_button "Submit"

  expect(Video.first.clip.file.filename).to eq("sample_vid.mov")
  end
end
