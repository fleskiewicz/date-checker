#!/usr/bin/ruby

date = ARGV[0].to_s
wrong = false
wrong_year = false
wrong_month = false
wrong_day = false

# sprawdzenie czy dlugosc argumentu jest prawidlowa dla daty
if date.length != 8
	puts "wrong length"
	wrong = true
end

# sprawdzenie czy wszystkie znaki w argumencie sa cyferkami
date.each_char do |char|
	if !(char =~ /[[:digit:]]/)
		puts "wrong characters"
		wrong = true
	end
end

# podzial argumentu na rok/miesiac/dzien
if wrong == true
	puts "popracuj nad argumentem"
else
  i = 0
  year = ""
  month = ""
  day = ""
  date.each_char do |char|
    if(i<4)
      year = year + char
    elsif(i<6)
      month = month + char
    else
      day = day + char
    end
    i = i + 1
  end
  
  # konwersja na inta w celu porownywania
  year = year.to_i
  month = month.to_i
  day = day.to_i
  
  # sprawdzenie czy rok miesci sie w przedziale 1900-2019
  if !(year < 1900)
    if year > 2019
      wrong_year = true
    end
  else
    wrong_year = true
  end
  
  # sprawdzenie czy ilosc miesiecy znajduje sie w przedziale 1-12
  if !(month < 1) 
    if month > 12
      wrong_month = true
    end
  else
    wrong_month = true
  end

  # sprawdzenie czy ilosc dni nie jest mniejsza od 0
  if day < 1
      wrong_day = true
  end

  # sprwdzenie czy ilosc dni w danym miesiacu sie zgadza
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
  
  if wrong_year
    puts "wrong year"
  end
    
  if wrong_month
    puts "wrong month"
  end
  
  if wrong_day
    puts "wrong day"
  end

  # slownik znakow zodiaku
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

  # obliczamy wartosc podanej daty sumujac wszystkie jej cyfry
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

  # sumujemy otrzymana wartosc do momentu az wynikowa bedzie jednocyfrowa
  while date_value > 9
  	date_value = date_value.digits(10).sum
  end

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

  # tworzenie stringa z wybranymi cechami charakteru
  character_string = String.new
  characteristics[date_value].each do |c|
  	character_string << c
  	character_string << ", "
  end
  character_string = character_string[0..-3]

  year = year.to_s
  month = month.to_s
  day = day.to_s
  date_value = date_value.to_s

  print year + " " + month + " " + day + "\n"
  print "Chinski znak zodiaku: " + zodiac_result + "\n"
  print "Numerologiczna cyfra: " + date_value + "\n"
  print "Cechy charakteru: " + character_string + "\n"
end
