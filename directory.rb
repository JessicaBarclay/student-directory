@students = []

def input_students
  puts ("_"*50)
  puts "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  name = gets.chop.capitalize.to_sym
    while !name.empty? do
      puts "Cohort?".center(50)
      cohort = gets.chop.capitalize.to_sym
      if cohort.empty? ; cohort = "Cohort tbc" end
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students".center(50)
      puts "Hit return to finish or add another name:".center(50)
      name = gets.chop.to_sym
    end
end
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end
def show_students
  print_header
  print_students_list
  print_footer
end
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "Try again"
  end
end
def print_header
  puts "The Students of Villains Academy".center(50)
  puts ("_"*50)
end
def print_students_list
  if @students.empty? || @students == nil
    puts ""
    puts "No students on file\n".center(50)
    else list_by_month = @students.group_by {|input| input[:cohort]}
      puts "Students listed by cohort:".center(50)
    list_by_month.map do |key, value|
      puts "#{key}"
      for index in 0..value.size-1 do
      puts "#{index+1}. #{value[index][:name]}"
    end
    end
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

interactive_menu
