require "BlikstickSquare/version"
require "BlikstickSquare/blinkstick"

module BlikstickSquare
  class Commander

    def first_blinkstick
      BlinkStick.find_all.first
    end

    def print_info
      b = first_blinkstick()
      puts "Found device:"
      puts "  Manufacturer:  " + b.manufacturer
      puts "  Description:   " + b.description
      puts "  Serial:        " + b.serial
      puts "  Current Color: " + b.color.html
      puts "  Info Block 1:  " + b.info_block1()
      puts "  Info Block 2:  " + b.info_block2()
    end

    def off
      set_color("000000")
    end

    def red
      set_color("ff0000")
    end

    def green
      set_color("00ff00")
    end

    def blue
      set_color("0000ff")
    end

    def set_color(color)
      b = first_blinkstick()
      channel = 0
      (0..7).each { | index |
        b.set_color(channel, index, Color::RGB.from_html(color))
      }
    end

    def red
      set_color("ff0000")
    end
  end
end
