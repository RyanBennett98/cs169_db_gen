require 'json'
require 'faker'

num_students = 100
id = 0

path_to_write = "fake/students.json"

Dir.mkdir("fake") unless File.exists?("fake/")

students = Array.new

while id < num_students
  # Generate student data
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  middle_name = Faker::Name.middle_name
  temp_student_hash = {     
    "UC_SRCH_CRIT" => first_name + " " + last_name,
    "STUDENT_ID" => Faker::Number.unique.number(11),
    "CAMPUS_ID" => Faker::Number.unique.number(30), 
    "OPRID" => Faker::Number.unique.number(30),
    "LAST_NAME" =>  last_name,
    "FIRST_NAME" =>  first_name,
    "MIDDLE_NAME" =>  middle_name,
    "UC_PRF_FIRST_NM" =>  first_name,
    "UC_PRF_MIDDLE_NM" =>  middle_name,
    "EMAIL_ADDR" => first_name.downcase + last_name.downcase.gsub("'", "") + "@berkeley.edu",
    "ACAD_PROG" => Faker::Job.education_level
  }
  students << temp_student_hash
  id += 1
end

File.open(path_to_write, "w") do |f|
    f.write(JSON.pretty_generate(students))
end

