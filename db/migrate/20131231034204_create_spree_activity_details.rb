class CreateSpreeActivityDetails < ActiveRecord::Migration
  def change
    create_table :spree_activity_details do |t|
      t.references :product
      t.text :itinerary
      t.string :duration
      t.text :cancellation
      t.text :things_to_bring
      t.text :pick_up  # TODO: relate with address
      t.timestamps
    end
  end
end
