class AddIdContact < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :id, :integer, limit: 8
  end
end
