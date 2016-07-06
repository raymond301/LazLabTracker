class Sample < ActiveRecord::Base
  has_many :sample_aliases
  has_many :aliquots

  def top_name
    self.sample_aliases.select{|a| a.top}.first.name rescue '<ERROR>'
  end

  def top_name_with_source
    sa = self.sample_aliases.select{|a| a.top}.first
    return "#{sa.name} (#{sa.typeCast})" rescue '<ERROR>'
  end

  def allNames
    SampleAlias.where(['sample_id = ?', self.id]).map{|s| s.name}
  end

end
