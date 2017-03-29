def input_students
  students = []
  puts ("_"*50)
  puts "Please enter the students information".center(50)
  puts  "To finish, just hit return twice".center(50)
  puts
  puts "Students name?".center(50); name = gets.chop.capitalize.to_sym
    while !name.empty? do
      puts "Students cohort?".center(50) ; cohort = gets.chop.capitalize.to_sym
      if cohort.empty? ; cohort = "N/A" end
      puts "Country of birth?".center(50) ; country = gets.chop.to_sym
      students << {name: name, cohort: cohort, country: country}
      puts "Confirm name: '#{name}' by typing yes or no" ; typo = gets.chop.downcase
      if typo == "no" ; puts "Students name?".center(50); name = gets.chop.capitalize.to_sym end
      puts "Now we have #{students.count} students".center(50)
      puts "Hit return or add another name:".center(50) ; name = gets.chop.to_sym
    end
  students
end
def print_header
  puts "The Students of Villains Academy".center(50)
  puts ("_"*50)
end
def print(students)
  list_by_month = students.group_by {|input| input[:cohort]}
    puts "Students listed by cohort:".center(50)
      list_by_month.map do |key, value|
        puts "#{key}"
        for index in 0..value.size-1 do
      puts "#{index+1}. #{value[index][:name]}, #{value[index][:country]}"
    end
  end
end
def print_footer(students)
  if students.count == 1
    puts "Overall, we have a great student"
    puts ("_"*50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
    puts ("_"*50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
