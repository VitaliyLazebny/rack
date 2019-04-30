class AppTime
  def self.current(format)
    return "\n" unless format

    t = Time.now

    result = format
                 .sub('year',   t.year.to_s)
                 .sub('month',  t.month.to_s)
                 .sub('day',    t.day.to_s)
                 .sub('hour',   t.hour.to_s)
                 .sub('minute', t.min.to_s)
                 .sub('second', t.sec.to_s)

    "#{result}\n"
  end
end
