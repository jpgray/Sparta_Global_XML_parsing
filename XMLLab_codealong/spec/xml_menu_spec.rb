describe "Guiseppe's" do

  before(:all) do
    @menu = Guiseppes.new
  end

  it 'should have no price more than £10'do
    # Loop through all prices and do assertion check its not more than 10
    @menu.get_all_prices_as_floats.each do |price|
      expect(price).to be <= 10
    end
  end

  it 'should have no item with calories over 1000, except for the "full breakfast"' do
    @menu.get_all_food_items.each do |food|
      if food.element_children[0].text.upcase == 'FULL BREAKFAST'
        expect(food.element_children[3].text.to_i).to be > 1000
      else
        expect(food.element_children[3].text.to_i).to be <= 1000
      end
    end
  end

  it "should have all waffle dishes stating you get 2 waffles" do
    @menu.get_all_food_items.each do |food|
      if food.element_children[0].text.upcase.include? 'WAFFLES'
        expect(food.element_children[2].text.upcase).to include 'TWO'
      end
    end
  end

end
