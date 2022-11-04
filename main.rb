require_relative 'app'
require_relative 'methods'

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

def start(app)
  method = Methods.new
  puts 'Welcome to School Library App!'
  loop do
    options
    option = gets.chomp
    break if option == '7'

    app.start_action(option, method)
  end

  puts 'Thank you for using this app!'
end

def main
  app = App.new
  app.start_action
end

main
