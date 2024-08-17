repeat
	-- Get battery percentage
	set battery_output to do shell script "pmset -g batt | grep -o '\\d\\+%'"
	-- display dialog "Raw battery output: " & battery_output

	-- Remove '%' symbol and convert to integer
	set battery_percentage to text 1 thru -2 of battery_output as integer
	-- display dialog "Battery percentage as integer: " & battery_percentage

	-- Perform an action based on the battery percentage
	if battery_percentage < 3 then
		display dialog "Battery level below 3%, 
	Please recharge immediately!" buttons {"OK"} default button "OK"
	else if battery_percentage < 10 then
		display dialog "Battery level below 10%, 
	Please recharge" buttons {"OK"} default button "OK"
	end if

	-- wait 7 minutes
	delay 450
end repeat
