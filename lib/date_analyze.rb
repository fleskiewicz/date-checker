#!/usr/bin/ruby

require './date.rb'
require './personality.rb'
require './chinese_zodiac.rb'

# Klasa do analizy daty
class Analyzer

  date = ARGV[0].to_s
  wrong = false
  wrong_year = false
  wrong_month = false
  wrong_day = false

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
  def self.split_date(date)
    counter = 0
    splitted = ['', '', '']
    date.each_char do |char|
      if(i<4)
        splitted[0] = splitted[0] + char
      elsif(i<6)
        splitted[1] = splitted[1] + char
      else
        splitted[2] = splitted[2] + char
      end
        counter += 1
    end
    return splitted
  end

  # Metoda drukujaca komunikaty o zlych argumentach
  def self.print_bad_arguments(wrong_year, wrong_month, wrong_day)
    if wrong_year
      puts "wrong year"
    end
    
    if wrong_month
      puts "wrong month"
    end
  
    if wrong_day
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

  # Metoda sprowadzajaca date do czytelnego formatu
  def self.convert_to_date(year, month, day)
    year = year.to_s
    month = month.to_s
    day = day.to_s
    return year + " " + month + " " + day
  end

  # Metoda drukujaca wynik analizy
  def self.print_result(date, zodiac_result, date_value, character_string)
    print date + "\n"
    print "Chinski znak zodiaku: " + zodiac_result + "\n"
    print "Numerologiczna cyfra: " + date_value + "\n"
    print "Cechy charakteru: " + character_string + "\n"
  end

  wrong = check_argument_length(date)
  wrong = check_argument_chars(date)
  date = split_date(date)
  # konwersja na inta w celu porownywania
  date = Date.new(date)
  wrong_year = date.year_valid?
  wrong_month = date.month_valid?
  wrong_day = date.day_valid?
  print_bad_arguments(wrong_year, wrong_month, wrong_day)
  zodiac_result = ChineseZodiac.new().get_chinese_zodiac(date.get_year)
  date_value = calculate_date_value(date.get_year, date.get_month, date.get_day)
  date_value = reduce_date_value(date_value)
  character_string = Personality.new().get_characteristics(date_value)
  date_value = date_value.to_s
  print_result(convert_to_date(date.get_year, date.get_month, date.get_day), zodiac_result, date_value, character_string)
end
