json.array!(@aliquots) do |aliquot|
  json.extract! aliquot, :id
  json.url aliquot_url(aliquot, format: :json)
end
