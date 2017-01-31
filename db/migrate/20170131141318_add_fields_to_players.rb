class AddFieldsToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :name, :string
    add_column :players, :surname, :string
    add_column :players, :age, :string
    add_column :players, :team, :string
    add_column :players, :sport, :string
    add_column :players, :position, :string
    add_column :players, :height, :string
    add_column :players, :weight, :string
  end
end
