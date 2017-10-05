class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  # Rails uses method "add_index" to add an index on the email column
  # of the users table. Option unique: true forces uniqueness
    add_index :users, :email, unique: true
  end
end
