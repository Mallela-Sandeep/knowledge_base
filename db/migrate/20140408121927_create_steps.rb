class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :post
      t.string     :title
      t.text       :description
      t.timestamps
    end
  end
end
