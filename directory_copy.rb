# months array
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
  puts "Enter your cohort"
  cohort = gets.chomp.capitalize
  if cohort.empty? 
    cohort = :Secret
  end
  # while name is not empty, repeat this code
  while !name.empty? do
    valid_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", :Secret]
    until valid_months.include? cohort
      puts "Wrong spelling try again"
      cohort = gets.chomp.capitalize
      if cohort.empty? 
        cohort = :Secret
      end
    end
    #add the student hash to the array
    students << { name: name, cohort: cohort.to_sym, hobby: hobby, country_of_birth: country_of_birth }
    puts "now we have #{students.count} students"
    # get another name from the user
    puts "Enter another student"
    puts "name:"
    name = gets.chomp
    break if name.empty?
    puts "hobby:"
    hobby = gets.chomp
    puts "country of birth:"
    country_of_birth = gets.chomp
    puts "Enter your cohort"
    cohort = gets.chomp.capitalize
    if cohort.empty? 
      cohort = :Secret
    end
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
  # count = 0
  # until count == students.length
  #   if student[:name][0] == "M" && student[:name].length < 12
  #     puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort, hobby: #{students[count][:hobby]}, country of birth: #{students[count][:country_of_birth]})"
  #     count += 1
  #   end
  # end
  
  students_by_cohort = students.group_by { |student| student[:cohort] }
  
  students_by_cohort.each do |cohort, students|
    puts "Students in #{cohort} cohort"
      students.each_with_index do |student, num|
        puts "#{num + 1}. #{student[:name]} (#{student[:cohort]} cohort, hobby: #{student[:hobby]}, country of birth: #{student[:country_of_birth]})"
      end
  end
end

def print_header
  puts "The students of villain academy"
  puts "-------------".to_s.center(30)
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  else 
    puts "Overall, we have #{names.count} great student"
  end
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
