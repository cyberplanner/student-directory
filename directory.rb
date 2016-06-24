# Adding a method for user ineraction/user input
def input_students
  puts "Please enter the names of the student:"
  puts "To finish, just hit return twice"
  # the array in which the input is gonna be saved
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not 'empty?', repeat this code
  while !name.empty? do
    # Add the student hash to the array with a cohort hash
    students << {name: name, cohort: :november}
    # then puts the number of students/entries in the students array 
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

#Print each element in the array(array containing the name in [0] and the cohort in [1]) by iterating over the array

def print students
  counter = 1
  while counter < students.length
    students.map do |student|
    puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
    counter += 1
    end
  end
  
#  students.each_with_index do |student, number|
#    puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#  end
end

#finally, we print the total number of students
def print_footer students
  puts "Overall, we have #{students.count} great students".center(70)
end

#print the students whose name begins with a specific letter.
def print_students_begin_with students
  puts "To print students whose names begins with a letter, please enter a letter: "
  letter = gets.chomp
  students.each_with_index do |student, number|
    if student[:name].chars.first.downcase == letter.downcase
      puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
    end
  end
end

# only print the students whose name is shorter than 12 characters
def shorter_than_twelve students
  puts "\n\nStudents with names shorter than 12 characters:"
  students.each_with_index do |student, number|
    if student[:name].length < 12
      puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
    end
  end
end





#calling methods
#getting input from the user
students = input_students
print_header
print students
print_footer students
print_students_begin_with students
shorter_than_twelve students