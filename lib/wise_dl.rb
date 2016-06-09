require "wise_dl/version"

module WiseDl
  class Client
    def initialize(options)
      @opts = {url: ''}.merge!(options)
      @uri = URI.parse("#{@opts[:url]}")
    end

    def result
      retries = 2
      begin
        req = Net::HTTP::Get.new(@uri.request_uri)
        http = Net::HTTP.new(@uri.host, @uri.port)
        http.read_timeout = 1
        http.use_ssl = true if @uri.scheme == 'https'
        res = http.start do |http|
          _res = http.request(req)
          case _res.code
          when "200"
            _res
          when "302"
            @uri = URI.parse("#{_res['location']}")
          end
        end
        res.value # check wheather the image is downloaded
        res
      rescue => e
        if 1 < retries
          retries -= 1
          sleep rand(0..0.3)
          retry
        end
        nil
      end
    end
  end
end
