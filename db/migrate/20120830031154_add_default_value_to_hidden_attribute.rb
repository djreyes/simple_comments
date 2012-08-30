class AddDefaultValueToHiddenAttribute < ActiveRecord::Migration
  def up
    change_column :comments, :hidden, :boolean, default: false
  end
  
  def down
    change_column :comments, :hidden, :boolean, default: nil
  end
end
