class DashboardController < ApplicationController

  def index
    @recentSampls=Sample.last(10)
    @studyText=Sample.select(:study_name).uniq.map{|s| s.study_name}
  end

  def find_sample
    @q=params['query']
    @samps=SampleAlias.allSamplesInQuery( params['query'] )
  end

  def search_sample
  end

  def list_by_study
    @studySamples=Sample.where(:study_name => params[:study_name])
  end

  def export

  end

end
