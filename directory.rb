@students = []

def print_menu_options
  puts "1. Input the students", "2. Show the students"
  puts "3. Save to students.csv", "4. Load from students.csv", "9. Exit"
end
def interactive_menu
  load_on_startup
  loop do
    print_menu_options
    process(STDIN.gets.chomp)
  end
end
def process(selection)
  case selection
  when "1" ; input_students ; when "2" ; show_students
  when "3" ; save_to_students_file ; when "4" ; load_students_file
  when "9" ; exit ; else "Try again" end
end
def array_list
  @students << {name: @name, cohort: @cohort}
end
def input_students
  puts "_"*50, "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  @name = STDIN.gets.chop.capitalize.to_sym
    while !@name.empty? do
      puts "Cohort?".center(50)
      @cohort = STDIN.gets.chop.capitalize.to_sym
      if @cohort.empty? ; @cohort = "Cohort tbc" end
      array_list
      puts "Now we have #{@students.count} students".center(50)
      puts "Hit return or add another name:".center(50)
      @name = STDIN.gets.chop.to_sym
    end
end
def show_students
  print_header ; print_students_list ; print_footer
end
def print_header
  puts "The Students of Villains Academy".center(50), "*"*50
end
def print_students_list
  @students.each_with_index do |student, i|
    puts "#{i+1}.#{student[:name]}, #{student[:cohort]}"
  end
end
def print_footer
  if @students.count == 0 ; return
  elsif @students.count == 1
    puts "","We have a great student!".center(50)
  else
    puts "","We have #{@students.count} great students!".center(50)
  end
end
def save_to_students
  puts "Data saved".center(50), ""
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students_file(filename="students.csv")
  puts "Data loaded, hit 2 to view".center(50), ""
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    array_list
  end
  file.close
end
def load_on_startup
  if ARGV.empty? ; load_students_file end
end

interactive_menu

# def default_load_file
#   filename = ARGV.first
#   return if filename.nil?
#   if File.exists?(filename)
#     load_students_file(filename)
#     puts "Loaded #{@students.count} from #{filename}"
#   else
#     puts "Sorry, #{filename} doesn't exist"
#   end
# end
