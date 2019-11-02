class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :title
      t.string :description
      t.integer :user_id
    end
  end
end
