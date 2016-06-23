# first we print the list of students
students = [
            {name: "Dr. Hannibal Lecter", cohort: :november},
            {name: "Darth Vader", cohort: :november},
            {name: "Nurse Ratched", cohort: :november},
            {name: "Michael Corleone", cohort: :november},
            {name: "Alex DeLarge", cohort: :november},
            {name: "The Wicked Witch of the West", cohort: :november},
            {name: "Terminator", cohort: :november},
            {name: "Freddy Krueger", cohort: :november},
            {name: "The Joker", cohort: :november},
            {name: "Joffrey Baratheon", cohort: :november},
            {name: "Norman Bates", cohort: :november}
            ]
           
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Print each element in the array(array containing the name in [0] and the cohort in [1]) by iterating over the array
def print students
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#finally, we print the total number of students
def print_footer students
  puts "Overall, we have #{students.count} great students"
end

#callign methods
print_header
print students
print_footer students