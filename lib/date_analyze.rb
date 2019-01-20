#!/usr/bin/ruby

require './date.rb'
require './personality.rb'
require './chinese_zodiac.rb'

# Klasa do analizy daty
class Analyzer

  date = ARGV[0].to_s

  # Metoda sprawdzajaca czy dlugosc argumentu jest prawidlowa dla daty
  def self.check_argument_length(argument)
    if argument.length != 8
      puts "wrong length"
      exit
    end
  end

  # Metoda sprawdzajaca czy wszystkie znaki w argumencie sa cyframi
  def self.check_argument_chars(argument)
    argument.each_char do |char|
      if !(char =~ /[[:digit:]]/)
        puts "wrong characters"
        exit
      end
    end
  end

  # Metoda dzielaca argument na rok/miesiac/dzien
  def self.split_argument(date_string)
    counter = 0
    splitted = ['', '', '']
    date_string.each_char do |char|
      if(counter<4)
        splitted[0] = splitted[0] + char
      elsif(counter<6)
        splitted[1] = splitted[1] + char
      else
        splitted[2] = splitted[2] + char
      end
        counter += 1
    end
    return splitted
  end

  # Metoda drukujaca komunikaty o zlych argumentach
  def self.print_bad_arguments(date)
    if date.year_valid?
      puts "wrong year"
    end

    if date.month_valid?
      puts "wrong month"
    end

    if date.day_valid?
      puts "wrong day"
    end
  end

  # Metoda zwiekszajaca wartosc daty
  def self.increase_date_value(value)
    total = 0
    while value > 0
      increase_value = value % 10
      value /= 10
      total += increase_value
    end
    return total
  end

  # Metoda obliczajaca wartosc podanej daty sumujac wszystkie jej cyfry
  def self.calculate_date_value(year, month, day)
    date_value = 0
    date_value += increase_date_value(year)
    date_value += increase_date_value(month)
    date_value += increase_date_value(day)
    return date_value
  end

  # Metoda sumujaca otrzymana wartosc do momentu az wynikowa bedzie jednocyfrowa
  def self.reduce_date_value(date_value)
    while date_value > 9
      date_value = date_value.digits(10).sum
    end
    return date_value
  end

  def self.print_date(date)
    print date + "\n"
  end

  def self.print_chinese_zodiac_sign(zodiac_result)
    print "Chinski znak zodiaku: " + zodiac_result + "\n"
  end

  def self.print_numerological_digit(date_value)
    print "Numerologiczna cyfra: " + date_value + "\n"
  end

  def self.print_character_traits(character_string)
    print "Cechy charakteru: " + character_string + "\n"
  end

  check_argument_length(date)
  check_argument_chars(date)
  date = split_argument(date)
  date = Date.new(date)
  print_bad_arguments(date)
  zodiac_result = ChineseZodiac.new().get_chinese_zodiac(date.get_year)
  date_value = calculate_date_value(date.get_year, date.get_month, date.get_day)
  date_value = reduce_date_value(date_value)
  character_string = Personality.new().get_characteristics(date_value)
  date_value = date_value.to_s
  print_date(date.to_string)
  print_chinese_zodiac_sign(zodiac_result)
  print_numerological_digit(date_value)
  print_character_traits(character_string)
end
