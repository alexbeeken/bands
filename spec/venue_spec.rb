require("spec_helper")

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}

  describe('.create') do
    it 'only allows venues with the first letter capitalized to be created' do
      test_venue1 = Venue.create({:name => "Janky's wax house"})
      test_venue2 = Venue.create({:name => "tanky's tax mouse"})
      expect(Venue.all()).to(eq([test_venue1]))
    end
  end

  describe('#title_case') do
    it 'changes the name of the venue to a title case string' do
      test_venue = Venue.create({:name => "Janky's wax house"})
      test_venue.title_case()
      expect(test_venue.name).to(eq("Janky's Wax House"))
    end
  end
end
