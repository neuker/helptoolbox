# == Schema Information
# Schema version: 20110124220800
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  article_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  
  belongs_to :article
  
  attr_accessible :name   # specifies that only these columns are editable
  
end
