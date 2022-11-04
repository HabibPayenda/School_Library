require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, class_room, parent_permission, name = 'Unknown')
    super(age, name, parent_permission)
    @classroom = class_room
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
