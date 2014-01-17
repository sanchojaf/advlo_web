module Spree
  Product.class_eval do
    has_one :activity_detail
    belongs_to :user, class_name: 'Spree::User'
    has_many :questions
  
    searchable :auto_index => true, :auto_remove => true do
      text :name, :boost => 2.0
      text :description, :boost => 1.2
      time :available_on

      integer :taxon_ids, :references => Spree::Taxon, :multiple => true do
        taxons.collect{|t| t.self_and_ancestors.map(&:id) }.flatten
      end

      string :taxon_names, :references => Spree::Taxon, :multiple => true do
        taxons.collect{|t| t.self_and_ancestors.map(&:name) }.flatten
      end

      latlon(:location) { Sunspot::Util::Coordinates.new(latitude,longitude) }

      float :price
    end


    def latitude  
      return location.latitude unless location.nil?
    end

    def longitude 
      return location.longitude unless location.nil?
    end

  end
end
