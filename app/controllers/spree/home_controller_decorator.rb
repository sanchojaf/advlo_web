#require 'spree/base_controller'
Spree::HomeController.class_eval do
  skip_before_filter :authenticate_spree_user!
end
