# Klasa zawierajaca metody pozwalajacymi okreslic cechy charakteru
class Personality
  def initialize
    # Slownik cech charakteru
    @characteristics = {
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
  end
  # Metoda tworzaca stringa z wybranymi cechami charakteru
  def get_characteristics(date_value)
    character_string = ''
    @characteristics[date_value].each do |trait|
      character_string << trait + ', '
    end
    return character_string
  end
end
