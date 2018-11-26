require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.remove_first_char.each do |price|
    expect(price).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    i=0
    while i< @xml_menu.get_name.length
      if i!= @xml_menu.find_index_name("Full Breakfast")
        expect(@xml_menu.get_calories[i].text.to_i).to be < 1000
      else
        expect(@xml_menu.get_calories[i].text.to_i).to be > 1000
      end
      i += 1
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    j=0
    while j< @xml_menu.get_description.length
      if @xml_menu.get_name[j].text.upcase.include?("WAFFLES")
        expect(@xml_menu.get_description[j].text.upcase.include?("TWO")).to be true
        expect(@xml_menu.get_description[j].text.upcase.include?("WAFFLES")).to be true
      end
      j += 1
    end
  end

end
