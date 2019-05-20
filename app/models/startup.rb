class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.all 
        return @@all
    end

    def self.find_by_founder(name)
        return @@all.find do |startup|
            startup.founder == name
        end
    end

    def self.domains
        return @@all.collect do |startup|
            startup.domain
        end.uniq
    end

    def sign_contract(vc, type, investment)
        fround = FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        round_count = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self 
                round_count += 1
            end
        end
        return round_count
    end

    def total_funds
        total_inv = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self 
                total_inv += funding_round.investment
            end
        end
        return total_inv
    end

    def investors
        return FundingRound.all.collect do |round|
            if round.startup == self
                round.venture_capitalist
            end
        end.uniq   
    end


end
