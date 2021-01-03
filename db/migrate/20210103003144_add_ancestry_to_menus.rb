class AddAncestryToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :ancestry, :string
    add_index :menus, :ancestry
  end
end
