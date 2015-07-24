require_relative 'db/config'
require 'byebug'

def list(legislator,state)

  a = Legislator.select(:firstname,:middlename,:lastname,:party,:title,:state)
  # a = Legislator.where(:state => state)
  a = Legislator.where(state: state)
  # a = Legislator.where(:title => 'Sen')
  a = Legislator.where(title: legislator)

  # a is an array
  if legislator == 'Sen'
    puts "Senators: "
  else
    puts "Representatives: "
  end

  a.each do |y|
    puts "#{y.firstname}" + " " + "#{y.middlename}" + " " + "#{y.lastname}" + " " + "(" + "#{y.party}" + ")"
  end
end

list('Sen',"CO")
list('Rep',"LA")

def number(gender, legislator)

  # g = Legislator.where(gender: gender)
  s = Legislator.where(["title = ?", legislator])
  l = Legislator.where(["gender = ? and title = ? ", gender, legislator])

  # p g.count
  percentage = ((l.count.to_f / s.count.to_f) * 100).to_i
  p percentage.to_s + "%"
end

# number('M', 'Sen')
number('F', 'Sen')

def list_states_legislators
 states = Legislator.uniq.pluck(:state)

 # Ordering the states begin
 array_of_count = []
 states.each do |state|
   array_of_count << [state, Legislator.where(state: state).count]
 end

 states = array_of_count.sort{|a,b| b[1] <=> a[1]}
 states.map!{|state| state[0]} # to get just the states

 states.each do |x|
  puts "#{x}: #{ Legislator.where(title: "Sen", state: x, in_office: '1').count } Senators, #{ Legislator.where(title: "Rep", state: x, in_office: '1').count } Republicans "
  end
end

list_states_legislators

def total_legislators_count
  count_s = Legislator.where(title: "Sen").count
  count_r = Legislator.where(title: "Rep").count
  puts "Senator: " + count_s.to_s
  puts "Representatives: " + count_r.to_s
end

total_legislators_count

def delete_irrelevants
  to_delete = Legislator.where(in_office: '0')
  to_delete.delete_all
  count_s = Legislator.where(title: "Sen").count
  count_r = Legislator.where(title: "Rep").count
  puts "Senator: " + count_s.to_s
  puts "Representatives: " + count_r.to_s
end

delete_irrelevants

# votesmart_id: 26827