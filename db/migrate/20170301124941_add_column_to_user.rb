class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :my_threads, :user_id, :int, null: false
    add_column :comments, :user_id, :int, null: false
  end
end
