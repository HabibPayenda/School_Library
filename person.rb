class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def age_reader
    @age
  end

  def name_reader
    @name
  end

  def id_reader
    @id
  end

  def age_writer(age)
    @age = age
  end

  def name_writer(name)
    @name = name
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    true unless @age < 18
  end
end
