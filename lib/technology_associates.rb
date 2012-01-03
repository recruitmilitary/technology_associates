require 'technology_associates/version'
require 'net/https'
require 'ostruct'
require 'nokogiri'

module TechnologyAssociates

  class << self
    attr_accessor :ca_path
  end

  class Job < OpenStruct

    BASE_URL = 'https://taic.silkroad.com/epostings/'

    def self.all
      document = post(BASE_URL + 'index.cfm?fuseaction=app.jobsearch',
           'company_id'     => '16053',
           'version'        => '1',
           'tosearch'       => 'yes',
           'keywords'       => '',
           'byBusinessUnit' => 'NULL',
           'bycountry'      => '0',
           'bystate'        => '0')

      jobs = []

      document.search("table.cssSearchResults tr").each_with_index do |row, index|
        next if index == 0 # skip header

        cells = row.search("td")

        tracking_code = cells[0].text.strip
        title = cells[1].text.strip
        location = cells[2].text.strip
        date_posted = Date.parse(cells[3].text.strip)
        url = BASE_URL + cells[1].at('a').attr('href')

        jobs << Job.new(:tracking_code => tracking_code,
                        :title         => title,
                        :location      => location,
                        :date_posted   => date_posted,
                        :url           => url)
      end

      jobs
    end

    def self.post(url, attributes)
      request(:post, url, attributes)
    end

    def self.get(url)
      request(:get, url)
    end

    def self.request(method, url, attributes = {})
      uri = URI.parse(url)

      case method
      when :get
        request = Net::HTTP::Get.new(uri.path + "?" + uri.query)
      when :post
        request = Net::HTTP::Post.new(uri.path + "?" + uri.query)
        request.set_form_data(attributes)
      else
        raise "Unknown http method: #{method}"
      end

      http = Net::HTTP.new(uri.host, uri.port)

      if (uri.port == 443) # ssl?
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_path = ::TechnologyAssociates.ca_path if ::TechnologyAssociates.ca_path
      end

      response = http.request(request)

      Nokogiri::HTML(response.body)
    end

    def description
      document = self.class.get(url)

      document.at("dl dd#jobDesciptionDiv").to_s
    end

  end

end
