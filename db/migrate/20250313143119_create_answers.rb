class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.string :correct, null: false, default: false
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
