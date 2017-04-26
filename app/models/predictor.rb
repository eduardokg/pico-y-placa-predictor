class Predictor < ApplicationRecord
  def self.check_last_digit(last_digit, date, time)
    restricted = false
    case last_digit
    when 1, 2
      if date.monday?
        restricted = check_time(time, restricted)
      end
    when 3, 4
      if date.tuesday?
        restricted = check_time(time, restricted)
      end
    when 5, 6
      if date.wednesday?
        restricted = check_time(time, restricted)
      end
    when 7, 8
      if date.thursday?
        restricted = check_time(time, restricted)
      end
    when 9, 0
      if date.friday?
        restricted = check_time(time, restricted)
      end
    else
      false
    end
  end

  def self.check_time(time, restricted)
    morning_starts = "7:00".to_time
    morning_ends = "9:30".to_time
    afternoon_starts = "16:00".to_time
    afternoon_ends = "19:30".to_time

    if ((time.to_i >= morning_starts.to_i) && (time.to_i <= morning_ends.to_i)) || ((time.to_i >= afternoon_starts.to_i) && (time.to_i <= afternoon_ends.to_i))
      restricted = true
    end

    return restricted
  end
end
