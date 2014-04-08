class Step < ActiveRecord::Base

  attr_accessible :title, :description
  belongs_to :post

end
