require 'csv'
require 'erb'
CSV.foreach('planet_express_logs.csv', headers: true, header_converters: :symbol) do |row|
    puts row.inspect # replace with your logic
end

class Delivery
    attr_accessor :destination, :shipment, :crates, :money, :pilot
    def initialize (destination:, shipment:, crates:, money:)
        @destination = destination
        @shipment = shipment
        @crates = crates
        @money = money.to_i
        determine_pilot
    end

    def determine_pilot
        if @destination == "Earth"
            @pilot = "Fry"
        elsif
          @destination == "Mars"
            @pilot = "Amy"
        elsif
          @destination == "Uranus"
            @pilot = "Bender"
        else
            @pilot = "Leela"
        end

    end


def fry
  pilot == Fry
end

def amy
  pilot == Amy
end

def bender
  pilot == Bender
end

def leela
  pilot == Leela
end

end


deliveries = CSV.foreach("planet_express_logs.csv", headers: true, header_converters: :symbol)
money_sum = deliveries.reduce (0) { |sum, money| sum + money[:money].to_i }
puts money_sum

delivery_objects = deliveries.collect { |row| Delivery.new(row)}
puts delivery_objects.inspect
fry_trips = delivery_objects.select { |delivery| delivery.pilot == "Fry" }
puts fry_trips.length
amy_trips = delivery_objects.select { |delivery| delivery.pilot == "Amy" }
puts amy_trips.length
bender_trips = delivery_objects.select { |delivery| delivery.pilot == "Bender" }
puts bender_trips.length
leela_trips = delivery_objects.select { |delivery| delivery.pilot == "Leela" }
puts leela_trips.length

fry_bonus = fry_trips.reduce(0) { |sum, delivery| sum + delivery.money }/10
amy_bonus = amy_trips.reduce(0) { |sum, delivery| sum + delivery.money }/10
bender_bonus = bender_trips.reduce(0) { |sum, delivery| sum + delivery.money }/10
leela_bonus = leela_trips.reduce(0) { |sum, delivery| sum + delivery.money }/10

fry_total = fry_trips.reduce(0) { |sum, delivery| sum + delivery.money }
amy_total = amy_trips.reduce(0) { |sum, delivery| sum + delivery.money }
bender_total = bender_trips.reduce(0) { |sum, delivery| sum + delivery.money }
leela_total = leela_trips.reduce(0) { |sum, delivery| sum + delivery.money }





#
# money = money.collect { |row| money [:money]}
# pilots = pilots.collect { |row| pilots [:pilots]}
# puts deliveries
# puts money
# puts pilots

  new_file = File.open("./planet_express_logs.html", 'w+')
  new_file << ERB.new(File.read("report.erb")).result(binding)
  new_file.close
