class AddCacheKeyToProgresses < ActiveRecord::Migration[4.2]
  tag :predeploy

  def self.up
    add_column :progresses, :cache_key_context, :string
  end

  def self.down
    remove_column :progresses, :cache_key_context
  end
end
