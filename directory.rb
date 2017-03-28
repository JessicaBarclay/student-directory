def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice" ; name = gets.chomp.capitalize
  puts "Any hobbies?" ; hobbies = gets.chomp.capitalize
  puts "Country of birth?" ; country = gets.chomp.capitalize
  puts "Height in cm?" ; height = gets.chomp
    while !name.empty? do
      students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
      puts "Now we have #{students.count} students, add another?" ; name = gets.chomp
      puts "Any hobbies?" ; hobbies = gets.chomp.capitalize
      puts "Country of birth?" ; country = gets.chomp.capitalize
      puts "Height in cm?" ; height = gets.chomp
    end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "________________________________"
end
def print(students)
  total = students.count
  i = 0
    while total > 0
    puts "Name: #{students[i][:name]} Cohort: #{students[i][:cohort]} Hobbies: #{students[i][:hobbies]} Country: #{students[i][:country]} Height: #{students[i][:height]}"
    total -= 1
    i += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
