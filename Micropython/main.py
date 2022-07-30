import time
import network
import machine
import rp2
import uping

# Setup LED var
led_external = machine.Pin(15, machine.Pin.OUT)

# Setup ping vars
host = "google.com"
ping_count = 4
ping_interval = 10 #seconds
ping_timeout = 50 #miliseconds

# Setup Wifi vars
ssid = '<ssid>'
password = '<password>'
rp2.country("<country initials>")
wlan = network.WLAN(network.STA_IF)

def connect_to_network():
    wlan.active(True)
    wlan.connect(ssid, password)

    # Wait for connect
    while True:
        if wlan.status() < 0 or wlan.status() >= 3:
            break
        print('waiting for connection...')
        led_external.toggle()
        time.sleep(1)

     # Handle connection error
    if wlan.status() != 3:
        led_external.off()
        raise RuntimeError('network connection failed')
    else:
        print('connected')
        led_external.on()
        status = wlan.ifconfig()
        print( 'ip = ' + status[0] )

def ping_remote(host, ping_count, ping_timeout):
    return uping.ping(host, count=ping_count, timeout=ping_timeout, interval=10, quiet=False, size=64)

def main():
    while True:
        
        try:
            print('== Starting connection to ' + ssid + ' ==')
            connect_to_network()
    
            print('== Pinging ' + host + ' ==')
            while True:
                transmitted,received = ping_remote(host, ping_count, ping_timeout)
                if received > 0:
                    led_external.on()
                else:
                    led_external.off()
                print()
                time.sleep(ping_interval)
        except RuntimeError:
            print('Unable to connect to the network, but retrying...')
        except OSError:
            print('Unable to connect to the network, but retrying...')
main()
