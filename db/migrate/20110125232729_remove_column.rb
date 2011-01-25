class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :articles, :tags
  end

  def self.down
  end
end
