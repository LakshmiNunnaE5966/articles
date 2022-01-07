class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :article, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :articles
    add_foreign_key :users, :comments
  end
end
