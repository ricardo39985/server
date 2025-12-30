class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    # This line tells Rails the primary key 'id' IS a uuid
    create_table :users, id: :uuid do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :profile_picture_key
      t.text :bio

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
