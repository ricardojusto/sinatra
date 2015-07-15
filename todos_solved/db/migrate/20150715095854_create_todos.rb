class CreateTodos < ActiveRecord::Migration
  def change
  	create_table :todos do |table|
  		table.string :title
  		table.boolean :complete
  		table.timestamps
  	end
  end
end
