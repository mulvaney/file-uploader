class DocumentsAddFile < ActiveRecord::Migration
  def up
    add_column :documents, :document, :string
  end

  def down
  end
end
