class AddStatusToBuildPlans < ActiveRecord::Migration
  def self.up
    add_column :build_plans, :status, :string
  end

  def self.down
    remove_column :build_plans, :status
  end
end
