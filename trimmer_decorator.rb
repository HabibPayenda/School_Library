require_relative 'base_decorator'
require_relative 'person'
require_relative 'capitalize_decorator'

class Trimmer < Base
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    super[0..9]
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = Capitalize.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = Trimmer.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
