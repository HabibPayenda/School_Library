require_relative 'base_decorator'
require_relative 'person'

class Capitalize < Base
  def correct_name
    # super.capitalize
    @nameable.correct_name.capitalize
  end
end
