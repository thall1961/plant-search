require 'net/http'

class Search < ApplicationRecord

  def go
    net = Net::HTTP.new("trefle.io", 443)
    net.use_ssl = true
    response = net.get("/api/plants?token=ZlF4c04zeTMzVXJ5RUVXT2huUmNRUT09")
    response.body
  end
end
