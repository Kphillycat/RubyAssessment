Title each section with a comment that includes the name and number of each section.
Then write the ruby that fulfills each lettered instruction under the title. There is no need to structure your code based on the lettered instructions.
If you need to use code from a previous numbered section please cut and paste into the approrpriate section.

#1---------------. Arrays------------------------
array = ["Blake","Ashley","Jeff"]
array << "Keef"
array.each {|item| puts item}
array[1]
array.index("Jeff")

#---------------------2. Hashes--------------------------------------
instructor = {:name=>"Ashley", :age=>27}
instructor[:location] = "NYC"
instructor.each {|k,v| puts "Key is #{k} and Value is #{v}"}
instructor[:name]
instructor.key(27)

#---------------------------3. Nested Structures--------------------
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

school[:founded_in]="2013" #a
school[:students].push(:name=>"Keef",:grade=>"B") #b
school[:students].delete_if {|x| x[:name]=="Billy"} #c
school[:students].each{|k| k[:semester]="Summer"} #d
school[:instructors].each{|k| k[:subject]="being almost better than Blake" if k[:name]=="Ashley"} #e
school[:students].each{|k| k[:grade]="F" if k[:name]=="Frank"} #f
school[:students].each{|k| puts k[:name] if k[:grade]=="B"} #f. Not sure if returns meant output (puts)
school[:instructors].each{|k| puts k[:subject] if k[:name]=="Jeff"} #h
school.each{ |k,v| puts v } #i. Prints all the values but doesn't print just values of student and instructor hashes....if k.kind_of?(Array) ? k.each { |h| puts h } : puts v}
school.each do |k,v| #i. Prints all the values
	if v.kind_of?(Array)
		for i in v
			puts i.values()
		end
	else
		puts v 
	end
end

#------------------------4. Methods-----------------------
def grade(name, school_hash) #a. i.
		school_hash[:students].each{|k| return k[:grade] if k[:name]==name}
end

#----------a. i. Create a method to return the grade of a student, given that student's name. 
# ii. Then use it to refactor your work in 3.i. ---------------------------------------------
#a.ii. Solution doesn't appear to refactor the code in 3i) since I utilized the values() method 
#to quickly get the value regardless of type (students or instructors) of hash. Let me know what you think.

def subject_change(instructor, nu_subject, school_hash) #b. i.
	school_hash[:instructors].each{|k| k[:subject]=nu_subject if k[:name]==instructor} 
end

subject_change("Blake", "being terrible", school) #b. ii.
def add_student(student, grade, school_hash) #c. i.
	school_hash[:students].push(:name=>student,:grade=>grade) 
end

add_student("Keef", "C",school) #c. ii.

def add_key(key, value, school_hash) #d. i.
	school_hash[key] = value
end

add_key(:Ranking, 1, school) #d. ii.

#----------------5. a.
class School; end 

#----------------5. b.
class School
def initialize 
end
end

#----------------5. b. i.
class School
def initialize() 
	@name
	@location 
	@ranking
	@students 
	@instructors
end
end

#--------------------------5 b. ii.
class School
def initialize(name, location, ranking, students, instructors) 
	@name 
	@location 
	@ranking 
	@students 
	@instructors 
end
end

#--------------------------5 b. iii.
class School
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@ranking = ranking
	@students = students
	@instructors = instructors
end
end

#---------------------------5 c.
class School

	attr_accessor :name, :location, :instructors, :students 
	attr_reader :ranking
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@ranking = ranking
	@students = students
	@instructors = instructors
end
end

#----------------------------5. d.
class School

	attr_accessor :name, :location, :instructors, :students 
	attr_reader :ranking
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@students[] = students
	@instructors = instructors
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end
end

#-----------------------------5 e.
class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester) #<---- e.
	students.push(:name=>student_name,:grade=>grade, :semester=>grade) 
end
end

#------------------------------5 f.
class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester)
	students.push(:name=>student_name,:grade=>grade, :semester=>grade) 
end

def remove_student(student_name) #<---- f.
	students.delete_if {|k,v| k[:name]==student_name} 
end

end #end of class

#----------------------------------------5 g.
class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = [] #<----- g.
def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
	@@SCHOOLS.push(self) #<----- g.
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester)
	students.push(:name=>student_name,:grade=>grade, :semester=>grade) 
end

def remove_student(student_name) #<---- f.
	students.delete_if {|k,v| k[:name]==student_name} 
end

end #end of class

#------------------------------------------5 h.
class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = [] 

def initialize(name, location, ranking, students, instructors) 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
	@@SCHOOLS.push(self) 
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester)
	students.push(:name=>student_name,:grade=>grade, :semester=>grade) 
end

def remove_student(student_name) 
	students.delete_if {|k,v| k[:name]==student_name} 
end

def self.reset #<---- h.
	@@SCHOOLS.clear()
end

end #end of class

#---------------------------------6. Classes------------------------------------------
class Student
end #6 a.

class Student #<--------6 b.
	attr_accessor :name, :grade, :semester
	
	def initialize(student_name, grade, semester)
		@name = student_name
		@grade = grade
		@semester = semester
	end

	def display
		puts "Student Name: #{@name}, Grade: #{@grade} and Semester: #{@semester}"
	end


end #end of Student Class


class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = [] 

def initialize(name, location, ranking, students, instructors) #students need to be initialized array of objects 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
	@@SCHOOLS.push(self)
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester)
	new_student = Student.new(student_name, grade, semester) #<--------6 b.
	students.push(new_student) #<--------6 b.
end

def remove_student(student_name)
	students.delete_if {|k,v| k.name==student_name} #<--------6 b.
end

# def display
# 	puts "There are #{@@SCHOOLS.length} instances"
# end

def self.reset
	@@SCHOOLS.clear()
end

end #End of School Class

#----------------6 c.---------------
class Student
	attr_accessor :name, :grade, :semester
	
	def initialize(student_name, grade, semester)
		@name = student_name
		@grade = grade
		@semester = semester
	end

	# def display
	# 	puts "Student Name: #{@name}, Grade: #{@grade} and Semester: #{@semester}"
	# end


end #end of Student Class


class School

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = []
def initialize(name, location, ranking, students, instructors) #students need to be initialized array of objects 
	@name = name
	@location = location
	@students = students.clone
	@instructors = instructors.clone
	@@SCHOOLS.push(self)
end

def ranking_set(ranking_value)
	@ranking = ranking_value 
end

def add_student(student_name, grade, semester)
	new_student = Student.new(student_name, grade, semester)
	students.push(new_student) 
end

def remove_student(student_name)
	students.delete_if {|k,v| k.name==student_name} 
end

# def display
# 	puts "There are #{@@SCHOOLS.length} instances" 
# end

def self.reset
	@@SCHOOLS.clear()
end

def StudentObjReturn(student_name) #<--------6 c.
	students.each {|k,v| return k if k.name==student_name} #<--------6 c.	
end

end #end of School class

#----------------7------------------

# a.) I assume the class is going to print out the latest implicit return value from it's methods 
# and it's Object id. Output: "hello <Object id of the class>"
# b.) If you wanted to call a class method I thought it was with the syntax self.class.[MethodName]. 
# I believe this output would be "<Object id of the class>"
# c.) I believe this output would be "<Object id of the class>" and "<Object id of the new instance. Will be different each time.>"
# d.) I believe this output would be "<Object id of the class>" 
# e.) I believe this output would be "goodbye"

