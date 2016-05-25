require 'csv'

male_employee_hash = Hash.new(0)
female_employee_hash = Hash.new(0)

CSV.open('data/employee_data.csv').each_with_index do |row, index|
	next if index < 1
	employee_id = row[1]
	manager = row[7]
	gender = row[8]
	puts "Direct Report Employee Id: #{employee_id}, Manager Name: #{manager}"
	male_employee_hash[manager] += 1 if gender == 'Male'
	female_employee_hash[manager] += 1 if gender == 'Female'
end

puts "*" * 20

male_employee_hash.each do |manager, count|
	next unless manager
	puts "Manager #{manager} has #{count} male employees"
end

female_employee_hash.each do |manager, count|
	puts "Manager #{manager} has #{count} female employees"
end
