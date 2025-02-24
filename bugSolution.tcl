proc get_data {file} {     set fp [open $file r]     if {$fp == -1} {         return -code error "Could not open file: $file"     }     set data [read $fp]     close $fp     return $data }  proc process_data {data} {     # Some data processing logic here. Assume this might throw an error.     if {[regexp {error} $data]} {         return -code error "Error in data processing"     }     return [string length $data] }  # Example usage  set file_name "my_data.txt"  catch {     set data [get_data $file_name]     if {[catch {set length [process_data $data]} errmsg] }{         puts "Error during data processing: $errmsg"     } else {         puts "Data length: $length"     } } errmsg  if {$errmsg != ""} {     puts "An error occured: $errmsg"} 