use <RobotPrimitives.scad>
use <MCAD/involute_gears.scad>
use <MCAD/servos.scad>

/* [Action] */
$Action = 0; //[0: Nothing, 1:Trajectory sim, 2:Launcher V1, 3:Launcher V2, 4:Full bot V1, 5: Ball intake, 6:ControlWheelManipulator, 7:Hook lifter, 8:Control Wheel Manipulator, 9:Shooter angler]

/* [Field elements] */
$ShowControlPanel = false;//Show control panel wheel
$ShowLoadingBay = false;//Show loading bay heights
$ShowGoals = false;//Show goal heights

/* [Bounding boxes] */
$ShowStartBound = false;//Show robot starting constraints
$ShowTrenchBound = false;//Show bounds for trench run
$ShowMaxBound = false;//Show bounds for max reach

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
$ShooterStyle = 1;//[0: None, 1:Double parallel, 2:Single round]
$HopperStyle = 3;//[0: None, 1:Square, 2:Round, 3: Flat]
$FeedFrom = 1;//[0:Top, 1:Bottom]
$MotorPlacement = 1;//[0:Outer, 1:Inner]

//Shooter parameters
$ShooterFeederSpacing = 8;
$ShooterGuideOpening = 8;

$LaunchCompression = 1;//
$ShooterV2GuideOpening = 8;//Width of the guide channel

/* [Intake options] */
$BallIntakeStyle = "BallIntakeV2"; //[BallIntakeV1:"Front roller, side transport", BallIntakeV2:"Front scoop", BallIntakeV3:"Front, inset conveyor"]
$ScoopRotationDrive = 2;//[0: None, 1:Balanced, 2:Dynamic]
// slider widget for Intake channel count
$FSIntakeChannels = 1;//[1:3]
$FRSTHeight = 12;//FRST intake channel height
$FSHopperAngle = 0;//Front scoop hopper rotation angle
$FSHopperCenterX = 4;//Front scoop hopper rotation axis-X. (0, 0) = bottom-back of hopper
$FSHopperCenterY = 5;//Front scoop hopper rotation axis-Y
$FSIntakeAngle   = 0;//Front scoop intake angle
$FSIntakeXLength = 10;//Front scoop intake length
$FSIntakeYLength = -2;//Front scoop intake height
$BackBumperSize  = 3;//Bumper plate

/* [Control wheel options] */
$ControlWheelAngle = 0;

/* [Hidden] */
$va = -9.8;//Vertcal acceleration (9.8m/s^2)
$ha = 0;//Zero acceleration horizontally
$BallDiameter = 7;
$inchtom = 0.0254;
$mtoinch = 1/$inchtom;
$mtofeet = $mtoinch / 12;
$Explode = 1.0;

$FulcrumLength = 4;

$FSAxisSpacing = sqrt(($FSIntakeXLength * $FSIntakeXLength) + ($FSIntakeYLength * $FSIntakeYLength));
$FSSupportAngle = Triangle_SSS_A($A1 = $FSAxisSpacing, $A2 = $FSIntakeXLength, $O = $FSIntakeYLength);


$ShooterV2FeederSpacing = $BallDiameter + $FlyWheelDiameter - $LaunchCompression;//Spacing between drive wheel set centers
$ShooterFlywheelColor = [0.7, 0.1, 0.2];

$StartRobotBounds = [30, 30, 45];
$MaxRobotBounds = [$StartRobotBounds[0] + 24, $StartRobotBounds[1] + 24, $StartRobotBounds[2]];
$TrenchRunBounds = [30, 30, 27];

//Color wheel manipulator
$CWShaftDiameter = 8/25.4;//8mm
$CWShaftClearance = 2/25.4;//2mm
$CWMotorDiameter = 1.5;
$ControlWheelContactorHeight = 6;

$ControlWheelOffset = [0, -0.28, -2];

//Misc colors
Oak = [0.65, 0.5, 0.4];
Pine = [0.85, 0.7, 0.45];
Birch = [0.9, 0.8, 0.6];
FiberBoard = [0.7, 0.67, 0.6];
BlackPaint = [0.2, 0.2, 0.2];
Iron = [0.36, 0.33, 0.33];
Steel = [0.65, 0.67, 0.72];
Stainless = [0.45, 0.43, 0.5];
Aluminum = [0.77, 0.77, 0.8];
Brass = [0.88, 0.78, 0.5];
Transparent = [1, 1, 1, 0.2];

//Shooter angler parameters
$PivotBoltD = 0.21;//M5
$PivotBoltHeadD = 0.38;//M5
$PivotBoltInset = .15;
$LeadscrewTNutD = .41;
$LeadscrewTNutOuterD = 0.9;
$NutAccessHeight = .7;
$FrameDepth = 1;
$FrameHeight = 1.0;
$SupportHeight = .75;
$SupportSideWidth = 0.3;
$Clearance = 0.05;
$SupportDepth = 2.5;
$FrameClearanceDepth = $FrameDepth + .4;
$ShooterAngleMotorD = 1.5;
$LowerSupportWidth = 2.5;
$LowerSupportHeight = 0.75;
$LowerSupportDepth = 2.8;
$VerticalMountSpacing = 0.85;

//Set variables based on settings now
$ScoopWidth = (7 * $FSIntakeChannels) + 3;

DoAction();
ShowFieldElements();
ShowBoundingBoxes();

//Printable elements
//  ControlDriveMount();
//  ControlWheelFrame();
//  ControlPanelServoGear($Teeth = 12);
//  ShooterAnglerPrint();

module ShowFieldElements()
{
  if ($ShowControlPanel)
  {
    translate([0, 23, 0])
      ControlPanel();
  }  
  if ($ShowLoadingBay)
  {
    translate([0, 27, 0])
      color(Oak)
        LoadingBay();
  }
  if ($ShowGoals)
  {
    translate([0, 27, 0])
      color(Pine)
        PortGoals();
  }
}

module PortGoals()
{
  difference()
  {
    translate([-20, 0 ,0])
      cube([40, 0.125, 48]);
    //Lower portal goal
    translate([-17, -.1, 18])
      cube([34, 1, 8]);
  }
}

module LoadingBay()
{
  difference()
  {
    translate([-15, 0 ,0])
      cube([30, 0.125, 48]);
    //Upper loading bay
    translate([-12, -.1, 24])
      cube([24, 1, 8]);
    //Lower loading bay
    translate([-4, -.1, 3])
      cube([8, 1, 8]);
  }
}

module ShowBoundingBoxes()
{
  if ($ShowStartBound)//Show robot starting constraints
  {
    ShowBounds($Bounds = $StartRobotBounds);
  }

  if ($ShowTrenchBound)//Show bounds for trench run
  {
    ShowBounds($Bounds = $TrenchRunBounds);
  }

  if ($ShowMaxBound)//Show bounds for trench run
  {
    ShowBounds($Bounds = $MaxRobotBounds);
  }
}

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
    Intake();
  else if ($Action == 6)
    ControlWheelManipulator();
  else if ($Action == 7)
    HookLifter();
  else if ($Action == 8)
    ControlWheelManipulator();
  else if ($Action == 9)
    ShooterAngler();
}

module ShooterAnglerPrint()
{
  translate([0.35, -0.2, $FrameHeight])
    rotate(180, [1, 0, 0])
      ShooterAnglerUpperPivot($FrameWidth = 1.6);
  translate([2.3, -0.2, 0])
    rotate(180, [0, 0, 1])
      ShooterAnglerPivotSupport($DoHex = true, $FrameWidth = 1.6, $DoHorizontal = true);
  ShooterAnglerLowerSupport();
  translate([-$SupportSideWidth - $Clearance, 2, 0])
    ShooterAnglerPivotSupport($FrameWidth = $LowerSupportWidth, $VerticalMountSpacing, $DoVertical = true, , $DoHorizontal = true);
}


module ShooterAngler()
{
  translate([$Clearance + $SupportSideWidth, 0, 3])
    ShooterAnglerUpperPivot($FrameWidth = 1.6);
  translate([0, 0, 3])
    ShooterAnglerPivotSupport($DoHex = true, $FrameWidth = 1.6);
  ShooterAnglerLowerSupport();
  translate([-$SupportSideWidth - $Clearance, 2, 0])
    ShooterAnglerPivotSupport($FrameWidth = $LowerSupportWidth, $VerticalMountSpacing, $DoVertical = true);
}

module ShooterAnglerLowerSupport()
{
  difference()
  {
    //Main frame
    cube([$LowerSupportWidth, $LowerSupportDepth, $LowerSupportHeight]);
    //Motor opening
    translate([$LowerSupportWidth / 2, 1.2, 0])
      cylinder(d = $ShooterAngleMotorD, h = 4, $fn = 20, center = true);
    //Motor clamp gap
    translate([$LowerSupportWidth / 2, 0, 0.5])
      cube([.2, 1, 2], center = true);
    //Motor clamp bolt
    translate([-0.1, 0.25, $LowerSupportHeight / 2])
      rotate(90, [0, 1, 0])
        cylinder(d = 3/16, h = 3, $fn = 20);
    //Pivot hole
    translate([-0.1, 2.45, $LowerSupportHeight / 2])
      rotate(90, [0, 1, 0])
        cylinder(d = .198, h = 3, $fn = 20);
  }
}

module ShooterAnglerPivotSupport($DoHex = false, $DoVertical = false, $DoHorizontal = false)
{
  $SupportWidth = $FrameWidth + $SupportSideWidth + $SupportSideWidth + $Clearance + $Clearance;

  difference()
  {
    //Main frame
    cube([$SupportWidth, $SupportDepth, $SupportHeight]);
    //Opening for pivot mech
    translate([$SupportSideWidth, -0.01, -0.01])
      cube([$FrameWidth + ($Clearance * 2), $FrameClearanceDepth + 0.01, $SupportHeight + 0.02]);
    //Pivot shaft opening
    translate([(($FrameWidth + $LeadscrewTNutOuterD) / 2) - 0.01, $FrameDepth / 2, $SupportHeight / 2])
      rotate(90, [0, 1, 0])
        cylinder(d = $PivotBoltD, h = $SupportWidth + 1, $fn = 20, center = true);
    if ($DoVertical == true)
    {
      //Vertical mount holes
      translate([$SupportWidth / 2, 2, 0])
        cylinder(d = 3/16, h = 4, $fn = 20, center = true);
      translate([($SupportWidth / 2) - $VerticalMountSpacing, 2, 0])
        cylinder(d = 3/16, h = 4, $fn = 20, center = true);
      translate([($SupportWidth / 2) + $VerticalMountSpacing, 2, 0])
        cylinder(d = 3/16, h = 4, $fn = 20, center = true);
    }
    if ($DoHex == true)
    {
      translate([-0.1, 2, $SupportHeight / 2])
        rotate(30, [1, 0, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = 15.1 / 25.4, h = $SupportWidth + .2, $fn = 6);
    }
  }
  if ($DoHorizontal == true)
  {
    //Horizontal mount block
    translate([0, 1.3, 0])
      difference()
      {
        translate([0, 0, $SupportHeight])
        cube([$SupportSideWidth, 1.2, 0.6]);
        translate([0, 0.25, 1])
          rotate(90, [0, 1, 0])
            cylinder(d = 3/16, h = 2, $fn = 20, center = true);
        translate([0, 0.95, 1])
          rotate(90, [0, 1, 0])
            cylinder(d = 3/16, h = 2, $fn = 20, center = true);
      }
    }
}

module ShooterAnglerUpperPivot()
{
  difference()
  {
    //Base frame
    cube([$FrameWidth, $FrameDepth, $FrameHeight]);
    //Nut channel access
    translate([($FrameWidth - $LeadscrewTNutOuterD) / 2, -0.1, -0.01])
      cube([$LeadscrewTNutOuterD, $FrameDepth + 0.2, $NutAccessHeight]);
    //TNut opening
    translate([$FrameWidth / 2, $FrameDepth / 2, .685])
      cylinder(d1 = $LeadscrewTNutD + 0.01, d2 = $LeadscrewTNutD , h = .32, $fn = 20);
    //Pivot shaft bolt captures
    translate([(($FrameWidth - $LeadscrewTNutOuterD) / 2) + 0.01, $FrameDepth / 2, 0.3])
      rotate(-90, [0, 1, 0])
      {
        rotate(30, [0, 0, 1])//Rotate so flat is aligned with bottom
          cylinder(d = $PivotBoltHeadD, h = $PivotBoltInset, $fn = 6);
        cylinder(d = $PivotBoltD, h = 2, $fn = 20);
      }
    translate([(($FrameWidth + $LeadscrewTNutOuterD) / 2) - 0.01, $FrameDepth / 2, 0.3])
      rotate(90, [0, 1, 0])
      {
        rotate(30, [0, 0, 1])//Rotate so flat is aligned with bottom
          cylinder(d = $PivotBoltHeadD, h = $PivotBoltInset, $fn = 6);
        cylinder(d = $PivotBoltD, h = 2, $fn = 20);
      }
  }
}

module HookLifter()
{
  $HookLifterPositionAngle = 10;
  $HookLifterSegmentLength = 20;
  rotate(90 - $HookLifterPositionAngle, [1, 0, 0])
    Tube($L = $HookLifterSegmentLength, $W = 1, $H = 1);
  translate([0,-($HookLifterSegmentLength * cos($HookLifterPositionAngle)), 1 + ($HookLifterSegmentLength * sin($HookLifterPositionAngle))])
    rotate(-90 + $HookLifterPositionAngle, [1, 0, 0])
      Tube($L = $HookLifterSegmentLength, $W = 1, $H = 1);
  translate([0, 0, 2 + (2 * $HookLifterSegmentLength * sin($HookLifterPositionAngle))])
    rotate(90 - $HookLifterPositionAngle, [1, 0, 0])
      Tube($L = $HookLifterSegmentLength, $W = 1, $H = 1);
}

module ControlPanel()
{
  ControlColor = [[0, 1, 1], [0, 1, 0], [1, 0, 0], [1, 1, 0]];
  translate([0, 0, 30.25])
    for (i = [0:7])
      rotate((-45 * i), [0, 0, 1])
        color(ControlColor[i % 4])
          linear_extrude(height  = 2)
            slice(32 / 2, 45);
}

module FullBotV1()
{
  RobotBaseSimple($BumperOffset = 1, $OpenFront = true);
  Shooter();
  Intake();
  translate([1.5, 0.5, 25])
    rotate(90, [0, 0, 1])
      ControlWheelManipulator();
}

module Shooter()
{
  if ($ShooterStyle == 1)
    translate([-7.5, -8, 22])
      rotate(180, [0, 0, 1])
        ShooterV2Model();
}

module Intake()
{
  if ($BallIntakeStyle == "BallIntakeV1")
  {
    translate([4, 6, 3])
      BallIntakeV1();
    translate([0, 10, 3.5])
      Ball();
  }
  else if ($BallIntakeStyle == "BallIntakeV2")
  {
    translate([0, 21, 3.5])
      Ball();
    translate([0, 17 - $FSIntakeXLength + $FSHopperCenterX, $FSHopperCenterY + 6.5 - $FSIntakeYLength])
      BallIntakeScoopMechanism();
  }
  else if ($BallIntakeStyle == "BallIntakeV3")
  {
    BallIntakeInsetConveyor();
  }
  
}

module BallIntakeInsetConveyor()
{
  translate([0, 5.5, 6])
    BallIntakeScoop();
}

module BallIntakeScoopMechanism()
{
  rotate($FSIntakeAngle, [1, 0, 0])
  {
    //Intake scoop actuator
    BallIntakeScoopActuator();
    //Show rotation axis
    color("BLACK")
      rotate(90, [0, 1, 0])
        cylinder(d = .2, h = 30, $fn = 10, center = true);
    translate([0, $FSIntakeXLength, $FSIntakeYLength])
    {
      //Intake scoop
      //Show rotation axis
      color("BLACK")
        rotate(90, [0, 1, 0])
          cylinder(d = .2, h = 30, $fn = 10, center = true);
      rotate($FSHopperAngle - $FSIntakeAngle, [1, 0, 0])
        translate([0, -$FSHopperCenterX, -$FSHopperCenterY])
          BallIntakeScoop();
    }
  }
  if ($ScoopRotationDrive == 1)
      ScoopDriveBalancing();
  else if ($ScoopRotationDrive == 2)
    {
      ScoopDriveDynamic();
    }
}

module ScoopDriveDynamic()//Orientation of the hopper requires software tracking
{
  //Hopper rotation mech
  //Chain sprockets
  translate([-($ScoopWidth / 2) - 0.1 - .5, 0, 0])
  {
    rotate($FSIntakeAngle - $FSSupportAngle, [1, 0, 0])
    {
      translate([5.2, -2, 1.5])
        rotate(-90, [0, 1, 0])
          Neverest();
      translate([0, -2, 1.5])
        rotate(-90, [0, 1, 0])
          cylinder(d = 1.5, h = .25, $fn = 20);

        translate([0, $FSAxisSpacing, 0])
          rotate(-90, [0, 1, 0])
            cylinder(d = 3, h = .25, $fn = 20);


      //Rotation motor drive chain
      color("DARKGRAY")
      {
        translate([-0.23, -2, 2.2])
          rotate(-3.5, [1, 0, 0])
            cube([.2, 12.5, .2]);
          translate([-0.23, -2, .55])
            rotate(-10.5, [1, 0, 0])
              cube([.2, 12.5, .2]);
      }
    }
  }
}

module ScoopDriveBalancing()//Auto orientation of the hopper
{
  translate([-($ScoopWidth / 2) - .45, 0, 0])
  {
    //Hopper rotation mech
    //Chain sprockets
    translate([-0.1, 0, 0])
      rotate($FSIntakeAngle-$FSSupportAngle, [1, 0, 0])
        translate([0, $FSAxisSpacing, 0])
          rotate(-90, [0, 1, 0])
            cylinder(d = 3, h = .25, $fn = 20);
    //Scoop rotation motor/sprocket set
    //Alignment sprocket
    translate([-0.1, 0, 0])
      rotate(-90, [0, 1, 0])
        cylinder(d = 3, h = .25, $fn = 20);
    //Alignment drive chain
    translate([-0.32, 0, 0])
      color("DARKGRAY")
        rotate($FSIntakeAngle - $FSSupportAngle, [1, 0, 0])
        {
          translate([0, 0, 1.5])
              cube([.2, $FSAxisSpacing, .2]);
          translate([0, 0, -1.5 - 0.2])
              cube([.2, $FSAxisSpacing, .2]);
        }
    //Rotation sprocket
    translate([0.3, 0, 0])
      rotate(-90, [0, 1, 0])
        cylinder(d = 3, h = .25, $fn = 20);
    //Rotation Motor
    translate([5.2, 0, -3])
      rotate(-90, [0, 1, 0])
        Neverest();
    //Rotation motor sprocket
    translate([0.3, 0, -3])
      rotate(-90, [0, 1, 0])
        cylinder(d = 1.5, h = .25, $fn = 20);
    //Rotation motor drive chain
    color("DARKGRAY")
    {
      translate([ 0.18, 1.2, -1.7])
        rotate(75, [1, 0, 0])
          cube([.2, 3.2, .2], center = true);
      mirror([0, 1, 0])
        translate([0.18, 1.2, -1.7])
          rotate(75, [1, 0, 0])
            cube([.2, 3.2, .2], center = true);
    }
  }
}

module BallIntakeScoopActuatorSide()
{
  rotate(-90 - $FSSupportAngle, [1, 0, 0])
  {
    translate([0, 0, -$FulcrumLength])
      Tube($L = $FSAxisSpacing + $FulcrumLength + 0.5, $W = 1, $T = 1);
  }
}

module BallIntakeScoopActuator()
{
  translate([($ScoopWidth / 2) + 0.75, 0, 0])
    BallIntakeScoopActuatorSide();
  translate([-($ScoopWidth / 2) - 1.5, 0, 0])
    BallIntakeScoopActuatorSide();
}

module BallIntakeScoop($ShowWideBalls = true)
{
  translate([0, 4.4, 3.5])
    Ball();
  translate([0, 4.4, 3.5 + 7])
    Ball();
  if ($FSIntakeChannels == 3)
  {
    translate([7.2, 4.4, 3.5])
      Ball();
    translate([7.2, 4.4, 3.5 + 7])
      Ball();
    translate([-7.2, 4.4, 3.5])
      Ball();
  }
  //Leading edge scooper roller
  color(Brass)
    translate([0, 7, 0])
      rotate(90, [0, 1, 0])
        cylinder(d = 2, h = $ScoopWidth - 3, $fn = 30, center = true);
  //Intake motor and drive
  //Chain sprockets
  translate([-($ScoopWidth / 2) - 0.1, 7, 0])
    rotate(-90, [0, 1, 0])
      cylinder(d = 1.5, h = .25, $fn = 20);
  translate([-($ScoopWidth / 2) - 0.1, 0, 0])
  {
    translate([0, -2, 2])
    {
      rotate(-90, [0, 1, 0])
        cylinder(d = 1.5, h = .25, $fn = 20);
      //Motor
      translate([5, 0, 0])
        rotate(-90, [0, 1, 0])
          Neverest();
    }
    //Drive chain
    translate([0, 7, 0])
      color("DARKGRAY")
        rotate(167.4, [1, 0, 0])
        {
          translate([-.12, 0, 1.5 / 2])
              cube([.2, 9.3, .2]);
          translate([-.12, 0, -1.9 / 2])
              cube([.2, 9.3, .2]);
        }
      }

  //"box" support frame
  //Left
  translate([-($ScoopWidth / 2) - 0.0, 0, 0])
    ScoopFrameSide();
  //Right
  mirror([1, 0, 0])
    translate([-($ScoopWidth / 2), 0, 0])
      ScoopFrameSide();
  //Lower back
  translate([-($ScoopWidth / 2) + 1.125, 0, 0.5])
    rotate(90, [0, 1, 0])
      Tube($L = $ScoopWidth - 2 - 0.25, $W = 1, $T = 2);
  //Upper back
  translate([-($ScoopWidth / 2) + 1.125, -0.5, 11.5])
    rotate(90, [0, 1, 0])
      Tube($L = $ScoopWidth - 2 - 0.25, $W = 1, $T = 1);
  
  //Hopper box
  color([0.6, 0.25, 0.11, 0.5])
  {
    //Front panel
    translate([-($ScoopWidth / 2), 8, 2])
      cube([$ScoopWidth, 0.125, 11]);
    //Back panel
    translate([-($ScoopWidth / 2), 0, 1])
      cube([$ScoopWidth, 0.125, 11]);
    //Side panels
    translate([($ScoopWidth / 2), -1, 0])
      cube([0.125, 9, 13]);
    translate([-($ScoopWidth / 2), -1, 0])
      cube([0.125, 9, 13]);
    //Back bumper panel
    translate([-($ScoopWidth / 2) + 1 + 0.125,1, -$BackBumperSize])
      cube([$ScoopWidth - 2 - 0.25, 0.125, $BackBumperSize + 1]);
  }
}

module ScoopFrameSide()
{
  
  {
    //Front vertical
    translate([0.5 + 0.125, -0.5 + 8, 2])
      Tube($L = 10, $W = 1, $H = 1);
    //Back vertical
    translate([0.5 + 0.125, -0.5, 0])
      Tube($L = 12, $W = 1, $H = 1);
    //Top horizontal
    translate([0.5 + 0.125, -1, 12.5])
      rotate(-90, [1, 0, 0])
        Tube($L = 9, $W = 1, $H = 1);
    //Bottom horizontal
    translate([0.5 + 0.125, -0, 1])
      rotate(-90, [1, 0, 0])
        Tube($L = 8, $W = 1, $T = 2);
  }
}

ControlWheelManipulator();
module ControlWheelManipulator()
{
  //Drive wheel assembly
  rotate(-$ControlWheelAngle, [1, 0, 0])
    ControlDriveWheelAssembly();
  //Mount frame
  translate([-3.8, 1.22, 0])
    ControlDriveMountAssembly();
}

module ControlDriveMountAssembly()
{
  translate([0.63, 0, -1.75])
    ControlServoAndGear();
#  ControlDriveMount();
}

module ControlDriveMount()
{
  translate([0, -1, -1.35])
  difference()
  {
    //Main base
    cube([2, 3, 2]);
    translate([-0.1, 1, 1.35])
    {
      //Shaft opening
      rotate(90, [0, 1, 0])
        cylinder(d = $CWShaftDiameter + $CWShaftClearance, h = 4, $fn = 20);
      //Rotation shaft bearings
      translate([.09, 0, 0])
        rotate(90, [0, 1, 0])
          scale(1/25.4)
            BearingReceptical($Type="608",  $DOversize = .5);
      translate([1.83, 0, 0])
        rotate(90, [0, 1, 0])
          scale(1/25.4)
            BearingReceptical($Type="608",  $DOversize = .5);
    }
  }
  //Servo mount blocks
  translate([.85, 1.25, -2.15])
    difference()
    {
      cube([.7, .75, .8]);
      translate([-0.1, .1, .2])
        rotate(90, [0, 1, 0])
          cylinder(d = .2, h = 1, $fn = 20);
      translate([-0.1, .1, .6])
        rotate(90, [0, 1, 0])
          cylinder(d = .2, h = 1, $fn = 20);
    }
  translate([.85, -.47, -2.15])
    mirror([0, 1, 0])
      difference()
      {
        cube([.7, .53, .8]);
        translate([-0.1, .1, .2])
          rotate(90, [0, 1, 0])
            cylinder(d = .2, h = 1, $fn = 20);
        translate([-0.1, .1, .6])
          rotate(90, [0, 1, 0])
            cylinder(d = .2, h = 1, $fn = 20);
      }
}

module ControlPanelServoGear()
{
  difference()
  {
    ControlPanelRotationGear($Thickness = 7, $Bore = 10, $Teeth = 12);
//    //Servo coupler inset
//    translate([0.2, 0, 0])
//      rotate(90, [0, 1, 0])
//        cylinder(d = 1, h = .2, $fn = 30);
  }
}

module ControlServoAndGear()
{
  //Rotation drive gear
  color([0.2, 0.4, 0.4])
    translate([-1.54 + 3, 0, 0])
        rotate($ControlWheelAngle + 11, [1, 0, 0])
          ControlPanelServoGear();
  //Servo
  translate([0, 0, 0])
    rotate(180, [1, 0, 0])
      rotate(90, [0, 1, 0])
        color(BlackPaint)
          Servo();
}

module Servo()
{
  scale(1/25.4)
    translate([-10, -30, 0])
      futabas3003();
}
module ControlDriveWheelAssembly()
{
  //Translate so rotation point is correct
  translate([0, 1.5, 2])
  {
    //Drive wheel
    color([.4, .3, .5])
      cylinder(d = 4, h = $ControlWheelContactorHeight, $fn = 20);
    //Spindle
    cylinder(d = .25, h = 7, $fn = 20);
    translate([0, 0, -4.7])
      Neverest();
    ControlWheelFrame();
    
    //Rotation shaft
    color("SILVER")
    translate($ControlWheelOffset)
      translate([-0.7, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $CWShaftDiameter, h = 6, $fn = 20, center = true);
    
  }
}

module ControlWheelFrame()
{ 
  difference()
  {
    union()
    {
      //Bottom base
      translate([-0.1, 0, -2])
        cube([2.5, 6, 2], center = true);
      //Side suppports
      translate([-0.75, 2.5, -1])
        cube([1.5, .5, 7.5]);
      translate([-0.75, -3, -1])
        cube([1.5, .5, 7.5]);
      //Top support
      translate([0, 0, 6.4])
        cube([1.5, 6, .4], center = true);
      //Rotation drive gear
      translate([-1.74, 0, 0])
        translate($ControlWheelOffset)
          color([0.5, 0.2, 0.7])
            ControlPanelRotationGear($Thickness = 10);
    }
    //Motor opening
    translate([0, -0.28, 0])//Neverest shaft is 0.28" off center
      cylinder(d = $CWMotorDiameter, h = 7, $fn = 30, center = true);
    translate($ControlWheelOffset)
    {
      //Rotation bolt shaft opening to allow bolt to pass through to roration
      rotate(90, [0, 1, 0])
        cylinder(d = 0.6, h = 2, $fn = 20);
      //Rotation bolt shaft
      translate([-2.5, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $CWShaftDiameter + $CWShaftClearance, h = 2, $fn = 20);
      //Rotation bolt head
      translate([-0.73 - .3, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $CWShaftDiameter + $CWShaftClearance + .2, h = .5, $fn = 6);
    }
    //Motor clamp mechanism
    translate([0, 0, -3.5])
    {
      cube([.1, 1.5, 3]);
        translate([-1.4, 1.5, 0])
      cube([1.5, .1, 3]);
    }
    translate([0, 1, -2])
    {
      //Bolt shaft opening
      rotate(90, [0, 1, 0])
        cylinder(d = 0.3, h = 5, $fn = 20, center = true);
      //Bolt head inset
      translate([1.01, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 0.6, h = .3, $fn = 6, center = true);
    }
    //Spindle bearing
    translate([0, 0, 6.29])
    {
      scale(1/25.4)
        BearingReceptical($Type="608",  $DOversize = .5, $HOversize = 1);
      cylinder(d = $CWShaftDiameter + $CWShaftClearance, h = 1, $fn = 20, center = true);
    }
  }
}

module ControlPanelRotationGear($Thickness = 10, $Bore = 0, $Teeth = 16)
{
  rotate(90, [0, 1, 0])
    scale(1/25.4)
      gear (	
        number_of_teeth=$Teeth,
        circular_pitch=500, 
        diametral_pitch=false,
        pressure_angle=18,//28
        clearance = 0.2,
        gear_thickness=$Thickness,
        rim_thickness=$Thickness,
        rim_width=5,//Outer rim width
        hub_thickness=0,//Hub length
        hub_diameter=15,//Hub diameter
        bore_diameter=$Bore,//Bore diameter
        circles=0,
        backlash=0,
        twist=0,
        involute_facets=4,
        flat=false);
}

module BallIntakeV1()
{
  //$FRSTHeight
  //Left, drive plate
  difference()
  {
    cube([0.125, 8, $FRSTHeight + 3]);
    translate([-0.01, 4.1, 0])
      cube([0.225, 4, 4]);
  }
    translate([0, 4.5, 0])
      rotate(-35, [0, 0, 1])
        cube([0.125, 4.5, 2]);
  //Right side
  translate([-7.5, 0, 0])
  difference()
  {
    cube([0.125, 8, $FRSTHeight]);
    translate([-0.01, 4.1, 0])
      cube([0.225, 4, 4]);
  }
    translate([-7.5, 4.5, 0])
      rotate(35, [0, 0, 1])
        cube([0.125, 4.5, 2]);
  //Back
  translate([-7.4, 0, 0])
    cube([7.5, 0.125, $FRSTHeight + 3]);
  //Lower drive wheel
  translate([1, 4, 2])
    rotate(90, [1, 0, 0])
    {
      Wheel($Diameter = 4, $Thickness = 1);
      translate([0, 0, 4.7])
        rotate(180, [0, 1, 0])
          Neverest();
    }
  //Front
  translate([-7.5, 8, 7])
    cube([7.5, 0.125, $FRSTHeight - 4]);
  //Kick wheel
  translate([-2, 4, $FRSTHeight + 5])
    rotate(90, [1, 0, 0])
    {
      Wheel($Diameter = 4, $Thickness = 1);
      translate([0, 0, 4.7])
        rotate(180, [0, 1, 0])
          Neverest();
    }
  //Intake pusher
  color("BLUE")
  translate([-3.75, 9, 5])
    rotate(90, [0, 1, 0])
      cylinder(d = 4, h = 5, $fn = 30, center = true);
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
  if ($HopperStyle == 1)
  {
    difference()
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
      translate([-8, -10, 0])
        cube([8, 10, 10]);
      translate([19, -10, 5])
        cube([8, 10, 10]);
      }
    FeederBallSet();
  }
  else if ($HopperStyle == 2)
  {
    difference()
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
        translate([-8, -10, 0])
          cube([8, 10, 10]);
        translate([19, -10, 5])
          cube([8, 10, 10]);
      }
    FeederBallSet();
  }
  else if ($HopperStyle == 3)
  {
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

