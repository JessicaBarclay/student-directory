def input_students
  students = []
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50) ; name = gets.chomp.capitalize
  puts "Any hobbies?".center(50) ; hobbies = gets.chomp.capitalize
  puts "Country of birth?".center(50) ; country = gets.chomp.capitalize
  puts "Height in cm?".center(50) ; height = gets.chomp
    while !name.empty? do
      students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
      puts "Now we have #{students.count} students, add another?".center(50) ; name = gets.chomp
      puts "Any hobbies?".center(50) ; hobbies = gets.chomp.capitalize
      puts "Country of birth?".center(50) ; country = gets.chomp.capitalize
      puts "Height in cm?".center(50) ; height = gets.chomp
    end
  students
end
def print_header
  puts "The students of Villains Academy".center(50)
  puts "__________________________________________________"
end
def print(students)
  total = students.count
  i = 0
    while total > 0
    puts "Name: #{students[i][:name]}
    Cohort: #{students[i][:cohort]}
    Hobbies: #{students[i][:hobbies]}
    Country: #{students[i][:country]}
    Height: #{students[i][:height]}".center(50)
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
