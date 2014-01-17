# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


#
#puts 'SETTING UP HOST LOGIN'

#user1 = Spree::User.create! :title => 'Mr', :first_name => 'Jack', :last_name => 'Jackson', :email => #'jack@g.com', :password => '123qwe', :password_confirmation => '123qwe', :phone => '123452345'

#puts 'New user created: ' << user1.first_name

#user2 = Spree::User.create! :title => 'Mr', :first_name => 'Sev', :last_name => 'Raj', :email => 'sa@g.com', :password #=> '123qwe', :password_confirmation => '123qwe', :phone => '123452345'

#puts 'New user created: ' << user2.first_name

#role = Spree::Role.find_or_create_by_name 'host'

#user1.spree_roles << role
#user1.save
#user2.spree_roles << role
#user2.save





