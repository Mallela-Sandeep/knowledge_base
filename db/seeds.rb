# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = {:email => 'admin@kb.com'}
admin_user = Admin.where(:email => admin[:email]).first     
if admin_user.blank?
  admin_user = Admin.create(:email => admin[:email], :password => 'ginger79', :password_confirmation => 'ginger79') 
  admin_user.save!
end
