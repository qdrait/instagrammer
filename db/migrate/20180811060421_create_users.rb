class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :tel_no
      t.integer :gender
      t.text :website
      t.text :profile
      t.text :image

      t.timestamps
    end
  end
end
