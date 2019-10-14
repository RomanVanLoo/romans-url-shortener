class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks do |t|
      t.references :link

      t.timestamps
    end
  end
end
