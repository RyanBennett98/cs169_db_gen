require 'json'
require 'faker'

num_students = 100
id = 0

path_to_write = "fake/students.json"

Dir.mkdir("fake") unless File.exists?("fake/")
File.open(path_to_write, "w") do |f|
  while id < num_students
    # Generate student data
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    temp_student_hash = {
      "id" => "%03d" % [id],
      "student_id" => Faker::Number.number(11),
      "campus_id" => Faker::Number.number(16),
      "name" =>  first_name + " " + last_name,
      "email" => first_name.downcase + last_name.downcase.gsub("'", "") + "@berkeley.edu",
      "phone" => Faker::PhoneNumber.phone_number
      # Add other attributes too
    }
    f.write(JSON.pretty_generate(temp_student_hash))
    f.write("\n")
    id += 1
  end
end

