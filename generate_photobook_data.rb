#!/usr/bin/env ruby
require 'json'
require 'yaml'

# Script to generate photobook data and year pages for Jekyll
photobook_dir = File.join(__dir__, 'assets', 'photobook')
output_file = File.join(__dir__, '_data', 'photobook.yml')
pages_dir = File.join(__dir__, '_pages', 'fotoboek')

unless Dir.exist?(photobook_dir)
  puts "Error: Photobook directory not found at #{photobook_dir}"
  exit 1
end

# Create pages directory if it doesn't exist
Dir.mkdir(pages_dir) unless Dir.exist?(pages_dir)

photos = {}

# Scan each year directory
Dir.glob(File.join(photobook_dir, '*')).sort.each do |year_path|
  next unless File.directory?(year_path)
  
  year = File.basename(year_path)
  photos[year] = {}
  
  # Check if this year has day subdirectories
  day_dirs = Dir.glob(File.join(year_path, '*')).select { |f| File.directory?(f) }
  
  if day_dirs.empty?
    # Photos directly in year folder
    photo_files = Dir.glob(File.join(year_path, '*.{jpg,JPG,jpeg,JPEG}'))
    photos[year]['direct'] = photo_files.map { |f| File.basename(f) }.uniq.sort
  else
    # Photos in day folders
    day_dirs.sort.each do |day_path|
      day = File.basename(day_path)
      photo_files = Dir.glob(File.join(day_path, '*.{jpg,JPG,jpeg,JPEG}'))
      photos[year][day] = photo_files.map { |f| File.basename(f) }.uniq.sort
    end
  end
end

# Write to YAML file
File.open(output_file, 'w') do |file|
  file.write(photos.to_yaml)
end

# Generate individual year pages
photos.each do |year, days|
  total_photos = days.values.flatten.size
  next if total_photos == 0
  
  # Check if this year has day subdirectories
  has_day_folders = !days.keys.include?('direct')
  
  if has_day_folders
    # Create year overview page with links to day pages
    year_file = File.join(pages_dir, "#{year}.md")
    File.open(year_file, 'w') do |file|
      file.puts "---"
      file.puts "layout: single"
      file.puts "title: \"#{year}\""
      file.puts "permalink: /fotoboek/#{year}"
      file.puts "author_profile: false"
      file.puts "---"
      file.puts ""
      file.puts "[← Terug naar fotoboek overzicht](/fotoboek)"
      file.puts ""
      file.puts "<style>"
      file.puts ".day-grid {"
      file.puts "  display: grid;"
      file.puts "  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));"
      file.puts "  gap: 20px;"
      file.puts "  margin: 30px 0;"
      file.puts "}"
      file.puts ""
      file.puts ".day-card {"
      file.puts "  background: #f5f5f5;"
      file.puts "  border-radius: 10px;"
      file.puts "  padding: 25px;"
      file.puts "  text-align: center;"
      file.puts "  transition: transform 0.3s ease, box-shadow 0.3s ease;"
      file.puts "  box-shadow: 0 2px 8px rgba(0,0,0,0.1);"
      file.puts "}"
      file.puts ""
      file.puts ".day-card:hover {"
      file.puts "  transform: translateY(-5px);"
      file.puts "  box-shadow: 0 4px 16px rgba(0,0,0,0.2);"
      file.puts "}"
      file.puts ""
      file.puts ".day-card h2 {"
      file.puts "  font-size: 2em;"
      file.puts "  margin: 0 0 10px 0;"
      file.puts "  color: #333;"
      file.puts "  text-transform: capitalize;"
      file.puts "}"
      file.puts ""
      file.puts ".day-card p {"
      file.puts "  font-size: 1.1em;"
      file.puts "  color: #666;"
      file.puts "  margin: 0;"
      file.puts "}"
      file.puts ""
      file.puts ".day-card a {"
      file.puts "  text-decoration: none;"
      file.puts "  color: inherit;"
      file.puts "  display: block;"
      file.puts "}"
      file.puts ""
      file.puts ".day-card a:hover h2 {"
      file.puts "  color: #0066cc;"
      file.puts "}"
      file.puts "</style>"
      file.puts ""
      file.puts "<div class=\"year-overview\">"
      file.puts "  <p><strong>#{total_photos} foto's</strong></p>"
      file.puts "  <p>Klik op een dag om de foto's van die dag te bekijken.</p>"
      file.puts ""
      file.puts "  <div class=\"day-grid\">"
      
      day_order = ['dinsdag', 'woensdag', 'donderdag', 'vrijdag']
      day_order.each do |day_name|
        next unless days[day_name]
        photo_count = days[day_name].size
        
        file.puts "    <div class=\"day-card\">"
        file.puts "      <a href=\"/fotoboek/#{year}/#{day_name}\">"
        file.puts "        <h2>#{day_name.capitalize}</h2>"
        file.puts "        <p>#{photo_count} foto's</p>"
        file.puts "      </a>"
        file.puts "    </div>"
      end
      
      file.puts "  </div>"
      file.puts "</div>"
    end
    
    # Create individual day pages
    day_order = ['dinsdag', 'woensdag', 'donderdag', 'vrijdag']
    day_order.each do |day_name|
      next unless days[day_name]
      
      day_file = File.join(pages_dir, "#{year}-#{day_name}.md")
      File.open(day_file, 'w') do |file|
        file.puts "---"
        file.puts "layout: single"
        file.puts "title: \"#{day_name.capitalize}\""
        file.puts "permalink: /fotoboek/#{year}/#{day_name}"
        file.puts "author_profile: false"
        file.puts "---"
        file.puts ""
        file.puts "[← Terug naar #{year}](/fotoboek/#{year})"
        file.puts ""
        file.puts "<style>"
        file.puts ".photo-grid {"
        file.puts "  display: grid;"
        file.puts "  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));"
        file.puts "  gap: 15px;"
        file.puts "  margin: 20px 0;"
        file.puts "}"
        file.puts ""
        file.puts ".photo-item {"
        file.puts "  position: relative;"
        file.puts "  overflow: hidden;"
        file.puts "  aspect-ratio: 1;"
        file.puts "  border-radius: 8px;"
        file.puts "  box-shadow: 0 2px 8px rgba(0,0,0,0.1);"
        file.puts "  transition: transform 0.3s ease, box-shadow 0.3s ease;"
        file.puts "}"
        file.puts ""
        file.puts ".photo-item:hover {"
        file.puts "  transform: scale(1.05);"
        file.puts "  box-shadow: 0 4px 16px rgba(0,0,0,0.2);"
        file.puts "}"
        file.puts ""
        file.puts ".photo-item img {"
        file.puts "  width: 100%;"
        file.puts "  height: 100%;"
        file.puts "  object-fit: cover;"
        file.puts "  display: block;"
        file.puts "}"
        file.puts "</style>"
        file.puts ""
        file.puts "<div class=\"day-photos\">"
        file.puts "  <p><strong>#{days[day_name].size} foto's</strong></p>"
        file.puts ""
        file.puts "  <div class=\"photo-grid\">"
        days[day_name].each do |photo|
          file.puts "    <a href=\"https://wandel4daagseoldenzaal.blob.core.windows.net/fotoboek/#{year}/#{day_name}/#{photo}\" target=\"_blank\" class=\"photo-item\" title=\"#{photo}\">"
          file.puts "      <img src=\"/assets/photobook/#{year}/#{day_name}/#{photo}\" alt=\"#{photo}\" loading=\"lazy\">"
          file.puts "    </a>"
        end
        file.puts "  </div>"
        file.puts "</div>"
      end
    end
  else
    # Year without day folders - create single page with all photos
    year_file = File.join(pages_dir, "#{year}.md")
    File.open(year_file, 'w') do |file|
      file.puts "---"
      file.puts "layout: single"
      file.puts "title: \"#{year}\""
      file.puts "permalink: /fotoboek/#{year}"
      file.puts "author_profile: false"
      file.puts "---"
      file.puts ""
      file.puts "[← Terug naar fotoboek overzicht](/fotoboek)"
      file.puts ""
      file.puts "<style>"
      file.puts ".photo-grid {"
      file.puts "  display: grid;"
      file.puts "  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));"
      file.puts "  gap: 15px;"
      file.puts "  margin: 20px 0;"
      file.puts "}"
      file.puts ""
      file.puts ".photo-item {"
      file.puts "  position: relative;"
      file.puts "  overflow: hidden;"
      file.puts "  aspect-ratio: 1;"
      file.puts "  border-radius: 8px;"
      file.puts "  box-shadow: 0 2px 8px rgba(0,0,0,0.1);"
      file.puts "  transition: transform 0.3s ease, box-shadow 0.3s ease;"
      file.puts "}"
      file.puts ""
      file.puts ".photo-item:hover {"
      file.puts "  transform: scale(1.05);"
      file.puts "  box-shadow: 0 4px 16px rgba(0,0,0,0.2);"
      file.puts "}"
      file.puts ""
      file.puts ".photo-item img {"
      file.puts "  width: 100%;"
      file.puts "  height: 100%;"
      file.puts "  object-fit: cover;"
      file.puts "  display: block;"
      file.puts "}"
      file.puts "</style>"
      file.puts ""
      file.puts "<div class=\"year-photos\">"
      file.puts "  <p><strong>#{total_photos} foto's</strong></p>"
      file.puts ""
      file.puts "  <div class=\"photo-grid\">"
      days['direct'].each do |photo|
        file.puts "    <a href=\"https://wandel4daagseoldenzaal.blob.core.windows.net/fotoboek/#{year}/#{photo}\" target=\"_blank\" class=\"photo-item\" title=\"#{photo}\">"
        file.puts "      <img src=\"/assets/photobook/#{year}/#{photo}\" alt=\"#{photo}\" loading=\"lazy\">"
        file.puts "    </a>"
      end
      file.puts "  </div>"
      file.puts "</div>"
    end
  end
end

puts "Photobook data and year pages generated successfully!"
puts "Total years: #{photos.keys.size}"
photos.each do |year, days|
  total = days.values.flatten.size
  puts "  #{year}: #{total} photos"
end
