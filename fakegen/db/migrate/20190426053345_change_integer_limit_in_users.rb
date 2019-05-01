class ChangeIntegerLimitInUsers < ActiveRecord::Migration
  def change
    change_column :users, :STUDENT_ID, :integer, limit: 16
    change_column :users, :CAMPUS_ID, :integer, limit: 16
    change_column :users, :OPRID, :integer, limit: 16
  end
end
