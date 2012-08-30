class AddFacebookIdIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, :facebook_id
  end
end
