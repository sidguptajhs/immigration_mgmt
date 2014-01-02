class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.belongs_to :passport
      t.belongs_to :visa_type
      t.string :visa_id
      t.date :issue_date
      t.date :expiry_date
      t.timestamps
    end
  end
end