# Adding a method for user ineraction/user input
def input_students
  puts "Please enter the student's name:"
  puts "To finish, just hit return twice"
  # the array in which the input is gonna be saved
  students = []
  # get the first name
  name = gets.chop
  
  # while the name is not 'empty?', repeat this code
  while !name.empty? do
    # get the cohort
    m = false
    while m == false
      puts "Which cohort does #{name} belong to? Please enter the month name."
      cohortlabel = gets.chomp.downcase
      months = ["january", "february", "march",
         "april", "may", "june", "july", "august",
          "september", "october", "november", "december"]
      #check for typos
      if months.include?(cohortlabel)
        m = true
      #check if empty
      elsif cohortlabel.empty?
        cohortlabel = "Unknown"
        m = true
      else
        puts "Please enter a valid month: "
      end #end if
    end #end second while
    cohortlabel = cohortlabel.to_sym

    
    # Add the student hash to the array with a cohort hash
    students << {name: name, cohort: cohortlabel, hobbies:[], country:"Not known", height_m: "Not known"}
    # then puts the number of students/entries in the students array 
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    
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

def print_students students
  counter = 1
  while counter <= students.length
    students.map do |student|
    name = student[:name]
    cohort = student[:cohort].to_s.capitalize
    if student[:name].length < 12
      puts "#{counter.to_s.ljust(4)}. #{name.ljust(40)} (#{cohort.rjust(10)} cohort)"
      counter += 1
    end
    
    end #I DON'T THINK I NEED THIS END
  end
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

=begin

def print_by_cohort students
    cohort_month = []
    puts "Print by specific cohort month? - Enter Full Month Please"
    month = STDIN.gets.chomp.capitalize
      students.map do |student|
        if student[:cohort] == month
          cohort_month << student
      end
    end
    print_students(cohort_month)
end
=end


#print the students from a specific cohort.

existing_cohorts = []

def cohorts students, existing_cohorts
  puts "\nHere's a list of students arranged by cohort: "
  puts "-------------".center(70)
  existing_cohorts = students.map {|student| student[:cohort]}.sort.uniq
   for i in (0..existing_cohorts.length-1)

      students.map do |student|
        if student[:cohort]== existing_cohorts[i]
          puts "#{student[:name]} (#{student[:cohort]} cohort)".center(70)

        end
      end
    end
end
=begin

def print_cohorts students, existing_cohorts
  counter = 1
  existing_cohorts = students.map {|student| student[:cohort]}.sort.uniq
  while counter <= existing_cohorts.length
    students.each do |student|
      if student[:cohort] == existing_cohorts[0]
        puts puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
        counter += 1
      end
    end
  end
end
=end









#calling methods
#getting input from the user
students = input_students   #That's how we point to what we get from the first method (input_students)
print_header
print_students students
print_footer students
print_students_begin_with students
puts cohorts(students, existing_cohorts)