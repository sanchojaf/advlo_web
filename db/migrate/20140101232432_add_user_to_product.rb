class AddUserToProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :user_id, :integer,  :default => 1
  end
end
