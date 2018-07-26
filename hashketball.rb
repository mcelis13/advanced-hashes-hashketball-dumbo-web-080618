require 'pry'
def game_hash
  return {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players =>{
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  #return num of points scored by that player

  game_hash.each do |home_or_away, team_data|
    team_data.each do |general_team_keys, values|
      if team_data[:players].has_key?(name)
        return team_data[:players][name][:points]
      end
    end
  end
end

def all_players
  merged = game_hash[:home][:players].merge(game_hash[:away][:players])
end

def shoe_size(name)
  # game_hash.each do |home_or_away, team_data|
  #   team_data.each do |general_team_keys, values|
  #     if general_team_keys == :players
  #       values.each do |playerName, statNameHash|
  #         if playerName == name
  #           statNameHash.each do |statName, value|
  #             if statName == :shoe
  #               return value
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end  command / to comment out multiple lines
   all_players[name][:shoe]

end

def team_names()
  bothTeams = []

  game_hash.each do |home_or_away, team_data|
    team_data.each do |general_team_keys, values|
      if general_team_keys == :team_name
        bothTeams.push(values)
      end
    end
  end

  return bothTeams
end

def team_colors(userInputTeamName)
  store_if_home_or_away = ''

  game_hash.each do |home_or_away, team_data|
    store_if_home_or_away = home_or_away
    team_data.each do |general_team_keys, values|
      if general_team_keys == :team_name
        if values == userInputTeamName
          return game_hash[store_if_home_or_away][:colors]
        end
      end
    end
  end

end

def player_numbers(userInputTeam)
  numbers = []

  game_hash.each do |home_or_away, team_data|
    store_if_home_or_away = home_or_away
    team_data.each do |general_team_keys, values|
      if general_team_keys == :team_name
        if values == userInputTeam
          game_hash[store_if_home_or_away][:players].each do |playerName, stats|
            stats.each do |statName, value|
              if statName == :number
                numbers.push(value)
              end
            end
          end
        end
      end
    end
  end

  numbers
end

def player_stats(name)
  game_hash.each do |home_or_away, team_data|
    team_data.each do |general_team_keys, values|
      if general_team_keys == :players
        values.each do |playerName, statNameHash|
          if playerName == name
            return statNameHash
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
largest_shoe = 0
store_player_name = ''
store_if_home_or_away = ''

  game_hash.each do |home_or_away, team_data|
    team_data.each do |general_team_keys, values|
      if general_team_keys == :players
        values.each do |playerName, statNameHash|
            statNameHash.each do |statName, value|
              if statName == :shoe
                if largest_shoe < value
                  largest_shoe = value
                  store_player_name = playerName
                  store_if_home_or_away = home_or_away
                end
              end
            end
        end
      end
    end
  end

  game_hash[store_if_home_or_away][:players][store_player_name][:rebounds]
end
