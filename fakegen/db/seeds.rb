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
  User.create!(student_id: Faker::Number.number(11),
               campus_id: Faker::Number.number(16),
               name: first_name + " " + last_name,
               email: first_name.downcase + last_name.downcase.gsub("'", "") + "@berkeley.edu",
               phone: Faker::PhoneNumber.phone_number)
end