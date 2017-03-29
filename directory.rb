def input_students
  students = []
  puts "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  puts # format purposes
  puts "Students name?".center(50); name = gets.chomp.capitalize.to_sym
    while !name.empty? do
      puts "Students cohort?".center(50) ; cohort = gets.chomp.capitalize.to_sym
      if cohort.empty? ; cohort = "April" end # default value for cohort
      puts "Any hobbies?".center(50) ; hobbies = gets.chomp.capitalize.to_sym
      puts "Country of birth?".center(50) ; country = gets.chomp.upcase.to_sym
      puts "Height in cm?".center(50) ; height = gets.chomp.to_sym
      students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
      puts "Confirm name: #{name} by typing yes or no" ; typo = gets.chomp.downcase # chance for user to check/change name
      if typo == "no" ; puts "Students name?".center(50); name = gets.chomp.capitalize.to_sym end
      puts "Now we have #{students.count} students, add another?".center(50) ; name = gets.chomp.to_sym
    end
  students
end
def print_header
  puts "The Students of Villains Academy".center(50)
  puts ("_"*50)
end
def print(students)
  total = students.count
  i = 0
  while total > 0
    puts "Name: #{students[i][:name]} Cohort: #{students[i][:cohort]}"
    puts "Hobbies: #{students[i][:hobbies]}"
    puts "Country: #{students[i][:country]}"
    puts "Height: #{students[i][:height]}"
    puts ("_"*50)
    total -= 1
    i += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
