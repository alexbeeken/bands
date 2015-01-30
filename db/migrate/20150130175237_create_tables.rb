class CreateTables < ActiveRecord::Migration
  def change
    
    create_table(:bands) do |t|
      t.column(:title, :string)
      t.timestamps
    end

    create_table(:venues) do |t|
      t.column(:text, :string)
      t.timestamps
    end

  end
end
