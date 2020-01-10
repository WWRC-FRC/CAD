use <sprockets.scad>

OpticalLimitSwitchHolder();
//PrintHabMechParts();
//LightRingFrame();
//JeVoisMount();
//UltrasonicHousingPrint();
//ChainPusherInsert();
//ChainPusherGuide();
//PrintCamerMountLogitec();

module LightRingFrame()
{
  $fn = 40;
  difference()
  {
    cylinder(d = 2.55, h = 0.26);
    translate([0, 0, 0.08])
    {
      difference()
      {
        cylinder(d = 2.42, h = 0.26);
        cylinder(d = 1.65, h = 0.26);
      }
      cylinder(d = 1.5, h = 0.26);
    }
    cube([0.51, 0.77, 1], center = true);
    translate([2.035 / 2, 0, 0])
      cube([.3, .3, 1], center = true);
  }
}

module JeVoisMount()
{
  difference()
  {
    //Main base
    translate([0, 0, 3.5])
      cube([70, 70, 13], center = true);
    //Camera outline/mount holes
    translate([-14, 0, 2])
      JeVoisBottom();
    //Mount screw countersinks
    translate([-28.75, 12.5, 7])
      JeVoisHoles($D = 6, $L = 2);
    //Cable exit
    translate([13, 6, 7])
      cube([22, 20, 10], center = true);
    translate([29, 6, 7])
      cube([14, 10, 10], center = true);
    //Frame mount holes
    translate([-15, 25])
      cylinder(d = 3, h = 30, center = true, $fn = 20);
    translate([-15, -25])
      cylinder(d = 3, h = 30, center = true, $fn = 20);
    //Remove excess
    translate([30, -55, 0])
      rotate(30, [0, 0, 1])
        cube([80, 80, 80], center = true);
    translate([30, 61, 0])
      rotate(-20, [0, 0, 1])
        cube([80, 80, 80], center = true);
  }
}

module JeVoisHoles($D = 3, $L = 20)
{
  $fn = 20;
  translate([0, 0, -10])
    cylinder(d = $D, h = $L);
  translate([0, -25, -10])
    cylinder(d = $D, h = $L);
  translate([29.5, 0, -10])
    cylinder(d = $D, h = $L);
  translate([29.5, -25, -10])
    cylinder(d = $D, h = $L);
}

module JeVoisBottom()
{
  $fn = 20;
  translate([-29.5/2, 25/2, 0])
  {
  //  color([0.2, 0.4, 0.9, 0.5])
  //    rotate(90, [1, 0, 0])
  //      translate([-36, -2.0, -37.6])
  //        import("JeVoisA33-fanless-case-bottom-0.1mm.stl", convexity=3);
    //Mount holes
    JeVoisHoles($D = 3, $L = 20);
    //Body cutout
    hull()
    {
      translate([0, 0, 0])
        cylinder(d = 7, h = 8.5);
      translate([0, -25, 0])
        cylinder(d = 7, h = 8.5);
      translate([29.5, 0, 0])
        cylinder(d = 7, h = 8.5);
      translate([29.5, -25, 0])
        cylinder(d = 7, h = 8.5);
    }
    translate([-4, -12.5, 4.25])
      cube([5, 18, 8.5], center = true);
  }
}

module UltrasonicHousingPrint()
{
	scale(25.4)
	{
	rotate(180, [0, 1, 0])
		UltrasonicSensorMountFront();

	translate([0, 1.3, -.58])
    rotate(180, [1, 0, 0])
      UltrasonicSensorMountBackPlate();
	}
}

module UltrasonicSensorMountBackPlate()
{
  translate([0, -0.05, 0])
    difference()
    {
      translate([0, 0.02, 0])
      cube([2.1 + 0.2, 1.16 + 0.1, .2], center = true);
      translate([0, -0.05, -0.1])
        cube([2.1 + 0.01, 1.2 + 0.03, .2], center = true);
      translate([0, -0.27, 0])
        cube([0.6, .25, .5], center = true);
    }
    translate([0, -0.78, 0.05])
      cube([2.1 + 0.2, 0.24, .1], center = true);
}

module UltrasonicSensorMountFront()
{
  difference()
  {
    //Main block
    translate([0, -0.1, (.68 / 2)])
      cube([2.1, 1.2, .68], center = true);
    //Cut out the sensor
    translate([0, 0, 0.07])
      UltrasonicSensor();
  }
  difference()
  {
    //Mounting base
    translate([0, -0.8, (.68 / 2)])
      cube([4, .2, .68], center = true);
    //Mounting holes
    translate([1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
    translate([-1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
  }
}

module UltrasonicSensor()
{
  //PCB
  cube([1.95, .88, 0.15], center = true);
  //Transducer 1
  translate([1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Transducer 2
  translate([-1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Cyrstal
  translate([0, (.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
  //Connector
  translate([0, -(.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
}

module ChainPusherInsert($ChainPusherInsertSize = 21.65, $ChainPusherInsertHeight = 40, $ChainPusherInsertShaft = 9.75)
{
  translate([0, 0, $ChainPusherInsertHeight / 2])
    difference()
    {
      cube([$ChainPusherInsertSize, $ChainPusherInsertSize, $ChainPusherInsertHeight], center = true);
      cylinder(d = $ChainPusherInsertShaft, h = $ChainPusherInsertHeight + 20, center = true, $fn= 30);
    }
}

module ChainPusherGuide( $ChainPusherHexSize = 16.5)
{
  translate([0, 0, 6.5])
    difference()
    {
      cube([29.4, 29.4, 13], center = true);
      translate([0, 0, 2.01])
        cube([25.4, 29.5, 13], center = true);
      cylinder(d = $ChainPusherHexSize, h = 20, $fn = 6, center = true);
    }
}

module PrintCamerMountLogitec()
{
  translate([0, 0, 26])
    difference()
    {
      CamerMountLogitec();
      translate([0, 0, 50])
        cube([100, 100, 100], center = true);
    }

  translate([40, 0, -1.5])
    difference()
    {
      CamerMountLogitec();
      translate([0, 0, -50])
        cube([100, 100, 100], center = true);
    }

}

module CamerMountLogitec()
{
  difference()
  {
    union()
    {
      intersection()
      {
        union()
        {
          cube([52, 70, 10], center = true);
          sphere(d = 52, $fn = 100);
        }
        scale([0.5, 1.0, 1.0])
          cylinder(d = 70, h = 100, $fn = 10, center = true);
      }
      translate([0, 0, -24])
        cube([30, 72, 4], center = true);
    }
    sphere(d = 49, $fn = 100);
    cube([53, 73, 3], center = true);
    translate([25, 0, 0])
      cube([20, 73, 53], center = true);
    translate([-25, 0, 0])
      cube([20, 73, 53], center = true);
    translate([0, 29.5, 0])
      cylinder(d = 3, h = 100, $fn = 100, center = true);
    translate([0, -29.5, 0])
      cylinder(d = 3, h = 100, $fn = 100, center = true);
  }
}

module OpticalSensor()
{
  union()
  {
    //PCB
    cube([34, 2, 16]);
     //Sensor
    translate([0, 2, 2.5])
      cube([7, 8, 14]);//Z really 11 but extended to make opening on mount
    //LED stems
    translate([27, 0, 2.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    translate([27, 0, 13.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    //Pot
    translate([14, -6, 8])
      cube([8, 9, 8]);
    translate([18, -6, 12])
      rotate(90, [1, 0, 0])
        cylinder(d = 4, h = 10, $fn = 50);
    //Connector
    translate([30, -3, 2])
      cube([4, 6, 15]);//Z really 12 but extended to make opening on mount
    translate([30, -6, 2])
      cube([10, 4, 15]);//Z really 12 but extended to make opening on mount
    //"Stuff"
    translate([0, -2.5, 0])
      cube([34, 2.5, 16]);
  //Mounting hole
  translate([25, 15, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 4, h = 30, $fn = 50);
  //Mounting hole captive opening
  translate([25, 10, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 7, h = 4, $fn = 50);
  }
}

module OpticalLimitSwitchHolder()
{
  difference()
  {
    //Main holder
    cube([39, 20, 18]);
    translate([3, 10, 2])
      OpticalSensor();
    //Adjust connector opening
    translate([32, -0.1, 3])
      cube([10, 8, 20]);
  }
  translate([24, 17, 18])
    OpticalSensorTab();
  translate([0, 0, 18])
    OpticalSensorTab();
  translate([24, 0, 0])
    rotate(90, [1, 0, 0])
      OpticalSensorTab();
  translate([-15, 15, 0])
    rotate(90, [1, 0, 0])
      OpticalSensorTab();
  translate([0, 20, 18])
    rotate(-90, [0, 0, 1])
      OpticalSensorTab();
}

module OpticalSensorTab()
{
  difference()
  {
    cube([15, 3, 15]);
    translate([7.5, 0, 7.5])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4, h = 5, $fn = 50);
  }
}