require 'csv'

def count_by(data, field, value)
    data.count{ |avenger| avenger[field] == value }
end

data = CSV.foreach('avengers.csv', :headers => true)

total_count = data.count

puts "There have been #{total_count} Avengers."

men = count_by(data, 'Gender', 'MALE')

puts "There have been #{men} male Avengers."

women = count_by(data, 'Gender', 'FEMALE')

puts "There have been #{women} female Avengers."

puts "That means the Avengers are #{ (men.to_f / total_count * 100).round(1) }% men."

died_once = data.count{ |avenger| avenger['Death1'] == 'YES' }

puts "In all, #{died_once} Avengers (#{died_once.to_f / total_count * 100}%) have died at least once."