class CreateUsersFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_followers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :follower, null: false

      t.timestamps
    end

    add_foreign_key :users_followers, :users, column: :follower_id
    add_index :users_followers, [:user_id, :follower_id], unique: true
  end
end
