class RenameUrlToRssUrl < ActiveRecord::Migration
  def self.up
    rename_column(:build_plans, :url, :rss_url)
  end

  def self.down
    rename_column(:build_plans, :rss_url, :url)
  end
end
