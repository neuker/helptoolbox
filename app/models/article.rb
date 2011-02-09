# == Schema Information
# Schema version: 20110208053442
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  desc       :text
#  sourcecode :text
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
  
  has_many :tags, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  validates_presence_of :title
  
  # attr_accessible :title, :desc, :sourcecode, :category, :tags_attributes, :assets_attributes # specifies that only these columns are editable
  attr_accessible :title, :desc, :sourcecode, :category, :tags_attributes, :assets_attributes # specifies that only these columns are editable
  
  # has_attached_file :screenshot, :url => "/assets/images/:attachment/:id/:style/:basename.:extension",
  #     :path => ":rails_root/public/assets/images/:attachment/:id/:style/:basename.:extension"
  
  def self.search(search)
    if search
      find(:all, :conditions => ['articles.title LIKE ? OR articles.desc LIKE ? OR articles.sourcecode LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
