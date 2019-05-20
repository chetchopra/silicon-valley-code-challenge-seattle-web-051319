class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        return @@all
    end

    def self.tres_commas_club
        return @@all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        fround = FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        return FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        return FundingRound.all.collect do |round|
            if round.venture_capitalist == self
                round.startup
            end
        end.uniq
    end

    def biggest_investment
        largest_round = nil
        largest_round_amount = 0
        self.funding_rounds.each do |round|
            if round.investment > largest_round_amount
                largest_round = round
            end
        end
        return largest_round
    end

    def invested(domain)
        total = 0
        self.funding_rounds.each do |round|
            if round.startup.domain == domain
                total += round.investment
            end
        end
        return total
    end

end
