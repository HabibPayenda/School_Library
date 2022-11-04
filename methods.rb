class Methods
  def list(type, title)
    text = "***************************************************\n"
    type.length.zero? && text += "There are no #{title} yet\n"
    type.each do |item|
      text += "---------------------------------------------------\n"
      item.instance_variables.each do |var|
        val = item.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} "
      end
      text += "\n---------------------------------------------------\n"
    end
    text += '***************************************************'
    puts text
  end
end
