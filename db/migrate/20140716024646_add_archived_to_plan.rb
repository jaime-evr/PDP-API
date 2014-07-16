class AddArchivedToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :archived, :boolean, default: false
  end
end
