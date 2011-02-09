class AddAttachmentScreenshotToArticle < ActiveRecord::Migration
  def self.up
    remove_column :articles, :screenshot_file_name
    remove_column :articles, :screenshot_content_type
    remove_column :articles, :screenshot_file_size
    remove_column :articles, :screenshot_updated_at
  end

  def self.down
    remove_column :articles, :screenshot_file_name
    remove_column :articles, :screenshot_content_type
    remove_column :articles, :screenshot_file_size
    remove_column :articles, :screenshot_updated_at
  end
end
