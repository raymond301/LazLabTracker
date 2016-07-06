json.array!(@samples) do |sample|
  json.extract! sample, :id, :study_name, :rlims_id, :family_id, :sample_type, :treatments, :preparation, :patient_initials, :full_name, :birth_date, :collection_date, :create_date, :visit_description, :source, :notes, :tissue_tumor_flag, :tissue_normal_flag, :tissue_abnormal_flag
  json.url sample_url(sample, format: :json)
end
