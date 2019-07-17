class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :hexCode
      t.string :rgbCode

      t.timestamps
    end
  end
end
