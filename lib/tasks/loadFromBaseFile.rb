require 'pp'

### Usage: rails runner lib/tasks/loadFromBaseFile.rb <filename>
filepath = ARGV[0]
stdy = ARGV[1]


@header = Array.new
if File.exist?(filepath)
  puts "\nStarting New File Parse..."
  File.readlines(filepath).each_with_index do |ln, idx|
    #puts "\t#{idx}"
    rr=ln.split(/\t/)  #.map{|m| m.sub(/^\"/,'').sub(/\"$/,'') }

    if idx == 0
      @header = rr
      next
    end


    s=Sample.create({study_name:stdy,rlims_id:rr[0],family_id:rr[1],sample_type:rr[3],patient_initials:rr[13],
                     full_name:rr[14],visit_description:rr[18],tissue_tumor_flag:rr[27],tissue_normal_flag:rr[28],tissue_abnormal_flag:rr[29] })

    if !rr[4].empty?
      s.treatments = rr[4]
    end
    if !rr[5].empty?
      s.preparation = rr[5]
    end
    if !rr[15].empty?
      s.birth_date =  Date.strptime(rr[15], "%m/%d/%Y")
    end
    if !rr[16].empty?
      if !rr[16] =~ /^##/
        s.collection_date =  DateTime.strptime(rr[16], "%m/%d/%Y %H:%M %p")
      end
    end
    if !rr[17].empty?
      s.create_date =  DateTime.strptime(rr[17], "%m/%d/%Y")
    end
    if !rr[23].empty?
      s.source = rr[23]
    end
    if !rr[24].empty?
      s.notes = rr[24]
    end
    s.save!


    #raise s.inspect
    ### sample aliases rr[2] &&  Patient Ids rr[12]

    sa = rr[2].split(/,/)
    if sa.size < 0
      sa.each_with_index do |p, ii|
        sp = p.split(/\(/) #.map{|pp| pp}
        #pp ["SampleAlias",sp]
        SampleAlias.create({sample: s, name: sp[0], typeCast: sp[1].gsub!(/\)/,'')})
      end
    end


    pti = rr[12].split(/,/)
    pti.each_with_index do |p, ii|
      sp = p.split(/\(/) #.map{|pp| pp.gsub!(/\)/,'')}
      #pp ["PatientNames",sp]
      newSampAlias = SampleAlias.create({sample: s, name: sp[0], typeCast: sp[1].gsub!(/\)/,'')})

      if ii == 0
        newSampAlias.top = true
        newSampAlias.save!
      end

    end


  ######## the box and location child ######
    a = Aliquot.create({sample:s})

    if !rr[6].empty?
      a.quantity = rr[6].to_f
    end
    if !rr[7].empty?
      a.qty_units = rr[7]
    end
    if !rr[8].empty?
      a.concentration = rr[8]
    end
    if !rr[9].empty?
      a.concent_units = rr[9]
    end
    if !rr[10].empty?
      a.sample_container_type = rr[10]
    end
    if !rr[11].empty?
      a.freeze_thraw_count = rr[11]
    end
    if !rr[19].empty?
      a.storage_status = rr[19]
    end
    if !rr[20].empty?
      a.custodial_department_id = rr[20]
    end
    if !rr[21].empty?
      a.location = rr[21]
    end
    if !rr[22].empty?
      a.box_description = rr[22]
    end
    if !rr[25].empty?
      a.nanopore_260_230_avg = rr[25]
    end
    if !rr[26].empty?
      a.nanopore_260_280_avg = rr[26]
    end
    a.save!


    #if idx > 40

#      exit

#    end







  end
end


