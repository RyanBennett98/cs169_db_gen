# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

num_students = 100

num_students.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  middle_name = Faker::Name.middle_name
  User.create!(UC_SRCH_CRIT: first_name + " " + last_name,
               STUDENT_ID: Faker::Number.unique.number(11),
               CAMPUS_ID: Faker::Number.unique.number(30),
               OPRID: Faker::Number.unique.number(30),
               LAST_NAME:  last_name,
               FIRST_NAME:  first_name,
               MIDDLE_NAME:  middle_name,
               UC_PRF_FIRST_NM:  first_name,
               UC_PRF_MIDDLE_NM:  middle_name,
               EMAIL_ADDR: first_name.downcase + last_name.downcase.gsub("'", "") + "@berkeley.edu",
               ACAD_PROG: Faker::Job.education_level)
end