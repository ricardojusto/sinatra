class AddFieldsToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :name, :string
  	add_column :users, :first_name, :string, null: false, default: ''
  	add_column :users, :last_name, :string, null: false, default: ''
  	add_column :users, :phone_number, :string
  	add_column :users, :address, :text
  end
end
