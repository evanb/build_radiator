#faking cron
while(true) do
    puts `rake build_plans:update_all`
    sleep 5
end
