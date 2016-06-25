@students = [] # an empty array accessible to all methods

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
      cohortlabel = gets.chomp.downcase
      #define an array of months to compare against
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
    
    #convert the cohort label into a symbol
    cohortlabel = cohortlabel.to_sym

    
    # Add the student hash to the array with a cohort hash
    @students << {name: name, cohort: cohortlabel} #, hobbies:[], country:"Not known", height_m: "Not known"
    # then puts the number of students/entries in the students array 
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
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
  end #end if
end #end of print
#####################
#finally, we print the total number of students
def print_footer
  if @students.count == 1
   puts "Overall we have #{@students.count} great student.".center(40)
  else
   puts "Overall we have #{@students.count} great students.".center(40)
  end
  puts # spacer line
end

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
  file = File.open "students.csv", "w"
  #iterating over the students array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close  
end

#########################
# load the students data from the csv file
def load_students
  file = File.open "students.csv", "r"
  file.readline do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the students to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
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
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

####################
#calling the method
#interactive_menu
interactive_menu

