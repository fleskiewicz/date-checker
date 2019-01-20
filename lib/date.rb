# Klasa zawierajaca wlasciwosci daty
class Date
  def initialize(date)
    @year = date[0].to_i
    @month = date[1].to_i
    @day = date[2].to_i
  end

  # Metoda sprawdzajaca czy rok miesci sie w przedziale 1900-2019
  def year_not_valid?
    if (@year > 1899) && (@year < 2020)
      return false
    end
    return true
  end

  # Metoda sprawdzajaca czy ilosc miesiecy znajduje sie w przedziale 1-12
  def month_not_valid?
    if (@month > 0) && (@month < 13)
      return false
    end
    return true
  end
  # Metoda sprawdzajaca czy dni nie jest mniej niz jeden
  def day_number_less_than_one
    if @day < 1
      return true
    end
    return false
  end

  # Metoda sprawdzajaca rok przestepny
  def leap_year?
    return (@year % 4 == 0 && @year % 100 != 100) || (@year % 400 == 0)
  end

  # Metoda sprawdzajaca czy miesiac jest lutym oraz ilosc dni
  def check_february()
    if @month == 2
      if leap_year? && @day > 29
        return true
      elsif @day > 28
        return true
      end
    end
    return false
  end

  # Metoda sprawdzajaca czy podany miesiac jest 30 dniowy
  def thirty_days_month
    return @month == 4 || @month == 6 || @month == 9 || @month == 11
  end

  # Metoda sprawdzajaca czy ilosc dni nie jest wieksza od dni w 30 dniowym miesiacu
  def wrong_day_number_in_month
    if thirty_days_month && @day > 30
      return true
    else
      return check_february
    end
  end

  def impossible_day_number?
    # Sprawdzenie czy ilosc dni nie jest mniejsza od 1 lub wieksza od 31
    if (day_number_less_than_one || @day > 31)
      return true
    end
    return false
  end

  # Metoda sprawdzajaca czy numer dnia nie jest mniejszy od 1
  # i nie wiekszy od liczby dni w miesiacu
  def day_not_valid?
    return impossible_day_number? && wrong_day_number_in_month
  end

  # Metoda sprowadzajaca date do czytelnego formatu
  def to_string
    return @year.to_s + " " + @month.to_s + " " + @day.to_s
  end

  def get_year
    return @year
  end

  def get_month
    return @month
  end

  def get_day
    return  @day
  end
end
