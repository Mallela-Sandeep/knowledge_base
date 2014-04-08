class Post < ActiveRecord::Base

  attr_accessible :title, :description
  has_many :attachments, :as => :attachable


end
