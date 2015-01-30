class CreateMigrationTable < ActiveRecord::Migration
  def change
    create_table :bands_venues do |t|
      t.belongs_to :venues, index: true
      t.belongs_to :bands, index: true
    end
  end
end
