# lets put all the students in an array 
def input_students
  puts "Please enter students info"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "name: "
  name = gets.chomp
  puts "hobby "
  hobby = gets.chomp
  puts "country_of_birth"
  country_of_birth = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth: country_of_birth, }
    puts "now we have #{students.count} students"
    # get another name from the user
    puts "Enter another student"
    puts "name:"
    name = gets.chomp
    puts "hobby:"
    hobby = gets.chomp
    puts "country of birth:"
    country_of_birth = gets.chomp
  end
  #return the array of students
  students
end

def print(students)
  # printing the students with each
  # students.each_with_index do |student, num|
  #   if student[:name][0] == "M" && student[:name].length < 12
  #     puts "#{num + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
  
  # printing the students with a loop
  count = 0
  until count == students.length
    puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort,
    hobby: #{students[count][:hobby]}, country of birth: #{students[count][:country_of_birth]})"
    count += 1
  end
end

def print_header
  puts "The students of villain academy"
  puts "-------------".to_s.center(30)
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Normon Bates", cohort: :november}
#   ]


# # nothing happens until we call the methods
