require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  # Place your methods here
  def get_prices_strings
    @menu.search('price')
  end

  def remove_first_char
    array = get_prices_strings
    newarr = []
    array.each do |a|
      b = a.text
      b[0] = ''
      p b
      newarr << b.to_f
    end
    newarr
  end






  def get_name
    @menu.search('name')
  end

  def find_index_name (name)
    newarr = []
    get_name.each do |a|
      newarr << a.text
    end
    newarr.find_index(name)
  end

  def get_calories
    @menu.search('calories')
  end





  def get_description
    @menu.search('description')
  end

end

check = GuiseppesMenu.new
# puts check.get_prices_strings[0]
puts check.remove_first_char
puts check.find_index_name ("Full Breakfast")
