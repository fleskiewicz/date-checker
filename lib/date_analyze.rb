#!/usr/bin/ruby

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
      return true
    end
    return false
  end

  # Metoda sprawdzajaca czy wszystkie znaki w argumencie sa cyframi
  def self.check_argument_chars(argument)
    argument.each_char do |char|
      if !(char =~ /[[:digit:]]/)
		    puts "wrong characters"
        return true
      end
    end
    return false
  end

  # Metoda dzielaca argument na rok/miesiac/dzien
  def self.split_date(date, is_wrong)
    if is_wrong == true
	    puts "popracuj nad argumentem"
    else
      i = 0
      splitted = ['', '', '']
      date.each_char do |char|
        if(i<4)
          splitted[0] = splitted[0] + char
        elsif(i<6)
          splitted[1] = splitted[1] + char
        else
          splitted[2] = splitted[2] + char
        end
        i = i + 1
      end
    end
    return splitted
  end
  
  # Metoda sprawdzajaca czy rok miesci sie w przedziale 1900-2019
  def self.year_valid?(year)
    if !(year < 1900)
      if year > 2019
        return true
      end
    else
      return true
    end
    return false
  end
  
  # Metoda sprawdzajaca czy ilosc miesiecy znajduje sie w przedziale 1-12
  def self.month_valid?(month)
    if !(month < 1) 
      if month > 12
        return true
      end
    else
      return true
    end
    return false
  end

  # Metoda sprawdzajaca czy numer dnia nie jest mniejszy od 0
  # i nie wiekszy od liczby dni w miesiacu
  def self.day_valid?(day, month, year)
    wrong_day = false

    # Sprawdzenie czy ilosc dni nie jest mniejsza od 0
    if day < 1
      wrong_day = true
    end

    # Sprwdzenie czy ilosc dni w danym miesiacu sie zgadza
    case month
    when 1
      if day > 31
        wrong_day = true
      end
    when 2
      if day > 28
        wrong_day = true
      end
    when 3
      if day > 31
        wrong_day = true
      end
    when 4
      if day > 30
        wrong_day = true
      end
    when 5
      if day > 31
        wrong_day = true
      end
    when 6
      if day > 30
      wrong_day = true
      end
    when 7
      if day > 31
        wrong_day = true
      end
    when 8
      if day > 31
        wrong_day = true
      end
    when 9
      if day > 30
        wrong_day = true
      end
    when 10
      if day > 31
        wrong_day = true
      end
    when 11
      if day > 30
        wrong_day = true
      end
    when 12
      if day > 31
        wrong_day = true
      end  
    else
      "something is wrong with month"
    end

    # sprawdzenie w przypadku roku przestepnego
    if (year % 4 == 0 && year % 100 != 100) || (year % 400 == 0)
      if month == 2
        wrong_day = false
        if day < 1 || day > 29
          wrong_day = true
        end
      end
    end
    return wrong_day
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

  # Metoda zwracajaca chinski znak zodiaku
  def self.get_chinese_zodiac(year)
    chinese_zodiacs = {
      0 => "Szczur",
      1 => "Bawół",
      2 => "Tygyrs",
      3 => "Królik",
      4 => "Smok",
      5 => "Wąż",
      6 => "Koń",
      7 => "Koza",
      8 => "Małpa",
      9 => "Kogut",
      10 => "Pies",
      11 => "Świnia"
    }
    zodiac_result = (year - 1900) % 12
    zodiac_result = chinese_zodiacs[zodiac_result]
    return zodiac_result
  end

  # Metoda obliczajaca wartosc podanej daty sumujac wszystkie jej cyfry
  def self.calculate_date_value(year, month, day)
    date_value = 0
    year_value = year
    month_value = month
    day_value = day

    while year_value > 0
    	d = year_value % 10
    	year_value = year_value / 10
    	date_value = date_value + d
    end

    while month_value > 0
  	  d = month_value % 10
  	  month_value = month_value / 10
  	  date_value = date_value + d
    end

    while day_value > 0
  	  d = day_value % 10
  	  day_value = day_value / 10
  	  date_value = date_value + d
    end

    return date_value
  end

  # Metoda sumujaca otrzymana wartosc do momentu az wynikowa bedzie jednocyfrowa
  def self.reduce_date_value(date_value)
    while date_value > 9
  	  date_value = date_value.digits(10).sum
    end
    return date_value
  end

  # Metoda tworzaca stringa z wybranymi cechami charakteru
  def self.get_characteristics(date_value)
    # slownik cech charakteru
    characteristics = {
      1 => ["ambitność", "racjonalizm", "egocentryzm"],
      2 => ["wyrozumiałość", "dyplomacja", "niepewność"],
      3 => ["charyzma", "twórczy", "lekkomyślność"],
      4 => ["zorganizowanie", "odpowiedzialność", "szorstkość"],
      5 => ["śmiałość", "pomysłowość", "niecierpliwość"],
      6 => ["wrażliwość", "zrównoważenie", "lenistwo"],
      7 => ["szlachetność", "elegancja", "samotność"],
      8 => ["nieustepliowść", "samokontrola", "radykalizm"],
      9 => ["wielkoduszność", "wyrozumiałość", "wybuchowość"]
    }
    character_string = String.new
    characteristics[date_value].each do |c|
      character_string << c
      character_string << ", "
    end
    character_string = character_string[0..-3]
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
  date = split_date(date, wrong)
  # konwersja na inta w celu porownywania
  year = date[0].to_i
  month = date[1].to_i
  day = date[2].to_i
  wrong_year = year_valid?(year)
  wrong_month = month_valid?(month)
  wrong_day = day_valid?(day, month, year)
  print_bad_arguments(wrong_year, wrong_month, wrong_day)
  zodiac_result = get_chinese_zodiac(year)
  date_value = calculate_date_value(year, month, day)
  date_value = reduce_date_value(date_value)
  character_string = get_characteristics(date_value)
  date_value = date_value.to_s
  print_result(convert_to_date(year, month, day), zodiac_result, date_value, character_string)
end
