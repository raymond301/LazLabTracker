class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :study_name
      t.string :rlims_id
      t.string :family_id
      t.string :sample_type
      t.string :treatments
      t.string :preparation
      t.string :patient_initials
      t.string :full_name
      t.date :birth_date
      t.datetime :collection_date
      t.datetime :create_date
      t.string :visit_description
      t.string :source
      t.text :notes
      t.string :tissue_tumor_flag, :limit=>2
      t.string :tissue_normal_flag, :limit=>2
      t.string :tissue_abnormal_flag, :limit=>2
    end
  end
end
