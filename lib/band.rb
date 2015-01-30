class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates :name, uniqueness: true
  validates :legacy_code, format: { with: /^[A-Z]/,
    message: "allows capitolized names only" }

  define_method(:update_venues) do |venues|

    venues.each() do |venue|
      if (self.venues().include?(venue))
      else
        self.venues() << (venue)
      end
    end

    self.venues.each() do |venue|
      if venues.include?(venue)
      else
        self.venues.delete(venue)
      end
    end
  end
end
