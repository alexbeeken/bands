class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates :name, uniqueness: {case_sensitive: false}
  validates :name, format: { with: /[A-Z]/,
    message: "allows capitolized names only" }
  before_save(:title_case)


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
