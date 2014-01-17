module Spree
  module Search
    class Solr
      attr_accessor :current_user
      attr_accessor :current_currency

      def initialize(params)
        self.current_currency = Spree::Config[:currency]
        @properties = {}
        #prepare(params)
        sunspot_search(params)
      end
   
       
      def sunspot_search(params)
        @search_result = Spree::Product.solr_search do
          any_of do
            if params[:taxon]
              with(:taxon_ids, [params[:taxon]])
            end
            if params.has_key?('gmaps-output-latitude') && params.has_key?('gmaps-output-longitude')
              lat = params['gmaps-output-latitude']
              lon = params['gmaps-output-longitude']
              with(:location).in_radius(lat,lon, 100)
            end
            if params[:keywords]
              fulltext params[:keywords] do           
                boost_fields :name => 2.0
              end
            end
            if params[:search]          
              if params[:search][:price_range_any]
                params[:search][:price_range_any].each do |price_range|
                  price_split = price_range.split(" - ")
                  from = price_split[0][1..-1].to_f                
                  to = price_split[1][1..-1].to_f              
                  with(:price, from..to)    
                end                     
              end
            end
          end
         #paginate page: page, per_page: Spree::Config[:products_per_page]
        end           
      end

      def retrieve_products
        @search_result.results
      end

      def prepare(params)
        puts "/////////////params before prepare #{params.inspect} /////////////////////////"
        #@properties[:taxon] = params[:taxon].blank? ? nil : Spree::Taxon.find(params[:taxon])
        #@properties[:keywords] = params[:keywords]
        @properties[:search] = params[:search]
        per_page = params[:per_page].to_i
        @properties[:per_page] = per_page > 0 ? per_page : Spree::Config[:products_per_page]
        @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
        puts "/////////////params before prepare #{params.inspect} /////////////////////////"
      end

#        attr_accessor :properties
#        attr_accessor :current_user
#        attr_accessor :current_currency

#        def initialize(params)
#          self.current_currency = Spree::Config[:currency]
#          @properties = {}
#          prepare(params)
#        end

#        def retrieve_products
#          @products_scope = get_base_scope
#          curr_page = page || 1

#          @products = @products_scope.includes([:master => :prices])
#          unless Spree::Config.show_products_without_price
#            @products = @products.where("spree_prices.amount IS NOT NULL").where("spree_prices.currency" => current_currency)
#          end
#          @products = @products.page(curr_page).per(per_page)
#        end

#        def method_missing(name)
#          if @properties.has_key? name
#            @properties[name]
#          else
#            super
#          end
#        end

#        protected
#          def get_base_scope
#            base_scope = Spree::Product.active
#            base_scope = base_scope.in_taxon(taxon) unless taxon.blank?
#            base_scope = get_products_conditions_for(base_scope, keywords)
#            base_scope = add_search_scopes(base_scope)
#            base_scope
#          end

#          def add_search_scopes(base_scope)
#            search.each do |name, scope_attribute|
#              scope_name = name.to_sym
#              if base_scope.respond_to?(:search_scopes) && base_scope.search_scopes.include?(scope_name.to_sym)
#                base_scope = base_scope.send(scope_name, *scope_attribute)
#              else
#                base_scope = base_scope.merge(Spree::Product.ransack({scope_name => scope_attribute}).result)
#              end
#            end if search
#            base_scope
#          end

          # method should return new scope based on base_scope
#          def get_products_conditions_for(base_scope, query)
#            unless query.blank?
#              base_scope = base_scope.like_any([:name, :description], query.split)
#            end
#            base_scope
#          end


    end
  end
end
