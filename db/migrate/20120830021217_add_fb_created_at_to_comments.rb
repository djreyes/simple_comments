class AddFbCreatedAtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :fb_created_at, :datetime
  end
end
