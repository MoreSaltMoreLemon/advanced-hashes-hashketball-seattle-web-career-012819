def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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

def num_points_scored(player)
  points = 0

  game_hash.each do |location, team_properties|
    unless game_hash[location][:players][player].nil?
      points = game_hash[location][:players][player][:points]
    end
  end

  points
end

def shoe_size(player)
  shoe_size = 0

  game_hash.each do |location, team_properties|
    unless game_hash[location][:players][player].nil?
      shoe_size = game_hash[location][:players][player][:shoe]
    end
  end
  
  shoe_size
end

def team_colors(team)
  game_hash.each do |location, team_properties|
    if team_properties[:team_name] == team
      return team_properties[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_properties|
    teams << team_properties[:team_name]
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_properties|
    if team_properties[:team_name] == team
      team_properties[:players].each do |players, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers

end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_properties|
    unless team_properties[:players][player_name].nil?
      stats = team_properties[:players][player_name]
    end
  end
  stats


end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_properties|
    team_properties[:players].each do |player, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def player_by_number(number)
  player_name = ""

  game_hash.each do |location, team|
    team[:players].each do |player, player_info|
      if player_info[:number] == number
        player_name = player
      end
    end
  end

  player_name
end