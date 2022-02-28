class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :major
      t.integer :age
      t.references :instructor, foreign_key: true

      t.timestamps
    end
  end
end
