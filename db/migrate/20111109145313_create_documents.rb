class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :summary
      t.string :uploaded_by
      t.date :updated_at
      t.date :created_at

      t.timestamps
    end
  end
end
