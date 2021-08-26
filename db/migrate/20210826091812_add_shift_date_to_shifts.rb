class AddShiftDateToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :shift_date, :date
  end
end
