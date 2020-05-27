class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :photographer
      t.string :shutter
      t.string :iso
      t.string :aperture

      t.timestamps
    end
  end
end
