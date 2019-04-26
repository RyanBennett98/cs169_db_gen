class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :student_id, :limit => 8
      t.integer :campus_id, :limit => 8
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
