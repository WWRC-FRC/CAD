use <RobotPrimitives.scad>

/* [Action] */
$Action = 5; //[1:Trajectory sim, 2:Launcher V1, 3:Launcher V2, 4:Full bot V1, 5: Ball intake]

/* [Trajectory sim] */
//Initial velocity exiting parallel to shooter (m/s)
$MuzzleVelocity = 7.5;
//Launch angle
$Angle = 70;
//Time of simulation in seconds
$SimDuration = 1;
//number of steps in simulation
$SimSteps = 20;
//Distance from wall to start line (inches)
$StartLineOffset = 50;

/* [Shooter] */
$FlyWheelDiameter = 4;
$Style = 0;//[0:Square, 1:Round]
$FeedFrom = 1;//[0:Top, 1:Bottom]
$MotorPlacement = 0;//[0:Outer, 1:Inner]

//Shooter parameters
$ShooterFeederSpacing = 8;
$ShooterGuideOpening = 8;

$LaunchCompression = 1;//
$ShooterV2GuideOpening = 8;//Width of the guide channel

/* [Hidden] */
$va = -9.8;//Vertcal acceleration (9.8m/s^2)
$ha = 0;//Zero acceleration horizontally
$BallDiameter = 7;
$inchtom = 0.0254;
$mtoinch = 1/$inchtom;
$mtofeet = $mtoinch / 12;
$Explode = 1.0;

$ShooterV2FeederSpacing = $BallDiameter + $FlyWheelDiameter - $LaunchCompression;//Spacing between drive wheel set centers

$ShooterFlywheelColor = [0.7, 0.1, 0.2];

DoAction();

module DoAction()
{
  if ($Action == 1)
  {
    scale($mtofeet * 12)
      ShooterTrajectoryTest();
  }
  else if ($Action == 2)
    ShooterV1Model();
  else if ($Action == 3)
    ShooterV2Model();
  else if ($Action == 4)
    FullBotV1();
  else if ($Action == 5)
    BallIntake();
}

module FullBotV1()
{
  $FlyWheelDiameter = 4;
  $Style = 1;//[0:Square, 1:Round]
  $FeedFrom = 1;//[0:Top, 1:Bottom]
  $MotorPlacement = 1;//[0:Outer, 1:Inner]
  
  RobotBaseSimple();
  translate([-7.5, -8, 22])
    rotate(180, [0, 0, 1])
      ShooterV2Model();
  translate([0, 10, 3.5])
    Ball();
  translate([4, 6, 3])
    BallIntake();
}

module BallIntake()
{
  //Left, drive plate
  difference()
  {
    cube([0.125, 8, 16]);
    translate([-0.01, 4.1, 0])
      cube([0.225, 4, 4]);
  }
    translate([0, 4.5, 0])
      rotate(-35, [0, 0, 1])
        cube([0.125, 4.5, 2]);
  //Right side
  translate([-7.5, 0, 0])
    cube([0.125, 6, 12]);
    translate([-7.5, 6.0, 0])
      rotate(45, [0, 0, 1])
        cube([0.125, 3.2, 2]);
  //Back
  translate([-7.4, 0, 0])
    cube([7.5, 0.125, 16]);
  //Drive wheel
  translate([1, 4, 2])
    rotate(90, [1, 0, 0])
    {
      Wheel($Diameter = 4, $Thickness = 1);
      translate([0, 0, 4.7])
        rotate(180, [0, 1, 0])
          Neverest();
    }
  //Kick wheel
  translate([-2, 4, 18])
    rotate(90, [1, 0, 0])
    {
      Wheel($Diameter = 4, $Thickness = 1);
      translate([0, 0, 4.7])
        rotate(180, [0, 1, 0])
          Neverest();
    }
  //Belt
  translate([-1, 4, 2])
    rotate(-11, [0, 1, 0])
      color("BLACK")
        cube([.1, .2, 16]);
  translate([3, 4, 2.8])
    rotate(-11, [0, 1, 0])
      color("BLACK")
        cube([.1, .2, 16]);
}

module ShooterV2Feeder()
{
  //Feeder
  difference()
  {
    cylinder(d = 16 + 0.125 + 0.125, h = 5, $fn = 80);
    translate([0, 0, 0.125])
      cylinder(d = 16, h = 7.1, $fn = 80);
    translate([0, -10, -1])
      cube([20, 20, 9]);
  }
  //Guide peg
  translate([0, 0, 0])
    cylinder(d = 0.5, h = 7, $fn = 20);
  
  //Feed channel
  difference()
  {
    if ($Style == 0)
    {
      translate([9, -4.3, 6.7])
        rotate(-20, [0, 1, 0])
          difference()
          {
            translate([0, 0, -1])
              cube([22, 7.5 + 0.125 + 0.125, 4], center = true);
            translate([0, 0, 0.125])
              cube([22.1, 7.5, 6], center = true);
          }
    }
    else
    {
      translate([-1.2, -4.7, 3.7])
      rotate(-20 + 90, [0, 1, 0])
      difference()
      {
        cylinder(d = 8.125, h = 22, $fn = 20);
        translate([-10, -5, 0])
          cube([10, 10, 30]);
        translate([0, 0, -0.5])
          cylinder(d = 8, h = 23, $fn = 20);
      }
    }
    translate([-8, -10, 0])
      cube([8, 10, 10]);
    translate([19, -10, 5])
      cube([8, 10, 10]);
  }
}

module ShooterV2Shooter()
{
  translate([15, 0, 4])
    {
  #  translate([-5, 0, -2])
      Ball();
    //Rear launcher
    ShooterV2Drive($Wheels = 1);
    //Leading launcher
    translate([-$ShooterV2FeederSpacing, 0, 0])
      ShooterV2Drive($Wheels = 1);
    //Feeder
    translate([-$ShooterV2FeederSpacing - 3.8, 0, 0])
      ShooterV2Drive($Wheels = 2, $FlyWheelDiameter = 4.0);
    //Support frame
    //Left
    translate([3.5, ($ShooterGuideOpening / 2) + 0.5 + (.125 / 2), 2])
      rotate(-90, [0, 1, 0])
        Tube($L = 20, $W = 1, $H = 1);
    //Right
    translate([3.5, -(($ShooterGuideOpening / 2) + 0.5 + (.125 / 2)), 2])
      rotate(-90, [0, 1, 0])
        Tube($L = 20, $W = 1, $H = 1);
    //Trailing
    translate([2.5, -(($ShooterGuideOpening / 2) + 1.0 + (.125 / 2)), 3])
        rotate(-90, [1, 0, 0])
          Tube($L = $ShooterGuideOpening + 2 + 0.125, $W = 2, $H = 1);
    //Leading
    translate([-10.5, -(($ShooterGuideOpening / 2) + 1.0 + (.125 / 2)), 3])
      rotate(-90, [1, 0, 0])
        Tube($L = $ShooterGuideOpening + 2 + 0.125, $W = 2, $H = 1);
    //Funnel
    translate([-7.5, 0, -4.5])
    {
      difference()
      {
        cube([23, $ShooterGuideOpening - 0.125, 7], center = true);
        translate([0, 0, 0.125])
          cube([23.1, $ShooterGuideOpening - (0.125 * 3), 7], center = true);
        translate([10, 0, -3.5])
          rotate(45, [0, 1, 0])
            cube([12, 12, 12], center = true);
        if ($Clip == 1)
          translate([-16.6, -4.5, -.6])
            rotate(35, [0, 1, 0])
              cube([5, 10, 10]);
      }
      translate([1.5, -($ShooterGuideOpening - 0.125)/ 2, -3.5])
        rotate(-45, [0, 1, 0])
          cube([7, $ShooterGuideOpening - 0.125, 0.125]);
    }
  }
}

module ShooterV2MotorPlate()
{
  difference()
  {
    //Main frame
    color([0.7,0.7, 0.8])
      cube([3.5, .125, 4.75], center = true);
    //Bearing opening
    translate([0, -.15, 0])
      HexBearing($Shaft = 0);
    //Motor bolt openings
    translate([1, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 0.165, h = 1, $fn = 20, center = true);
    translate([-1, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 0.165, h = 1, $fn = 20, center = true);
    //Adjustment slots
    translate([1.0, 0, 1.95])
      Slot($D = .165, $Length = 0.75, $H = .5);
    translate([-1.0, 0, 1.95])
      Slot($D = .165, $Length = 0.75, $H = .5);
    translate([1.0, 0, -1.95])
      Slot($D = .165, $Length = 0.75, $H = .5);
    translate([-1.0, 0, -1.95])
      Slot($D = .165, $Length = 0.75, $H = .5);
  }
}

module ShooterV2Drive()
{
  translate([0, $ShooterV2GuideOpening / 2, 0])
  {
    //Motor mount plate
    ShooterV2MotorPlate();
    //Bearing
    translate([0, -.15 * $Explode, 0])
      HexBearing($Shaft = 1);
    //Coupler
    translate([0, -1 * $Explode, 0])
      HexCoupler();
    //Motor spacer
    translate([0, .19 * $Explode, 0])
      MotorSpacer();

    translate([0, 3.86 * $Explode, 0])
      rotate(90, [1, 0, 0])
        MiniCIM();
    
    //Far side bearing plate
    translate([0, -8, 0])
      mirror([0, 1, 0])
      {
        //Motor mount plate
        ShooterV2MotorPlate();
        //Bearing
        translate([0, -.15 * $Explode, 0])
          HexBearing($Shaft = 1);
      }
      //Drive shaft
      color([0.7, 0.8, 0.8])
        translate([0, -1.2, 0])
          rotate(90, [1, 0, 0])
            cylinder(d = 0.5, h = $ShooterV2GuideOpening - 1, $fn = 6);
      //Drive wheel(s)
      if ($Wheels == 1)
      {
        translate([0, -$ShooterV2GuideOpening / 2, 0])
          rotate(90, [1, 0,0])
            Wheel();
      }
      else
      {
        translate([0, -($ShooterV2GuideOpening / 2) + 1.5, ])
          rotate(90, [1, 0,0])
            Wheel();
        translate([0, -($ShooterV2GuideOpening / 2) - 1.5, ])
          rotate(90, [1, 0,0])
            Wheel();
      }
  }  
}

module Slot()
{
  rotate(90, [1, 0, 0])
    hull()
    {
      translate([$Length / 2, 0, 0])
        cylinder(d = $D, h = $H, $fn = 20, center = true);
      translate([-$Length / 2, 0, 0])
        cylinder(d = $D, h = $H, $fn = 20, center = true);
    }
}

module MotorSpacer()
{
  color([0.7, 0.7, 0.8])
    rotate(90, [1, 0, 0])
      difference()
      {
        cylinder(d = 2.5, h = 0.25, $fn = 50, center = true);
        cylinder(d = 1.5, h = 0.26, $fn = 50, center = true);
        //Motor bolt openings
        translate([1, 0, 0])
          cylinder(d = 0.165, h = 1, $fn = 20, center = true);
        translate([-1, 0, 0])
          cylinder(d = 0.165, h = 1, $fn = 20, center = true);
      }
}

module ShooterV2Model()
{
  if ($FeedFrom == 0)//Top feed
  {
    translate([-8, 0, -16])
      rotate(-$Angle - 270, [0, 1, 0])
        mirror([0, $MotorPlacement, 0])
          ShooterV2Shooter($Clip = 0);
  }
  else//Bottom feed
  {
    translate([-11, 0, -12])
      rotate($Angle + 270, [0, 1, 0])
        mirror([0, $MotorPlacement, 0])
          ShooterV2Shooter($Clip = 0);
  }

  translate([-13, -3.8, -17.3])
  {
    ShooterV2Feeder();
    FeederBallSet();
  }
}

module Ball()
{
  sphere(d = $BallDiameter, $fn = 60);
}

module FeederBallSet()
{
  translate([13, 3.8, 17.3])
  {
    translate([-11, 0, -13])
      Ball();
    translate([-17.3, -3.1, -13.6])
      Ball();
    translate([-12.5, -8.4, -13.0])
      Ball();
    translate([-5.9, -8.4, -10.6])
      Ball();
    translate([0.7, -8.4, -8.2])
      Ball();
  }
}

module HexCoupler()
{
  color([0.3, 0.3, 0.4])
    rotate(90, [1, 0, 0])
      difference()
      {
        intersection()
        {
          cylinder(d = 1, h = 1.5, $fn = 20, center = true);
          cube([1, .879, 1.5], center = true);
        }
        cylinder(d = 0.5, h = 1.6, $fn = 6, center = true);
      }
}

module HexBearing()
{
  rotate(-90, [1, 0, 0])
    color([0.4, 0.4, 0.5])
      difference()
      {
        union()
        {
          cylinder(d = 1.225, h = 0.063, $fn = 40);
          translate([0, 0, 0.063])
            cylinder(d = 1.124, h = 0.25, $fn = 40);
        }
        if ($Shaft == 1)
        {
          translate([0, 0, -0.1])
            cylinder(d = 0.5, h = 2, $fn = 6);
        }
      }
}

module ShooterV1ChannelGuide()
{
  intersection()
  {
    difference()
    {
      cube([11, 1/4, 11], center = true);
      rotate(90, [1, 0, 0])
        cylinder(d = $ShooterGuideOpening, h = 1, $fn = 50, center = true);
    }
    rotate(22.5, [0, 1, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 13, h = 1, $fn = 8, center = true);
  }
}

module ShooterV1Model()
{
  //Channel guides
  translate([0, -2, 0])
    difference()
    {
      ShooterV1ChannelGuide();
        cube([20, 1, 5], center = true);
    }
  translate([0, 2.5, 0])
    ShooterV1ChannelGuide();
  translate([0, 5.5, 0])
    ShooterV1ChannelGuide();
  translate([0, 10.5, 0])
    ShooterV1ChannelGuide();
  //Motors
  translate([-($BallDiameter + 1/4) / 2, 0, 0])
    ShooterV1SideMotorSet();
  mirror([1, 0, 0])
    translate([-($BallDiameter + 1/4) / 2, 0, 0])
      ShooterV1SideMotorSet();
  //Channel supports
  for (i = [0:7])
  {
    //Flat support guides
    rotate(360 * i / 8, [0, 1, 0])
    {
      if ((i == 2) || (i == 6))
      {
        translate([-0.5, 2.3, -($ShooterGuideOpening / 2) - 0.2])
          cube([1, 3.4, 1/4]);
      }
      else
      translate([-0.5, -2.15, -($ShooterGuideOpening / 2) - 0.2])
        cube([1, 13, 1/4]);
    }
    if ((i != 2) && (i != 6))
    {
      color("SILVER")
        rotate(360 * i / 8, [0, 1, 0])
          translate([0, -2.5, -($ShooterGuideOpening / 2) - .8])
            rotate(-90, [1, 0, 0])
              cylinder(d = 3/8, h = 13.5, $fn = 20);
    }
  }
}

module ShooterV1SideMotorSet()
{
  translate([-2.6 / 2, 0, -4.4])
    ShooterMotorWheelSet();
  translate([-2.6 / 2, $ShooterFeederSpacing, -4.4])
    ShooterMotorWheelSet();
}

module ShooterMotorWheelSet()
{
  MiniCIM();
  translate([0, 0, 4.4])
    Wheel();
}

module ShooterTrajectoryTest()
{
  PowerPort();
  translate([-$StartLineOffset * $inchtom, 0, 0])
    ShowTrajectory();
}

module ShowTrajectory()
{
  
  vu = $MuzzleVelocity*sin($Angle);//Vertical initial velocity component, +ve = up
  hu = $MuzzleVelocity*cos($Angle);//Horizontal initial velocity component
  echo(vu);
  for (step = [0: $SimSteps])
  {
    t = (step * $SimDuration)/ $SimSteps;
    vs=(vu*t) + (0.5*$va*(t*t));
    hs=(hu*t) + (0.5*$ha*(t*t));
    translate([hs, 0, vs])
      sphere(d = 7 * $inchtom, $fn = 20);
  }
}

module PowerPort()
{
  //Outer port
  difference()
  {
    //Main support
    translate([0, 0, 10*12*$inchtom / 2])
      cube([1 * $inchtom, 4*12*$inchtom, 10*12*$inchtom], center = true);
    //Outer port opening
    translate([0, 0, 98.25 * $inchtom])
      rotate(90, [0, 0, 1])
        rotate(90, [1, 0, 0])
          cylinder(d = (30 * $inchtom) / 0.866026, h = .1, $fn = 6, center = true);//Hex included circle conversion
    //Bottom port opening
    translate([-0.05, - 34 * $inchtom / 2, 18 * $inchtom])
      cube([.1, 34 * $inchtom, 10 * $inchtom]);
  }
  //Inner port
  translate([29.25 * $inchtom, 0, 98.25 * $inchtom])
  {
    difference()
    {
      cube([1 * $inchtom, 4*12*$inchtom, 3*12*$inchtom], center = true);
      rotate(90, [0, 1, 0])
        cylinder(d = 13 * $inchtom, h = 0.1, $fn = 50, center = true);
    }
  }
}

