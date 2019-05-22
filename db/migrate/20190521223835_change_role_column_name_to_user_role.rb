class ChangeRoleColumnNameToUserRole < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :role, :user_role
  end
end
