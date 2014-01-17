# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.logo = 'logo/spree_50.png'
  config.searcher_class = Spree::Search::Solr


#  config.facebook_app_id = '406868472779982'

#  config.facebook_layout = 'standard' # button_count, box_count
#  config.facebook_show_faces = true # true
#  config.facebook_verb_to_display = 'like' # recommend
#  config.facebook_color_scheme = 'light' # dark
#  config.facebook_send_button = false # true

end

Spree.user_class = "Spree::User"

#Spree::PermittedAttributes.user_attributes << :fist_name
Spree::PermittedAttributes.user_attributes.push :first_name, :last_name, :phone, :icon, :icon_file_name, 
                                                :icon_content_type, :icon_file_size, :icon_updated_at
                                               

#Spree::Config.facebook_app_id = '406868472779982'
#Spree::Config.facebook_layout = 'standard' # button_count, box_count
#Spree::Config.facebook_show_faces = false # true
#Spree::Config.facebook_verb_to_display = 'like' # recommend
#Spree::Config.facebook_color_scheme = 'light' # dark
#Spree::Config.facebook_send_button = false # true

