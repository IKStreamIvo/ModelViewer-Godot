# Model Viewer
Basic Model Viewer test in Godot 3  
Features rotation, zooming and loading models.

![app detailed and simple preview](/model_viewer_preview.png)

# Controls
- Left mouse button - swipe to rotate the models
- Scroll wheel / middle mouse button - scroll to zoom in and out the models
- Previous and next buttons ![previous button sprite](/Assets/Images/prev_btn.png) ![next button sprite](/Assets/Images/next_btn.png) - navigate and load models
- Background toggle button ![toggle background button sprite](/Assets/Images/turn_off_btn.png) - toggles between simple and blooming background
- Help button ![help toggle button sprite](/Assets/Images/help_btn.png) - shows / hides help screen
- Credits button ![credits toggle button sprite](/Assets/Images/credits_btn.png) - shows / hides credits screen

# Changes

<details open>
<summary>added credits, UI scaling, etc. [Dec. 20, 2024]</summary>
<h3>UI</h3>

- Fixed UI scaling to be responsive to window's size
- Changed UI's default scale to 2x
    - In order to be clear on smaller window sizes
- Added credits screen of the authors and assets
- Changed the toggle background button's sprites
    - In order to take less space visually

</details>

<details>
<summary>added buttons, bloom background, help screen, etc. [Dec. 19, 2024]</summary>
<h3>UI</h3>

- Fixed buttons' positions when scaling the window
- Added more buttons (e.g. background and help toggle)
- Added sprites for buttons
- Added text to show model's filename
- Added a detailed background with bloom to test models with lightings
- Used Bit3 font for texts

<h3>Models</h3>

- Removed models from initial fork due to the rights

<h3>Code</h3>

- Added/cleaned some lines of code

</details>

# To-do
- [x] Make UI's scale responsive to window's scale
- [ ] Drag n' drop OBJs and load them as scenes
- [ ] Controls for adjusting the detailed background
- [x] Credits screen
- [ ] Fix pixel tearing of textures (e.g. buttons)

# Credits
## Code
**Ivolutio [(@Ivolutio)](https://twitter.com/Ivolutio)** - loading models, controls

## Sprites
**Din [(@DinPixels)](https://bsky.app/profile/dinpixels.bsky.social)** - buttons, texts

## Models
**Kenney [(www.kenney.nl)](https://www.kenney.nl)** - cars, barrel, crate, tree  
License: Creative Commons Zero, CC0 [(https://creativecommons.org/publicdomain/zero/1.0/)](https://creativecommons.org/publicdomain/zero/1.0/)
- **Car Kit:** <https://www.kenney.nl/assets/car-kit>
- **Platformer Kit:** <https://www.kenney.nl/assets/platformer-kit>

## Fonts
**Bit3 Font** by **[CamShaft](https://www.fontsc.com/font/designer/camshaft)**  
License: Freeware (Personal & Commercial Use)  
<https://fontzone.net/font-details/bit3>