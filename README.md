# Intermediate Computer Graphics Midterm
 
000834886,
I will be covering the issue under even numbers. (8-6 = 2)

These are my chosen Tasks;

#A
A ship and background with "realistic" texture that presents a cartoon-style look. You are required to create a ramp pattern different than the one done in class and explain why this pattern was chosen. 

#B
Windshield reflections to give realism to the ship. Explain which type of reflection you used, why, and how did you customized it.

#A Explenation

I needed color, 2 textures (one for the texture of the ship, and the other as a refrence for the toon ramp) and a range to set the intensity of the effect.

For the lighting model I calculated the dot product of the view direction and the light direction.
Then passed it to calculate the reffrence position alon the ramp texture to determine the light level of the pixel.
I return the rgb as the surface albedo, times the light color, times the ramp above, times the intensity of the effect.

Then the actual color of the object is the main texture multiplied by the color of the object.

#B Explenation

For my properties I needed color, a range, my texture of the object, and a cubemap of the scenes skybox. 

Inside my input I needed a world reflection vector.

in the surf function the albedo of the object is the texture of the object, but the emmission is the cubemap, reffrencing the world reflection.
