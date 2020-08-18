require 'open-uri'
require 'pry'

class Scraper

  @@student = []
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
   times_to_loop = doc.css(".student-card").size
    scraped_students = []
    
    i = 0 
    doc.css(".roster-cards-container").each do |student|
    times_to_loop.times do 
      @@student.push({
        location: doc.css(".student-location")[i].text, 
        name: doc.css(".student-name")[i].text,
        profile_url: doc.css(".student-card a")[i].attr("href")
      })
      i += 1 
      end 
    end 
    @@student
  end 

  def self.scrape_profile_page(profile_url)
    students = {}
    doc = Nokogiri::HTML(open(profile_url))
    all_students = doc.css(".social-icon-container").children.css("a").map {|x| x.attribute('href').value}
    all_students.each do |link|
      if link.include?('linkedin')
        student[:linkedin] = link 
        elsif link.include?('github')
          student[:github] = link 
          elsif link.include?('twitter')
            student[:twitter] = link 
            else link.include?('blog')
              student[:blog] = link 
            end 
          end 
        end 
   end 
