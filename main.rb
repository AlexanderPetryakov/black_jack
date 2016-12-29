require_relative 'player'

def start
	puts '--Игра Black Jack--'
	main_menu
end

def main_menu
  main_menu_text
  main_menu_choice
end

def main_menu_text
  puts ''
  puts '--Главное меню--'
  puts '1. Начать новую игру.'
  puts '2. Выйти из пограммы.'
  print 'Введите номер пункта меню: '
end

def main_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    players
  when 2
    exit
  else
    wrong_menu_choice
    main_menu
  end
end

def wrong_menu_choice
  puts ''
  puts 'Неправильный номер пункта меню!!!!!'
end

def players
  Player.new("Dealer")
  Player.new(ask_name)
  game
end

def game
  Player.new_game
  init_show
  first_turn
  second_turn
  show_results
  #evaluate_results
  #end_menu
end

def init_show
  puts ''
  puts "#{Player.get(0).name} счет: #{Player.get(0).bank_account}."
  puts "#{Player.get(1).name} счет: #{Player.get(1).bank_account}."
end

def first_turn
  first_deal
  show_first_deal
end

def first_deal
  Player.get(0).deal
  Player.get(1).deal
  Player.get(0).count
  Player.get(1).count
  Player.get(0).wager
  Player.get(1).wager
end

def show_first_deal
  puts ''
  puts "В банке: #{Player.show_bank}$."
  puts "#{Player.get(0).name}: карты: * *"
  print "#{Player.get(1).name}: карты: "
  Player.get(1).show_hand
  puts ", очки: #{Player.get(1).points}."
end

def second_turn
  second_turn_menu_text
  second_turn_choice
end

def second_turn_menu_text
  puts ''
  puts '--Что дальше?--'
  puts '1. Взять карту.'
  puts '2. Пропустить ход.'
  print 'Введите номер пункта меню: '
end

def second_turn_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    player_second_deal
  when 2
    dealer_turn
  else
    wrong_menu_choice
    second_turn
  end
end

def player_second_deal
  Player.get(1).deal_one
  Player.get(1).count
end

def dealer_turn
  puts 'ход дилера'
end

def show_results
  puts ''
  puts '--Результаты--'
  print "#{Player.get(0).name}: карты: "
  Player.get(0).show_hand
  puts ", очки: #{Player.get(0).points}"
  print "#{Player.get(1).name}: карты: "
  Player.get(1).show_hand
  puts ", очки: #{Player.get(1).points}."
end

def evaluate_results

end

def end_menu

end

def ask_name
  print 'Введите имя игрока: '
  gets.chomp
end

start
