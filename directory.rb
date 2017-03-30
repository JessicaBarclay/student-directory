@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    exit
  else
    puts "Try again"
  end
end
def input_students
  puts ("_"*50)
  puts "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  name = STDIN.gets.chop.capitalize.to_sym
    while !name.empty? do
      puts "Cohort?".center(50)
      cohort = STDIN.gets.chop.capitalize.to_sym
      if cohort.empty? ; cohort = "Cohort tbc" end
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students".center(50)
      puts "Hit return or add another name:".center(50)
      name = STDIN.gets.chop.to_sym
    end
end
def show_students
  print_header
  print_students_list
  print_footer
end
def print_header
  puts "The Students of Villains Academy".center(50)
  puts ("_"*50)
end
def print_students_list
  @students.each_with_index do |student, i|
    puts "#{i + 1}.#{student[:name]}, #{student[:cohort]}"
  end
end
def print_footer
  if @students.count == 0
    return
  elsif @students.count == 1
    puts ""
    puts "We have a great student".center(50)
    puts ("_"*50)
  else
    puts ""
    puts "Overall, we have #{@students.count} great students".center(50)
    puts ("_"*50)
  end
end
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort}
  end
  file.close
end
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

try_load_students
interactive_menu
