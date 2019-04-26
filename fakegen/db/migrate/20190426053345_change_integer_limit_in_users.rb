class ChangeIntegerLimitInUsers < ActiveRecord::Migration
  def change
    change_column :users, :student_id, :integer, limit: 8
    change_column :users, :campus_id, :integer, limit: 8
  end
end
