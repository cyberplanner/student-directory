# Adding a method for user ineraction/user input
def input_students
  puts "Please enter the names of the students:"
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
  puts "The students of Villains Academy"
  puts "-------------"
end

#Print each element in the array(array containing the name in [0] and the cohort in [1]) by iterating over the array
def print students
  students.each_with_index do |student, number|
    puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#finally, we print the total number of students
def print_footer students
  puts "Overall, we have #{students.count} great students"
end

#calling methods
#getting input from the user
students = input_students
print_header
print students
print_footer students