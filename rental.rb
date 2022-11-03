class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(book)

    @person = person
    person.rentals.push(person)
  end
end
