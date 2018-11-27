require 'nokogiri'

class GuiseppesMenu
  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end

  def get_food_items
    @menu.search('food')
  end

  def get_xpath_calories
    @menu.xpath('/breakfast_menu/food/calories')
  end

  def get_xpath_names
    @menu.xpath('//name')
  end
end

giuseppes = GuiseppesMenu.new

# puts giuseppes.get_menu_names.class
# puts giuseppes.get_food_items
# puts giuseppes.get_food_items.text
# puts giuseppes.get_xpath_calories.text
# puts giuseppes.get_xpath_names.text
