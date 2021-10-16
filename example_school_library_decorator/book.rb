# rubocop:disable all

class Book
  @@books = []
  attr_accessor :title, :author, :rentals
  def self.add_books(book)
    @@books << book
  end

  def self.list_all_books
    if @@books.empty?
      puts 'No books found'
      return
    end

    @@books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
