class CreateHaikus < ActiveRecord::Migration[6.1]
  def change
    create_table :haikus do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
