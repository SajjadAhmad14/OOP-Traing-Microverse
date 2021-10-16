require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students << student
  end
end

class_a = Classroom.new('Grade 10')

std = Student.new(19, 'John')

class_a.add_student(std)

p class_a.students
