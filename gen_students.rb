require 'json'
require 'faker'

#Number of fake students to generate
num_students = 100

#ID variable could be useful if you need to track individual students
#Currently not used in the JSON file
id = 0

#File where the data will be written
path_to_write = "fake/students.json"

#If there is no fake directory, we need to make one
Dir.mkdir("fake") unless File.exists?("fake/")

File.open(path_to_write, "w") do |f|
  while id < num_students
    # Generate student data
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    #Hash of a student, used to make a JSON object
    temp_student_hash = {
      "student_id" => Faker::Number.unique.number(11),
      "campus_id" => Faker::Number.unique.number(16),
      "name" =>  first_name + " " + last_name,
      "first_name" => first_name,
      "last_name" => last_name,
      "email" => first_name.downcase + last_name.downcase.gsub("'", "") + "@berkeley.edu",
      "phone" => Faker::PhoneNumber.phone_number
      # Any other attributes can be added here
    }
    #Student hash is written to the JSON file
    f.write(JSON.pretty_generate(temp_student_hash))
    f.write("\n")
    id += 1
  end
end
