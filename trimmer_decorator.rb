require_relative 'base_decorator'
require_relative 'person'
require_relative 'capitalize_decorator'

class Trimmer < Base
  def correct_name
    # super[0..9]
    @nameable.correct_name[0..9]
  end
end

person = Person.new(17, 'maximilianus', parent_permission: false)
puts person.correct_name
puts person.can_use_services?

capitalized_person = Capitalize.new(person)
puts capitalized_person.correct_name
# puts capitalized_person.can_use_services;

capitalized_trimmed_person = Trimmer.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
