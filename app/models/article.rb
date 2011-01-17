# == Schema Information
# Schema version: 20110117183359
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  desc       :text
#  sourcecode :text
#  category   :string(255)
#  tags       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
  
  validates_presence_of :title
  
  attr_accessible :title, :desc, :sourcecode, :category, :tags # specifies that only these columns are editable
  
  def self.search(search)
    
    if search
      find(:all, :conditions => ['Title LIKE ? OR Desc LIKE ? OR sourcecode LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
