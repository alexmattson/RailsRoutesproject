class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps null: false
      t.string :username, null: false

    end

    add_index :users, :username, unique: true
  end
end
