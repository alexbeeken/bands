class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates :name, uniqueness: {case_sensitive: false}
  validates :legacy_code, format: { with: /^[A-Z]$/,
    message: "allows capitolized names only" }
end
