# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
src = "fake/students.json"

s_arr = JSON.parse(File.read(src))

s_arr.each do |student|
  User.create!(UC_SRCH_CRIT: student["UC_SRCH_CRIT"],
               STUDENT_ID: student["STUDENT_ID"],
               CAMPUS_ID: student["CAMPUS_ID"],
               OPRID: student["OPRID"],
               LAST_NAME:  student["LAST_NAME"],
               FIRST_NAME:  student["FIRST_NAME"],
               MIDDLE_NAME:  student["MIDDLE_NAME"],
               UC_PRF_FIRST_NM:  student["UC_PRF_FIRST_NM"],
               UC_PRF_MIDDLE_NM:  student["UC_PRF_MIDDLE_NM"],
               EMAIL_ADDR: student["EMAIL_ADDR"],
               ACAD_PROG: student["ACAD_PROG"])
end