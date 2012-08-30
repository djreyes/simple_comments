class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :facebook_id
      t.string :message
      t.boolean :hidden

      t.timestamps
    end
  end
end
