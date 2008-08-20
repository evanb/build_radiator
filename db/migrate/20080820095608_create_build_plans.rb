class CreateBuildPlans < ActiveRecord::Migration
  def self.up
    create_table :build_plans do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :build_plans
  end
end
