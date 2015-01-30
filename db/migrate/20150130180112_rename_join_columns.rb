class RenameJoinColumns < ActiveRecord::Migration
  def change
    change_table(:bands_venues) do |t|
      t.rename(:bands_id, :band_id)
      t.rename(:venues_id, :venue_id)
    end
  end
end
