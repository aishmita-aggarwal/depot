class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :question
      t.string :answer
      t.string :user_email
      t.string :user_name

      t.timestamps
    end
  end
end
