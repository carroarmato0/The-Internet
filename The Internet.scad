// Unit of measurement 1=1mm

// Top
difference() {
  // Base
  cube([160, 80, 60], center = false);
  // Cavity
  translate([5, 5, 5]) cube([150, 70, 60], center = false);
  // LED Cavity
  translate([80, 40, 0]) cylinder(h=10, r=4, center = false, $fn=360);
}
difference() {
  // LED Support
  translate([80, 40, 0]) cylinder(h=10, r=6, center = false, $fn=360);
  // LED Support Cavity
  translate([80, 40, 0]) cylinder(h=10, r=4, center = false, $fn=360);
}

// Bottom
translate([5, 90, 0]) {
  difference() {
    //Base
    cube([149, 69, 54], center = false);
    // Inner Cavity
    translate([5, 5, 10]) cube([140, 60, 44], center = false);
    // Outer Cavity
    translate([5, 5, 0]) cube([140, 60, 5], center = false);
  }
  //Pillar1
  translate([5, 5, 10]) cube([15, 15, 39.5], center = false);
  //Pillar2
  translate([5, 50, 10]) cube([15, 15, 39.5], center = false);
  //Pillar3
  translate([130, 50, 10]) cube([15, 15, 39.5], center = false);
  //Pillar4
  translate([130, 5, 10]) cube([15, 15, 39.5], center = false);

  // Bottom RPI Zero W Holder
  difference() {
    // Base RPI Zero Enclosure
    translate([63, 19, 10]) cube([63, 32, 15], center = false);
    // Base RPI Zero Reference
    translate([67, 23, 10]) cube([55, 24, 15], center = false);
    // Cavity 1
    translate([63, 25, 10]) cube([63, 20, 15], center = false);
    // Cavity 2
    translate([68.5, 19, 10]) cube([52, 32, 15], center = false);
  }
}