require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :legislators do |t|
      t.string :title #"Rep"
      t.string :firstname #"Neil"
      t.string :middlename #""
      t.string :lastname #"Abercrombie"
      t.string :name_suffix #""
      t.string :nickname #""
      t.string :party #"D"
      t.string :state #"HI"
      t.integer :district #"1"
      t.integer :in_office #"0"
      t.string :gender #"M"
      t.integer :phone
      t.integer :fax
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id #"A000014"
      t.integer :votesmart_id #26827"
      t.string :fec_id #"H6HI01121"
      t.integer :govtrack_id #"400001"
      t.string :crp_id #"N00007665"
      t.string :twitter_id #"neilabercrombie"
      t.string :congresspedia_url #"http://www.opencongress.org/wiki/Neil_Abercrombie"
      t.string :youtube_url #"http://www.youtube.com/hawaiirep1"
      t.string :facebook_id #""
      t.string :official_rss #""
      t.string :senate_class #""
      t.date :birthdate #"06/26/1938"
      t.timestamps null:false
    end

  end
end


