@students = []

def print_menu_options
  puts "", "1. Input students", "2. List students" , "3. List by cohort"
  puts "4. Save file" , "5. Load file", "9. Exit"
end
def interactive_menu
  load_startup_option
  loop do
    print_menu_options
    process(STDIN.gets.chomp)
  end
end
def process(selection)
  case selection
  when "1" ; input_students ; when "2" ; show_students
  when "3" ; print_by_cohort ; when "4" ; save_to_file
  when "5" ; load_file ; when "9" ; exit
  else "Try again" end
end
def student_list_array
  @students << {name: @name, cohort: @cohort}
end
def input_students
  puts "_"*50,"","Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  @name = STDIN.gets.chop.capitalize.to_sym
    while !@name.empty? do
      puts "Cohort?".center(50)
      @cohort = STDIN.gets.chop.capitalize.to_sym
      if @cohort.empty? ; @cohort = "Cohort tbc" end
      student_list_array
      puts "Now we have #{@students.count} students".center(50)
      puts "Hit return or add another name:".center(50)
      @name = STDIN.gets.chop.capitalize.to_sym
    end
end
def show_students
  print_header ; print_students_list ; print_footer
end
def print_header
  puts "","The Students of Villains Academy".center(50),"","*"*50
end
def print_students_list
  @students.each_with_index do |student, i|
    puts "#{i+1}.#{student[:name]}, #{student[:cohort]}"
  end
end
def print_footer
  if @students.count == 0 ; return
    elsif @students.count == 1 ; puts "We have a great student!".center(50)
    else puts "We have #{@students.count} great students!".center(50)
  end
end
def print_by_cohort
  list_by_cohort = @students.group_by {|input| input[:cohort]}
  puts "Students listed by cohort:".center(50), ""
    list_by_cohort.map do |key, value|
      puts "#{key}"
      for index in 0..value.size-1 do
      puts "#{index+1}. #{value[index][:name]}"
    end
  end
end
def save_to_file
  puts "Save file as:".center(50)
  filename = STDIN.gets.chomp
  file = File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
    end
  puts "Saved: #{filename}".center(50)
end
def load_file
  puts "Load file:".center(50), ""
  filename = STDIN.gets.chomp
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(",")
      student_list_array
    end
  end
  puts "Loaded: #{filename}".center(50)
end
def load_default(filename="students.csv")
  puts "","'#{filename}' loaded by default".center(50), ""
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(",")
      student_list_array
    end
  end
end
def load_startup_option
  filename = ARGV.first
  if filename.nil? || filename.empty? ; load_default
  else puts "","'#{filename}' loaded".center(50), ""
    file = File.open(filename, "r") do |file|
      file.readlines.each do |line|
        @name, @cohort = line.chomp.split(",")
        student_list_array
      end
    end
  end
end

interactive_menu
