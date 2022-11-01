require_relative 'base_decorator'
require_relative 'person'

class Capitalize < Base
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    super.capitalize
  end
end
