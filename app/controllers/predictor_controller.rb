class PredictorController < ApplicationController
  def check_plates
    license_plates = params["license_plates"]
    last_digit = license_plates[-1].to_i
    begin
       date = Date.strptime(params["date"], '%m/%d/%Y')
    rescue ArgumentError
       redirect_to root_path and return
    end
    time_params = params["time"]
    time = "#{time_params["(4i)"]}:#{time_params["(5i)"]}".to_time

    restricted = Predictor.check_last_digit(last_digit, date, time)

    respond_to do |format|
      unless restricted
        message = "You don't have restrictions at this time"
        format.html { redirect_to root_path, notice: message }
      else
        message = "You are restricted to drive this vehicle"
        format.html { redirect_to root_path, alert: message }
      end
    end
  end
end
