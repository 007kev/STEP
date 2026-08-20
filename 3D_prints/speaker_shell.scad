// more facets for making smooth arcs
$fa = 2;
$fs = 0.25;

// speaker dimensions
speaker_width = 134;
speaker_depth = 64;
speaker_height = 64;

// smaller box to subtract from speaker
// making the walls 2.5mm for strength
subtraction = 2.5;

box_width = speaker_width - subtraction;
box_depth = speaker_depth - subtraction;
box_height = speaker_height;
box_z_offset = subtraction;

// speaker bolt holes M2 screws
bolt_diameter = 2;

//distance from speaker 
bolt_distance = 4.04;

// speaker holes
bose_diameter = 33.34;

// bolt hole distances (assuming 45 degrees)
bolt_hole_distance = bolt_distance + (bolt_diameter/2) + (bose_diameter/2);
bolt_hole = (sqrt(2)*bolt_hole_distance)/2;

difference(){
    group(){
        // speaker body
        color("blue")
          cube([speaker_width, 
              speaker_depth, 
              speaker_height], 
              center = true);
        
    }// end of group

    translate([0, 0, box_z_offset])
    // box body
    color("red")
      cube([box_width,
          box_depth,
          box_height],
          center = true);
    
    rotate([0, 90, 0])
      cylinder(h = speaker_width + 5, 
               d = bose_diameter, 
               center = true);
    
 // bolt hole 1 - 4
    translate([0, bolt_hole, bolt_hole])
        rotate([0, 90, 0])
            cylinder(h = speaker_width + 5,
                     d = bolt_diameter,
                     center = true);

    translate([0, -bolt_hole, bolt_hole])
        rotate([0, 90, 0])
            #cylinder(h = speaker_width + 5,
                     d = bolt_diameter,
                     center = true);  
                  
    translate([0, -bolt_hole, -bolt_hole])
        rotate([0, 90, 0])
            cylinder(h = speaker_width + 5,
                     d = bolt_diameter,
                     center = true);
                     
    translate([0, bolt_hole, -bolt_hole])
        rotate([0, 90, 0])
            cylinder(h = speaker_width + 5,
                     d = bolt_diameter,
                     center = true);
                     
    translate([-speaker_width/2 + 41.18, speaker_depth/2 - 10.7 , -speaker_height/2])
        cylinder(h = 10, d = 3, center = true);
        
    translate([-speaker_width/2 + 95.4, speaker_depth/2 - 25 , -speaker_height/2])
        cylinder(h = 10, d = 3, center = true);
        
        
        // control box cut out w/ M3 screw holes
    translate([speaker_width/2 - 32.2, speaker_depth/2 - 4, -speaker_height/2 + 18.6])
        rotate([0, 0, 90])
        cube([8, 69.6, 17.4]);
        
    translate([speaker_width/2 - 32.2 + 1.5 + 0.64, 
               speaker_depth/2, 
               -speaker_height/2 + 18.6 + 1.5 + 6.10])
        rotate([90 , 0, 0])
        cylinder(h = 8, d = 3, center = true);
        
    translate([-speaker_width/2 + 32.2 - 1.5 - 0.64,
               speaker_depth/2, 
               -speaker_height/2 + 18.6 + 1.5 + 6.10])
        rotate([90 , 0, 0])
        cylinder(h = 8, d = 3, center = true);

}// end of difference



difference(){
    group(){
    // for threaded inserters later
    translate([speaker_width/2 - 7/2,
               speaker_depth/2 - 7/2,
               speaker_height/2 - 10/2])
      color("green")
        cube([7, 7, 10],center= true);

    translate([-speaker_width/2 + 7/2,
               speaker_depth/2 - 7/2,
               speaker_height/2 - 10/2])
      color("green")
        cube([7, 7, 10],center= true);

    translate([-speaker_width/2 + 7/2,
               -speaker_depth/2 + 7/2,
               speaker_height/2 - 10/2])
      color("green")
        cube([7, 7, 10],center= true);

    translate([speaker_width/2 - 7/2,
               -speaker_depth/2 + 7/2,
               speaker_height/2 - 10/2])
      color("green")
        cube([7, 7, 10],center= true);
    }// end of group
                     
     // holes for cover screws M3 screws                   
     translate([speaker_width/2 - 3.5, -speaker_depth/2 + 3.5, speaker_height/2 - 5])
        cylinder(h = 30, d = 3, center = true);
        
     translate([speaker_width/2 - 3.5, speaker_depth/2 - 3.5, speaker_height/2 - 5])
        cylinder(h = 30, d = 3, center = true);
        
     translate([-speaker_width/2 + 3.5, -speaker_depth/2 + 3.5, speaker_height/2 - 5])
        #cylinder(h = 30, d = 3, center = true);
                  
     translate([-speaker_width/2 + 3.5, speaker_depth/2 - 3.5, speaker_height/2 - 5])
        cylinder(h = 30, d = 3, center = true);
    
    
     translate([-speaker_width/2 + 3.5, speaker_depth/2 - 3.5, speaker_height/2 - 10])
        color("purple")
        #cylinder(h = 5, d = 5, center = true);
    
     translate([speaker_width/2 - 3.5, speaker_depth/2 - 3.5, speaker_height/2 - 10])
        color("purple")
        #cylinder(h = 5, d = 5, center = true);
        
     translate([speaker_width/2 - 3.5, -speaker_depth/2 + 3.5, speaker_height/2 - 10])
        color("purple")
        #cylinder(h = 5, d = 5, center = true);
        
     translate([-speaker_width/2 + 3.5, -speaker_depth/2 + 3.5, speaker_height/2 - 10])
        color("purple")
        #cylinder(h = 5, d = 5, center = true);
    
}//end of difference

difference(){    
    group(){
        translate([-speaker_width/2, speaker_depth, -speaker_height/2])
            cube([speaker_width, speaker_depth, 2.5]);
            } // end of group
            
        translate([-speaker_width/2 + 3.5, speaker_depth + 3.5, -speaker_height/2])
                #cylinder(h = 10, d = 3, center = true);
            
        translate([-speaker_width/2 + 3.5, 2*speaker_depth - 3.5, -speaker_height/2])
                cylinder(h = 10, d = 3, center = true);
            
        translate([speaker_width/2 - 3.5, speaker_depth + 3.5, -speaker_height/2])
                cylinder(h = 10, d = 3, center = true);
            
        translate([speaker_width/2 - 3.5, 2*speaker_depth - 3.5, -speaker_height/2])
                cylinder(h = 10, d = 3, center = true);
}//end of difference 



