def input_students
  students = []
  puts ("_"*50)
  puts "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  puts ("_"*50)
  puts "Students name?".center(50); name = gets.chop.capitalize.to_sym
    while !name.empty? do
      puts "Cohort?".center(50)
        cohort = gets.chop.capitalize.to_sym
          if cohort.empty? ; cohort = "Cohort tbc" end
            puts "Country of birth?".center(50) ; country = gets.chop.to_sym
            students << {name: name, cohort: cohort, country: country}
            puts "Will #{name} be attending the #{cohort} cohort?".center(50)
            puts "Hit return to confirm or type no to change:".center(50) ; typo = gets.chop.downcase
          if typo == "no" ; puts "Correct cohort?".center(50); cohort = gets.chop.capitalize.to_sym end
        puts "Now we have #{students.count} students".center(50)
      puts "Hit return to finish or add another name:".center(50) ; name = gets.chop.to_sym
    end
  students
end
def print_header
  puts "The Students of Villains Academy".center(50)
  puts ("_"*50)
end
def print(students)
  if students.empty? || students == nil
    puts ""
      puts "No students on file\n".center(50)
        else list_by_month = students.group_by {|input| input[:cohort]}
          puts "Students listed by cohort:".center(50)
            list_by_month.map do |key, value|
            puts "#{key}"
          for index in 0..value.size-1 do
        puts "#{index+1}. #{value[index][:name]}, #{value[index][:country]}"
      end
    end
  end
end
def print_footer(students)
  if students.count == 0
    return
      elsif students.count == 1
        puts ""
          puts "We have a great student".center(50)
            puts ("_"*50)
          else
        puts ""
      puts "Overall, we have #{students.count} great students".center(50)
    puts ("_"*50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
