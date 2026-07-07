# Advanced Animator

A multi-track keyframe timeline editor for Orion Drift spectator cameras. Build camera shots over one or more replays, preview them, then record.

## Tracks

Each of these is its own keyframe lane on the timeline, independently editable:

- **Position** - camera location, Catmull-Rom curve through keys (or straight lerp)
- **Rotation** - camera orientation, quaternion spline (or slerp)
- **Field of View**
- **Depth of Field** - F-Stop, Focal Distance, Sensor Width (separate lanes)
- **Replay Speed** - how fast the bound replay(s) play back
- **Timeline Speed** - how fast the camera animation itself plays back (independent of replay speed)
- **POV** - locks the camera to a player's view instead of freecam keys
- **Replay Cuts** - jump a replay layer to a different source time at a given point on the timeline
- **Replay Freeze** - pause a replay layer's source time for a stretch of the timeline while the camera keeps animating

Every key (except POV, which is always a hard cut) can be set to `smooth`, `linear`, or `cut` interpolation.

## Multi-Layer Replay Driving

- Add any number of replay layers, each bound to a separately loaded replay
- Per-layer **Mute** and **Solo**
- Each layer has its own timeline start offset and source start/end trim
- Replay Cuts and Replay Freezes are scoped to a layer, so different layers can jump or pause independently while others keep playing

## POV Camera

- **1P** - snaps to the player's head transform, with adjustable near-clip and an option to hide the nearest head
- **3P** - orbits the player:
  - **Auto Orbit**: follows behind the player's velocity direction (with a configurable velocity threshold before it starts tracking movement instead of facing), with look-ahead distance and smoothing
  - **Manual Orbit**: fixed or spinning orbit controlled by yaw/pitch, adjustable live in preview with arrow keys / WASD, with optional auto-spin at a set speed

## Smoothing System

- **Global / Position / Rotation** smoothing blend sliders mix a raw linear path with a curved one
- **Advanced Smoothing** unlocks fine controls: timing carry, keyflow, tangent strength/clamp, overshoot guard, mid-bias power (position), and carry floor / ease power / strength / linear mix / keyflow / mid-bias power (rotation)
- Built-in presets: **Flow Through**, **Balanced**, **Soft Arc**
- Save, load, and delete your own named smoothing presets, stored per-config (not per-project)

## Editing

- Click-drag keyframes directly on the timeline lanes; shift-click to multi-select across rows
- Copy / Paste / Duplicate selected keys, preserving relative timing
- 20-level undo
- **Live Key Edit** - move/rotate the freecam and have it write straight into the selected Position/Rotation key
- Snap-to-grid on all key placement and dragging
- Step the playhead keyframe-to-keyframe (with press-and-hold auto-repeat)
- Rebindable keybinds for play/pause, step prev/next keyframe, delete, undo, and open-key-editor

## Preview vs. Edit Mode

- **Edit mode**: camera follows freecam (if present) so you can fly around and place keys
- **Preview mode**: camera is driven entirely by the timeline (position, rotation, FOV, DOF, POV) so you can judge the actual shot
- **Recording Mode** hides path/overlay drawing for a clean capture

## Visualization

- Draws the raw keyframe path and the smoothed camera path in the world, plus keyframe dots and a highlighted playhead marker
- Optional look-direction rays sampled along the path
- Optional ghost camera frustums, either at the playhead or stepped along the whole path

## Projects

- Named projects save/load/delete independently, auto-resuming the last-opened project on script load
- Old projects are automatically upgraded to add any new fields introduced by later versions
