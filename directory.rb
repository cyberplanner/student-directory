require 'rainbow'
require 'csv'
# # # # # # # # # 
@students = [] # an empty array accessible to all methods
@default_file = "students.csv"
#########################
#add to @students
def add_to_students name, cohort
  @students << {name: name, cohort: cohort.to_sym} #, hobbies:[], country:"Not known", height_m: "Not known"
end
###########
#feedback
def success
  puts Rainbow("Action was successful.").red.bright.center(40)
end

def termination
  puts Rainbow("The program is now terminated! Good bye!").yellow.bright
  exit
end
#########################
# Adding a method for user ineraction/user input
def input_students
  puts "Please enter the student's name:"
  puts "To finish, just hit return twice"
  # the array in which the input is gonna be saved
  
  # get the first name
  name = gets.chomp
  # while the name is not 'empty?', repeat this code
  while !name.empty? do
    # get the cohort
    m = false
    while m == false
      puts "Which cohort does #{name} belong to? Please enter the month name."
      cohort = gets.chomp.downcase
      #define an array of months to compare against
      months = ["january", "february", "march",
         "april", "may", "june", "july", "august",
          "september", "october", "november", "december"]
      #check for typos
      if months.include?(cohort)
        m = true
      #check if empty
      elsif cohort.empty?
        cohort = "Unknown"
        m = true
      else
        puts "Please enter a valid month: "
      end #end if
    end #end second while
    
    #convert the cohort label into a symbol
    #cohortlabel = cohortlabel   #DON'T NEED THIS LINE NOW

    
    # Add the student hash to the array with a cohort hash
    add_to_students name, cohort #refactored
    # then puts the number of students/entries in the students array 
    if @students.count == 1
      success
      puts "Now we have #{@students.count} student. Enter a new name or hit return for main menu:"
    else
      success
      puts "Now we have #{@students.count} students. Enter a new name or hit return for main menu:"
    end
      #gets another name from the user..unless it's empty the while loop continues
      name = gets.chomp  #gets.gsub(/\n/,”")
    end
  #return the array of students
  #students
end

############################################end of input section

# A method to print the header
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end
####################
#Print each element in the array(array containing the name in [0] and the cohort in [1]) by iterating over the array
def print_students_list
  count = @students.count
  if count ==0
    puts "There are no students to print.".center(40)
    exit
  else

  n = 1
  while n <= count
  @students.map do |student|
      name = student[:name]
      cohortstr = student[:cohort].to_s.capitalize
        puts "#{n.to_s.center(4)} #{name.ljust(30)} #{cohortstr}"
      n +=1
      end #end of map do
  end #end of while
    puts #spacer line
    success
  end #end if
end #end of print

#####################
#print the students whose name begins with a specific letter.
def print_students_begin_with
  if @students.length > 0
      puts "To print students whose names begins with a letter, please enter a letter: "
    letter = gets.chomp
    @students.each_with_index do |student, number|
      if student[:name].chars.first.downcase == letter.downcase
        puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
      end
    end
  end
end
######################
#print the students from a specific cohort.

def cohorts_print #students #, existing_cohorts
  puts "Students grouped by cohort:"
  puts #spacer line
  #existing_cohorts = [] I DON'T NEED TO DECALRE IT FIRST
  existing_cohorts = @students.map {|student| student[:cohort]}.sort.uniq
   for i in (0..existing_cohorts.length-1)
      @students.map do |student|
        if student[:cohort] == existing_cohorts[i]
          cohortstr = student[:cohort].to_s.capitalize + " Cohort"
          puts "#{cohortstr.ljust(20)} #{student[:name]} "
        end #end if
      end #end do
   end #end for
   success
  #cohorts
end #end def
######################
#finally, we print the total number of students
def print_footer
  if @students.count == 1
   puts "Overall we have #{@students.count} great student.".center(40)
  else
   puts "Overall we have #{@students.count} great students.".center(40)
  end
  puts # spacer line
end
#######################
# save the students data to a csv file
def save_students
  puts "Please enter the name of the file:"
  filename = STDIN.gets.chomp + ".csv"
  file = File.open filename, "w"
  #iterating over the students array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  success
  #file.close  
end
#########################
# amethod to take the file name as in argument
def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    puts "Please enter the a full file name to load (extension included): "
    filename = STDIN.gets.chomp
    
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist. would you like to load default file? Y/N"
    decision = STDIN.gets.chomp.downcase
    if decision == "y"
      load_students(@default_file)
      success
    else
      termination
    end
    #exit # quit the program
  end
  
end
#########################

# load the students data from the csv file
def load_students(filename) # = "students.csv")
  file = File.open filename, "r"
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_to_students name, cohort #refactored
  end
  success
  #file.close
end

########################
# Interactive menu
########################
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. " + Rainbow("Input the students").underline.bright
  puts "2. " + Rainbow("Show the students").underline.bright
  puts "3. " + Rainbow("Save the students to file").underline.bright
  puts "4. " + Rainbow("Load the students from file").underline.bright
  puts "9. " + Rainbow("Exit" ).red.underline.bright    # 9 because we'll be adding more items
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
    when "3"
      save_students
    when "4"
      try_load_students
    when "9"
      termination #termination message
    else
      puts "I don't know what you mean, try again"
  end
end

####################
#calling the method
#interactive_menu
interactive_menu