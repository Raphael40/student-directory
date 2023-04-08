@students = []
  
# lets put all the students in an array 
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    append(name)
    puts "Name has been entered"
    puts "now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def append(name, cohort = :november)
  @students << {name: name, cohort: cohort}
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_header
  puts "The students of villain academy"
  puts "-------------"
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def save_students
  # Ask for filename
  puts "What would you like to name your file, press enter to use student.csv default name"
  file_name = gets.chomp
  if file_name.empty?
    file_name = "students.csv"
  end
  # open the file for writing
  file = File.open(file_name, "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students have been saved"
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students
  puts "Available student data files:"
  Dir.glob("*.csv") { |file| puts file }
  puts "Specify which one you would like to load"
  filename = gets.chomp
  filename = "students.csv" if filename.empty?
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    append(name, cohort.to_sym)
  end
  file.close
  puts "Student files have been loaded"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list of students from a file"
    puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # This will cause the program to terminate
    else 
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu