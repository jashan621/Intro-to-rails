require 'csv'
# db/seeds.rb

# Create categories only if they don't already exist
Category.find_or_create_by(name: "Category 1")
Category.find_or_create_by(name: "Category 2")
# Add more categories as needed

# Clear existing data
puts 'Clearing existing data...'
Lake.destroy_all

# Seed data from Faker
puts 'Seeding data from Faker...'

10.times do
  lake = Lake.create!(
    name: Faker::Address.unique.city,
    description: Faker::Lorem.sentence,
    area: Faker::Number.within(range: 1..1000),
    access: ['Public', 'Permit Required'].sample
  )
end

puts 'Faker data seeding complete!'

# Seed data from CSV
puts 'Seeding data from CSV...'
csv_file = File.join(Rails.root, 'DataStream-3fb25a2.csv')

CSV.foreach(csv_file, headers: true) do |row|
  name = row['MonitoringLocationName'].strip  # Remove leading/trailing whitespace
  area = row['MonitoringLocationLatitude'].to_f  # Convert latitude to float for area

  # Skip records with blank or whitespace-only names, or area <= 0
  next if name.blank? || area <= 0

  Lake.create!(
    name: name,
    description: row['MonitoringLocationType'],
    area: area,
    access: 'Public'  # Assuming all records have public access
  )
end

puts 'CSV data seeding complete!'
