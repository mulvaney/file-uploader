class Document < ActiveRecord::Base

  mount_uploader :document, DocumentUploader
  belongs_to :user
end
