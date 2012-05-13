require_relative 'gdefine/version'
require 'nokogiri'
require 'open-uri'


module Gdefine

  # Using iPhone 5 User agent for smaller page and so Google definition is shown
  # (as the open-uri default does has Google not showing the the defition)
  USER_AGENT = 'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us)'

  def self.define word
    html = open "https://www.google.com/search?q=define+#{word}", 'User-Agent' => USER_AGENT
    format parse(html)
  end

  def self.parse html
    doc = Nokogiri::HTML html

    doc.css('.ts tr').inject([]) do |entries, entry|
      if entry.css('td').length > 1 # ignore the spacer row
        cells = entry.css('td')

        entry = {}
        entry[:type] = cells.shift.text
        entry[:definition] = cells.text
        entries << entry
      end
      entries
    end
  end

  def self.format entries
    output = entries.inject('') do |total, entry|
      total += "\n #{entry[:type]} #{entry[:definition]} \n"
    end
  end

end
