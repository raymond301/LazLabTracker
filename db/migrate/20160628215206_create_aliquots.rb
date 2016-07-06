class CreateAliquots < ActiveRecord::Migration
  def change
    create_table :aliquots do |t|
      t.references :sample, index: true
      t.float :quantity
      t.string :qty_units
      t.float :concentration
      t.string :concent_units
      t.string :sample_container_type
      t.integer :freeze_thraw_count
      t.string :storage_status
      t.string :custodial_department_id
      t.string :location
      t.string :box_description
      t.string :nanopore_260_230_avg
      t.string :nanopore_260_280_avg
      t.boolean :current, :default => true
      t.timestamps null: false
    end
  end
end
