class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, format: { with: /[A-Z]/,
    message: "allows capitolized names only" }
  before_save(:title_case)

  scope(:not_done, -> do
    where({:done => false})
  end)

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

  define_method(:title_case) do

      title = self.name

      title = title.split()

      title.each() do |word|
        unless (word.include?("of")) || (word.include?("the")) && (title.first != "the")
          word.capitalize!
        end
      end

      title = title.join(" ")

      self.name = title
    end
  end
