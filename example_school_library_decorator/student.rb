# rubocop:disable all
require_relative "./person"

class Student < Person
  attr_reader :classroom

  def initialize(age, name = "Unknown", parent_permission = true, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
