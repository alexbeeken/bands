require("spec_helper")

describe(Band) do
  it {should have_and_belong_to_many(:venues)}

   describe('#update_venues') do
    it 'adds new, leaves same and deletes old venues from a band' do
      test_band = Band.create({:name => "The Beat Holes"})
      test_venue0 = Venue.create({:name => "The Pea House"})
      test_venue1 = Venue.create({:name => "The Salt Bar"})
      test_band.venues << test_venue0
      test_band.venues << test_venue1
      test_venues = []
      test_venues.push(test_venue1)
      test_venue2 = Venue.create({:name => "Potatoes and Meat"})
      test_venues.push(test_venue2)
      test_band.update_venues(test_venues)
      expect(test_band.venues).to(eq([test_venue1, test_venue2]))
    end
  end

  describe('#title_case') do
    it 'changes the name of the band to a title case string' do
      test_band = Band.create({:name => "the beat holes"})
      test_band.title_case()
      expect(test_band.name).to(eq("The Beat Holes"))
    end
  end

  describe('.create') do
    it 'only allows bands with the first letter capitalized to be created' do
      test_venue1 = Band.create({:name => "The beat holes"})
      test_venue2 = Band.create({:name => "the seat moles"})
      expect(Band.all()).to(eq([test_venue1]))
    end
  end
end
