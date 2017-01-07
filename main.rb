require_relative 'game'

def start
	puts '--Игра BlackJack--'
	puts "--   \u2660 \u2663 \u2666 \u2665    --"
	main_menu
end

def main_menu
  main_menu_text
  main_menu_choice
end

def turn1
  if Game.get.turn1 == false
    turn1_menu
  else
    turn2_menu
  end
end

def turn1_menu
  turn1_menu_text
  turn1_menu_choice
end


def turn2(bool)
  Game.get.turn2(bool)
  turn2_menu
end

def turn2_menu
  turn2_menu_text
  turn2_menu_choice
end

def reset
  if Game.get.reset == true
    turn1
  else
    end_game
  end
end

def end_game
  puts 'Конец игры!'
  main_menu
end


def main_menu_text
  puts ''
  puts '--Главное меню--'
  puts '1. Начать новую игру.'
  puts '2. Правила'
  puts '3. Выйти из пограммы.'
  print 'Введите номер пункта меню: '
end

def main_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    Game.new(ask_name)
    turn1
  when 2
    rules
  when 3
    exit
  else
    wrong_menu_choice
    main_menu
  end
end

def turn1_menu_text
  puts ''
  puts '1. Взять карту?'
  puts '2. Остаться?'
  print 'Введите номер пункта меню: '
end

def turn1_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    turn2(true)
  when 2
    turn2(false)
  else
    wrong_menu_choice
    turn1_menu
  end
end

def turn2_menu_text
  puts ''
  puts '1. Продолжить игру?'
  puts '2. Выйти в главное меню (Игра будет проиграна).'
  print 'Введите номер пункта меню: '
end

def turn2_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    reset
  when 2
    main_menu
  else
    wrong_menu_choice
    turn2_menu
  end
end

def ask_name
  print 'Введите имя игрока: '
  gets.chomp
end

def wrong_menu_choice
  puts ''
  puts 'Неправильный номер пункта меню!!!!!'
end

def rules
  puts ''
  puts 'Правила игры:'
  puts 'Выигрывает набравший наибольшее количество очков, но не более 21.'
  puts 'Расчет очков: карты с номерами - количество очков равно номеру.'
  puts 'Валет, дама, король - по 10 очков.'
  puts 'Туз - 11 или 1, в зависимости от суммы очков.'
  puts 'В начале игры у игрока 100$ в банке. Ставка - 10$.'
  puts ''
  puts 'Для выхода - нажмите Ввод.'
  gets.chomp
  main_menu
end

start