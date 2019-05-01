class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :UC_SRCH_CRIT
      t.integer :STUDENT_ID
      t.integer :CAMPUS_ID
      t.integer :OPRID
      t.string :LAST_NAME
      t.string :FIRST_NAME
      t.string :MIDDLE_NAME
      t.string :UC_PRF_FIRST_NM
      t.string :UC_PRF_MIDDLE_NM
      t.string :EMAIL_ADDR
      t.string :ACAD_PROG

      t.timestamps null: false
    end
  end
end
