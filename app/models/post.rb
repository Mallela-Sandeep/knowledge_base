class Post < ActiveRecord::Base

  attr_accessible :title, :description, :steps_attributes
  has_many :steps 
  accepts_nested_attributes_for :steps, :allow_destroy => true, :reject_if => :all_blank 

end
