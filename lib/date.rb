# Klasa zawierajaca wlasciwosci daty
class Date
  def initialize(date)
    @year = date[0].to_i
    @month = date[1].to_i
    @day = date[2].to_i
  end

  # Metoda sprawdzajaca czy rok miesci sie w przedziale 1900-2019
  def year_valid?()
    if (@year > 1900) && (@year < 2020)
        return false
    end
    return true
  end

  # Metoda sprawdzajaca czy ilosc miesiecy znajduje sie w przedziale 1-12
  def month_valid?()
    if (@month > 0) && (@month < 13)
      return false
    end
    return true
  end

  def check_if_february()
    if (@month == 2)
      return true
    end
    return false
  end

  def check_if_day_number_not_less_than_one()
    if (@day < 1)
      return true
    end
    return false
  end

  def leap_year_days(wrong_day)
    # sprawdzenie w przypadku roku przestepnego
    if (@year % 4 == 0 && @year % 100 != 100) || (@year % 400 == 0)
      if is_february
        wrong_day = false
        if check_if_day_number_not_less_than_one || @day > 29
          wrong_day = true
        end
      end
    end
  end

  def correct_days_number_in_month(wrong_day)
    if (@month==4 || @month==6 || @month==9 || @month==11) && @day > 30
      wrong_day = true
    elsif check_if_february() && @day > 28
      wrong_day = true
    else
      "something is wrong with month"
    end
  end

  def is_days_number_possible(wrong_day)
    # Sprawdzenie czy ilosc dni nie jest mniejsza od 1 lub wieksza od 31
    if (check_if_day_number_not_less_than_one || @day > 31)
      wrong_day = true
    end
  end

  # Metoda sprawdzajaca czy numer dnia nie jest mniejszy od 1
  # i nie wiekszy od liczby dni w miesiacu
  def day_valid?()
    wrong_day = false
    is_days_number_possible(wrong_day)
    correct_days_number(wrong_day)
    leap_year_days(wrong_day)
    return wrong_day
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
