# == Schema Information
# Schema version: 20110208041241
#
# Table name: assets
#
#  id                 :integer         not null, primary key
#  article_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Asset < ActiveRecord::Base

  belongs_to :article
    
  # styles section doesn't work on localhost
  has_attached_file :image,
  :styles => {
  :thumb  => "100x100",
  :medium => "200x200",
  :large => "600x400"
  },
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style/:filename",
  :bucket => 's3imagesz'


  # has_attached_file :image,
  # :storage => :s3,
  # :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  # :path => ":attachment/:id/:basename.:extension",
  # :bucket => 's3imagesz'
  
  # has_attached_file :image,
  # :styles => {
  # :thumb  => "100x100",
  # :medium => "200x200",
  # :large => "600x400"
  # },
  # attr_accessible :image
    
end
