# This migration comes from spree_location (originally 20130530022033)
class CreateSpreeLocations < ActiveRecord::Migration
  def change
    create_table :spree_locations do |t|
      t.references :locatable, :polymorphic => true
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
