class RenamingColumns < ActiveRecord::Migration
  change_table(:bands) do |t|
    t.rename(:title, :name)
  end

  change_table(:venues) do |t|
    t.rename(:text, :name)
  end
end
