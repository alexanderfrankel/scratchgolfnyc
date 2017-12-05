class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :course_name
      t.date   :date

      t.timestamps
    end
  end
end
