class AddReplyIdToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :reply_id, :integer
  end
end
