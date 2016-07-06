class SampleAlias < ActiveRecord::Base
  belongs_to :sample

  def self.allSamplesInQuery(q)
    sa = SampleAlias.all.where("name like ?", "%#{q}%")
    return sa.map{|a| a.sample}.uniq
  end
end
