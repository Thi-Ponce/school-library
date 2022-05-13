class App
  include Inputs
  def initialize
    @persons = []
    @books = []
  end
  
  attr_accessor :persons, :books

  def list_all_books
    puts "\n"
    books.each_with_index do |book, index|
    puts "[#{index + 1}] Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
  end

  def create_book
  end

  def create_rental
  end

  def list_rentals
  end

end 
