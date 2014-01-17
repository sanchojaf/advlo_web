module Spree
  Image.class_eval do
    attachment_definitions[:attachment][:styles] = {
      :mini => '<60x39>', # thumbs under image
      :small => '<120x78>', 
      #:medium => '<255x167>', # images on category view
      :medium => '<315x205>', # images on category view
      #:product => '<325x212>', # full product image
      :product => '<503x327>', # full product image
      #:product => '<348x227>',
      :large => '<744x486>' # light box image


    }
  end
end







