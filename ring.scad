/*
    Ringen van Evy & Johan
    ----------------------
    
    Ter gelehenheid van onze huwelijksverniewing.
    
    (based upon: https://www.thingiverse.com/thing:41524)
*/

// ring_size = 17.7; // Johan
ring_size = 13; // Evy

include <write/Write.scad>

OutterMessage = "Evy&Johan";
InnerMessage = "2018";
Font = "fonts/BlackRose.dxf";
font_size = 10;
font_spacing = 0;
ring_thickness = 1.6;
ring_width = 6;

inner_diameter = ring_size;
inner_radius = inner_diameter/2;
font_scale = font_size/10;
spacing_factor = font_spacing/100;

translate([0,0,ring_width/2])
    ring();

module ring() {
       
            difference(){
    
                translate([0,0,0])
                    rounded_cylinder(r1=inner_radius+ring_thickness,r2=inner_radius,h=ring_width,n=0.5);
                scale(font_scale)
                    {
                    writecylinder(OutterMessage,[0,0,0],
                        (inner_radius+ring_thickness)/font_scale*1.01,ring_width,space=1.05+spacing_factor,
                        rotate=0,up=.9,center = true,font = Font);
                    mirror([1,0,0]) 
                    writecylinder(InnerMessage,[0,0,0],
                        (inner_radius)/font_scale-0.25,ring_width,space=1.10+spacing_factor,
                        rotate=0,up=.5,center = true,font = Font);
                    }
            }
    
}

module rounded_cylinder(r1,r2,h,n) {
  $fn = 100;
  translate([0,0,-h/2])  
  rotate_extrude(convexity=1) {
    translate([r2,0,0]) offset(r=n) offset(delta=-n) square([r1-r2,h]);
  }
}
