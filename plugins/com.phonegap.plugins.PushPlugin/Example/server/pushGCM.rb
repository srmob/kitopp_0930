require 'rubygems'
require 'pushmeup'
GCM.host = 'https://android.googleapis.com/gcm/send'
GCM.format = :json
GCM.key = "AIzaSyDHk6Rtvap13bZC7NGZsL8Iq5KAZw04piA"
destination = ["APA91bGKHCM0QaXaDjVEcG6_cZJ_Ga4R1WuGwqG16rZDjfnF-R6f3fzl9u83mkASAIYPz8epivFTk_e5LGXm1aDerXTOc9UdSDAE_96Jl_ZYn1RGynfHqDkSXyS6G3j3rncIA1GEHSglyyCMsQ0hJZlPa4wRWQLVJg"]
data = {:message => "third message to kitaki!", :msgcnt => "1", :soundname => "beep.wav"}

GCM.send_notification( destination, data)
