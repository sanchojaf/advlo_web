module Spree
  User.class_eval do
    has_many :products, dependent: :destroy
    has_many :questions, dependent: :destroy

    has_attached_file :icon,
      styles: { mini:'32x32>', normal: '250x250>' },
      default_style: :normal,
      url: '/spree/users/:id/:style/:basename.:extension',
      path: ':rails_root/public/spree/users/:id/:style/:basename.:extension',
      default_url: '/assets/default_user.png'

    #include Spree::Core::S3Support
    #supports_s3 :icon
  end
end
