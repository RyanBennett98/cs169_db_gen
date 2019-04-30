#!/usr/bin/ruby

require 'sqlite3'
require 'faker'

begin

    db = SQLite3::Database.new "fake.db"
    result = db.execute <<-SQL
    CREATE TABLE CLC_STDNT_LOOKUP_V00_VW (
      UC_SRCH_CRIT VARCHAR(92),
      STUDENT_ID VARCHAR(11),
      CAMPUS_ID VARCHAR(30),
      OPRID VARCHAR(30),
      LAST_NAME VARCHAR(30),
      FIRST_NAME VARCHAR(30),
      MIDDLE_NAME VARCHAR(30),
      UC_PRF_FIRST_NM VARCHAR(30),
      UC_PRF_MIDDLE_NM VARCHAR(30),
      EMAIL_ADDR VARCHAR(70),
      ACAD_PROG VARCHAR(4000)
    );
    SQL


rescue SQLite3::Exception => e

    puts "Exception occurred"
    puts e

ensure
    db.close if db
end
