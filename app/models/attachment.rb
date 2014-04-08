class Attachment < ActiveRecord::Base

  attr_accessible :attachable_id, :attachable_type, :image
  belongs_to :attachable, :polymorphic => true
  mount_uploader :file, FileUploader

end
