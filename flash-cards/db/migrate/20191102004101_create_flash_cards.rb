class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.integer :user_id
      t.string :title
      t.string :description
    end
  end
end