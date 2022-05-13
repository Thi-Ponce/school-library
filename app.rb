require './book'
require './student'
require './teacher'
require './person'

class App
  include Inputs
  def initialize
    @people = []
    @books = []
    @id = 0
  end
  
  attr_accessor :persons, :books


  def run
    puts 'Welcome to School Library App!'
    display_options

    task_list = {
      '1' => method(:list_all_books),
      '2' => method(:list_all_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => method(:list_rentals)
    }

    task = gets.chomp
    if task.to_i.positive? && task.to_i < 7
      task_list[task].call
    elsif task == '7'
      puts 'Thank you for using this app!'
    else
      puts 'Please select a valid choice from the list'
      run
    end
  end

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

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
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_selected = gets.chomp.strip.to_i

    case person_selected
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Selection. Returning to main menu'
      nil
    end
    puts "Person created successfully\n\n"
  end

  def create_student
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    loop do
      print "Has parent permission [Y/N]?\s"
      permission = gets.chomp
      if %w[y Y].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: true)
        @people << student unless @people.include?(student)
        break
      elsif %w[n N].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: false)
        @people << student unless @people.include?(student)
        break
      end
    end
  end

  def create_teacher
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    specialization = not_empty(message: "Specialization:\s")
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher unless @people.include?(teacher)
  end

  def create_book
    title = not_empty(message: "Title:\s")
    author = not_empty(message: "Author:\s")
    puts "Book created successfully \n\n"
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
  end

  def create_rental
  end

  def list_rentals
  end

end 
