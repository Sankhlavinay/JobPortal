class AddUuidToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :uuid, :string
  end
end
