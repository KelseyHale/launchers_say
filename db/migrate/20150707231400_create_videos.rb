class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :clip, null: false

      t.timestamp null: false
    end
  end
end
