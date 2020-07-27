class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :view_count
      t.references :author
      t.timestamps
    end
  end
end
