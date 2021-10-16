# rubocop:disable all
require_relative "./corrector"

class Person
  @@people = []
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def self.list_all_people
    if @@people.empty?
      puts "No people found"
      return
    end

    @@people.each do |person|
      puts "Type: #{person.class}, Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def self.create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp

    if person_type != "1" and person_type != "2"
      puts "Please choose 1 or 2."
      return
    end

    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    if person_type == "1"
      print "Has parent permission? [Y/N]: "
      parent_permission = gets.chomp.downcase
      parent_permission = parent_permission == "y" ? true : false

      @@people << Student.new(age, name, parent_permission)
    else
      print "Specialization: "
      specialization = gets.chomp

      @@people << Teacher.new(age, specialization, name)
    end

    puts "Person created succesfully"
  end

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
