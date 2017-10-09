require "pry"

def get_first_name_of_season_winner(data, season)
  data.each do |season_num, contestant_arr|
    if season_num == season
      contestant_arr.each do |contestant_hash|
        contestant_hash.each do |category, data|
          if category == "status" && data == "Winner"
            return contestant_hash["name"].split(" ")[0]
          end
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_num, contestant_arr|
    contestant_arr.each do |contestant_hash|
      contestant_hash.each do |category, data|
        if category == "occupation" && data == occupation
          return contestant_hash["name"]
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |season_num, contestant_arr|
    contestant_arr.each do |contestant_hash|
      contestant_hash.each do |category, data|
        if category == "hometown" && data == hometown
          counter += 1
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season_num, contestant_arr|
    contestant_arr.each do |contestant_hash|
      contestant_hash.each do |category, data|
        if category == "hometown" && data == hometown
          return contestant_hash["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_arr = []

  data.each do |season_num, contestant_arr|
    if season_num == season
      contestant_arr.each do |contestant_hash|
        contestant_hash.each do |category, data|
          if category == "age"
            age_arr << data.to_f
          end
        end
      end
    end
  end

  (age_arr.reduce(:+) / age_arr.length).round
  
end