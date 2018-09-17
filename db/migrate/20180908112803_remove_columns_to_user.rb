class RemoveColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tel_no, :string
    remove_column :users, :gender, :integer
    remove_column :users, :website, :text
    remove_column :users, :profile, :text
  end
end
