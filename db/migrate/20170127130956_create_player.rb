class CreatePlayer < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.string :age
      t.string :sport
      t.string :team
      t.string :position
      t.string :nationality
      t.string :height
      t.string :weight
      t.attachment :avatar
    end
  end
end
