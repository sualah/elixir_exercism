defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - ((discount/100) * before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly = daily_rate(hourly_rate) * 22
    ceil(monthly - ((discount/100) * monthly))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    with_discount = daily_rate(hourly_rate) - ((discount/100) * daily_rate(hourly_rate))
    Float.floor(budget / with_discount, 1)
  end
end
