# rubocop:disable all
require_relative "./book.rb"
require_relative "./person.rb"
require_relative "./rental.rb"
require_relative "./student.rb"
require_relative "./teacher.rb"

class Bookstore
  def initialize
    @rentals = []
  end

  def list_all_rentals
    print "ID of person: "
    id = gets.chomp.to_i

    rentals = @rentals.filter do |rental|
      rental.person.id == id
    end

    if rentals.empty?
      puts "No rentals found for the given ID"
      return
    end

    puts "Rentals: "

    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def create_rental
    if @books.empty?
      puts "A rental cannot be created because there are currently no books."
      return
    end

    puts "Select a book from the following list by number"
    @books.each_with_index do |book, index|
      puts "#{index}.- Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "Select a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}.- #{person.class}, Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts "Rental created successfully"
  end
end

def main
  response = nil

  bookstore = Bookstore.new()

  puts "Welcome to School Library App!\n\n"

  while response != "7"
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"

    response = gets.chomp

    puts "\n"

    case response
    when "1"
      Book.list_all_books()
    when "2"
      Person.list_all_people()
    when "3"
      Person.create_person()
    when "4"
      print "Book title: "
      title = gets.chomp
      print "Book author: "
      author = gets.chomp
      book = Book.new(title, author)
      Book.add_books(book)
      puts "Book created succesfully"  
    when "5"
      bookstore.create_rental()
    when "6"
      bookstore.list_all_rentals()
    when "7"
      puts "Thank you for using this app!"
    end
    puts "\n"
  end
end

main()
