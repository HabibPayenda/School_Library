require_relative 'person'
require_relative 'classroom'

class Student < Person

  def initialize(age, class_room, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
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

# class1 = Classroom.new('class1')
#
# student1 = Student.new(13, 'class1', 'ahmad')
# student2 = Student.new(18, 'class1', 'ah')

# student1.classroom(class1)
#
# class1.add_student(student1)
# class1.add_student(student2)
#
# class1.students.each do |key, value|
#   puts key.to_s
# end
# puts student1.name
# puts class1.students.length

