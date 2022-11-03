require 'colorize'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'methods'

class App
  attr_accessor :rentals, :books, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def options
    puts 'Enter a corresponding number to chose an option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def start
    method = Methods.new
    puts 'Welcome to School Library App!'
    loop do
      options
      option = gets.chomp
      break if option == '7'

      start_action(option, method)
    end

    puts 'Thank you for using this app!'
  end

  def start_action(option, method)
    case option
    when '1'
      method.list(@books, 'books')
    when '2'
      method.list(@people, 'people')
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts "*******************************************\nThe option: #{option} is not a valid option"
      puts '-------------------------------------------'
      puts "Please select a valid option from the list\n*******************************************"
    end
  end

  def create_person
    text = "===================================================\nWhat type of person do you want to add? \n"
    text += "---------------------------------------------------\n"
    text += "Press (1) to add a student.\n"
    text += "---------------------------------------------------\n"
    text += "Press (2) to add a teacher.\n"
    text += "---------------------------------------------------\n===================================================\n"
    puts text
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, 'Unknown', name, parent_permission: parent_permission)
    @people.push(student)
    puts "#{name} was added to the students list successfully"
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts "#{name} was added to the teachers list successfully"
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book with title:#{title} and author:#{author} created successfully"
  end

  def books_with_index
    @books.each_with_index do |book, index|
      text = "#{index}: "
      book.instance_variables.each do |var|
        val = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} "
      end
      puts text
    end
  end

  def people_with_index
    @people.each_with_index do |person, index|
      text = "#{index}: "
      person.instance_variables.each do |var|
        val = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} "
      end
      puts text
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    books_with_index
    selected_book = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    people_with_index
    selected_person = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[selected_book], @people[selected_person])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'Enter the person ID: '
    id = gets.chomp
    puts 'Rentals:'
    person_rentals = @rentals.each { |rental| rental if rental.person.id == id.to_i }
    person_rentals.each_with_index do |rental, index|
      text = "#{index + 1}: "
      rental.instance_variables.each do |var|
        val = rental.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} "
      end
      puts text
    end
  end
end

def main
  app = App.new

  app.start
end

main
