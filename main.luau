metadata = {
	name = "glowmonster.replay.animator",
	description = "Replay multi-track timeline editor (camera + POV + speed + FOV + multi-replay layers).",
	author = "glowmonster",
	version = 1.70,
	defaultKeybind = "M",
}
type InterpMode = "smooth" | "linear" | "cut"
type NumKey = { t: number, v: number, interp: InterpMode? }
type Vec3Key = { t: number, v: Vec3, interp: InterpMode? }
type QuatKey = { t: number, v: Quat, interp: InterpMode? }
type POVMode = "1P" | "3P" | "OUT"
type POVOrbitMode = "AUTO" | "MANUAL"
type POVKey = {
	t: number,
	replayLayerId: number,
	playerId: number,
	mode: POVMode,
	nearClip: number?,
	hideNearestHead: boolean?,
	orbitMode: POVOrbitMode?,
	orbitRadius: number?,
	orbitHeight: number?,
	orbitLookAheadDistance: number?,
	orbitSmoothing: number?,
	manualOrbitSmoothingMultiplier: number?,
	orbitVelocityThreshold: number?,
	manualOrbitYaw: number?,
	manualOrbitPitch: number?,
	manualOrbitAutoSpin: boolean?,
	manualOrbitSpinSpeed: number?,
	interp: InterpMode?,
}
type ReplayCutKey = {
	t: number,
	replayLayerId: number,
	srcJumpT: number,
}
type ReplayFreezeRange = {
	startT: number,
	endT: number,
}
type ReplaySegment = {
	replayName: string,
	dstStart: number,
	srcStart: number,
	srcEnd: number,
	playbackHz: number?,
}
type ReplayLayer = {
	name: string,
	muted: boolean?,
	solo: boolean?,
	hideWhenDone: boolean?,
	segments: { ReplaySegment },
	freezes: { ReplayFreezeRange }?,
}
type Tracks = {
	position: { Vec3Key },
	rotation: { QuatKey },
	fov: { NumKey },
	dofFstop: { NumKey },
	dofFocalDistance: { NumKey },
	dofSensorWidth: { NumKey },
	speed: { NumKey },
	timelineSpeed: { NumKey },
	pov: { POVKey },
	replayCuts: { ReplayCutKey }?,
}
type Project = {
	projectName: string,
	createdAt: number?,
	updatedAt: number?,
	timelineStart: number,
	timelineEnd: number,
	snap: number,
	replayLayers: { ReplayLayer },
	tracks: Tracks,
	ui: {
		useQuatInterp: boolean?,
		globalSmoothing: number?,
		posSmoothing: number?,
		rotSmoothing: number?,
		advancedSmoothing: boolean?,
		posTimingCarry: number?,
		posBlendPower: number?,
		posKeyflow: number?,
		posMidBiasPower: number?,
		posTangentStrength: number?,
		posTangentClamp: number?,
		posOvershootGuard: number?,
		rotCarryFloor: number?,
		rotEasePower: number?,
		rotSmoothStrength: number?,
		rotLinearMix: number?,
		rotKeyflow: number?,
		rotMidBiasPower: number?,
		povNearClip: number?,
		hideNearestHead: boolean?,
		headHideOffset: number?,
		headHideNearClip: number?,
		pov3POrbitMode: POVOrbitMode?,
		pov3POrbitRadius: number?,
		pov3POrbitHeight: number?,
		pov3PLookAheadDistance: number?,
		pov3POrbitSmoothing: number?,
		pov3PManualOrbitSmoothingMultiplier: number?,
		pov3PVelocityThreshold: number?,
		pov3PManualYaw: number?,
		pov3PManualPitch: number?,
		zoom: number,
		scroll: number,
		rangeStart: number,
		rangeEnd: number,
		scrollSpeed: number,
		selectedRow: string,
		selectedKeyIndex: number,
		selectedReplayLayerId: number,
		masterReplayName: string,
	},
}
type SmoothingPreset = {
	useQuatInterp: boolean?,
	globalSmoothing: number?,
	posSmoothing: number?,
	rotSmoothing: number?,
	advancedSmoothing: boolean?,
	posTimingCarry: number?,
	posBlendPower: number?,
	posKeyflow: number?,
	posMidBiasPower: number?,
	posTangentStrength: number?,
	posTangentClamp: number?,
	posOvershootGuard: number?,
	rotCarryFloor: number?,
	rotEasePower: number?,
	rotSmoothStrength: number?,
	rotLinearMix: number?,
	rotKeyflow: number?,
	rotMidBiasPower: number?,
}

GMRA_KEYBIND_DEFS = {
	{
		id = "togglePlayPause",
		name = "Play / Pause",
		description = "Start or pause timeline playback",
		defaultKey = "SpaceBar",
	},
	{
		id = "stepPrevKeyframe",
		name = "Step To Previous Keyframe",
		description = "Move the playhead to the previous keyframe",
		defaultKey = "Left",
	},
	{
		id = "stepNextKeyframe",
		name = "Step To Next Keyframe",
		description = "Move the playhead to the next keyframe",
		defaultKey = "Right",
	},
	{
		id = "deleteSelectedKey",
		name = "Delete Selected Key",
		description = "Delete the selected keyframe",
		defaultKey = "Delete",
	},
	{
		id = "deleteSelectedKeyAlt",
		name = "Delete Selected Key (Alt)",
		description = "Alt delete for the selected keyframe",
		defaultKey = "BackSpace",
	},
	{
		id = "openSelectedEditorContext",
		name = "Open Selected Key Editor",
		description = "Open the selected key editor from the timeline",
		defaultKey = "RightMouseButton",
	},
	{
		id = "undo",
		name = "Undo",
		description = "Undo the last change",
		defaultKey = "Z",
		ctrl = true,
	},
}

GMRA_KEYBOARD_KEYS = {
	"Tab",
	"Enter",
	"Pause",
	"CapsLock",
	"Escape",
	"SpaceBar",
	"PageUp",
	"PageDown",
	"End",
	"Home",
	"Left",
	"Up",
	"Right",
	"Down",
	"Insert",
	"BackSpace",
	"Delete",
	"Zero",
	"One",
	"Two",
	"Three",
	"Four",
	"Five",
	"Six",
	"Seven",
	"Eight",
	"Nine",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"NumPadZero",
	"NumPadOne",
	"NumPadTwo",
	"NumPadThree",
	"NumPadFour",
	"NumPadFive",
	"NumPadSix",
	"NumPadSeven",
	"NumPadEight",
	"NumPadNine",
	"Multiply",
	"Add",
	"Subtract",
	"Decimal",
	"Divide",
	"F1",
	"F2",
	"F3",
	"F4",
	"F5",
	"F6",
	"F7",
	"F8",
	"F9",
	"F10",
	"F11",
	"F12",
	"NumLock",
	"ScrollLock",
	"LeftShift",
	"RightShift",
	"LeftControl",
	"RightControl",
	"LeftAlt",
	"RightAlt",
	"LeftCommand",
	"RightCommand",
	"Semicolon",
	"Equals",
	"Comma",
	"Hyphen",
	"Underscore",
	"Period",
	"Slash",
	"Tilde",
	"LeftBracket",
	"Backslash",
	"RightBracket",
	"Apostrophe",
	"Quote",
	"LeftParantheses",
	"RightParantheses",
	"Ampersand",
	"Asterix",
	"Caret",
	"Dollar",
	"Exclamation",
	"Colon",
	"A_AccentGrave",
	"E_AccentGrave",
	"E_AccentAigu",
	"C_Cedille",
	"Section",
	"LeftMouseButton",
	"MiddleMouseButton",
	"RightMouseButton",
	"ThumbMouseButton",
	"ThumbMouseButton2",
}

GMRA_MODIFIER_KEY_NAMES = {
	LeftShift = true,
	RightShift = true,
	LeftControl = true,
	RightControl = true,
	LeftAlt = true,
	RightAlt = true,
}

GMRA_KEYBIND_CAPTURE_ACTION = ""
GMRA_KEYBIND_CAPTURE_PRIMED = false

local function initDefaults()
	config.projects = config.projects or {}
	config.lastProject = config.lastProject or ""
	config.smoothingPresets = config.smoothingPresets or {}
	config.lastSmoothingPreset = config.lastSmoothingPreset or ""
	config.showPath = (config.showPath == nil) and true or config.showPath
	config.pathSamplesPerSecond = tonumber(config.pathSamplesPerSecond) or 12
	config.showPathRawLine = (config.showPathRawLine == nil) and true or config.showPathRawLine
	config.showPathSmoothedLine = (config.showPathSmoothedLine == nil) and true or config.showPathSmoothedLine
	config.showPathDots = (config.showPathDots == nil) and true or config.showPathDots
	config.showLookDirection = (config.showLookDirection == nil) and false or config.showLookDirection
	config.lookRayLength = tonumber(config.lookRayLength) or 600
	config.timelineSnapStep = tonumber(config.timelineSnapStep) or 0.05
	config.timelineStartGlobal = tonumber(config.timelineStartGlobal) or 0
	config.timelineEndGlobal = tonumber(config.timelineEndGlobal) or 20
	config.timelineAutoScrollSpeed = tonumber(config.timelineAutoScrollSpeed) or 1
	config.recordingModeProfile = (config.recordingModeProfile == nil) and false or config.recordingModeProfile
	config.keybinds = config.keybinds or {}
	config.previewTimelineInPreview = (config.previewTimelineInPreview == nil) and false
		or config.previewTimelineInPreview
	config.debugPreviewApplyPosition = (config.debugPreviewApplyPosition == nil) and true
		or config.debugPreviewApplyPosition
	config.debugPreviewApplyRotation = (config.debugPreviewApplyRotation == nil) and true
		or config.debugPreviewApplyRotation
	config.showGhostFrustum = (config.showGhostFrustum == nil) and false or config.showGhostFrustum
	config.showGhostFrustumAlongPath = (config.showGhostFrustumAlongPath == nil) and false
		or config.showGhostFrustumAlongPath
	config.ghostFrustumLength = tonumber(config.ghostFrustumLength) or 700
	config.ghostFrustumStepSeconds = tonumber(config.ghostFrustumStepSeconds) or 0.5
	config.ghostFrustumAspect = tonumber(config.ghostFrustumAspect) or (16 / 9)
	if type(config.smoothingPresets) ~= "table" then
		config.smoothingPresets = {}
	end
end
initDefaults()
local function safeSaveConfig()
	local function tryCall(fn, selfArg)
		if type(fn) ~= "function" then
			return false
		end
		local ok, result
		if selfArg ~= nil then
			ok, result = pcall(fn, selfArg)
		else
			ok, result = pcall(fn)
		end
		return ok and result ~= false
	end

	-- OD scripts usually persist with a direct saveConfig() call.
	-- Try that exact path first, then fall back to the safer method-style variants.
	if tryCall(saveConfig, nil) then
		return true
	end
	if tryCall(_G and _G.saveConfig or nil, nil) then
		return true
	end
	if tryCall(_G and _G.SaveConfig or nil, nil) then
		return true
	end
	if config then
		if tryCall(config.saveConfig, config) then
			return true
		end
		if tryCall(config.save, config) then
			return true
		end
	end
	return false
end
function gmraFindKeybindDef(actionId: string)
	for i = 1, #GMRA_KEYBIND_DEFS do
		local def = GMRA_KEYBIND_DEFS[i]
		if def.id == actionId then
			return def
		end
	end
	return nil
end
function gmraEnsureKeybindDefaults()
	config.keybinds = config.keybinds or {}
	for i = 1, #GMRA_KEYBIND_DEFS do
		local def = GMRA_KEYBIND_DEFS[i]
		local cur = config.keybinds[def.id]
		if type(cur) == "string" then
			cur = { key = cur }
			config.keybinds[def.id] = cur
		elseif type(cur) ~= "table" then
			cur = {}
			config.keybinds[def.id] = cur
		end
		if type(cur.key) ~= "string" then
			cur.key = def.defaultKey
		end
		if type(cur.ctrl) ~= "boolean" then
			cur.ctrl = def.ctrl == true
		end
		if type(cur.alt) ~= "boolean" then
			cur.alt = def.alt == true
		end
		if type(cur.shift) ~= "boolean" then
			cur.shift = def.shift == true
		end
	end
end
gmraEnsureKeybindDefaults()
local function feq(a: number, b: number, eps: number?): boolean
	eps = eps or 1e-6
	return math.abs(a - b) <= eps
end
local function vec3eq(a: Vec3, b: Vec3, eps: number?): boolean
	eps = eps or 1e-4
	return feq(a.x, b.x, eps) and feq(a.y, b.y, eps) and feq(a.z, b.z, eps)
end
local function quateq(a: Quat, b: Quat, eps: number?): boolean
	eps = eps or 1e-4
	return feq(a.x, b.x, eps) and feq(a.y, b.y, eps) and feq(a.z, b.z, eps) and feq(a.w, b.w, eps)
end
local function quatDot(a: Quat, b: Quat): number
	return (a.x * b.x) + (a.y * b.y) + (a.z * b.z) + (a.w * b.w)
end
local function quatNeg(q: Quat): Quat
	return Quat.new(-q.x, -q.y, -q.z, -q.w)
end
local function quatNormalize(q: Quat): Quat
	local len = math.sqrt((q.x * q.x) + (q.y * q.y) + (q.z * q.z) + (q.w * q.w))
	if len <= 1e-8 then
		return Quat.new(0, 0, 0, 1)
	end
	local inv = 1 / len
	return Quat.new(q.x * inv, q.y * inv, q.z * inv, q.w * inv)
end
local function safeQuatSlerp(a: Quat, b: Quat, t: number): Quat
	local q1 = quatNormalize(a)
	local q2 = quatNormalize(b)
	local dot = quatDot(q1, q2)
	if dot < 0 then
		q2 = quatNeg(q2)
		dot = -dot
	end
	local nt = t
	if nt < 0 then
		nt = 0
	elseif nt > 1 then
		nt = 1
	end
	if dot > 0.9995 then
		local inv = 1 - nt
		local blended = Quat.new(
			(q1.x * inv) + (q2.x * nt),
			(q1.y * inv) + (q2.y * nt),
			(q1.z * inv) + (q2.z * nt),
			(q1.w * inv) + (q2.w * nt)
		)
		return quatNormalize(blended)
	end
	return Quat.slerp(q1, q2, nt)
end
function gmraQuatAngleDeg(a: Quat, b: Quat): number
	local q1 = quatNormalize(a)
	local q2 = quatNormalize(b)
	local dot = math.abs(quatDot(q1, q2))
	if dot < -1 then
		dot = -1
	elseif dot > 1 then
		dot = 1
	end
	return (2 * math.acos(dot)) * (180 / math.pi)
end
local function quatConjugate(q: Quat): Quat
	return Quat.new(-q.x, -q.y, -q.z, q.w)
end
local function quatMul(a: Quat, b: Quat): Quat
	return Quat.new(
		(a.w * b.x) + (a.x * b.w) + (a.y * b.z) - (a.z * b.y),
		(a.w * b.y) - (a.x * b.z) + (a.y * b.w) + (a.z * b.x),
		(a.w * b.z) + (a.x * b.y) - (a.y * b.x) + (a.z * b.w),
		(a.w * b.w) - (a.x * b.x) - (a.y * b.y) - (a.z * b.z)
	)
end
local function quatInv(q: Quat): Quat
	local n = quatNormalize(q)
	return quatConjugate(n)
end
local function quatLogUnit(q: Quat): Quat
	local n = quatNormalize(q)
	local w = n.w
	if w < -1 then
		w = -1
	elseif w > 1 then
		w = 1
	end
	local theta = math.acos(w)
	local vLen = math.sqrt((n.x * n.x) + (n.y * n.y) + (n.z * n.z))
	if vLen <= 1e-8 then
		return Quat.new(0, 0, 0, 0)
	end
	local scale = theta / vLen
	return Quat.new(n.x * scale, n.y * scale, n.z * scale, 0)
end
local function quatExpPure(q: Quat): Quat
	local x = q.x
	local y = q.y
	local z = q.z
	local a = math.sqrt((x * x) + (y * y) + (z * z))
	if a <= 1e-8 then
		return quatNormalize(Quat.new(x, y, z, 1))
	end
	local s = math.sin(a) / a
	return quatNormalize(Quat.new(x * s, y * s, z * s, math.cos(a)))
end
local function alignQuatToRef(q: Quat, ref: Quat): Quat
	if quatDot(q, ref) < 0 then
		return quatNeg(q)
	end
	return q
end
local gmraRotFilterGuard = false
function gmraQuatWeightedLocalAverage(centerQ: Quat, samples, weights): Quat
	local qC = quatNormalize(centerQ)
	local invCenter = quatInv(qC)
	local sumX = 0
	local sumY = 0
	local sumZ = 0
	local totalW = 0
	for i = 1, #(samples or {}) do
		local sample = samples[i]
		local w = (weights and weights[i]) or 0
		if sample and w > 0 then
			local qS = alignQuatToRef(quatNormalize(sample), qC)
			local delta = quatLogUnit(quatMul(invCenter, qS))
			sumX += delta.x * w
			sumY += delta.y * w
			sumZ += delta.z * w
			totalW += w
		end
	end
	if totalW <= 1e-6 then
		return qC
	end
	local avg = Quat.new(sumX / totalW, sumY / totalW, sumZ / totalW, 0)
	return quatNormalize(quatMul(qC, quatExpPure(avg)))
end
function gmraWrapAngleNear(reference: number, angle: number): number
	local out = angle
	while (out - reference) > 180 do
		out -= 360
	end
	while (out - reference) < -180 do
		out += 360
	end
	return out
end
function gmraQuatToEulerSafe(q: Quat, fallback: Vec3?): Vec3
	local ok, e = pcall(function()
		return q:euler()
	end)
	if ok and e then
		return Vec3.new(e.x, e.y, e.z)
	end
	return fallback or Vec3.zeroVector
end
function gmraEvalQuatEulerBezier(keys: { QuatKey }, t: number, amount: number): Quat?
	-- Self-contained helpers so this function works even before _clamp/_clamp01/_lerpNum are defined.
	local function _clamp(x: number, a: number, b: number): number
		if x == nil then
			return a
		end
		return math.max(a, math.min(b, x))
	end
	local function _clamp01(x: number): number
		if x == nil or x < 0 then
			return 0
		end
		if x > 1 then
			return 1
		end
		return x
	end
	local function _lerpNum(a: number, b: number, tt: number): number
		return a * (1 - tt) + b * tt
	end
	if not keys or #keys == 0 then
		return nil
	end
	if t <= keys[1].t then
		return quatNormalize(keys[1].v)
	end
	if t >= keys[#keys].t then
		return quatNormalize(keys[#keys].v)
	end
	local i = 1
	for k = 1, #keys - 1 do
		if t >= keys[k].t and t < keys[k + 1].t then
			i = k
			break
		end
	end
	local k1 = keys[i]
	local k2 = keys[i + 1]
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return quatNormalize(k1.v)
	end
	local segDt = k2.t - k1.t
	if segDt <= 1e-6 then
		return quatNormalize(k1.v)
	end
	local curveAmount = _clamp(math.max(0, amount or 0), 0, 1.5)
	local alpha = _clamp01((t - k1.t) / segDt)
	local q1 = quatNormalize(k1.v)
	local q2 = alignQuatToRef(quatNormalize(k2.v), q1)
	if interp == "linear" or curveAmount <= 1e-5 then
		return safeQuatSlerp(q1, q2, alpha)
	end
	local times = {}
	local fxs = {}
	local fys = {}
	local fzs = {}
	local uxs = {}
	local uys = {}
	local uzs = {}
	local function basisFromQuat(rot: Quat): (Vec3, Vec3)
		local qq = quatNormalize(rot)
		local x = qq.x
		local y = qq.y
		local z = qq.z
		local w = qq.w
		local tx = 2 * x
		local ty = 2 * y
		local tz = 2 * z
		local twx = tx * w
		local twy = ty * w
		local twz = tz * w
		local txx = tx * x
		local txy = ty * x
		local txz = tz * x
		local tyy = ty * y
		local tyz = tz * y
		local tzz = tz * z
		local fwd = Vec3.new(1 - (tyy + tzz), txy + twz, txz - twy)
		local up = Vec3.new(txz + twy, tyz - twx, 1 - (txx + tyy))
		return fwd, up
	end
	do
		for idx = 1, #keys do
			local fwd, up = basisFromQuat(keys[idx].v)
			times[idx] = keys[idx].t
			fxs[idx] = fwd.x
			fys[idx] = fwd.y
			fzs[idx] = fwd.z
			uxs[idx] = up.x
			uys[idx] = up.y
			uzs[idx] = up.z
		end
	end
	local function quadDerivatives(
		x0: number,
		y0: number,
		x1: number,
		y1: number,
		x2: number,
		y2: number,
		atIndex: number
	): (number, number)
		local d0 = (x0 - x1) * (x0 - x2)
		local d1 = (x1 - x0) * (x1 - x2)
		local d2 = (x2 - x0) * (x2 - x1)
		if math.abs(d0) <= 1e-8 or math.abs(d1) <= 1e-8 or math.abs(d2) <= 1e-8 then
			local slope = (y2 - y0) / math.max(1e-6, x2 - x0)
			return slope, 0
		end
		local dy = 0.0
		if atIndex == 1 then
			dy = (y0 * ((2 * x0) - x1 - x2) / d0) + (y1 * (x0 - x2) / d1) + (y2 * (x0 - x1) / d2)
		elseif atIndex == 2 then
			dy = (y0 * (x1 - x2) / d0) + (y1 * ((2 * x1) - x0 - x2) / d1) + (y2 * (x1 - x0) / d2)
		else
			dy = (y0 * (x2 - x1) / d0) + (y1 * (x2 - x0) / d1) + (y2 * ((2 * x2) - x0 - x1) / d2)
		end
		local ddy = 2 * ((y0 / d0) + (y1 / d1) + (y2 / d2))
		return dy, ddy
	end
	-- Precompute one canonical (dy, ddy) per key so both segments that share a
	-- boundary key always use the exact same slope.  The old per-call approach
	-- re-evaluated the derivative from different neighbour triplets depending on
	-- which segment was active, producing a C0-but-not-C1 join that the camera
	-- perceived as a snap/jolt right as the playhead crossed each keyframe.
	local function buildDerivativeCache(values): ({ number }, { number })
		local n = #values
		local dvCache = {}
		local ddvCache = {}
		if n <= 1 then
			dvCache[1] = 0
			ddvCache[1] = 0
			return dvCache, ddvCache
		end
		if n == 2 then
			local slope = (values[2] - values[1]) / math.max(1e-6, times[2] - times[1])
			dvCache[1] = slope
			dvCache[2] = slope
			ddvCache[1] = 0
			ddvCache[2] = 0
			return dvCache, ddvCache
		end
		-- First key: one-sided quadratic through [1,2,3]
		do
			local dy, ddy = quadDerivatives(times[1], values[1], times[2], values[2], times[3], values[3], 1)
			dvCache[1] = dy
			ddvCache[1] = ddy
		end
		-- Interior keys: always centred on [k-1, k, k+1]
		for k = 2, n - 1 do
			local dy, ddy =
				quadDerivatives(times[k - 1], values[k - 1], times[k], values[k], times[k + 1], values[k + 1], 2)
			dvCache[k] = dy
			ddvCache[k] = ddy
		end
		-- Last key: one-sided quadratic through [n-2, n-1, n]
		do
			local last = n
			local dy, ddy = quadDerivatives(
				times[last - 2],
				values[last - 2],
				times[last - 1],
				values[last - 1],
				times[last],
				values[last],
				3
			)
			dvCache[last] = dy
			ddvCache[last] = ddy
		end
		return dvCache, ddvCache
	end
	local fxDv, fxDdv = buildDerivativeCache(fxs)
	local fyDv, fyDdv = buildDerivativeCache(fys)
	local fzDv, fzDdv = buildDerivativeCache(fzs)
	local uxDv, uxDdv = buildDerivativeCache(uxs)
	local uyDv, uyDdv = buildDerivativeCache(uys)
	local uzDv, uzDdv = buildDerivativeCache(uzs)
	local function keyDerivativesFromCache(dvCache: { number }, ddvCache: { number }, index: number): (number, number)
		return dvCache[index] or 0, ddvCache[index] or 0
	end
	local function quinticHermite(
		p0: number,
		v0: number,
		a0: number,
		p1: number,
		v1: number,
		a1: number,
		u: number,
		dt: number
	)
		local u2 = u * u
		local u3 = u2 * u
		local u4 = u3 * u
		local u5 = u4 * u
		return (p0 * (1 - (10 * u3) + (15 * u4) - (6 * u5)))
			+ ((v0 * dt) * (u - (6 * u3) + (8 * u4) - (3 * u5)))
			+ ((a0 * dt * dt) * ((0.5 * u2) - (1.5 * u3) + (1.5 * u4) - (0.5 * u5)))
			+ (p1 * ((10 * u3) - (15 * u4) + (6 * u5)))
			+ ((v1 * dt) * ((-4 * u3) + (7 * u4) - (3 * u5)))
			+ ((a1 * dt * dt) * ((0.5 * u3) - u4 + (0.5 * u5)))
	end
	local function sampleAxis(values, dvCache, ddvCache): number
		local v0, _ = keyDerivativesFromCache(dvCache, ddvCache, i)
		local v1, _ = keyDerivativesFromCache(dvCache, ddvCache, i + 1)
		local segSlope = (values[i + 1] - values[i]) / segDt
		local blend = _clamp01(curveAmount)
		v0 = _lerpNum(segSlope, v0, blend)
		v1 = _lerpNum(segSlope, v1, blend)
		-- a0/a1 are intentionally zero: the quintic acceleration terms ease velocity
		-- toward zero at each key endpoint, causing a deceleration-then-reacceleration
		-- stutter that looks like a snap when the playhead crosses a rotation keyframe.
		-- With a0=a1=0 the quintic degenerates to a cubic Hermite (Catmull-Rom style)
		-- that carries velocity smoothly through every key with no hitch.
		return quinticHermite(values[i], v0, 0, values[i + 1], v1, 0, alpha, segDt)
	end
	local function vecLenLocal(v: Vec3): number
		return math.sqrt((v.x * v.x) + (v.y * v.y) + (v.z * v.z))
	end
	local function vecNormLocal(v: Vec3, fallback: Vec3): Vec3
		local len = vecLenLocal(v)
		if len <= 1e-6 then
			return fallback
		end
		local inv = 1 / len
		return Vec3.new(v.x * inv, v.y * inv, v.z * inv)
	end
	local function vecCrossLocal(a: Vec3, b: Vec3): Vec3
		return Vec3.new((a.y * b.z) - (a.z * b.y), (a.z * b.x) - (a.x * b.z), (a.x * b.y) - (a.y * b.x))
	end
	local function quatFromBasis(fwd: Vec3, right: Vec3, up: Vec3): Quat
		local m00 = fwd.x
		local m10 = fwd.y
		local m20 = fwd.z
		local m01 = right.x
		local m11 = right.y
		local m21 = right.z
		local m02 = up.x
		local m12 = up.y
		local m22 = up.z
		local trace = m00 + m11 + m22
		if trace > 0 then
			local s = math.sqrt(trace + 1) * 2
			return quatNormalize(Quat.new((m21 - m12) / s, (m02 - m20) / s, (m10 - m01) / s, 0.25 * s))
		end
		if m00 > m11 and m00 > m22 then
			local s = math.sqrt(math.max(1e-8, 1 + m00 - m11 - m22)) * 2
			return quatNormalize(Quat.new(0.25 * s, (m01 + m10) / s, (m02 + m20) / s, (m21 - m12) / s))
		end
		if m11 > m22 then
			local s = math.sqrt(math.max(1e-8, 1 + m11 - m00 - m22)) * 2
			return quatNormalize(Quat.new((m01 + m10) / s, 0.25 * s, (m12 + m21) / s, (m02 - m20) / s))
		end
		local s = math.sqrt(math.max(1e-8, 1 + m22 - m00 - m11)) * 2
		return quatNormalize(Quat.new((m02 + m20) / s, (m12 + m21) / s, 0.25 * s, (m10 - m01) / s))
	end
	local fwd = Vec3.new(sampleAxis(fxs, fxDv, fxDdv), sampleAxis(fys, fyDv, fyDdv), sampleAxis(fzs, fzDv, fzDdv))
	local upGuess = Vec3.new(sampleAxis(uxs, uxDv, uxDdv), sampleAxis(uys, uyDv, uyDdv), sampleAxis(uzs, uzDv, uzDdv))
	fwd = vecNormLocal(fwd, Vec3.new(1, 0, 0))
	upGuess = vecNormLocal(upGuess, Vec3.new(0, 0, 1))
	local right = vecCrossLocal(upGuess, fwd)
	if vecLenLocal(right) <= 1e-6 then
		local fallbackUp = Vec3.new(0, 0, 1)
		if math.abs((fwd.x * fallbackUp.x) + (fwd.y * fallbackUp.y) + (fwd.z * fallbackUp.z)) > 0.98 then
			fallbackUp = Vec3.new(0, 1, 0)
		end
		right = vecCrossLocal(fallbackUp, fwd)
	end
	right = vecNormLocal(right, Vec3.new(0, 1, 0))
	local up = vecNormLocal(vecCrossLocal(fwd, right), Vec3.new(0, 0, 1))
	local curveQuat = quatFromBasis(fwd, right, up)
	curveQuat = alignQuatToRef(curveQuat, q1)
	return curveQuat
end
function gmraEvalQuatBasisFlowSpline(keys: { QuatKey }, t: number, amount: number): Quat?
	local function _clamp(x: number, a: number, b: number): number
		if x == nil then
			return a
		end
		return math.max(a, math.min(b, x))
	end
	local function _clamp01(x: number): number
		if x == nil or x < 0 then
			return 0
		end
		if x > 1 then
			return 1
		end
		return x
	end
	local function _lerpNum(a: number, b: number, tt: number): number
		return a * (1 - tt) + b * tt
	end
	local function _vecLen(v: Vec3): number
		return math.sqrt((v.x * v.x) + (v.y * v.y) + (v.z * v.z))
	end
	local function _vecNorm(v: Vec3, fallback: Vec3): Vec3
		local len = _vecLen(v)
		if len <= 1e-6 then
			return fallback
		end
		local inv = 1 / len
		return Vec3.new(v.x * inv, v.y * inv, v.z * inv)
	end
	local function _vecCross(a: Vec3, b: Vec3): Vec3
		return Vec3.new((a.y * b.z) - (a.z * b.y), (a.z * b.x) - (a.x * b.z), (a.x * b.y) - (a.y * b.x))
	end
	local function _quatBasis(rot: Quat): (Vec3, Vec3)
		local qq = quatNormalize(rot)
		local x = qq.x
		local y = qq.y
		local z = qq.z
		local w = qq.w
		local tx = 2 * x
		local ty = 2 * y
		local tz = 2 * z
		local twx = tx * w
		local twy = ty * w
		local twz = tz * w
		local txx = tx * x
		local txy = ty * x
		local txz = tz * x
		local tyy = ty * y
		local tyz = tz * y
		local tzz = tz * z
		local fwd = Vec3.new(1 - (tyy + tzz), txy + twz, txz - twy)
		local up = Vec3.new(txz + twy, tyz - twx, 1 - (txx + tyy))
		return fwd, up
	end
	local function _quatFromBasis(fwd: Vec3, right: Vec3, up: Vec3): Quat
		local m00 = fwd.x
		local m10 = fwd.y
		local m20 = fwd.z
		local m01 = right.x
		local m11 = right.y
		local m21 = right.z
		local m02 = up.x
		local m12 = up.y
		local m22 = up.z
		local trace = m00 + m11 + m22
		if trace > 0 then
			local s = math.sqrt(trace + 1) * 2
			return quatNormalize(Quat.new((m21 - m12) / s, (m02 - m20) / s, (m10 - m01) / s, 0.25 * s))
		end
		if m00 > m11 and m00 > m22 then
			local s = math.sqrt(math.max(1e-8, 1 + m00 - m11 - m22)) * 2
			return quatNormalize(Quat.new(0.25 * s, (m01 + m10) / s, (m02 + m20) / s, (m21 - m12) / s))
		end
		if m11 > m22 then
			local s = math.sqrt(math.max(1e-8, 1 + m11 - m00 - m22)) * 2
			return quatNormalize(Quat.new((m01 + m10) / s, 0.25 * s, (m12 + m21) / s, (m02 - m20) / s))
		end
		local s = math.sqrt(math.max(1e-8, 1 + m22 - m00 - m11)) * 2
		return quatNormalize(Quat.new((m02 + m20) / s, (m12 + m21) / s, 0.25 * s, (m10 - m01) / s))
	end
	if not keys or #keys == 0 then
		return nil
	end
	if t <= keys[1].t then
		return quatNormalize(keys[1].v)
	end
	if t >= keys[#keys].t then
		return quatNormalize(keys[#keys].v)
	end
	local i = 1
	for k = 1, #keys - 1 do
		if t >= keys[k].t and t < keys[k + 1].t then
			i = k
			break
		end
	end
	local k1 = keys[i]
	local k2 = keys[i + 1]
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return quatNormalize(k1.v)
	end
	local segDt = k2.t - k1.t
	if segDt <= 1e-6 then
		return quatNormalize(k1.v)
	end
	local alpha = _clamp01((t - k1.t) / segDt)
	local q1 = quatNormalize(k1.v)
	local q2 = alignQuatToRef(quatNormalize(k2.v), q1)
	if interp == "linear" then
		return safeQuatSlerp(q1, q2, alpha)
	end
	local strength = _clamp01(amount)
	if strength <= 1e-5 then
		return safeQuatSlerp(q1, q2, alpha)
	end
	local guard = _lerpNum(0.75, 0.25, strength)
	local times = {}
	local fxs = {}
	local fys = {}
	local fzs = {}
	local uxs = {}
	local uys = {}
	local uzs = {}
	for idx = 1, #keys do
		local fwd, up = _quatBasis(keys[idx].v)
		times[idx] = keys[idx].t
		fxs[idx] = fwd.x
		fys[idx] = fwd.y
		fzs[idx] = fwd.z
		uxs[idx] = up.x
		uys[idx] = up.y
		uzs[idx] = up.z
	end
	local function scalarTangent(values, idx: number): number
		local prevIdx = idx - 1
		local nextIdx = idx + 1
		if prevIdx < 1 and nextIdx > #values then
			return 0
		end
		if prevIdx < 1 then
			local dt = math.max(1e-6, times[nextIdx] - times[idx])
			return ((values[nextIdx] - values[idx]) / dt) * strength
		end
		if nextIdx > #values then
			local dt = math.max(1e-6, times[idx] - times[prevIdx])
			return ((values[idx] - values[prevIdx]) / dt) * strength
		end
		local dtL = math.max(1e-6, times[idx] - times[prevIdx])
		local dtR = math.max(1e-6, times[nextIdx] - times[idx])
		local velL = (values[idx] - values[prevIdx]) / dtL
		local velR = (values[nextIdx] - values[idx]) / dtR
		local wL = dtR / (dtL + dtR)
		local wR = dtL / (dtL + dtR)
		local tangent = velL * wL + velR * wR
		local maxAllowed = math.min(math.abs(velL), math.abs(velR)) * _lerpNum(3.0, 1.0, guard)
		if math.abs(tangent) > maxAllowed and math.abs(tangent) > 1e-8 then
			tangent = tangent * (maxAllowed / math.abs(tangent))
		end
		return tangent * strength
	end
	local function sampleAxis(values): number
		local m0 = scalarTangent(values, i)
		local m1 = scalarTangent(values, i + 1)
		local u = alpha
		local u2 = u * u
		local u3 = u2 * u
		local h00 = 2 * u3 - 3 * u2 + 1
		local h10 = u3 - 2 * u2 + u
		local h01 = -2 * u3 + 3 * u2
		local h11 = u3 - u2
		return (h00 * values[i]) + (h10 * m0 * segDt) + (h01 * values[i + 1]) + (h11 * m1 * segDt)
	end
	local fwd = Vec3.new(sampleAxis(fxs), sampleAxis(fys), sampleAxis(fzs))
	local upGuess = Vec3.new(sampleAxis(uxs), sampleAxis(uys), sampleAxis(uzs))
	fwd = _vecNorm(fwd, Vec3.new(1, 0, 0))
	upGuess = _vecNorm(upGuess, Vec3.new(0, 0, 1))
	local right = _vecCross(upGuess, fwd)
	if _vecLen(right) <= 1e-6 then
		local fallbackUp = Vec3.new(0, 0, 1)
		if math.abs((fwd.x * fallbackUp.x) + (fwd.y * fallbackUp.y) + (fwd.z * fallbackUp.z)) > 0.98 then
			fallbackUp = Vec3.new(0, 1, 0)
		end
		right = _vecCross(fallbackUp, fwd)
	end
	right = _vecNorm(right, Vec3.new(0, 1, 0))
	local up = _vecNorm(_vecCross(fwd, right), Vec3.new(0, 0, 1))
	local curveQuat = _quatFromBasis(fwd, right, up)
	return alignQuatToRef(curveQuat, q1)
end
function gmraQuatControl(prevQ: Quat?, curQ: Quat, nextQ: Quat?, strength: number?): Quat
	if not prevQ or not nextQ then
		return curQ
	end
	local tangentStrength = strength
	if tangentStrength == nil then
		tangentStrength = 1
	elseif tangentStrength < 0 then
		tangentStrength = 0
	elseif tangentStrength > 1 then
		tangentStrength = 1
	end
	if tangentStrength <= 1e-4 then
		return curQ
	end
	local prev = alignQuatToRef(quatNormalize(prevQ), curQ)
	local nxt = alignQuatToRef(quatNormalize(nextQ), curQ)
	local invCur = quatInv(curQ)
	local logA = quatLogUnit(quatMul(invCur, nxt))
	local logB = quatLogUnit(quatMul(invCur, prev))
	local scale = -0.25 * tangentStrength
	local avg = Quat.new((logA.x + logB.x) * scale, (logA.y + logB.y) * scale, (logA.z + logB.z) * scale, 0)
	return quatNormalize(quatMul(curQ, quatExpPure(avg)))
end
function gmraSafeQuatSquad(q1: Quat, q2: Quat, s1: Quat, s2: Quat, t: number): Quat
	local nt = clamp01(t)
	local a = safeQuatSlerp(q1, q2, nt)
	local b = safeQuatSlerp(s1, s2, nt)
	local h = 2 * nt * (1 - nt)
	return safeQuatSlerp(a, b, h)
end
local function nowSeconds(): number
	return (config._timeHack or 0) :: number
end
local function clearArray(t)
	for i = #t, 1, -1 do
		t[i] = nil
	end
end
local UNDO_LIMIT = 20
local undoStack: { Project } = {}
local function copyVec3(v: Vec3): Vec3
	return Vec3.new(v.x, v.y, v.z)
end
local function copyQuat(q: Quat): Quat
	return Quat.new(q.x, q.y, q.z, q.w)
end
local function deepCopyProject(p: Project): Project
	local cp: Project = {
		projectName = p.projectName,
		createdAt = p.createdAt,
		updatedAt = p.updatedAt,
		timelineStart = p.timelineStart,
		timelineEnd = p.timelineEnd,
		snap = p.snap,
		replayLayers = {},
		tracks = {
			position = {},
			rotation = {},
			fov = {},
			dofFstop = {},
			dofFocalDistance = {},
			dofSensorWidth = {},
			speed = {},
			timelineSpeed = {},
			pov = {},
			replayCuts = {},
		},
		ui = {
			useQuatInterp = p.ui.useQuatInterp,
			globalSmoothing = p.ui.globalSmoothing,
			posSmoothing = p.ui.posSmoothing,
			rotSmoothing = p.ui.rotSmoothing,
			advancedSmoothing = p.ui.advancedSmoothing,
			posTimingCarry = p.ui.posTimingCarry,
			posBlendPower = p.ui.posBlendPower,
			posKeyflow = p.ui.posKeyflow,
			posMidBiasPower = p.ui.posMidBiasPower,
			posTangentStrength = p.ui.posTangentStrength,
			posTangentClamp = p.ui.posTangentClamp,
			posOvershootGuard = p.ui.posOvershootGuard,
			rotCarryFloor = p.ui.rotCarryFloor,
			rotEasePower = p.ui.rotEasePower,
			rotSmoothStrength = p.ui.rotSmoothStrength,
			rotLinearMix = p.ui.rotLinearMix,
			rotKeyflow = p.ui.rotKeyflow,
			rotMidBiasPower = p.ui.rotMidBiasPower,
			zoom = p.ui.zoom,
			scroll = p.ui.scroll,
			rangeStart = p.ui.rangeStart,
			rangeEnd = p.ui.rangeEnd,
			scrollSpeed = p.ui.scrollSpeed,
			selectedRow = p.ui.selectedRow,
			selectedKeyIndex = p.ui.selectedKeyIndex,
			selectedReplayLayerId = p.ui.selectedReplayLayerId,
			masterReplayName = p.ui.masterReplayName,
			povNearClip = p.ui.povNearClip,
			hideNearestHead = p.ui.hideNearestHead,
			headHideOffset = p.ui.headHideOffset,
			headHideNearClip = p.ui.headHideNearClip,
		},
	}
	for i = 1, #p.replayLayers do
		local L = p.replayLayers[i]
		local newL: ReplayLayer = {
			name = L.name,
			muted = L.muted,
			solo = L.solo,
			hideWhenDone = L.hideWhenDone,
			segments = {},
			freezes = {},
		}
		for j = 1, #L.segments do
			local s = L.segments[j]
			newL.segments[j] = {
				replayName = s.replayName,
				dstStart = s.dstStart,
				srcStart = s.srcStart,
				srcEnd = s.srcEnd,
				playbackHz = s.playbackHz,
			}
		end
		for j = 1, #(L.freezes or {}) do
			local f = L.freezes[j]
			newL.freezes[j] = {
				startT = f.startT,
				endT = f.endT,
			}
		end
		cp.replayLayers[i] = newL
	end
	for i = 1, #p.tracks.position do
		local k = p.tracks.position[i]
		cp.tracks.position[i] = { t = k.t, v = copyVec3(k.v), interp = k.interp }
	end
	for i = 1, #p.tracks.rotation do
		local k = p.tracks.rotation[i]
		cp.tracks.rotation[i] = { t = k.t, v = copyQuat(k.v), interp = k.interp }
	end
	for i = 1, #p.tracks.fov do
		local k = p.tracks.fov[i]
		cp.tracks.fov[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #(p.tracks.dofFstop or {}) do
		local k = p.tracks.dofFstop[i]
		cp.tracks.dofFstop[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #(p.tracks.dofFocalDistance or {}) do
		local k = p.tracks.dofFocalDistance[i]
		cp.tracks.dofFocalDistance[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #(p.tracks.dofSensorWidth or {}) do
		local k = p.tracks.dofSensorWidth[i]
		cp.tracks.dofSensorWidth[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #p.tracks.speed do
		local k = p.tracks.speed[i]
		cp.tracks.speed[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #(p.tracks.timelineSpeed or {}) do
		local k = p.tracks.timelineSpeed[i]
		cp.tracks.timelineSpeed[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	for i = 1, #p.tracks.pov do
		local k = p.tracks.pov[i]
		cp.tracks.pov[i] = {
			t = k.t,
			replayLayerId = k.replayLayerId,
			playerId = k.playerId,
			mode = k.mode,
			nearClip = k.nearClip,
			hideNearestHead = k.hideNearestHead,
			orbitMode = k.orbitMode,
			orbitRadius = k.orbitRadius,
			orbitHeight = k.orbitHeight,
			orbitLookAheadDistance = k.orbitLookAheadDistance,
			orbitSmoothing = k.orbitSmoothing,
			manualOrbitSmoothingMultiplier = k.manualOrbitSmoothingMultiplier,
			orbitVelocityThreshold = k.orbitVelocityThreshold,
			manualOrbitYaw = k.manualOrbitYaw,
			manualOrbitPitch = k.manualOrbitPitch,
			manualOrbitAutoSpin = k.manualOrbitAutoSpin,
			manualOrbitSpinSpeed = k.manualOrbitSpinSpeed,
			interp = k.interp,
		}
	end
	cp.tracks.replayCuts = {}
	for i = 1, #(p.tracks.replayCuts or {}) do
		local k = p.tracks.replayCuts[i]
		cp.tracks.replayCuts[i] = { t = k.t, replayLayerId = k.replayLayerId, srcJumpT = k.srcJumpT }
	end
	return cp
end
local function clamp(x: any, a: number, b: number): number
	if x == nil then
		return a
	end
	return math.max(a, math.min(b, x :: number))
end
local function clamp01(x: number?): number
	x = x or 0
	if x < 0 then
		return 0
	end
	if x > 1 then
		return 1
	end
	return x
end
local function pushUndo(project: Project?)
	if not project then
		return
	end
	table.insert(undoStack, deepCopyProject(project))
	if #undoStack > UNDO_LIMIT then
		table.remove(undoStack, 1)
	end
end
local function doUndo()
	if #undoStack <= 0 then
		return
	end
	local prev = undoStack[#undoStack]
	table.remove(undoStack, #undoStack)
	local curT = playhead
	project = prev
	projectNameInput = prev.projectName
	playhead = clamp(curT, prev.timelineStart, prev.timelineEnd)
	config.projects[prev.projectName] = prev
	safeSaveConfig()
end
local replayState = {}
local lastPlayheadForCut = 0.0
local cutSnapFramesLeft = 0
local runtimeFrameCounter = 0
local loadedReplayListCacheFrame = -1
local loadedReplayFramesCacheFrame = -1
local loadedReplayListCache = {}
local loadedReplayFramesCache = {}
local loadedReplayQueryIndexCache = {}
local project: Project? = nil
local mode: "Edit" | "Preview" = "Edit"
local animating = false
local playhead = 0.0
local replayDriveState = {}
local previewEnabled = false
local editing = true
local driveReplays = true
local projectNameInput = ""
local newProjectNameInput = ""
local smoothingPresetNameInput = ""
local smoothingPresetSelectedName = config.lastSmoothingPreset or ""
local replaySearch = ""
local replayPicked = ""
local replayPickedDuration = 0.0
type BasicPlayer = { playerId: number, frameIndex: number }
local povPlayerNameSearch = ""
local povSelectedBasicPlayer: BasicPlayer? = nil
local povSelectedPlayerName = ""
local povModeStrings = { "1P", "3P", "OUT" }
local povOrbitModeStrings = { "Auto Orbit", "Manual Orbit" }
local povModeIndex = 1
local povReplayLayerPick = 1
local povNearClipAdd = 1.0
local povOrbitAddState = {
	modeIndex = 1,
	radius = 500.0,
	height = 0.0,
	lookAhead = 100.0,
	smoothing = 0.15,
	manualSmoothingMultiplier = 0.2,
	velocityThreshold = 600.0,
	manualYaw = 0.0,
	manualPitch = 0.0,
	autoSpin = false,
	spinSpeed = 45.0,
}
local rcutLayerPickState = 1
local rcutJumpInputState = 0.0
local rfreezeLayerPickState = 1
local rfreezeDurationInputState = 1.0
local rfreezeSelectedIndexState = 1
local aboutActiveTab = "overview"
local addKeyTypeOptions =
	{ "Position", "Rotation", "FOV", "Depth Of Field", "Replay Speed", "Timeline Speed", "POV", "Replay Cut", "Replay Freeze" }
local addKeyTypeIndex = 1
local addFovValue = 90.0
local addDofFstopValue = 0.0
local addDofFocalDistanceValue = 0.0
local addDofSensorWidthValue = 0.0
local replayTestStatus = ""
local showPath = (config.showPath == nil) and true or (config.showPath == true)
local pathLineThickness = 10
local pathPointSize = 14
local samplesPerSecond = tonumber(config.pathSamplesPerSecond) or 12
local showPathRawLine = (config.showPathRawLine == nil) and true or (config.showPathRawLine == true)
local showPathSmoothedLine = (config.showPathSmoothedLine == nil) and true or (config.showPathSmoothedLine == true)
local showPathDots = (config.showPathDots == nil) and true or (config.showPathDots == true)
local showLookDirection = config.showLookDirection == true
local lookRayLength = tonumber(config.lookRayLength) or 600
local globalSnapStep = tonumber(config.timelineSnapStep) or 0.05
local globalTimelineStart = tonumber(config.timelineStartGlobal) or 0
local globalTimelineEnd = tonumber(config.timelineEndGlobal) or 20
local globalAutoScrollSpeed = tonumber(config.timelineAutoScrollSpeed) or 1
local recordingModeProfile = config.recordingModeProfile == true
local debugPreviewApplyPosition = (config.debugPreviewApplyPosition == nil) and true
	or (config.debugPreviewApplyPosition == true)
local debugPreviewApplyRotation = (config.debugPreviewApplyRotation == nil) and true
	or (config.debugPreviewApplyRotation == true)
GMRA_ROTATION_DEBUG_DUMP_TEXT = tostring(config.rotationDebugDump or "")
GMRA_ROTATION_DEBUG_DUMP_STATUS = tostring(config.rotationDebugDumpStatus or "")
local showGhostFrustum = config.showGhostFrustum == true
local showGhostFrustumAlongPath = config.showGhostFrustumAlongPath == true
local ghostFrustumLength = tonumber(config.ghostFrustumLength) or 700
local ghostFrustumStepSeconds = tonumber(config.ghostFrustumStepSeconds) or 0.5
local ghostFrustumAspect = tonumber(config.ghostFrustumAspect) or (16 / 9)
local liveKeyEditEnabled = false
local liveKeyEditRow = ""
local liveKeyEditIndex = -1
local liveKeyEditLockMove = true
local liveKeyEditAnchorPos = Vec3.zeroVector
local liveEditNearClipBoosting = false
local liveEditNearClipPrev = 0.03
local liveEditNearClipPrevFreecam = 0.03
local liveEditNearClipValue = 150
local GMRA_POV_MANUAL_ORBIT_INPUT_ACTIVE = false
type KeyClipboardEntry = {
	dt: number,
	interp: InterpMode?,
	vNum: number?,
	vVec3: Vec3?,
	vQuat: Quat?,
	povReplayLayerId: number?,
	povPlayerId: number?,
	povMode: POVMode?,
	povNearClip: number?,
	povHideNearestHead: boolean?,
	povOrbitMode: POVOrbitMode?,
	povOrbitRadius: number?,
	povOrbitHeight: number?,
	povOrbitLookAheadDistance: number?,
	povOrbitSmoothing: number?,
	povManualOrbitSmoothingMultiplier: number?,
	povOrbitVelocityThreshold: number?,
	povManualOrbitYaw: number?,
	povManualOrbitPitch: number?,
	povManualOrbitAutoSpin: boolean?,
	povManualOrbitSpinSpeed: number?,
}
local keyClipboardRow = ""
local keyClipboardEntries: { KeyClipboardEntry } = {}
local keyClipboardSpan = 0
local selectedByBase = {}
camera.positionSmoothing = 0
camera.rotationSmoothing = 0
camera.fieldOfViewSmoothing = 0
local povAppliedThisFrame = false
local function sortKeysByT(keys)
	table.sort(keys, function(a, b)
		return a.t < b.t
	end)
end
local function sortRotationKeys(keys: { QuatKey })
	table.sort(keys, function(a, b)
		return a.t < b.t
	end)
	local i = 1
	while i < #keys do
		-- Use a very tight epsilon (1e-9) so only truly identical times
		-- get merged. The old 1e-6 threshold was silently deleting keys
		-- that were just dragged close together by the user.
		if math.abs(keys[i + 1].t - keys[i].t) <= 1e-9 then
			table.remove(keys, i)
		else
			i += 1
		end
	end
	if #keys <= 1 then
		if #keys == 1 then
			keys[1].v = quatNormalize(keys[1].v)
		end
		return
	end
	keys[1].v = quatNormalize(keys[1].v)
	local prev = keys[1].v
	for i = 2, #keys do
		local q = quatNormalize(keys[i].v)
		if quatDot(prev, q) < 0 then
			q = quatNeg(q)
			keys[i].v = q
		end
		prev = q
	end
end
local function upsertNumKey(keys: { NumKey }, t: number, v: number, interp: InterpMode?)
	interp = interp or "smooth"
	for i = 1, #keys do
		if feq(keys[i].t, t, 1e-6) then
			keys[i].v = v
			keys[i].interp = interp
			return
		end
	end
	table.insert(keys, { t = t, v = v, interp = interp })
	sortKeysByT(keys)
end
local function upsertVec3Key(keys: { Vec3Key }, t: number, v: Vec3, interp: InterpMode?)
	interp = interp or "smooth"
	for i = 1, #keys do
		if feq(keys[i].t, t, 1e-6) then
			keys[i].v = Vec3.new(v.x, v.y, v.z)
			keys[i].interp = interp
			sortKeysByT(keys)
			return
		end
	end
	table.insert(keys, { t = t, v = Vec3.new(v.x, v.y, v.z), interp = interp })
	sortKeysByT(keys)
end
local function upsertPOVKey(
	keys: { POVKey },
	t: number,
	replayLayerId: number,
	playerId: number,
	mode: POVMode,
	nearClip: number,
	hideNearestHead: boolean?,
	orbitMode: POVOrbitMode?,
	orbitRadius: number?,
	orbitHeight: number?,
	orbitLookAheadDistance: number?,
	orbitSmoothing: number?,
	manualOrbitSmoothingMultiplier: number?,
	orbitVelocityThreshold: number?,
	manualOrbitYaw: number?,
	manualOrbitPitch: number?,
	manualOrbitAutoSpin: boolean?,
	manualOrbitSpinSpeed: number?
)
	for i = 1, #keys do
		if feq(keys[i].t, t, 1e-6) then
			keys[i].replayLayerId = replayLayerId
			keys[i].playerId = playerId
			keys[i].mode = mode
			keys[i].nearClip = clamp(nearClip, 0, 100)
			keys[i].hideNearestHead = hideNearestHead == true
			keys[i].orbitMode = orbitMode or "AUTO"
			keys[i].orbitRadius = orbitRadius
			keys[i].orbitHeight = orbitHeight
			keys[i].orbitLookAheadDistance = orbitLookAheadDistance
			keys[i].orbitSmoothing = orbitSmoothing
			keys[i].manualOrbitSmoothingMultiplier = manualOrbitSmoothingMultiplier
			keys[i].orbitVelocityThreshold = orbitVelocityThreshold
			keys[i].manualOrbitYaw = manualOrbitYaw
			keys[i].manualOrbitPitch = manualOrbitPitch
			keys[i].manualOrbitAutoSpin = manualOrbitAutoSpin == true
			keys[i].manualOrbitSpinSpeed = manualOrbitSpinSpeed
			keys[i].interp = "cut"
			sortKeysByT(keys)
			return
		end
	end
	table.insert(keys, {
		t = t,
		replayLayerId = replayLayerId,
		playerId = playerId,
		mode = mode,
		nearClip = clamp(nearClip, 0, 100),
		hideNearestHead = hideNearestHead == true,
		orbitMode = orbitMode or "AUTO",
		orbitRadius = orbitRadius,
		orbitHeight = orbitHeight,
		orbitLookAheadDistance = orbitLookAheadDistance,
		orbitSmoothing = orbitSmoothing,
		manualOrbitSmoothingMultiplier = manualOrbitSmoothingMultiplier,
		orbitVelocityThreshold = orbitVelocityThreshold,
		manualOrbitYaw = manualOrbitYaw,
		manualOrbitPitch = manualOrbitPitch,
		manualOrbitAutoSpin = manualOrbitAutoSpin == true,
		manualOrbitSpinSpeed = manualOrbitSpinSpeed,
		interp = "cut",
	})
	sortKeysByT(keys)
end
local function evalPOV(p: Project, t: number): POVKey?
	local keys = p.tracks.pov
	if #keys == 0 then
		return nil
	end
	local last: POVKey? = nil
	for i = 1, #keys do
		if t >= keys[i].t then
			last = keys[i]
		else
			break
		end
	end
	return last
end
local function ensureLoadedReplayListCache()
	if loadedReplayListCacheFrame >= 0 and (runtimeFrameCounter - loadedReplayListCacheFrame) < 6 then
		return
	end
	loadedReplayListCacheFrame = runtimeFrameCounter
	loadedReplayListCache = Replay.listLoaded()
	loadedReplayQueryIndexCache = {}
	loadedReplayFramesCacheFrame = -1
end
local function ensureLoadedReplayFramesCache()
	if loadedReplayFramesCacheFrame == runtimeFrameCounter then
		return
	end
	loadedReplayFramesCacheFrame = runtimeFrameCounter
	loadedReplayFramesCache = getAllGameData()
end
local function gmraInvalidateReplayCaches()
	loadedReplayListCacheFrame = -1
	loadedReplayFramesCacheFrame = -1
	loadedReplayListCache = {}
	loadedReplayFramesCache = {}
	loadedReplayQueryIndexCache = {}
end
local function gmraUnloadAllLoadedReplaysForTest()
	local ok, err = pcall(function()
		Replay.unloadAll()
	end)
	gmraInvalidateReplayCaches()
	replayState = {}
	replayPicked = ""
	replayPickedDuration = 0.0
	if ok then
		replayTestStatus = "Unloaded all loaded replays."
	else
		replayTestStatus = "Unload failed: " .. tostring(err)
	end
end
local function getReplayFrameByName(replayName: string): ReplayFrame?
	if replayName == "" then
		return nil
	end
	ensureLoadedReplayListCache()
	local idx = loadedReplayQueryIndexCache[replayName]
	if idx == nil then
		for i = 1, #loadedReplayListCache do
			if string.find(loadedReplayListCache[i], replayName, 1, true) ~= nil then
				idx = i
				break
			end
		end
		if idx == nil then
			idx = 0
		end
		loadedReplayQueryIndexCache[replayName] = idx
	end
	if idx <= 0 then
		return nil
	end
	ensureLoadedReplayFramesCache()
	local fi = idx + 1
	if fi >= 1 and fi <= #loadedReplayFramesCache then
		return loadedReplayFramesCache[fi]
	end
	return nil
end
local function getActiveSegmentForLayerAtTime(p: Project, layerId: number, t: number): ReplaySegment?
	local layer = p.replayLayers[layerId]
	if not layer then
		return nil
	end
	for _, seg in ipairs(layer.segments) do
		local segLen = (seg.srcEnd - seg.srcStart)
		if segLen > 0 and t >= seg.dstStart and t < (seg.dstStart + segLen) then
			return seg
		end
	end
	return nil
end
local function isPOVActive(p: Project, t: number): boolean
	local pov = evalPOV(p, t)
	if not pov then
		return false
	end
	if pov.mode == "OUT" then
		return false
	end
	local seg = getActiveSegmentForLayerAtTime(p, pov.replayLayerId, t)
	if not seg then
		return false
	end
	local frame = getReplayFrameByName(seg.replayName)
	if not frame then
		return false
	end
	local plr = frame:getPlayerById(pov.playerId)
	if not plr then
		return false
	end
	return true
end
local function vec3Add(a: Vec3, b: Vec3): Vec3
	return Vec3.new(a.x + b.x, a.y + b.y, a.z + b.z)
end
local function vec3Sub(a: Vec3, b: Vec3): Vec3
	return Vec3.new(a.x - b.x, a.y - b.y, a.z - b.z)
end
local function vec3Mul(a: Vec3, s: number): Vec3
	return Vec3.new(a.x * s, a.y * s, a.z * s)
end
local function vec3Len(v: Vec3): number
	return math.sqrt((v.x * v.x) + (v.y * v.y) + (v.z * v.z))
end
local function vec3Normalize(v: Vec3): Vec3
	local len = vec3Len(v)
	if len <= 1e-8 then
		return Vec3.new(0, 0, 0)
	end
	return vec3Mul(v, 1 / len)
end
local function vec3Cross(a: Vec3, b: Vec3): Vec3
	return Vec3.new((a.y * b.z) - (a.z * b.y), (a.z * b.x) - (a.x * b.z), (a.x * b.y) - (a.y * b.x))
end
local function vec3ClampLen(v: Vec3, maxLen: number): Vec3
	if maxLen <= 0 then
		return Vec3.zeroVector
	end
	local len = vec3Len(v)
	if len <= 1e-6 or len <= maxLen then
		return v
	end
	return vec3Mul(v, maxLen / len)
end
local function lerpNum(a: number, b: number, t: number): number
	return a * (1 - t) + b * t
end
local function hermiteVec3(p1: Vec3, p2: Vec3, m1: Vec3, m2: Vec3, t: number): Vec3
	local t2 = t * t
	local t3 = t2 * t
	local h00 = (2 * t3) - (3 * t2) + 1
	local h10 = t3 - (2 * t2) + t
	local h01 = (-2 * t3) + (3 * t2)
	local h11 = t3 - t2
	return vec3Add(vec3Add(vec3Mul(p1, h00), vec3Mul(m1, h10)), vec3Add(vec3Mul(p2, h01), vec3Mul(m2, h11)))
end
local function vec3KeyTangent(
	prevK: Vec3Key?,
	curK: Vec3Key,
	nextK: Vec3Key?,
	smoothAmount: number?,
	timingCarry: number?,
	flowBlend: number?,
	tangentClamp: number?,
	overshootGuard: number?,
	midBiasPower: number?
): Vec3
	local strength = math.max(0, smoothAmount or 1)
	if strength <= 1e-6 then
		return Vec3.zeroVector
	end
	local carry = clamp01((timingCarry == nil) and 1 or timingCarry)
	local flow = clamp01((flowBlend == nil) and 0.5 or flowBlend)
	local clampMul = math.max(0.05, tangentClamp or 1)
	local guard = clamp01((overshootGuard == nil) and 0.45 or overshootGuard)
	local midCarry = clamp01((clamp((midBiasPower == nil) and 1 or midBiasPower, 0.25, 4) - 0.25) / 3.75)
	if prevK and nextK then
		local prevDt = math.max(1e-6, curK.t - prevK.t)
		local nextDt = math.max(1e-6, nextK.t - curK.t)
		local inVel = vec3Mul(vec3Sub(curK.v, prevK.v), 1 / prevDt)
		local outVel = vec3Mul(vec3Sub(nextK.v, curK.v), 1 / nextDt)
		local inSpeed = vec3Len(inVel)
		local outSpeed = vec3Len(outVel)
		local centeredVel = vec3Mul(vec3Sub(nextK.v, prevK.v), 1 / math.max(1e-6, prevDt + nextDt))
		local centeredDir = vec3Normalize(centeredVel)
		local inDir = vec3Normalize(inVel)
		local outDir = vec3Normalize(outVel)
		local bisectorDir = vec3Normalize(vec3Add(inDir, outDir))
		if vec3Len(bisectorDir) <= 1e-6 then
			bisectorDir = centeredDir
		end
		if vec3Len(bisectorDir) <= 1e-6 then
			bisectorDir = vec3Normalize(vec3Sub(nextK.v, curK.v))
		end
		local dirBias = clamp01(flow * lerpNum(0.35, 1.0, carry))
		local tangentDir = vec3Normalize(Vec3.lerp(centeredDir, bisectorDir, dirBias))
		if vec3Len(tangentDir) <= 1e-6 then
			tangentDir = bisectorDir
		end
		local avgSpeed = (inSpeed + outSpeed) * 0.5
		local harmonicSpeed = avgSpeed
		if inSpeed > 1e-6 and outSpeed > 1e-6 then
			harmonicSpeed = (2 * inSpeed * outSpeed) / (inSpeed + outSpeed)
		end
		local minSpeed = math.min(inSpeed, outSpeed)
		local maxSpeed = math.max(inSpeed, outSpeed)
		-- Keep more velocity through the key so the path feels like one continuous move
		-- instead of a sequence of mini checkpoints.
		local safeSpeed = lerpNum(avgSpeed, minSpeed, guard * 0.3)
		local carrySpeed = lerpNum(harmonicSpeed, avgSpeed, lerpNum(0.6, 0.92, midCarry))
		local targetSpeed = lerpNum(safeSpeed, carrySpeed, lerpNum(flow, 1.0, 0.2))
		local tangent = vec3Mul(tangentDir, targetSpeed * strength)
		local speedCap = math.max(1e-4, lerpNum(maxSpeed, math.max(avgSpeed, carrySpeed), guard * 0.2) * clampMul)
		return vec3ClampLen(tangent, speedCap)
	end
	if nextK then
		local nextDt = math.max(1e-6, nextK.t - curK.t)
		local outVel = vec3Mul(vec3Sub(nextK.v, curK.v), 1 / nextDt)
		return vec3ClampLen(vec3Mul(outVel, strength), math.max(1e-4, vec3Len(outVel) * clampMul))
	end
	if prevK then
		local prevDt = math.max(1e-6, curK.t - prevK.t)
		local inVel = vec3Mul(vec3Sub(curK.v, prevK.v), 1 / prevDt)
		return vec3ClampLen(vec3Mul(inVel, strength), math.max(1e-4, vec3Len(inVel) * clampMul))
	end
	return Vec3.zeroVector
end
local function smoothstep(t: number): number
	return t * t * (3 - 2 * t)
end
local function findBracket(keys, t: number)
	if not keys or #keys == 0 then
		return nil, nil
	end
	if t <= keys[1].t then
		local firstT = keys[1].t
		local lastAtFirst = keys[1]
		for i = 2, #keys do
			if feq(keys[i].t, firstT, 1e-6) then
				lastAtFirst = keys[i]
			else
				break
			end
		end
		return lastAtFirst, nil
	end
	local prev = keys[1]
	local next = nil
	for i = 2, #keys do
		local k = keys[i]
		if k.t <= t then
			prev = k
		else
			next = k
			break
		end
	end
	return prev, next
end
local function evalNum(keys: { NumKey }, t: number): number
	if #keys == 0 then
		return 0
	end
	local k1, k2 = findBracket(keys, t)
	if not k1 then
		return 0
	end
	if not k2 then
		return k1.v
	end
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return k1.v
	end
	local alpha = (t - k1.t) / (k2.t - k1.t)
	if interp == "linear" then
		return lerpNum(k1.v, k2.v, alpha)
	end
	return lerpNum(k1.v, k2.v, smoothstep(alpha))
end
local didPushUndoThisFrame = false
function beginUndoFrame()
	didPushUndoThisFrame = false
end

function pushUndoOnce(p: Project)
	if didPushUndoThisFrame then
		return
	end
	pushUndo(p)
	didPushUndoThisFrame = true
end

function setIfChangedNum(p: Project, oldV: number, newV: number): number
	if not feq(oldV, newV) then
		pushUndoOnce(p)
	end
	return newV
end

function isLiveKeyEditTarget(row: string, idx: number): boolean
	return liveKeyEditEnabled and liveKeyEditRow == row and liveKeyEditIndex == idx
end

function setLiveEditNearClipBoost(enabled: boolean)
	if enabled then
		if not liveEditNearClipBoosting then
			liveEditNearClipPrev = tonumber(camera.nearClippingPlane) or 0.03
			if getCameraById then
				local freecam = getCameraById("anotheraxiom.freecam")
				if freecam then
					liveEditNearClipPrevFreecam = tonumber(freecam.nearClippingPlane) or liveEditNearClipPrev
				end
			end
			liveEditNearClipBoosting = true
		end
		local boosted = clamp(math.max(liveEditNearClipPrev, liveEditNearClipValue), 0.001, 1000)
		camera.nearClippingPlane = boosted
		if getCameraById then
			local freecam = getCameraById("anotheraxiom.freecam")
			if freecam then
				freecam.nearClippingPlane = boosted
			end
		end
	else
		if liveEditNearClipBoosting then
			camera.nearClippingPlane = clamp(liveEditNearClipPrev, 0.001, 1000)
			if getCameraById then
				local freecam = getCameraById("anotheraxiom.freecam")
				if freecam then
					freecam.nearClippingPlane = clamp(liveEditNearClipPrevFreecam, 0.001, 1000)
				end
			end
			liveEditNearClipBoosting = false
		end
	end
end

function stopLiveKeyEdit()
	setLiveEditNearClipBoost(false)
	liveKeyEditEnabled = false
	liveKeyEditRow = ""
	liveKeyEditIndex = -1
end

function startLiveKeyEdit(row: string, idx: number)
	liveKeyEditEnabled = true
	liveKeyEditRow = row
	liveKeyEditIndex = idx
	liveKeyEditAnchorPos = Vec3.new(camera.position.x, camera.position.y, camera.position.z)
	setLiveEditNearClipBoost(row == "Position")
end

function applyLiveKeyEditFromCamera(p: Project)
	if not liveKeyEditEnabled then
		return
	end
	if previewEnabled then
		stopLiveKeyEdit()
		return
	end
	if p.ui.selectedRow ~= liveKeyEditRow or p.ui.selectedKeyIndex ~= liveKeyEditIndex then
		stopLiveKeyEdit()
		return
	end

	local row = liveKeyEditRow
	local idx = liveKeyEditIndex
	if row == "Position" then
		local k = p.tracks.position[idx]
		if not k then
			stopLiveKeyEdit()
			return
		end
		setLiveEditNearClipBoost(true)
		k.v = Vec3.new(camera.position.x, camera.position.y, camera.position.z)
	elseif row == "Rotation" then
		local k = p.tracks.rotation[idx]
		if not k then
			stopLiveKeyEdit()
			return
		end
		if liveKeyEditLockMove and getCameraById then
			local freecam = getCameraById("anotheraxiom.freecam")
			if freecam then
				freecam.position = liveKeyEditAnchorPos
			end
		end
		k.v = quatNormalize(Quat.new(camera.rotation.x, camera.rotation.y, camera.rotation.z, camera.rotation.w))
	end
end

local function round(x: number): number
	if x >= 0 then
		return math.floor(x + 0.5)
	else
		return math.ceil(x - 0.5)
	end
end

local function alignTo(x: number, snap: number): number
	if snap <= 0 then
		return x
	end
	return round(x / snap) * snap
end

local function roundUp(x: number, inc: number): number
	if inc <= 0 then
		return x
	end
	return round(x / inc) * inc
end

local function evalVec3Spline(
	keys: { Vec3Key },
	t: number,
	smoothAmount: number?,
	timingCarry: number?,
	tangentClamp: number?,
	overshootGuard: number?,
	flowBlend: number?,
	midBiasPower: number?
): Vec3
	-- Catmull-Rom spline with non-uniform time parameterisation.
	-- Guaranteed to pass through every keyframe at the exact keyed time.
	-- Tangents are computed globally (same formula at every key regardless
	-- of which segment is evaluating) so C1 continuity holds everywhere.
	if #keys == 0 then
		return Vec3.zeroVector
	end
	if t <= keys[1].t then
		return keys[1].v
	end
	if t >= keys[#keys].t then
		return keys[#keys].v
	end

	-- Find active segment
	local i = 1
	for k = 1, #keys - 1 do
		if t >= keys[k].t and t < keys[k + 1].t then
			i = k
			break
		end
	end

	local k1 = keys[i]
	local k2 = keys[i + 1]
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return k1.v
	end

	local segDt = k2.t - k1.t
	if segDt <= 1e-6 then
		return k1.v
	end

	local alpha = clamp01((t - k1.t) / segDt)
	if interp == "linear" then
		return Vec3.lerp(k1.v, k2.v, alpha)
	end

	local strength = clamp01(smoothAmount or 1)
	if strength <= 1e-6 then
		return Vec3.lerp(k1.v, k2.v, alpha)
	end

	local prevK = (i > 1) and keys[i - 1] or nil
	local nextK = (i + 1 < #keys) and keys[i + 2] or nil
	local m0 =
		vec3KeyTangent(prevK, k1, k2, strength, timingCarry, flowBlend, tangentClamp, overshootGuard, midBiasPower)
	local m1 =
		vec3KeyTangent(k1, k2, nextK, strength, timingCarry, flowBlend, tangentClamp, overshootGuard, midBiasPower)
	return hermiteVec3(k1.v, k2.v, vec3Mul(m0, segDt), vec3Mul(m1, segDt), alpha)
end
local function evalVec3(keys: { Vec3Key }, t: number, carryThrough: number?): Vec3
	if #keys == 0 then
		return Vec3.zeroVector
	end
	local k1, k2 = findBracket(keys, t)
	if not k1 then
		return Vec3.zeroVector
	end
	if not k2 then
		return k1.v
	end
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return k1.v
	end
	local alpha = (t - k1.t) / (k2.t - k1.t)
	if interp == "linear" then
		return Vec3.lerp(k1.v, k2.v, alpha)
	end
	local carry = clamp01(carryThrough)
	local eased = lerpNum(smoothstep(alpha), alpha, carry)
	return Vec3.lerp(k1.v, k2.v, eased)
end
local function evalVec3Curved(p: Project, t: number): Vec3
	if isPOVActive(p, t) then
		return evalVec3(p.tracks.position, t)
	end
	local ui = p.ui
	local linearPos = evalVec3(p.tracks.position, t, 0)
	-- Strength: how much Catmull-Rom smoothing vs straight lerp
	local s = clamp01(clamp01(ui.globalSmoothing) + clamp01(ui.posSmoothing))
	if s <= 1e-4 then
		return linearPos
	end
	-- Overshoot guard from advanced settings
	local adv = (ui.advancedSmoothing == nil) or (ui.advancedSmoothing == true)
	local guard = adv and clamp01((ui.posOvershootGuard == nil) and 0.6 or ui.posOvershootGuard) or 0.6
	local timingCarry = adv and clamp01((ui.posTimingCarry == nil) and 1 or ui.posTimingCarry) or 1
	local tangentClamp = adv and math.max(1, tonumber(ui.posTangentClamp) or 2.5) or 2.5
	local keyflow = adv and clamp01((ui.posKeyflow == nil) and 0.55 or ui.posKeyflow) or s
	local midBias = adv and math.max(0.25, tonumber(ui.posMidBiasPower) or 1) or 1
	local tangentStrength = adv and clamp01((ui.posTangentStrength == nil) and 1 or ui.posTangentStrength) or 1
	local splinePos =
		evalVec3Spline(p.tracks.position, t, tangentStrength, timingCarry, tangentClamp, guard, keyflow, midBias)
	return Vec3.lerp(linearPos, splinePos, s)
end
local function evalQuat(keys: { QuatKey }, t: number): Quat
	if #keys == 0 then
		return camera.rotation
	end
	if #keys == 1 then
		return quatNormalize(keys[1].v)
	end

	-- Find the segment index directly (avoids findBracket losing the index)
	local n = #keys
	local i1 = n - 1
	for i = 1, n - 1 do
		if t < keys[i + 1].t then
			i1 = i
			break
		end
	end
	local i2 = i1 + 1

	local k1 = keys[i1]
	local k2 = keys[i2]
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return quatNormalize(k1.v)
	end

	local segDt = k2.t - k1.t
	if segDt <= 1e-6 then
		return quatNormalize(k1.v)
	end

	local alpha = clamp01((t - k1.t) / segDt)
	local q1 = quatNormalize(k1.v)
	local q2 = quatNormalize(k2.v)
	if quatDot(q1, q2) < 0 then
		q2 = quatNeg(q2)
	end

	if project and (project :: Project).ui.useQuatInterp == false then
		return q1
	end
	if interp == "linear" then
		return safeQuatSlerp(q1, q2, alpha)
	end

	local smoothMix = 0
	local tangentStrength = 1.0
	local linearDamp = 0.0
	if project then
		local ui = (project :: Project).ui
		smoothMix = clamp01(clamp01(ui.globalSmoothing) + clamp01(ui.rotSmoothing))
		if smoothMix <= 1e-4 then
			return safeQuatSlerp(q1, q2, alpha)
		end
		local keyflow = clamp01((ui.rotKeyflow == nil) and 0.85 or ui.rotKeyflow)
		local smoothStrength = clamp01((ui.rotSmoothStrength == nil) and 1 or ui.rotSmoothStrength)
		linearDamp = clamp01(ui.rotLinearMix or 0)
		tangentStrength = clamp01(keyflow * smoothStrength)
	end
	if smoothMix <= 1e-4 then
		return safeQuatSlerp(q1, q2, alpha)
	end
	local curveMix = clamp01(smoothMix * (1 - linearDamp))
	if curveMix <= 1e-4 then
		return safeQuatSlerp(q1, q2, alpha)
	end

	local linearRot = safeQuatSlerp(q1, q2, alpha)
	local basisAmount = clamp(math.max(0.35, tangentStrength + 0.15), 0, 1.5)
	local okBasis, basisRot = pcall(function()
		return gmraEvalQuatBasisFlowSpline(keys, t, basisAmount)
	end)
	if okBasis and basisRot then
		basisRot = alignQuatToRef(quatNormalize(basisRot), linearRot)
		return safeQuatSlerp(linearRot, basisRot, curveMix)
	end

	local okLegacyBasis, legacyBasisRot = pcall(function()
		return gmraEvalQuatEulerBezier(keys, t, basisAmount)
	end)
	if okLegacyBasis and legacyBasisRot then
		legacyBasisRot = alignQuatToRef(quatNormalize(legacyBasisRot), linearRot)
		return safeQuatSlerp(linearRot, legacyBasisRot, curveMix)
	end

	local function localForwardOmegaAt(idx: number): Quat
		local curKey = keys[idx]
		local qC = quatNormalize(curKey.v)
		if n <= 1 then
			return Quat.new(0, 0, 0, 0)
		end
		if idx <= 1 then
			local nxt = keys[2]
			local dtR = math.max(1e-6, nxt.t - curKey.t)
			local qN = alignQuatToRef(quatNormalize(nxt.v), qC)
			local fwd = quatLogUnit(quatMul(quatInv(qC), qN))
			return Quat.new(fwd.x / dtR, fwd.y / dtR, fwd.z / dtR, 0)
		end
		if idx >= n then
			local prv = keys[n - 1]
			local dtL = math.max(1e-6, curKey.t - prv.t)
			local qP = alignQuatToRef(quatNormalize(prv.v), qC)
			local back = quatLogUnit(quatMul(quatInv(qC), qP))
			return Quat.new(-back.x / dtL, -back.y / dtL, -back.z / dtL, 0)
		end
		local prv = keys[idx - 1]
		local nxt = keys[idx + 1]
		local dtL = math.max(1e-6, curKey.t - prv.t)
		local dtR = math.max(1e-6, nxt.t - curKey.t)
		local qP = alignQuatToRef(quatNormalize(prv.v), qC)
		local qN = alignQuatToRef(quatNormalize(nxt.v), qC)
		local back = quatLogUnit(quatMul(quatInv(qC), qP))
		local fwd = quatLogUnit(quatMul(quatInv(qC), qN))
		local vL = Quat.new(-back.x / dtL, -back.y / dtL, -back.z / dtL, 0)
		local vR = Quat.new(fwd.x / dtR, fwd.y / dtR, fwd.z / dtR, 0)
		local wL = dtR / (dtL + dtR)
		local wR = dtL / (dtL + dtR)
		return Quat.new(vL.x * wL + vR.x * wR, vL.y * wL + vR.y * wR, vL.z * wL + vR.z * wR, 0)
	end

	local omega1 = localForwardOmegaAt(i1)
	local omega2 = localForwardOmegaAt(i2)
	local controlScale = (segDt / 3) * tangentStrength
	local c1 = quatNormalize(
		quatMul(q1, quatExpPure(Quat.new(omega1.x * controlScale, omega1.y * controlScale, omega1.z * controlScale, 0)))
	)
	local c2 = quatNormalize(
		quatMul(
			q2,
			quatExpPure(Quat.new(-omega2.x * controlScale, -omega2.y * controlScale, -omega2.z * controlScale, 0))
		)
	)
	c1 = alignQuatToRef(c1, q1)
	c2 = alignQuatToRef(c2, q2)

	local q01 = safeQuatSlerp(q1, c1, alpha)
	local q12 = safeQuatSlerp(c1, c2, alpha)
	local q23 = safeQuatSlerp(c2, q2, alpha)
	local r0 = safeQuatSlerp(q01, q12, alpha)
	local r1 = safeQuatSlerp(q12, q23, alpha)
	local smoothRot = safeQuatSlerp(r0, r1, alpha)
	smoothRot = alignQuatToRef(quatNormalize(smoothRot), linearRot)
	return safeQuatSlerp(linearRot, smoothRot, curveMix)
end
function gmraEvalQuatSafe(keys: { QuatKey }, t: number, fallbackRot: Quat?): Quat
	local defaultRot = fallbackRot or camera.rotation
	if not keys or #keys == 0 then
		return defaultRot
	end
	local ok, out = pcall(function()
		return evalQuat(keys, t)
	end)
	if ok and out then
		return out
	end
	local k1, k2 = findBracket(keys, t)
	if not k1 then
		return defaultRot
	end
	local q1 = quatNormalize(k1.v)
	if not k2 then
		return q1
	end
	local interp: InterpMode = (k2.interp or "smooth")
	if interp == "cut" then
		return q1
	end
	local segDt = k2.t - k1.t
	if segDt <= 1e-6 then
		return q1
	end
	local alpha = clamp01((t - k1.t) / segDt)
	local q2 = quatNormalize(k2.v)
	if quatDot(q1, q2) < 0 then
		q2 = quatNeg(q2)
	end
	return safeQuatSlerp(q1, q2, alpha)
end
function gmraBuildRotationDebugDump(p: Project): string
	local lines = {}
	local keys = p.tracks.rotation
	local function addLine(text: string)
		lines[#lines + 1] = text
	end
	addLine("Rotation Debug Dump")
	addLine(string.format("project=%s", p.projectName))
	addLine(string.format("rot_keys=%d", #keys))
	addLine(
		string.format(
			"settings global=%.3f rot=%.3f carry=%.3f ease=%.3f strength=%.3f linearMix=%.3f keyflow=%.3f midBias=%.3f quat=%s",
			tonumber(p.ui.globalSmoothing) or 0,
			tonumber(p.ui.rotSmoothing) or 0,
			tonumber(p.ui.rotCarryFloor) or 0,
			tonumber(p.ui.rotEasePower) or 0,
			tonumber(p.ui.rotSmoothStrength) or 0,
			tonumber(p.ui.rotLinearMix) or 0,
			tonumber(p.ui.rotKeyflow) or 0,
			tonumber(p.ui.rotMidBiasPower) or 0,
			tostring(p.ui.useQuatInterp == true)
		)
	)
	if #keys == 0 then
		addLine("no rotation keys")
		return table.concat(lines, "\n")
	end
	local epsList = { 0.008, 0.016, 0.033 }
	local firstT = keys[1].t
	local lastT = keys[#keys].t
	for idx = 1, #keys do
		local k = keys[idx]
		local qKey = quatNormalize(k.v)
		local eKey = gmraQuatToEulerSafe(qKey, Vec3.zeroVector)
		addLine(
			string.format(
				"key[%d] t=%.3f interp=%s euler=(%.3f, %.3f, %.3f)",
				idx,
				k.t,
				tostring(k.interp or "smooth"),
				eKey.x,
				eKey.y,
				eKey.z
			)
		)
		if idx > 1 and idx < #keys then
			for epsIdx = 1, #epsList do
				local eps = epsList[epsIdx]
				local tL = clamp(k.t - eps, firstT, lastT)
				local tR = clamp(k.t + eps, firstT, lastT)
				local okL, qL = pcall(function()
					return evalQuat(keys, tL)
				end)
				local okM, qM = pcall(function()
					return evalQuat(keys, k.t)
				end)
				local okR, qR = pcall(function()
					return evalQuat(keys, tR)
				end)
				if not okL or not qL then
					qL = gmraEvalQuatSafe(keys, tL, qKey)
				end
				if not okM or not qM then
					qM = gmraEvalQuatSafe(keys, k.t, qKey)
				end
				if not okR or not qR then
					qR = gmraEvalQuatSafe(keys, tR, qKey)
				end
				local dtIn = math.max(1e-6, k.t - tL)
				local dtOut = math.max(1e-6, tR - k.t)
				local speedIn = gmraQuatAngleDeg(qL, qM) / dtIn
				local speedOut = gmraQuatAngleDeg(qM, qR) / dtOut
				local speedAcross = gmraQuatAngleDeg(qL, qR) / math.max(1e-6, tR - tL)
				local eMid = gmraQuatToEulerSafe(qM, eKey)
				addLine(
					string.format(
						"  eps=%.3f in=%.3f out=%.3f delta=%.3f across=%.3f fallback=%s%s%s midEuler=(%.3f, %.3f, %.3f)",
						eps,
						speedIn,
						speedOut,
						math.abs(speedOut - speedIn),
						speedAcross,
						okL and "" or "L",
						okM and "" or "M",
						okR and "" or "R",
						eMid.x,
						eMid.y,
						eMid.z
					)
				)
			end
		end
	end
	return table.concat(lines, "\n")
end
function gmraStoreRotationDebugDumpInConfig(text: string, projectName: string)
	config.keybinds = config.keybinds or {}
	local keysToRemove = {}
	for k, _ in pairs(config.keybinds) do
		if type(k) == "string" and string.sub(k, 1, 21) == "__rotation_debug_line" then
			keysToRemove[#keysToRemove + 1] = k
		end
	end
	for i = 1, #keysToRemove do
		config.keybinds[keysToRemove[i]] = nil
	end
	config.keybinds.__rotation_debug_meta = {
		key = "project=" .. projectName,
		ctrl = false,
		alt = false,
		shift = false,
	}
	local lineIdx = 1
	for line in string.gmatch(text, "([^\n]+)") do
		local id = string.format("__rotation_debug_line_%03d", lineIdx)
		config.keybinds[id] = {
			key = line,
			ctrl = false,
			alt = false,
			shift = false,
		}
		lineIdx += 1
	end
end
function gmraClearStoredRotationDebugDump()
	config.keybinds = config.keybinds or {}
	local keysToRemove = {}
	for k, _ in pairs(config.keybinds) do
		if
			type(k) == "string" and (string.sub(k, 1, 21) == "__rotation_debug_line" or k == "__rotation_debug_meta")
		then
			keysToRemove[#keysToRemove + 1] = k
		end
	end
	for i = 1, #keysToRemove do
		config.keybinds[keysToRemove[i]] = nil
	end
end
function gmraDumpRotationDebug(p: Project)
	local ok, result = pcall(gmraBuildRotationDebugDump, p)
	if ok and result then
		GMRA_ROTATION_DEBUG_DUMP_TEXT = result
		GMRA_ROTATION_DEBUG_DUMP_STATUS = "Rotation debug dump captured for " .. p.projectName
		config.rotationDebugDump = result
		config.rotationDebugDumpStatus = GMRA_ROTATION_DEBUG_DUMP_STATUS
		config.rotationDebugProject = p.projectName
		gmraStoreRotationDebugDumpInConfig(result, p.projectName)
		safeSaveConfig()
		print(result)
		return
	end
	GMRA_ROTATION_DEBUG_DUMP_STATUS = "Rotation debug dump failed: " .. tostring(result)
	config.rotationDebugDumpStatus = GMRA_ROTATION_DEBUG_DUMP_STATUS
	safeSaveConfig()
	warn(GMRA_ROTATION_DEBUG_DUMP_STATUS)
end
local function anySoloOn(p: Project): boolean
	for _, L in ipairs(p.replayLayers) do
		if L.solo == true then
			return true
		end
	end
	return false
end
local function getLoadedReplayIndexByName(replayName: string): number?
	if replayName == "" then
		return nil
	end
	ensureLoadedReplayListCache()
	local idx = loadedReplayQueryIndexCache[replayName]
	if idx == nil then
		for i = 1, #loadedReplayListCache do
			if string.find(loadedReplayListCache[i], replayName, 1, true) ~= nil then
				idx = i
				break
			end
		end
		if idx == nil then
			idx = 0
		end
		loadedReplayQueryIndexCache[replayName] = idx
	end
	if idx <= 0 then
		return nil
	end
	return idx
end
local function getLoadedReplayDurationIfAvailable(replayName: string): number?
	local idx = getLoadedReplayIndexByName(replayName)
	if not idx then
		return nil
	end
	local r = Replay.getByIndex(idx)
	if not r then
		return nil
	end
	local ok, dur = pcall(function()
		return r:getDurationSeconds()
	end)
	if ok and dur then
		return dur
	end
	return nil
end
local function segKey(seg: ReplaySegment): string
	return tostring(seg.replayName)
		.. "|"
		.. tostring(seg.dstStart)
		.. "|"
		.. tostring(seg.srcStart)
		.. "|"
		.. tostring(seg.srcEnd)
end
local function safePositiveSpeed(x: number?): number
	if x == nil or x <= 0 then
		return 0.01
	end
	return x
end
local function integrateReplayDeltaOverPlayhead(p: Project, layer: ReplayLayer?, seg: ReplaySegment?, a: number, b: number): number
	if feq(a, b, 1e-9) then
		return 0
	end
	local dir = (b > a) and 1 or -1
	local step = math.max(p.snap or 0.05, 0.001)
	local total = 0.0
	local t = a
	while (dir == 1 and t < b) or (dir == -1 and t > b) do
		local remaining = math.abs(b - t)
		local dtPlayhead = math.min(step, remaining) * dir
		local tNext = t + dtPlayhead
		local mid = (t + tNext) * 0.5
		if not gmraFindReplayFreezeAtTime(layer, seg, mid) then
			local rs = safePositiveSpeed(evalNum(p.tracks.speed, mid))
			local tls = safePositiveSpeed(evalNum(p.tracks.timelineSpeed, mid))
			total += (tNext - t) * (rs / tls)
		end
		t = tNext
	end
	return total
end
local function replayTimeForLayerAtPlayhead(p: Project, layerId: number, seg: ReplaySegment, t: number): number
	local layer = p.replayLayers[layerId]
	local startTimeline = seg.dstStart
	local replayT = seg.srcStart
	local cuts = p.tracks.replayCuts
	if cuts and #cuts > 0 then
		for ci = 1, #cuts do
			local cut = cuts[ci]
			if cut.t > t then
				break
			end
			if cut.replayLayerId == layerId and cut.t >= seg.dstStart then
				startTimeline = cut.t
				replayT = clamp(cut.srcJumpT, seg.srcStart, seg.srcEnd)
			end
		end
	end
	replayT += integrateReplayDeltaOverPlayhead(p, layer, seg, startTimeline, t)
	return clamp(replayT, seg.srcStart, seg.srcEnd)
end
local function makeSegKey(seg: ReplaySegment): string
	return tostring(seg.replayName)
		.. "|"
		.. tostring(seg.dstStart)
		.. "|"
		.. tostring(seg.srcStart)
		.. "|"
		.. tostring(seg.srcEnd)
end
local function driveReplaysAtTime(p: Project, t: number, dt: number)
	if not driveReplays then
		return
	end
	ensureLoadedReplayListCache()
	local soloed = anySoloOn(p)
	for layerId = 1, #p.replayLayers do
		local layer = p.replayLayers[layerId]
		local muted = layer.muted == true
		if soloed and layer.solo ~= true then
			muted = true
		end
		local seg = (not muted) and getActiveSegmentForLayerAtTime(p, layerId, t) or nil
		local st = replayState[layerId]
		if not st then
			st = { segKey = "", replayT = 0, lastTimelineT = t }
			replayState[layerId] = st
		end
		if not seg then
			st.segKey = ""
			st.replayT = 0
			st.lastTimelineT = t
			continue
		end
		local idx = getLoadedReplayIndexByName(seg.replayName)
		if not idx then
			st.lastTimelineT = t
			continue
		end
		local replay = Replay.getByIndex(idx)
		if not replay then
			st.lastTimelineT = t
			continue
		end
		local key = makeSegKey(seg)
		local baseT = replayTimeForLayerAtPlayhead(p, layerId, seg, t)
		local frozenNow = gmraFindReplayFreezeAtTime(layer, seg, t) ~= nil
		-- Capture the previous timeline time BEFORE updating, so the cut-key
		-- crossed check can compare old vs new playhead position correctly.
		local prevTimelineT = st.lastTimelineT
		local frozenPrev = gmraFindReplayFreezeAtTime(layer, seg, prevTimelineT) ~= nil
		if st.segKey ~= key then
			st.segKey = key
			st.replayT = baseT
			st.lastTimelineT = t
		else
			if not animating then
				st.replayT = baseT
				st.lastTimelineT = t
			else
				local rs = evalNum(p.tracks.speed, t)
				if rs <= 0 then
					rs = 0.01
				end
				local tl = evalNum(p.tracks.timelineSpeed, st.lastTimelineT)
				if tl <= 0 then
					tl = 0.01
				end
				local expectedDelta = dt * tl
				local actualDelta = t - st.lastTimelineT
				local jumped = math.abs(actualDelta - expectedDelta) > math.max(p.snap * 2, expectedDelta * 2)
				if jumped or frozenNow or (frozenPrev ~= frozenNow) then
					st.replayT = baseT
				else
					st.replayT = st.replayT + dt * rs
				end
				st.lastTimelineT = t
			end
		end
		-- Apply any replay cut keys that the playhead has just crossed for this layer.
		-- Use prevTimelineT (before update) so the comparison is old < cutT <= new.
		local cuts = p.tracks.replayCuts
		local crossedCut = false
		if cuts and #cuts > 0 then
			for ci = 1, #cuts do
				local cut = cuts[ci]
				if cut.replayLayerId == layerId then
					local crossed = (prevTimelineT < cut.t and t >= cut.t)
						or (not animating and math.abs(t - cut.t) < p.snap * 0.5)
					if crossed then
						crossedCut = true
					end
				end
			end
		end
		if crossedCut then
			st.replayT = baseT
		end
		st.replayT = clamp(st.replayT, seg.srcStart, seg.srcEnd)
		pcall(function()
			replay:setPlaybackTimeSeconds(st.replayT)
		end)
		replay.isPlaying = false
	end
end
function sortPOV(keys: { POVKey })
	table.sort(keys, function(a, b)
		return a.t < b.t
	end)
end
function sortReplayCuts(keys: { ReplayCutKey })
	table.sort(keys, function(a, b)
		return a.t < b.t
	end)
end
function sortReplayFreezes(keys: { ReplayFreezeRange })
	table.sort(keys, function(a, b)
		return (a.startT or 0) < (b.startT or 0)
	end)
end
function gmraClampReplayFreezeRange(seg: ReplaySegment, freeze: ReplayFreezeRange, snap: number)
	local segStart = seg.dstStart
	local segEnd = seg.dstStart + math.max(0, seg.srcEnd - seg.srcStart)
	local minWidth = math.max(snap or 0.05, 0.01)
	freeze.startT = alignTo(clamp(freeze.startT, segStart, math.max(segStart, segEnd - minWidth)), snap)
	freeze.endT = alignTo(clamp(freeze.endT, freeze.startT + minWidth, segEnd), snap)
	if freeze.endT < freeze.startT + minWidth then
		freeze.endT = clamp(freeze.startT + minWidth, segStart + minWidth, segEnd)
	end
end
function gmraFindReplayFreezeAtTime(layer: ReplayLayer?, seg: ReplaySegment?, t: number): ReplayFreezeRange?
	if not layer or not seg or not layer.freezes or #layer.freezes == 0 then
		return nil
	end
	local segStart = seg.dstStart
	local segEnd = seg.dstStart + math.max(0, seg.srcEnd - seg.srcStart)
	for i = 1, #layer.freezes do
		local freeze = layer.freezes[i]
		local startT = math.max(segStart, freeze.startT or segStart)
		local endT = math.min(segEnd, freeze.endT or segEnd)
		if endT > startT and t >= startT and t < endT then
			return freeze
		end
	end
	return nil
end
function gmraSetCameraHideNearestHead(enabled: boolean): boolean
	local applied = false
	pcall(function()
		camera.hideNearestHead = enabled
		applied = true
	end)
	return applied
end
function gmraProjectVectorOntoPlane(vec: Vec3, normal: Vec3): Vec3
	local n = vec3Normalize(normal)
	local dot = vec.x * n.x + vec.y * n.y + vec.z * n.z
	return vec3Sub(vec, vec3Mul(n, dot))
end
function gmraGetPOVUpDirection(): Vec3
	local up = Vec3.new(0, 1, 0)
	pcall(function()
		if gravity and gravity.upDirection then
			up = gravity.upDirection
		end
	end)
	return vec3Normalize(up)
end
function gmraWrapAngleDeg(angle: number): number
	while angle > 180 do
		angle -= 360
	end
	while angle < -180 do
		angle += 360
	end
	return angle
end
function gmraGetPOVOrbitMode(k: POVKey): POVOrbitMode
	return (k.orbitMode == "MANUAL") and "MANUAL" or "AUTO"
end
function gmraGetPOVOrbitSettings(k: POVKey)
	local orbitMode = gmraGetPOVOrbitMode(k)
	local orbitRadius = math.max(0, tonumber(k.orbitRadius) or 500)
	local orbitHeight = tonumber(k.orbitHeight) or 0
	local orbitLookAheadDistance = math.max(0, tonumber(k.orbitLookAheadDistance) or 100)
	local orbitSmoothing = clamp(tonumber(k.orbitSmoothing) or 0.15, 0, 1)
	local manualOrbitSmoothingMultiplier = clamp(tonumber(k.manualOrbitSmoothingMultiplier) or 0.2, 0, 1)
	local orbitVelocityThreshold = math.max(0, tonumber(k.orbitVelocityThreshold) or 600)
	local manualOrbitYaw = gmraWrapAngleDeg(tonumber(k.manualOrbitYaw) or 0)
	local manualOrbitPitch = clamp(tonumber(k.manualOrbitPitch) or 0, -89.9, 89.9)
	local manualOrbitAutoSpin = k.manualOrbitAutoSpin == true
	local manualOrbitSpinSpeed = tonumber(k.manualOrbitSpinSpeed) or 45
	return orbitMode,
		orbitRadius,
		orbitHeight,
		orbitLookAheadDistance,
		orbitSmoothing,
		manualOrbitSmoothingMultiplier,
		orbitVelocityThreshold,
		manualOrbitYaw,
		manualOrbitPitch,
		manualOrbitAutoSpin,
		manualOrbitSpinSpeed
end
function gmraGetPOVSelectedManualOrbitKey(p: Project): POVKey?
	if not previewEnabled then
		return nil
	end
	if p.ui.selectedRow ~= "POV" then
		return nil
	end
	local idx = p.ui.selectedKeyIndex
	if idx < 1 or idx > #p.tracks.pov then
		return nil
	end
	local k = p.tracks.pov[idx]
	if not k or k.mode ~= "3P" then
		return nil
	end
	if gmraGetPOVOrbitMode(k) ~= "MANUAL" then
		return nil
	end
	if evalPOV(p, playhead) ~= k then
		return nil
	end
	return k
end
function gmraPOVKeyHeld(key: Key): boolean
	local ok, held = pcall(function()
		return Input.getKey(key)
	end)
	return ok and held == true
end
function gmraGetManualPOVOrbitInputDelta(dt: number): (number, number)
	local yaw = 0
	local pitch = 0
	if gmraPOVKeyHeld(Input.Key.Right) or gmraPOVKeyHeld(Input.Key.D) then
		yaw += 180 * dt
	end
	if gmraPOVKeyHeld(Input.Key.Left) or gmraPOVKeyHeld(Input.Key.A) then
		yaw -= 180 * dt
	end
	if gmraPOVKeyHeld(Input.Key.Up) or gmraPOVKeyHeld(Input.Key.W) then
		pitch += 180 * dt
	end
	if gmraPOVKeyHeld(Input.Key.Down) or gmraPOVKeyHeld(Input.Key.S) then
		pitch -= 180 * dt
	end
	return yaw, pitch
end
function gmraUpdateManualPOVOrbitInput(p: Project, dt: number)
	local k = gmraGetPOVSelectedManualOrbitKey(p)
	if not k then
		GMRA_POV_MANUAL_ORBIT_INPUT_ACTIVE = false
		return
	end
	local yawDelta, pitchDelta = gmraGetManualPOVOrbitInputDelta(dt)
	local active = math.abs(yawDelta) > 1e-6 or math.abs(pitchDelta) > 1e-6
	if not active then
		GMRA_POV_MANUAL_ORBIT_INPUT_ACTIVE = false
		return
	end
	if not GMRA_POV_MANUAL_ORBIT_INPUT_ACTIVE then
		pushUndoOnce(p)
	end
	GMRA_POV_MANUAL_ORBIT_INPUT_ACTIVE = true
	k.manualOrbitYaw = gmraWrapAngleDeg((tonumber(k.manualOrbitYaw) or 0) + yawDelta)
	k.manualOrbitPitch = clamp((tonumber(k.manualOrbitPitch) or 0) + pitchDelta, -89.9, 89.9)
end
function applyPOV(p: Project, t: number): boolean
	povAppliedThisFrame = false
	gmraSetCameraHideNearestHead(false)
	local pov = evalPOV(p, t)
	if not pov then
		return false
	end
	if pov.mode == "OUT" then
		return false
	end
	local seg = getActiveSegmentForLayerAtTime(p, pov.replayLayerId, t)
	if not seg then
		return false
	end
	local frame = getReplayFrameByName(seg.replayName)
	if not frame then
		return false
	end
	local plr = frame:getPlayerById(pov.playerId)
	if not plr then
		return false
	end
	local headXform = plr.head
	if not headXform then
		return false
	end
	if pov.mode == "1P" then
		camera.positionSmoothing = 0
		camera.rotationSmoothing = 0
		camera.position = headXform.position
		camera.rotation = headXform.rotation
		local nc = clamp(pov.nearClip or 0.03, 0, 1000)
		local hideNearestHead = (pov.hideNearestHead == nil) and (p.ui.hideNearestHead == true)
			or (pov.hideNearestHead == true)
		if hideNearestHead then
			gmraSetCameraHideNearestHead(true)
		end
		camera.nearClippingPlane = nc
		povAppliedThisFrame = true
		return true
	end
	local upDir = gmraGetPOVUpDirection()
	local orbitMode, orbitRadius, orbitHeight, orbitLookAheadDistance, orbitSmoothing, manualOrbitSmoothingMultiplier, orbitVelocityThreshold, manualOrbitYaw, manualOrbitPitch, manualOrbitAutoSpin, manualOrbitSpinSpeed =
		gmraGetPOVOrbitSettings(pov)
	local headForward = Vec3.new(0, 0, 1)
	local okF, fv = pcall(function()
		return headXform.rotation:getForwardVector()
	end)
	if okF and fv then
		headForward = vec3Normalize(fv)
	end
	local lookTarget = vec3Add(headXform.position, vec3Mul(headForward, orbitLookAheadDistance))
	local cameraDirection = vec3Mul(headForward, -1)
	local lookAtTarget = lookTarget
	if orbitMode == "AUTO" then
		camera.positionSmoothing = orbitSmoothing
		camera.rotationSmoothing = orbitSmoothing
		local targetVelocity = plr.velocity
		if targetVelocity and vec3Len(targetVelocity) > orbitVelocityThreshold then
			cameraDirection = vec3Mul(vec3Normalize(targetVelocity), -1)
		end
		cameraDirection = gmraProjectVectorOntoPlane(cameraDirection, upDir)
		if vec3Len(cameraDirection) <= 1e-5 then
			cameraDirection = vec3Mul(headForward, -1)
			cameraDirection = gmraProjectVectorOntoPlane(cameraDirection, upDir)
		end
		cameraDirection = vec3Normalize(cameraDirection)
		if vec3Len(cameraDirection) <= 1e-5 then
			cameraDirection = Vec3.new(1, 0, 0)
		end
	else
		camera.positionSmoothing = orbitSmoothing * manualOrbitSmoothingMultiplier
		camera.rotationSmoothing = orbitSmoothing * manualOrbitSmoothingMultiplier
		local behindDir = gmraProjectVectorOntoPlane(vec3Mul(headForward, -1), upDir)
		behindDir = vec3Normalize(behindDir)
		if vec3Len(behindDir) <= 1e-5 then
			behindDir = Vec3.new(0, 0, -1)
		end
		local rightDir = vec3Normalize(vec3Cross(behindDir, upDir))
		if vec3Len(rightDir) <= 1e-5 then
			rightDir = vec3Normalize(vec3Cross(behindDir, Vec3.new(0, 1, 0)))
		end
		if vec3Len(rightDir) <= 1e-5 then
			rightDir = Vec3.new(1, 0, 0)
		end
		local spinYaw = manualOrbitYaw
		if manualOrbitAutoSpin then
			spinYaw = gmraWrapAngleDeg(spinYaw + math.max(0, t - pov.t) * manualOrbitSpinSpeed)
		end
		local yawRad = math.rad(spinYaw)
		local pitchRad = math.rad(manualOrbitPitch)
		local horizontal = vec3Add(vec3Mul(behindDir, math.cos(yawRad)), vec3Mul(rightDir, math.sin(yawRad)))
		horizontal = vec3Normalize(horizontal)
		if vec3Len(horizontal) <= 1e-5 then
			horizontal = behindDir
		end
		cameraDirection = vec3Add(vec3Mul(horizontal, math.cos(pitchRad)), vec3Mul(upDir, math.sin(pitchRad)))
		cameraDirection = vec3Normalize(cameraDirection)
		if vec3Len(cameraDirection) <= 1e-5 then
			cameraDirection = behindDir
		end
		lookAtTarget = headXform.position
	end
	local rayEnd =
		vec3Add(headXform.position, vec3Add(vec3Mul(cameraDirection, orbitRadius), vec3Mul(upDir, orbitHeight)))
	local castOk, hit = pcall(function()
		return camera:castRay(headXform.position, rayEnd)
	end)
	if castOk and hit and hit.successful and hit.position then
		rayEnd = vec3Mul(vec3Add(hit.position, headXform.position), 0.5)
	end
	camera.position = rayEnd
	local looked = false
	pcall(function()
		camera:lookAt(lookAtTarget, upDir)
		looked = true
	end)
	if not looked then
		local rootXform = plr.root
		camera.rotation = (rootXform and rootXform.rotation) or headXform.rotation
	end
	camera.nearClippingPlane = 0.03
	povAppliedThisFrame = true
	return true
end
local function evalAndApplyCamera(p: Project, t: number)
	if debugPreviewApplyPosition then
		camera.position = evalVec3Curved(p, t)
	end
	if debugPreviewApplyRotation then
		camera.rotation = gmraEvalQuatSafe(p.tracks.rotation, t, camera.rotation)
	end
	camera.fieldOfView = evalNum(p.tracks.fov, t)
	pcall(function()
		postProcessSettings.depthOfFieldFstop = evalNum(p.tracks.dofFstop, t)
		postProcessSettings.depthOfFieldFocalDistance = evalNum(p.tracks.dofFocalDistance, t)
		postProcessSettings.depthOfFieldSensorWidth = evalNum(p.tracks.dofSensorWidth, t)
	end)
	applyPOV(p, t)
end
function quatForward(q: Quat): Vec3
	local okF, fv = pcall(function()
		return q:getForwardVector()
	end)
	if okF and fv then
		return vec3Normalize(fv)
	end
	return Vec3.new(0, 0, 1)
end
function quatUp(q: Quat, fwd: Vec3): Vec3
	local okU, uv = pcall(function()
		return q:getUpVector()
	end)
	if okU and uv then
		local up = vec3Normalize(uv)
		if vec3Len(up) > 1e-5 then
			return up
		end
	end
	local worldUp = Vec3.new(0, 1, 0)
	local right = vec3Normalize(vec3Cross(fwd, worldUp))
	if vec3Len(right) <= 1e-5 then
		right = vec3Normalize(vec3Cross(fwd, Vec3.new(1, 0, 0)))
	end
	local up = vec3Normalize(vec3Cross(right, fwd))
	if vec3Len(up) <= 1e-5 then
		return Vec3.new(0, 1, 0)
	end
	return up
end
function quatRight(q: Quat, fwd: Vec3, up: Vec3): Vec3
	local okR, rv = pcall(function()
		return q:getRightVector()
	end)
	if okR and rv then
		local r = vec3Normalize(rv)
		if vec3Len(r) > 1e-5 then
			return r
		end
	end
	local right = vec3Normalize(vec3Cross(fwd, up))
	if vec3Len(right) <= 1e-5 then
		right = vec3Normalize(vec3Cross(fwd, Vec3.new(0, 1, 0)))
	end
	if vec3Len(right) <= 1e-5 then
		return Vec3.new(1, 0, 0)
	end
	return right
end
function drawGhostFrustumAt(
	pos: Vec3,
	rot: Quat,
	fovDeg: number,
	length: number,
	aspect: number,
	r: number,
	g: number,
	b: number,
	thickness: number
)
	local fwd = quatForward(rot)
	local up = quatUp(rot, fwd)
	local right = quatRight(rot, fwd, up)
	up = vec3Normalize(vec3Cross(right, fwd))
	local clampedLen = math.max(5, length)
	local clampedAspect = clamp(aspect, 0.25, 4)
	local vfov = math.rad(clamp(fovDeg, 1, 179))
	local halfH = math.tan(vfov * 0.5) * clampedLen
	local halfW = halfH * clampedAspect
	local center = pos + (fwd * clampedLen)
	local top = up * halfH
	local side = right * halfW
	local tl = center + top - side
	local tr = center + top + side
	local bl = center - top - side
	local br = center - top + side
	WorldDraw.drawLine(pos, tl, r, g, b, thickness, 0)
	WorldDraw.drawLine(pos, tr, r, g, b, thickness, 0)
	WorldDraw.drawLine(pos, bl, r, g, b, thickness, 0)
	WorldDraw.drawLine(pos, br, r, g, b, thickness, 0)
	WorldDraw.drawLine(tl, tr, r, g, b, thickness, 0)
	WorldDraw.drawLine(tr, br, r, g, b, thickness, 0)
	WorldDraw.drawLine(br, bl, r, g, b, thickness, 0)
	WorldDraw.drawLine(bl, tl, r, g, b, thickness, 0)
end
local function drawPath(p: Project)
	if recordingModeProfile then
		WorldDraw.clear()
		return
	end
	local wantsPath = showPath == true
	local wantsLook = showLookDirection == true
	local wantsGhost = showGhostFrustum == true
	if not wantsPath and not wantsLook and not wantsGhost then
		WorldDraw.clear()
		return
	end
	WorldDraw.clear()
	local startT = p.timelineStart
	local endT = p.timelineEnd
	local dt = 1 / math.max(1, samplesPerSecond)
	if wantsPath and showPathDots then
		for _, k in ipairs(p.tracks.position) do
			WorldDraw.drawPoint(k.v, 1, 1, 0, pathPointSize, 0)
		end
	end
	local t = startT + dt
	if wantsPath and showPathRawLine then
		local lastRaw = evalVec3(p.tracks.position, startT)
		t = startT + dt
		while t <= endT do
			local raw = evalVec3(p.tracks.position, t)
			WorldDraw.drawLine(lastRaw, raw, 0.2, 0.6, 1.0, pathLineThickness, 0)
			lastRaw = raw
			t += dt
		end
	end
	if wantsPath and showPathSmoothedLine then
		local lastSm = evalVec3Curved(p, startT)
		t = startT + dt
		while t <= endT do
			local sm = evalVec3Curved(p, t)
			WorldDraw.drawLine(lastSm, sm, 0.2, 1.0, 0.3, pathLineThickness, 0)
			lastSm = sm
			t += dt
		end
	end
	if wantsLook then
		local lookStep = dt * 4
		local lookThickness = math.max(1, pathLineThickness * 0.4)
		t = startT
		while t <= endT do
			local lookPos = evalVec3Curved(p, t)
			local lookRot = gmraEvalQuatSafe(p.tracks.rotation, t, camera.rotation)
			local lookFwd = Vec3.new(0, 0, 1)
			local okF, fv = pcall(function()
				return lookRot:getForwardVector()
			end)
			if okF and fv then
				lookFwd = fv
			end
			WorldDraw.drawLine(lookPos, lookPos + (lookFwd * lookRayLength), 1.0, 0.65, 0.2, lookThickness, 0)
			t += lookStep
		end
	end
	if wantsGhost then
		local frustumThickness = math.max(1, pathLineThickness * 0.22)
		if showGhostFrustumAlongPath then
			local step = math.max(0.05, ghostFrustumStepSeconds)
			local maxCount = 300
			local count = 0
			local ft = startT
			while ft <= endT and count < maxCount do
				local pos = evalVec3Curved(p, ft)
				local rot = gmraEvalQuatSafe(p.tracks.rotation, ft, camera.rotation)
				local fov = evalNum(p.tracks.fov, ft)
				drawGhostFrustumAt(
					pos,
					rot,
					fov,
					ghostFrustumLength,
					ghostFrustumAspect,
					1.0,
					0.45,
					0.1,
					frustumThickness
				)
				ft += step
				count += 1
			end
		else
			local pos = evalVec3Curved(p, playhead)
			local rot = gmraEvalQuatSafe(p.tracks.rotation, playhead, camera.rotation)
			local fov = evalNum(p.tracks.fov, playhead)
			drawGhostFrustumAt(
				pos,
				rot,
				fov,
				ghostFrustumLength,
				ghostFrustumAspect,
				1.0,
				0.7,
				0.2,
				frustumThickness + 0.5
			)
		end
	end
	if wantsPath and showPathDots then
		local red = evalVec3Curved(p, playhead)
		WorldDraw.drawPoint(red, 1, 0, 0, pathPointSize * 1.4, 0)
	end
end
local function cloneNumKeys(keys)
	local out = {}
	for i = 1, #(keys or {}) do
		local k = keys[i]
		out[i] = { t = k.t, v = k.v, interp = k.interp }
	end
	return out
end
local function upgradeProject(p: Project)
	p.ui = p.ui
		or {
			zoom = 1,
			scroll = 0,
			rangeStart = 0,
			rangeEnd = 5,
			scrollSpeed = 1,
			selectedRow = "",
			selectedKeyIndex = -1,
			selectedReplayLayerId = 1,
			masterReplayName = "",
		}
	p.ui.useQuatInterp = (p.ui.useQuatInterp == nil) and true or p.ui.useQuatInterp
	p.ui.globalSmoothing = p.ui.globalSmoothing or 0
	p.ui.posSmoothing = p.ui.posSmoothing or 0
	p.ui.rotSmoothing = p.ui.rotSmoothing or 0
	p.ui.advancedSmoothing = (p.ui.advancedSmoothing == nil) and true or p.ui.advancedSmoothing
	p.ui.posTimingCarry = (p.ui.posTimingCarry == nil) and 1 or p.ui.posTimingCarry
	p.ui.posBlendPower = (p.ui.posBlendPower == nil) and 2 or p.ui.posBlendPower
	p.ui.posKeyflow = (p.ui.posKeyflow == nil) and 0.55 or p.ui.posKeyflow
	p.ui.posMidBiasPower = (p.ui.posMidBiasPower == nil) and 1 or p.ui.posMidBiasPower
	p.ui.posTangentStrength = (p.ui.posTangentStrength == nil) and 1 or p.ui.posTangentStrength
	p.ui.posTangentClamp = (p.ui.posTangentClamp == nil) and 2.5 or p.ui.posTangentClamp
	p.ui.posOvershootGuard = (p.ui.posOvershootGuard == nil) and 0.45 or p.ui.posOvershootGuard
	p.ui.rotCarryFloor = (p.ui.rotCarryFloor == nil) and 0.82 or p.ui.rotCarryFloor
	p.ui.rotEasePower = (p.ui.rotEasePower == nil) and 1 or p.ui.rotEasePower
	p.ui.rotSmoothStrength = (p.ui.rotSmoothStrength == nil) and 1 or p.ui.rotSmoothStrength
	p.ui.rotLinearMix = (p.ui.rotLinearMix == nil) and 0.3 or p.ui.rotLinearMix
	p.ui.rotKeyflow = (p.ui.rotKeyflow == nil) and 0.85 or p.ui.rotKeyflow
	p.ui.rotMidBiasPower = (p.ui.rotMidBiasPower == nil) and 1 or p.ui.rotMidBiasPower
	p.ui.zoom = p.ui.zoom or 1
	p.ui.scroll = p.ui.scroll or 0
	p.ui.rangeStart = p.ui.rangeStart or p.timelineStart or 0
	p.ui.rangeEnd = p.ui.rangeEnd or math.min((p.ui.rangeStart or 0) + 5, p.timelineEnd or 20)
	p.ui.scrollSpeed = p.ui.scrollSpeed or 1
	p.ui.selectedRow = p.ui.selectedRow or ""
	p.ui.selectedKeyIndex = p.ui.selectedKeyIndex or -1
	p.ui.selectedReplayLayerId = p.ui.selectedReplayLayerId or 1
	p.ui.masterReplayName = p.ui.masterReplayName or ""
	p.snap = p.snap or 0.05
	p.timelineStart = p.timelineStart or 0
	p.timelineEnd = p.timelineEnd or (p.timelineStart + 20)
	p.replayLayers = p.replayLayers or { { name = "Replay Layer 1", muted = false, solo = false, segments = {}, freezes = {} } }
	p.tracks = p.tracks
		or {
			position = {},
			rotation = {},
			fov = {},
			dofFstop = {},
			dofFocalDistance = {},
			dofSensorWidth = {},
			speed = {},
			timelineSpeed = {},
			pov = {},
		}
	p.tracks.position = p.tracks.position or {}
	p.tracks.rotation = p.tracks.rotation or {}
	p.tracks.fov = p.tracks.fov or { { t = 0, v = 90, interp = "smooth" } }
	p.tracks.dofFstop = p.tracks.dofFstop or { { t = 0, v = 0, interp = "smooth" } }
	p.tracks.dofFocalDistance = p.tracks.dofFocalDistance or { { t = 0, v = 0, interp = "smooth" } }
	p.tracks.dofSensorWidth = p.tracks.dofSensorWidth or { { t = 0, v = 0, interp = "smooth" } }
	p.tracks.speed = p.tracks.speed or { { t = 0, v = 1, interp = "smooth" } }
	p.tracks.timelineSpeed = p.tracks.timelineSpeed or { { t = 0, v = 1, interp = "smooth" } }
	if p.tracks.timelineSpeed == p.tracks.speed then
		local tl = cloneNumKeys(p.tracks.timelineSpeed)
		if #tl == 0 then
			tl = { { t = 0, v = 1, interp = "smooth" } }
		end
		p.tracks.timelineSpeed = tl
	end
	p.tracks.pov = p.tracks.pov or {}
	p.tracks.replayCuts = p.tracks.replayCuts or {}
	for i = 1, #p.replayLayers do
		local layer = p.replayLayers[i]
		layer.segments = layer.segments or {}
		layer.freezes = layer.freezes or {}
		table.sort(layer.freezes, function(a, b)
			return (a.startT or 0) < (b.startT or 0)
		end)
	end
	sortKeysByT(p.tracks.position)
	sortRotationKeys(p.tracks.rotation)
	sortKeysByT(p.tracks.fov)
	sortKeysByT(p.tracks.dofFstop)
	sortKeysByT(p.tracks.dofFocalDistance)
	sortKeysByT(p.tracks.dofSensorWidth)
	sortKeysByT(p.tracks.speed)
	sortKeysByT(p.tracks.timelineSpeed)
	sortKeysByT(p.tracks.pov)
	sortReplayCuts(p.tracks.replayCuts or {})
	p.ui.selectedReplayLayerId = clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers)
	p.ui.rangeStart = clamp(p.ui.rangeStart, p.timelineStart, p.timelineEnd)
	p.ui.rangeEnd = clamp(p.ui.rangeEnd, p.ui.rangeStart + 0.1, p.timelineEnd)
	p.ui.povNearClip = p.ui.povNearClip or 0.03
	p.ui.hideNearestHead = (p.ui.hideNearestHead == nil) and false or p.ui.hideNearestHead
	p.ui.headHideOffset = (p.ui.headHideOffset == nil) and 4 or p.ui.headHideOffset
	p.ui.headHideNearClip = (p.ui.headHideNearClip == nil) and 2 or p.ui.headHideNearClip
end
local function makeEmptyProject(name: string): Project
	local p: Project = {
		projectName = name,
		createdAt = nowSeconds(),
		updatedAt = nowSeconds(),
		timelineStart = 0,
		timelineEnd = 20,
		snap = 0.05,
		replayLayers = {
			{ name = "Replay Layer 1", muted = false, solo = false, segments = {}, freezes = {} },
		},
		tracks = {
			position = {},
			rotation = {},
			fov = { { t = 0, v = 90, interp = "smooth" } },
			dofFstop = { { t = 0, v = 0, interp = "smooth" } },
			dofFocalDistance = { { t = 0, v = 0, interp = "smooth" } },
			dofSensorWidth = { { t = 0, v = 0, interp = "smooth" } },
			speed = { { t = 0, v = 1, interp = "smooth" } },
			timelineSpeed = { { t = 0, v = 1, interp = "smooth" } },
			pov = {},
			replayCuts = {},
		},
		ui = {
			useQuatInterp = true,
			globalSmoothing = 0,
			posSmoothing = 0,
			rotSmoothing = 0,
			advancedSmoothing = true,
			posTimingCarry = 1,
			posBlendPower = 2,
			posKeyflow = 0.55,
			posMidBiasPower = 1,
			posTangentStrength = 1,
			posTangentClamp = 2.5,
			posOvershootGuard = 0.45,
			rotCarryFloor = 0.82,
			rotEasePower = 1,
			rotSmoothStrength = 1,
			rotLinearMix = 0.3,
			rotKeyflow = 0.85,
			rotMidBiasPower = 1,
			zoom = 1,
			scroll = 0,
			rangeStart = 0,
			rangeEnd = 5,
			scrollSpeed = 1,
			selectedRow = "",
			selectedKeyIndex = -1,
			selectedReplayLayerId = 1,
			masterReplayName = "",
			povNearClip = 0.03,
			hideNearestHead = false,
			headHideOffset = 4,
			headHideNearClip = 2,
		},
	}
	return p
end
function saveProject(p: Project)
	p.updatedAt = nowSeconds()
	config.projects[p.projectName] = p
	config.lastProject = p.projectName
	safeSaveConfig()
end
function loadProjectByName(name: string)
	local p = config.projects[name]
	if p then
		upgradeProject(p)
		project = p
		projectNameInput = name
		playhead = p.timelineStart
	end
end
local function writePositionKey(p: Project, t: number)
	t = alignTo(t, p.snap)
	table.insert(p.tracks.position, {
		t = t,
		v = Vec3.new(camera.position.x, camera.position.y, camera.position.z),
		interp = "smooth",
	})
	sortKeysByT(p.tracks.position)
end
local function upsertQuatKey(keys: { QuatKey }, t: number, v: Quat, interp: InterpMode)
	for i = 1, #keys do
		local k = keys[i]
		if math.abs(k.t - t) <= 1e-6 then
			k.v = quatNormalize(v)
			k.interp = interp
			sortRotationKeys(keys)
			return
		end
	end
	table.insert(keys, { t = t, v = quatNormalize(v), interp = interp })
	sortRotationKeys(keys)
end
local function writeRotationKey(p: Project, t: number)
	t = alignTo(t, p.snap)
	upsertQuatKey(
		p.tracks.rotation,
		t,
		Quat.new(camera.rotation.x, camera.rotation.y, camera.rotation.z, camera.rotation.w),
		"smooth"
	)
end
local function writeFovKey(p: Project, t: number)
	t = alignTo(t, p.snap)
	table.insert(p.tracks.fov, { t = t, v = camera.fieldOfView, interp = "smooth" })
	sortKeysByT(p.tracks.fov)
end
function gmraReadCurrentDOF()
	local fstop = 0
	local focalDistance = 0
	local sensorWidth = 0
	pcall(function()
		fstop = tonumber(postProcessSettings.depthOfFieldFstop) or 0
		focalDistance = tonumber(postProcessSettings.depthOfFieldFocalDistance) or 0
		sensorWidth = tonumber(postProcessSettings.depthOfFieldSensorWidth) or 0
	end)
	return fstop, focalDistance, sensorWidth
end
function writeDOFKeys(p: Project, t: number, fstop: number, focalDistance: number, sensorWidth: number)
	t = alignTo(t, p.snap)
	upsertNumKey(p.tracks.dofFstop, t, math.max(0, fstop), "smooth")
	upsertNumKey(p.tracks.dofFocalDistance, t, math.max(0, focalDistance), "smooth")
	upsertNumKey(p.tracks.dofSensorWidth, t, math.max(0, sensorWidth), "smooth")
end
local function writeSpeedKey(p: Project, t: number, v: number)
	t = alignTo(t, p.snap)
	upsertNumKey(p.tracks.speed, t, v, "smooth")
end
function writeReplayCutKey(p: Project, t: number, layerId: number, srcJumpT: number)
	t = alignTo(t, p.snap)
	local cuts = p.tracks.replayCuts or {}
	p.tracks.replayCuts = cuts
	-- Replace existing key at same time if present
	for i = 1, #cuts do
		if feq(cuts[i].t, t, 1e-6) then
			cuts[i].replayLayerId = layerId
			cuts[i].srcJumpT = srcJumpT
			sortKeysByT(cuts)
			return
		end
	end
	table.insert(cuts, { t = t, replayLayerId = layerId, srcJumpT = srcJumpT })
	sortKeysByT(cuts)
end
function gmraAddReplayFreeze(layer: ReplayLayer, seg: ReplaySegment, startT: number, endT: number, snap: number)
	layer.freezes = layer.freezes or {}
	local freeze: ReplayFreezeRange = { startT = startT, endT = endT }
	gmraClampReplayFreezeRange(seg, freeze, snap)
	table.insert(layer.freezes, freeze)
	sortReplayFreezes(layer.freezes)
end
function writePOVKey(
	p: Project,
	t: number,
	playerId: number,
	modeIndex: number,
	replayLayerId: number,
	nearClip: number,
	hideNearestHead: boolean?,
	orbitMode: POVOrbitMode?,
	orbitRadius: number?,
	orbitHeight: number?,
	orbitLookAheadDistance: number?,
	orbitSmoothing: number?,
	manualOrbitSmoothingMultiplier: number?,
	orbitVelocityThreshold: number?,
	manualOrbitYaw: number?,
	manualOrbitPitch: number?,
	manualOrbitAutoSpin: boolean?,
	manualOrbitSpinSpeed: number?
)
	t = alignTo(t, p.snap)
	local s = povModeStrings[modeIndex] or "1P"
	local povMode: POVMode = (s == "3P" and "3P") or (s == "OUT" and "OUT") or "1P"
	table.insert(p.tracks.pov, {
		t = t,
		replayLayerId = replayLayerId,
		playerId = playerId,
		mode = povMode,
		nearClip = clamp(nearClip, 0, 100),
		hideNearestHead = hideNearestHead == true,
		orbitMode = orbitMode or "AUTO",
		orbitRadius = orbitRadius,
		orbitHeight = orbitHeight,
		orbitLookAheadDistance = orbitLookAheadDistance,
		orbitSmoothing = orbitSmoothing,
		manualOrbitSmoothingMultiplier = manualOrbitSmoothingMultiplier,
		orbitVelocityThreshold = orbitVelocityThreshold,
		manualOrbitYaw = manualOrbitYaw,
		manualOrbitPitch = manualOrbitPitch,
		manualOrbitAutoSpin = manualOrbitAutoSpin == true,
		manualOrbitSpinSpeed = manualOrbitSpinSpeed,
		interp = "cut",
	})
	sortPOV(p.tracks.pov)
end
function bindLayerToLoadedReplay(p: Project, layerId: number, replayName: string)
	local layer = p.replayLayers[layerId]
	if not layer then
		return
	end
	local idx = getLoadedReplayIndexByName(replayName)
	if not idx then
		return
	end
	local dur = getLoadedReplayDurationIfAvailable(replayName)
	if not dur then
		dur = 20
	end
	clearArray(layer.segments)
	layer.freezes = {}
	table.insert(layer.segments, {
		replayName = replayName,
		dstStart = p.timelineStart,
		srcStart = 0,
		srcEnd = dur,
		playbackHz = 0,
	})
	p.timelineEnd = math.max(p.timelineEnd, p.timelineStart + dur)
	p.ui.masterReplayName = replayName
	replayPickedDuration = dur
	p.ui.rangeStart = clamp(p.ui.rangeStart, p.timelineStart, p.timelineEnd)
	p.ui.rangeEnd = clamp(p.ui.rangeEnd, p.ui.rangeStart + 0.1, p.timelineEnd)
end
function removeReplayLayer(p: Project, layerId: number)
	if #p.replayLayers <= 1 then
		return
	end
	if layerId < 1 or layerId > #p.replayLayers then
		return
	end
	table.remove(p.replayLayers, layerId)
	p.ui.selectedReplayLayerId = clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers)
end
function getAllPlayers(): { BasicPlayer }
	local playerList: { BasicPlayer } = {}
	local frames = getAllGameData()
	for i = 1, #frames do
		local players = frames[i].players
		for j = 1, #players do
			table.insert(playerList, { playerId = players[j].playerId, frameIndex = i })
		end
	end
	return playerList
end
function getPlayer(basicPlayer: BasicPlayer?): ReplayPlayer?
	if basicPlayer == nil then
		return nil
	end
	local frames = getAllGameData()
	if basicPlayer.frameIndex <= #frames then
		local frame = frames[basicPlayer.frameIndex]
		return frame:getPlayerById(basicPlayer.playerId)
	end
	return nil
end
local function pointsFromKeys(keys): { Vec2 }
	local pts: { Vec2 } = {}
	for i = 1, #keys do
		pts[i] = Vec2.new(keys[i].t, 0)
	end
	return pts
end
local function applyTimesFromPointsSelected(keys, pts: { Vec2 }, selectedIdxs: { number }, snap: number)
	for _, idx in ipairs(selectedIdxs) do
		if keys[idx] and pts[idx] then
			keys[idx].t = alignTo(pts[idx].x, snap)
		end
	end
end
local function applyTimesFromPoints(keys, pts: { Vec2 }, snap: number)
	local n = math.min(#keys, #pts)
	for i = 1, n do
		keys[i].t = alignTo(pts[i].x, snap)
	end
end
function keyDownSafe(key: Key): boolean
	local ok, down = pcall(function()
		return Input.getKeyDown(key)
	end)
	return ok and down == true
end
function keyHeldSafe(key: Key): boolean
	local ok, held = pcall(function()
		return Input.getKey(key)
	end)
	return ok and held == true
end
function gmraGetInputKeyByName(keyName: string)
	if type(keyName) ~= "string" or keyName == "" then
		return nil
	end
	local ok, key = pcall(function()
		return Input.Key[keyName]
	end)
	if ok then
		return key
	end
	return nil
end
function gmraIsModifierKeyName(keyName: string): boolean
	return GMRA_MODIFIER_KEY_NAMES[keyName] == true
end
function gmraGetActionKeybind(actionId: string)
	gmraEnsureKeybindDefaults()
	local def = gmraFindKeybindDef(actionId)
	local cur = config.keybinds[actionId]
	if not def or type(cur) ~= "table" then
		return nil
	end
	return cur
end
function gmraSetActionKeybind(actionId: string, keyName: string, ctrl: boolean, alt: boolean, shift: boolean)
	gmraEnsureKeybindDefaults()
	config.keybinds[actionId] = {
		key = keyName,
		ctrl = ctrl == true,
		alt = alt == true,
		shift = shift == true,
	}
	safeSaveConfig()
end
function gmraFormatKeybind(binding): string
	if type(binding) ~= "table" or type(binding.key) ~= "string" or binding.key == "" then
		return "(none)"
	end
	if gmraIsModifierKeyName(binding.key) then
		return binding.key
	end
	local parts = {}
	if binding.ctrl == true then
		table.insert(parts, "Ctrl")
	end
	if binding.alt == true then
		table.insert(parts, "Alt")
	end
	if binding.shift == true then
		table.insert(parts, "Shift")
	end
	table.insert(parts, binding.key)
	return table.concat(parts, " + ")
end
function gmraActionPressed(actionId: string): boolean
	if GMRA_KEYBIND_CAPTURE_ACTION ~= "" then
		return false
	end
	local binding = gmraGetActionKeybind(actionId)
	if type(binding) ~= "table" then
		return false
	end
	local key = gmraGetInputKeyByName(binding.key)
	if not key or not keyDownSafe(key) then
		return false
	end
	if binding.ctrl == true and not (keyHeldSafe(Input.Key.LeftControl) or keyHeldSafe(Input.Key.RightControl)) then
		return false
	end
	if binding.alt == true and not (keyHeldSafe(Input.Key.LeftAlt) or keyHeldSafe(Input.Key.RightAlt)) then
		return false
	end
	if binding.shift == true and not (keyHeldSafe(Input.Key.LeftShift) or keyHeldSafe(Input.Key.RightShift)) then
		return false
	end
	return true
end
function gmraActionHeld(actionId: string): boolean
	if GMRA_KEYBIND_CAPTURE_ACTION ~= "" then
		return false
	end
	local binding = gmraGetActionKeybind(actionId)
	if type(binding) ~= "table" then
		return false
	end
	local key = gmraGetInputKeyByName(binding.key)
	if not key or not keyHeldSafe(key) then
		return false
	end
	if binding.ctrl == true and not (keyHeldSafe(Input.Key.LeftControl) or keyHeldSafe(Input.Key.RightControl)) then
		return false
	end
	if binding.alt == true and not (keyHeldSafe(Input.Key.LeftAlt) or keyHeldSafe(Input.Key.RightAlt)) then
		return false
	end
	if binding.shift == true and not (keyHeldSafe(Input.Key.LeftShift) or keyHeldSafe(Input.Key.RightShift)) then
		return false
	end
	return true
end
function gmraShiftHeld(): boolean
	return keyHeldSafe(Input.Key.LeftShift) or keyHeldSafe(Input.Key.RightShift)
end
function gmraUpdateKeybindCapture()
	if GMRA_KEYBIND_CAPTURE_ACTION == "" then
		return
	end
	if not GMRA_KEYBIND_CAPTURE_PRIMED then
		if
			keyHeldSafe(Input.Key.LeftMouseButton)
			or keyHeldSafe(Input.Key.RightMouseButton)
			or keyHeldSafe(Input.Key.MiddleMouseButton)
		then
			return
		end
		GMRA_KEYBIND_CAPTURE_PRIMED = true
	end
	for i = 1, #GMRA_KEYBOARD_KEYS do
		local keyName = GMRA_KEYBOARD_KEYS[i]
		local key = gmraGetInputKeyByName(keyName)
		if key and keyDownSafe(key) then
			if keyName == "Escape" then
				gmraSetActionKeybind(GMRA_KEYBIND_CAPTURE_ACTION, "", false, false, false)
			else
				local ctrl = false
				local alt = false
				local shift = false
				if not gmraIsModifierKeyName(keyName) then
					ctrl = keyHeldSafe(Input.Key.LeftControl) or keyHeldSafe(Input.Key.RightControl)
					alt = keyHeldSafe(Input.Key.LeftAlt) or keyHeldSafe(Input.Key.RightAlt)
					shift = keyHeldSafe(Input.Key.LeftShift) or keyHeldSafe(Input.Key.RightShift)
				end
				gmraSetActionKeybind(GMRA_KEYBIND_CAPTURE_ACTION, keyName, ctrl, alt, shift)
			end
			GMRA_KEYBIND_CAPTURE_ACTION = ""
			GMRA_KEYBIND_CAPTURE_PRIMED = false
			return
		end
	end
end
function gmraDrawKeybindSettings(showHeader: boolean?)
	gmraEnsureKeybindDefaults()
	local shouldDraw = true
	if showHeader ~= false then
		shouldDraw = Gui.collapsingHeader("Keybinds##cfgKeybinds")
	end
	if shouldDraw then
		gmraIndentBlock()
		Gui.text("Click a hotkey to rebind. Press Escape to clear.")
		if Gui.beginTable("GMRAKeyboardControls", 3) then
			Gui.tableSetupColumn("Name")
			Gui.tableSetupColumn("Description")
			Gui.tableSetupColumn("Hotkey")
			Gui.tableHeadersRow()
			for i = 1, #GMRA_KEYBIND_DEFS do
				local def = GMRA_KEYBIND_DEFS[i]
				local binding = gmraGetActionKeybind(def.id)
				Gui.tableNextRow()
				Gui.tableNextColumn()
				Gui.text(def.name)
				Gui.tableNextColumn()
				Gui.text(def.description)
				Gui.tableNextColumn()
				local buttonLabel = gmraFormatKeybind(binding)
				if GMRA_KEYBIND_CAPTURE_ACTION == def.id then
					buttonLabel = "..."
				end
				if Gui.button(buttonLabel .. "##gmraKeybind_" .. def.id) then
					if GMRA_KEYBIND_CAPTURE_ACTION == def.id then
						GMRA_KEYBIND_CAPTURE_ACTION = ""
						GMRA_KEYBIND_CAPTURE_PRIMED = false
					else
						GMRA_KEYBIND_CAPTURE_ACTION = def.id
						GMRA_KEYBIND_CAPTURE_PRIMED = false
					end
				end
			end
			Gui.endTable()
		end
		gmraUnindentBlock()
	end
end
function spacePressed(): boolean
	return gmraActionPressed("togglePlayPause")
end
function stepPrevPressed(): boolean
	return gmraActionPressed("stepPrevKeyframe")
end
function stepNextPressed(): boolean
	return gmraActionPressed("stepNextKeyframe")
end
function stepPrevHeld(): boolean
	return gmraActionHeld("stepPrevKeyframe")
end
function stepNextHeld(): boolean
	return gmraActionHeld("stepNextKeyframe")
end
function deletePressed(): boolean
	return gmraActionPressed("deleteSelectedKey") or gmraActionPressed("deleteSelectedKeyAlt")
end
function rightMousePressed(): boolean
	return gmraActionPressed("openSelectedEditorContext")
end
function deleteSelectedKey(p: Project)
	local row = p.ui.selectedRow
	local idx = p.ui.selectedKeyIndex
	if idx < 1 then
		return
	end
	if row == "Position" then
		if p.tracks.position[idx] then
			table.remove(p.tracks.position, idx)
		end
		sortKeysByT(p.tracks.position)
	elseif row == "Rotation" then
		if p.tracks.rotation[idx] then
			table.remove(p.tracks.rotation, idx)
		end
		sortRotationKeys(p.tracks.rotation)
	elseif row == "Field of View" then
		if p.tracks.fov[idx] then
			table.remove(p.tracks.fov, idx)
		end
		sortKeysByT(p.tracks.fov)
	elseif row == "DOF F-Stop" then
		if p.tracks.dofFstop[idx] then
			table.remove(p.tracks.dofFstop, idx)
		end
		sortKeysByT(p.tracks.dofFstop)
	elseif row == "DOF Focus Distance" then
		if p.tracks.dofFocalDistance[idx] then
			table.remove(p.tracks.dofFocalDistance, idx)
		end
		sortKeysByT(p.tracks.dofFocalDistance)
	elseif row == "DOF Sensor Width" then
		if p.tracks.dofSensorWidth[idx] then
			table.remove(p.tracks.dofSensorWidth, idx)
		end
		sortKeysByT(p.tracks.dofSensorWidth)
	elseif row == "Replay Speed" then
		if p.tracks.speed[idx] then
			table.remove(p.tracks.speed, idx)
		end
		sortKeysByT(p.tracks.speed)
	elseif row == "Timeline Speed" then
		if p.tracks.timelineSpeed[idx] then
			table.remove(p.tracks.timelineSpeed, idx)
		end
		sortKeysByT(p.tracks.timelineSpeed)
	elseif row == "POV" then
		if p.tracks.pov[idx] then
			table.remove(p.tracks.pov, idx)
		end
		sortPOV(p.tracks.pov)
	elseif row == "ReplayCuts" then
		local cuts = p.tracks.replayCuts
		if cuts and cuts[idx] then
			table.remove(cuts, idx)
		end
		sortReplayCuts(p.tracks.replayCuts or {})
	end
	p.ui.selectedKeyIndex = -1
	p.ui.selectedRow = ""
end
function sortKeysForRow(row: string, keys)
	if row == "Rotation" then
		sortRotationKeys(keys)
	elseif row == "POV" then
		sortPOV(keys)
	elseif row == "ReplayCuts" then
		sortReplayCuts(keys)
	else
		sortKeysByT(keys)
	end
end
function rowToBase(row: string): string?
	if row == "Position" then
		return "pos"
	elseif row == "Rotation" then
		return "rot"
	elseif row == "Field of View" then
		return "fov"
	elseif row == "DOF F-Stop" then
		return "dofFstop"
	elseif row == "DOF Focus Distance" then
		return "dofFocalDistance"
	elseif row == "DOF Sensor Width" then
		return "dofSensorWidth"
	elseif row == "Replay Speed" then
		return "speed"
	elseif row == "Timeline Speed" then
		return "tlspeed"
	elseif row == "POV" then
		return "pov"
	elseif row == "ReplayCuts" then
		return "rc"
	end
	return nil
end
function rowKeys(p: Project, row: string)
	if row == "Position" then
		return p.tracks.position
	elseif row == "Rotation" then
		return p.tracks.rotation
	elseif row == "Field of View" then
		return p.tracks.fov
	elseif row == "DOF F-Stop" then
		return p.tracks.dofFstop
	elseif row == "DOF Focus Distance" then
		return p.tracks.dofFocalDistance
	elseif row == "DOF Sensor Width" then
		return p.tracks.dofSensorWidth
	elseif row == "Replay Speed" then
		return p.tracks.speed
	elseif row == "Timeline Speed" then
		return p.tracks.timelineSpeed
	elseif row == "POV" then
		return p.tracks.pov
	elseif row == "ReplayCuts" then
		return p.tracks.replayCuts or {}
	end
	return nil
end
function getSelectedIndicesForRow(p: Project, row: string): { number }
	local out: { number } = {}
	local keys = rowKeys(p, row)
	if not keys then
		return out
	end
	local seen = {}
	local base = rowToBase(row)
	local fromLane = (base and selectedByBase[base]) or {}
	for _, idx in ipairs(fromLane) do
		if idx >= 1 and idx <= #keys and not seen[idx] then
			seen[idx] = true
			out[#out + 1] = idx
		end
	end
	if #out == 0 and p.ui.selectedRow == row and p.ui.selectedKeyIndex >= 1 and p.ui.selectedKeyIndex <= #keys then
		out[1] = p.ui.selectedKeyIndex
	end
	table.sort(out)
	return out
end
function gmraClearSelectedAcrossRows()
	for base, _ in pairs(selectedByBase) do
		selectedByBase[base] = {}
	end
end
function gmraDeleteSelectedKeys(p: Project): boolean
	local rowOrder = {
		"Position",
		"Rotation",
		"Field of View",
		"DOF F-Stop",
		"DOF Focus Distance",
		"DOF Sensor Width",
		"Replay Speed",
		"Timeline Speed",
		"POV",
		"ReplayCuts",
	}
	local deletedAny = false
	for _, row in ipairs(rowOrder) do
		local keys = rowKeys(p, row)
		local selectedIdxs = getSelectedIndicesForRow(p, row)
		if keys and #selectedIdxs > 0 then
			table.sort(selectedIdxs, function(a, b)
				return a > b
			end)
			for _, idx in ipairs(selectedIdxs) do
				if keys[idx] then
					table.remove(keys, idx)
					deletedAny = true
				end
			end
			sortKeysForRow(row, keys)
			local base = rowToBase(row)
			if base then
				selectedByBase[base] = {}
			end
		end
	end
	if deletedAny then
		p.ui.selectedKeyIndex = -1
		p.ui.selectedRow = ""
		stopLiveKeyEdit()
	end
	return deletedAny
end
local keyframeStepHoldDir = 0
local keyframeStepHoldTime = 0.0
local keyframeStepRepeatAccum = 0.0
function gmraGatherAllKeyTimes(p: Project): { number }
	local out: { number } = {}
	local function addKeyTimes(keys)
		for i = 1, #(keys or {}) do
			local k = keys[i]
			if k then
				out[#out + 1] = k.t
			end
		end
	end
	addKeyTimes(p.tracks.position)
	addKeyTimes(p.tracks.rotation)
	addKeyTimes(p.tracks.fov)
	addKeyTimes(p.tracks.dofFstop)
	addKeyTimes(p.tracks.dofFocalDistance)
	addKeyTimes(p.tracks.dofSensorWidth)
	addKeyTimes(p.tracks.speed)
	addKeyTimes(p.tracks.timelineSpeed)
	addKeyTimes(p.tracks.pov)
	addKeyTimes(p.tracks.replayCuts or {})
	table.sort(out, function(a, b)
		return a < b
	end)
	local deduped: { number } = {}
	for i = 1, #out do
		local t = out[i]
		if #deduped == 0 or math.abs(deduped[#deduped] - t) > 1e-6 then
			deduped[#deduped + 1] = t
		end
	end
	return deduped
end
function gmraStepPlayheadToKeyframe(p: Project, dir: number)
	local times = gmraGatherAllKeyTimes(p)
	if #times == 0 then
		return
	end
	local eps = 1e-6
	if dir < 0 then
		for i = #times, 1, -1 do
			if times[i] < (playhead - eps) then
				playhead = times[i]
				return
			end
		end
		playhead = times[1]
	else
		for i = 1, #times do
			if times[i] > (playhead + eps) then
				playhead = times[i]
				return
			end
		end
		playhead = times[#times]
	end
end
function gmraUpdateKeyframeStepInput(p: Project, dt: number)
	if gmraGetPOVSelectedManualOrbitKey(p) then
		keyframeStepHoldDir = 0
		keyframeStepHoldTime = 0
		keyframeStepRepeatAccum = 0
		return
	end
	local dir = 0
	if stepPrevHeld() and not stepNextHeld() then
		dir = -1
	elseif stepNextHeld() and not stepPrevHeld() then
		dir = 1
	end
	if dir == 0 then
		keyframeStepHoldDir = 0
		keyframeStepHoldTime = 0
		keyframeStepRepeatAccum = 0
		return
	end
	local pressedNow = (dir < 0 and stepPrevPressed()) or (dir > 0 and stepNextPressed())
	if pressedNow then
		gmraStepPlayheadToKeyframe(p, dir)
		keyframeStepHoldDir = dir
		keyframeStepHoldTime = 0
		keyframeStepRepeatAccum = 0
		return
	end
	if keyframeStepHoldDir ~= dir then
		keyframeStepHoldDir = dir
		keyframeStepHoldTime = 0
		keyframeStepRepeatAccum = 0
		return
	end
	keyframeStepHoldTime += dt
	if keyframeStepHoldTime < 0.22 then
		return
	end
	keyframeStepRepeatAccum += dt
	while keyframeStepRepeatAccum >= 0.065 do
		keyframeStepRepeatAccum -= 0.065
		gmraStepPlayheadToKeyframe(p, dir)
	end
end
local keyClipboardSourceStart = 0
function copySelectedKeysToClipboard(p: Project): boolean
	local row = p.ui.selectedRow
	if row == "" then
		return false
	end
	local keys = rowKeys(p, row)
	if not keys or #keys == 0 then
		return false
	end
	local selectedIdxs = getSelectedIndicesForRow(p, row)
	if #selectedIdxs == 0 then
		return false
	end
	local firstT = math.huge
	local lastT = -math.huge
	for _, idx in ipairs(selectedIdxs) do
		local k = keys[idx]
		if k then
			firstT = math.min(firstT, k.t)
			lastT = math.max(lastT, k.t)
		end
	end
	if firstT == math.huge then
		return false
	end
	local entries: { KeyClipboardEntry } = {}
	for _, idx in ipairs(selectedIdxs) do
		local k = keys[idx]
		if k then
			local e: KeyClipboardEntry = { dt = k.t - firstT, interp = k.interp }
			if row == "Position" then
				e.vVec3 = Vec3.new(k.v.x, k.v.y, k.v.z)
			elseif row == "Rotation" then
				e.vQuat = quatNormalize(Quat.new(k.v.x, k.v.y, k.v.z, k.v.w))
			elseif
				row == "Field of View"
				or row == "DOF F-Stop"
				or row == "DOF Focus Distance"
				or row == "DOF Sensor Width"
				or row == "Replay Speed"
				or row == "Timeline Speed"
			then
				e.vNum = k.v
			elseif row == "POV" then
				e.povReplayLayerId = k.replayLayerId
				e.povPlayerId = k.playerId
				e.povMode = k.mode
				e.povNearClip = k.nearClip
				e.povHideNearestHead = k.hideNearestHead == true
				e.povOrbitMode = k.orbitMode
				e.povOrbitRadius = k.orbitRadius
				e.povOrbitHeight = k.orbitHeight
				e.povOrbitLookAheadDistance = k.orbitLookAheadDistance
				e.povOrbitSmoothing = k.orbitSmoothing
				e.povManualOrbitSmoothingMultiplier = k.manualOrbitSmoothingMultiplier
				e.povOrbitVelocityThreshold = k.orbitVelocityThreshold
				e.povManualOrbitYaw = k.manualOrbitYaw
				e.povManualOrbitPitch = k.manualOrbitPitch
				e.povManualOrbitAutoSpin = k.manualOrbitAutoSpin == true
				e.povManualOrbitSpinSpeed = k.manualOrbitSpinSpeed
				e.interp = "cut"
			end
			entries[#entries + 1] = e
		end
	end
	table.sort(entries, function(a, b)
		return a.dt < b.dt
	end)
	keyClipboardRow = row
	keyClipboardEntries = entries
	keyClipboardSpan = math.max(0, lastT - firstT)
	keyClipboardSourceStart = firstT
	return #entries > 0
end
function pasteClipboardAtPlayhead(p: Project, anchorT: number): boolean
	if keyClipboardRow == "" or #keyClipboardEntries == 0 then
		return false
	end
	local row = keyClipboardRow
	local firstPasteT = 0
	pushUndoOnce(p)
	for i = 1, #keyClipboardEntries do
		local e = keyClipboardEntries[i]
		local tt = alignTo(anchorT + e.dt, p.snap)
		if i == 1 then
			firstPasteT = tt
		end
		if row == "Position" then
			upsertVec3Key(p.tracks.position, tt, e.vVec3 or Vec3.zeroVector, e.interp or "smooth")
		elseif row == "Rotation" then
			upsertQuatKey(p.tracks.rotation, tt, e.vQuat or camera.rotation, e.interp or "smooth")
		elseif row == "Field of View" then
			upsertNumKey(p.tracks.fov, tt, e.vNum or 90, e.interp or "smooth")
		elseif row == "DOF F-Stop" then
			upsertNumKey(p.tracks.dofFstop, tt, e.vNum or 0, e.interp or "smooth")
		elseif row == "DOF Focus Distance" then
			upsertNumKey(p.tracks.dofFocalDistance, tt, e.vNum or 0, e.interp or "smooth")
		elseif row == "DOF Sensor Width" then
			upsertNumKey(p.tracks.dofSensorWidth, tt, e.vNum or 0, e.interp or "smooth")
		elseif row == "Replay Speed" then
			upsertNumKey(p.tracks.speed, tt, e.vNum or 1, e.interp or "smooth")
		elseif row == "Timeline Speed" then
			upsertNumKey(p.tracks.timelineSpeed, tt, e.vNum or 1, e.interp or "smooth")
		elseif row == "POV" then
			upsertPOVKey(
				p.tracks.pov,
				tt,
				e.povReplayLayerId or clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers),
				e.povPlayerId or 0,
				e.povMode or "1P",
				e.povNearClip or 1,
				e.povHideNearestHead == true,
				e.povOrbitMode,
				e.povOrbitRadius,
				e.povOrbitHeight,
				e.povOrbitLookAheadDistance,
				e.povOrbitSmoothing,
				e.povManualOrbitSmoothingMultiplier,
				e.povOrbitVelocityThreshold,
				e.povManualOrbitYaw,
				e.povManualOrbitPitch,
				e.povManualOrbitAutoSpin,
				e.povManualOrbitSpinSpeed
			)
		end
	end
	local keys = rowKeys(p, row)
	if keys then
		for i = 1, #keys do
			if feq(keys[i].t, firstPasteT, 1e-6) then
				p.ui.selectedRow = row
				p.ui.selectedKeyIndex = i
				break
			end
		end
	end
	return true
end
function duplicateSelectedKeysForward(p: Project): boolean
	local hadSelection = copySelectedKeysToClipboard(p)
	if not hadSelection and (#keyClipboardEntries == 0) then
		return false
	end
	local pasteAnchor = keyClipboardSourceStart + keyClipboardSpan + p.snap
	return pasteClipboardAtPlayhead(p, pasteAnchor)
end
function safeDragInt(label: string, value: number, speed: number, minV: number?, maxV: number?): number
	local ok, out = pcall(function()
		return Gui.dragInt(label, value, speed, minV or 0, maxV or 0)
	end)
	if ok then
		return out
	end
	local ok2, out2 = pcall(function()
		return Gui.dragInt(label, value, speed)
	end)
	if ok2 then
		return out2
	end
	return value
end
function safeSliderInt(label: string, value: number, minV: number, maxV: number): number
	local ok, out = pcall(function()
		return Gui.sliderInt(label, value, minV, maxV)
	end)
	if ok and out ~= nil then
		return out
	end
	return value
end
function safeSliderFloat(label: string, value: number, minV: number, maxV: number): number
	local ok, out = pcall(function()
		return Gui.sliderFloat(label, value, minV + 0.0, maxV + 0.0)
	end)
	if ok and out ~= nil then
		return out
	end
	return value
end
function gmraTooltip(text: string)
	if text ~= "" then
		Gui.setItemTooltip(text)
	end
end
function hasFn(name: string): boolean
	return (Gui[name] ~= nil)
end
function gmraIsItemActiveSafe(): boolean
	local ok, active = pcall(function()
		return Gui.isItemActive()
	end)
	if ok and active == true then
		return true
	end
	return Gui.isItemHovered() and keyHeldSafe(Input.Key.LeftMouseButton)
end
local gmraReplayStripDragWidgetId = ""
function gmraShouldCommitReplayStripWidget(widgetId: string): boolean
	if gmraReplayStripDragWidgetId ~= "" and not keyHeldSafe(Input.Key.LeftMouseButton) then
		gmraReplayStripDragWidgetId = ""
	end
	if gmraReplayStripDragWidgetId == widgetId then
		return true
	end
	if Gui.isItemHovered() and keyDownSafe(Input.Key.LeftMouseButton) then
		gmraReplayStripDragWidgetId = widgetId
		return true
	end
	if gmraIsItemActiveSafe() then
		gmraReplayStripDragWidgetId = widgetId
		return true
	end
	return false
end
local gmraTimelineWindowDragOwned = false
local gmraTimelineWindowSuppressFrames = 0
function gmraUpdateTimelineWindowDragOwnership(): boolean
	local justEnded = false
	if gmraTimelineWindowDragOwned and not keyHeldSafe(Input.Key.LeftMouseButton) then
		gmraTimelineWindowDragOwned = false
		justEnded = true
	end
	if Gui.isItemHovered() and keyDownSafe(Input.Key.LeftMouseButton) then
		gmraTimelineWindowDragOwned = true
	end
	if gmraIsItemActiveSafe() then
		gmraTimelineWindowDragOwned = true
	end
	if gmraTimelineWindowDragOwned or justEnded then
		gmraTimelineWindowSuppressFrames = 2
	elseif gmraTimelineWindowSuppressFrames > 0 then
		gmraTimelineWindowSuppressFrames -= 1
	end
	return gmraTimelineWindowDragOwned or (gmraTimelineWindowSuppressFrames > 0)
end
function gmraIndentBlock()
	if hasFn("indent") then
		Gui.indent()
	end
end
function gmraUnindentBlock()
	if hasFn("unindent") then
		Gui.unindent()
	end
end
function safeCombo(label: string, index: number, items): number
	local ok, out = pcall(function()
		-- Gui.combo not in spec; emulate with beginCombo/selectable/endCombo
		local result = index
		local preview = (items and items[index]) or ""
		if Gui.beginCombo(label, preview) then
			for i = 1, #items do
				if Gui.selectable(items[i] .. "##comboItem" .. tostring(i), i == index) then
					result = i
				end
			end
			Gui.endCombo()
		end
		return result
	end)
	if ok then
		return out
	end
	return index
end
function comboIndex(label: string, idx: number, options: { any }): number
	if (options == nil) or (#options == 0) then
		Gui.text("(no options)##" .. label)
		return 1
	end
	if idx == nil then
		idx = 1
	end
	if idx < 1 then
		idx = 1
	end
	if idx > #options then
		idx = #options
	end
	local previewAny = options[idx]
	local preview = tostring(previewAny)
	local ok, opened = pcall(function()
		return Gui.beginCombo(label, preview)
	end)
	if not ok then
		Gui.text(preview .. "##" .. label)
		return idx
	end
	if opened then
		for i = 1, #options do
			local optStr = tostring(options[i])
			local selected = (i == idx)
			local okSel, clicked = pcall(function()
				return Gui.selectable(optStr .. "##" .. label .. tostring(i), selected)
			end)
			if okSel and clicked then
				idx = i
			end
		end
		Gui.endCombo()
	end
	return idx
end
function getProjectNames(): { string }
	local names = {}
	for k, _ in pairs(config.projects or {}) do
		table.insert(names, k)
	end
	table.sort(names)
	return names
end
function getSmoothingPresetNames(): { string }
	local names = {}
	for k, _ in pairs(config.smoothingPresets or {}) do
		table.insert(names, k)
	end
	table.sort(names)
	return names
end
function captureSmoothingPreset(p: Project): SmoothingPreset
	local ui = p.ui
	return {
		useQuatInterp = ui.useQuatInterp,
		globalSmoothing = ui.globalSmoothing or 0,
		posSmoothing = ui.posSmoothing or 0,
		rotSmoothing = ui.rotSmoothing or 0,
		advancedSmoothing = ui.advancedSmoothing,
		posTimingCarry = ui.posTimingCarry or 1,
		posBlendPower = ui.posBlendPower or 2,
		posKeyflow = ui.posKeyflow or 0.55,
		posMidBiasPower = ui.posMidBiasPower or 1,
		posTangentStrength = ui.posTangentStrength or 1,
		posTangentClamp = ui.posTangentClamp or 2.5,
		posOvershootGuard = ui.posOvershootGuard or 0.45,
		rotCarryFloor = ui.rotCarryFloor or 0.82,
		rotEasePower = ui.rotEasePower or 1,
		rotSmoothStrength = ui.rotSmoothStrength or 1,
		rotLinearMix = ui.rotLinearMix or 0.3,
		rotKeyflow = ui.rotKeyflow or 0.85,
		rotMidBiasPower = ui.rotMidBiasPower or 1,
	}
end
function applySmoothingPreset(p: Project, preset: SmoothingPreset?)
	if not preset then
		return
	end
	local ui = p.ui
	if preset.useQuatInterp ~= nil then
		ui.useQuatInterp = preset.useQuatInterp
	end
	if preset.globalSmoothing ~= nil then
		ui.globalSmoothing = preset.globalSmoothing
	end
	if preset.posSmoothing ~= nil then
		ui.posSmoothing = preset.posSmoothing
	end
	if preset.rotSmoothing ~= nil then
		ui.rotSmoothing = preset.rotSmoothing
	end
	if preset.advancedSmoothing ~= nil then
		ui.advancedSmoothing = preset.advancedSmoothing
	end
	if preset.posTimingCarry ~= nil then
		ui.posTimingCarry = preset.posTimingCarry
	end
	if preset.posBlendPower ~= nil then
		ui.posBlendPower = preset.posBlendPower
	end
	if preset.posKeyflow ~= nil then
		ui.posKeyflow = preset.posKeyflow
	end
	if preset.posMidBiasPower ~= nil then
		ui.posMidBiasPower = preset.posMidBiasPower
	end
	if preset.posTangentStrength ~= nil then
		ui.posTangentStrength = preset.posTangentStrength
	end
	if preset.posTangentClamp ~= nil then
		ui.posTangentClamp = preset.posTangentClamp
	end
	if preset.posOvershootGuard ~= nil then
		ui.posOvershootGuard = preset.posOvershootGuard
	end
	if preset.rotCarryFloor ~= nil then
		ui.rotCarryFloor = preset.rotCarryFloor
	end
	if preset.rotEasePower ~= nil then
		ui.rotEasePower = preset.rotEasePower
	end
	if preset.rotSmoothStrength ~= nil then
		ui.rotSmoothStrength = preset.rotSmoothStrength
	end
	if preset.rotLinearMix ~= nil then
		ui.rotLinearMix = preset.rotLinearMix
	end
	if preset.rotKeyflow ~= nil then
		ui.rotKeyflow = preset.rotKeyflow
	end
	if preset.rotMidBiasPower ~= nil then
		ui.rotMidBiasPower = preset.rotMidBiasPower
	end
end
function normalizePresetName(name: string): string
	local out = string.match(name or "", "^%s*(.-)%s*$")
	return out or ""
end
function saveSmoothingPreset(name: string, p: Project): boolean
	local presetName = normalizePresetName(name)
	if presetName == "" then
		return false
	end
	config.smoothingPresets = config.smoothingPresets or {}
	config.smoothingPresets[presetName] = captureSmoothingPreset(p)
	smoothingPresetSelectedName = presetName
	config.lastSmoothingPreset = presetName
	safeSaveConfig()
	return true
end
function deleteSmoothingPreset(name: string)
	if name == "" then
		return
	end
	if config.smoothingPresets and config.smoothingPresets[name] then
		config.smoothingPresets[name] = nil
		if config.lastSmoothingPreset == name then
			config.lastSmoothingPreset = ""
		end
		if smoothingPresetSelectedName == name then
			smoothingPresetSelectedName = ""
		end
		safeSaveConfig()
	end
end
function pointAtX(points: { Vec2 }, xVal: number, eps: number): number
	for i = 1, #points do
		if math.abs(points[i].x - xVal) <= eps then
			return i
		end
	end
	return -1
end
function copyPoints(points: { Vec2 }): { Vec2 }
	local out: { Vec2 } = {}
	for i = 1, #points do
		out[i] = Vec2.new(points[i].x, points[i].y)
	end
	return out
end
function computeDragDeltaFromWidget(
	newPts: { Vec2 },
	prevPts: { Vec2 },
	selectedIdxs: { number },
	dragStartPts: { Vec2 },
	lastDelta: number?,
	snap: number
): number?
	if #dragStartPts == 0 then
		return nil
	end
	local anchorStartX = dragStartPts[1].x
	local expectedX = anchorStartX + (lastDelta or 0)
	local eps = math.max((snap or 0.05) * 0.25, 1e-5)
	local bestIdx = -1
	local bestScore = math.huge
	local n = math.min(#newPts, #prevPts)
	for i = 1, n do
		local moved = math.abs(newPts[i].x - prevPts[i].x) > eps
		if moved then
			local score = math.abs(newPts[i].x - expectedX)
			if score < bestScore then
				bestScore = score
				bestIdx = i
			end
		end
	end
	if bestIdx == -1 then
		for _, idx in ipairs(selectedIdxs or {}) do
			if newPts[idx] then
				local score = math.abs(newPts[idx].x - expectedX)
				if score < bestScore then
					bestScore = score
					bestIdx = idx
				end
			end
		end
	end
	if bestIdx == -1 then
		for i = 1, #newPts do
			local score = math.abs(newPts[i].x - expectedX)
			if score < bestScore then
				bestScore = score
				bestIdx = i
			end
		end
	end
	if bestIdx == -1 or not newPts[bestIdx] then
		return nil
	end
	return newPts[bestIdx].x - anchorStartX
end
function resolveDragCollisions(keys, dragRefs, dragDelta: number?, snap: number)
	if not keys or #keys == 0 then
		return
	end
	if not dragRefs or #dragRefs == 0 then
		return
	end
	local step = (snap and snap > 0) and snap or 0.001
	local eps = math.max(step * 0.25, 1e-6)
	local dir = ((dragDelta or 0) >= 0) and 1 or -1
	local refs = {}
	for i = 1, #dragRefs do
		if dragRefs[i] then
			refs[#refs + 1] = dragRefs[i]
		end
	end
	if #refs == 0 then
		return
	end
	table.sort(refs, function(a, b)
		if dir >= 0 then
			return a.t > b.t
		end
		return a.t < b.t
	end)
	local function collides(ref, targetT: number): boolean
		for i = 1, #keys do
			local other = keys[i]
			if other and other ~= ref and math.abs(other.t - targetT) <= eps then
				return true
			end
		end
		return false
	end
	for i = 1, #refs do
		local ref = refs[i]
		local targetT = alignTo(ref.t, snap)
		local guard = 0
		while collides(ref, targetT) and guard < 512 do
			targetT = alignTo(targetT + (dir * step), snap)
			guard += 1
		end
		ref.t = targetT
	end
end

function gmraPlayerNameFromId(playerId: number): string
	local frames = getAllGameData()
	for i = 1, #frames do
		local players = frames[i].players
		for j = 1, #players do
			local pid = players[j].playerId
			if pid == playerId then
				local rp = frames[i]:getPlayerById(playerId)
				if rp and rp.playerName and rp.playerName ~= "" then
					return rp.playerName
				end
				return tostring(playerId)
			end
		end
	end
	return tostring(playerId)
end

function gmraInterpToIndex(interp: InterpMode?): number
	local v = interp or "smooth"
	if v == "cut" then
		return 3
	end
	if v == "linear" then
		return 2
	end
	return 1
end

function gmraIndexToInterp(i: number): InterpMode
	if i == 3 then
		return "cut"
	end
	if i == 2 then
		return "linear"
	end
	return "smooth"
end

local selectedEditorAutoOpenFrames = 0

function gmraDrawPOVOrbitKeySettings(p: Project, k: POVKey, idSuffix: string)
	local orbitMode = gmraGetPOVOrbitMode(k)
	local orbitModeIdx = (orbitMode == "MANUAL") and 2 or 1
	local newOrbitModeIdx = comboIndex("3P Camera Style##povOrbitMode" .. idSuffix, orbitModeIdx, povOrbitModeStrings)
	local newOrbitMode = (newOrbitModeIdx == 2) and "MANUAL" or "AUTO"
	if orbitMode ~= newOrbitMode then
		pushUndoOnce(p)
		k.orbitMode = newOrbitMode
		orbitMode = newOrbitMode
	end
	if Gui.collapsingHeader("3P Orbit Settings##pov3PSettings" .. idSuffix) then
		gmraIndentBlock()
		local oldOrbitRadius = tonumber(k.orbitRadius) or 500
		local newOrbitRadius = Gui.sliderFloat("Orbit Radius##povOrbitRadius" .. idSuffix, oldOrbitRadius, 0, 1000)
		k.orbitRadius = setIfChangedNum(p, oldOrbitRadius, newOrbitRadius)
		local oldOrbitHeight = tonumber(k.orbitHeight) or 0
		local newOrbitHeight = Gui.sliderFloat("Orbit Height##povOrbitHeight" .. idSuffix, oldOrbitHeight, -300, 300)
		k.orbitHeight = setIfChangedNum(p, oldOrbitHeight, newOrbitHeight)
		local oldOrbitSmoothing = tonumber(k.orbitSmoothing) or 0.15
		local newOrbitSmoothing =
			Gui.sliderFloat("Orbit Smoothing##povOrbitSmoothing" .. idSuffix, oldOrbitSmoothing, 0, 1)
		k.orbitSmoothing = setIfChangedNum(p, oldOrbitSmoothing, newOrbitSmoothing)
		if orbitMode == "AUTO" then
			local oldLookAhead = tonumber(k.orbitLookAheadDistance) or 100
			local newLookAhead =
				Gui.sliderFloat("Look Ahead Distance##povOrbitLookAhead" .. idSuffix, oldLookAhead, 0, 300)
			k.orbitLookAheadDistance = setIfChangedNum(p, oldLookAhead, newLookAhead)
			local oldThreshold = tonumber(k.orbitVelocityThreshold) or 600
			local newThreshold =
				Gui.sliderFloat("Velocity Threshold##povOrbitThreshold" .. idSuffix, oldThreshold, 0, 3000)
			k.orbitVelocityThreshold = setIfChangedNum(p, oldThreshold, newThreshold)
		else
			local oldManualSmooth = tonumber(k.manualOrbitSmoothingMultiplier) or 0.2
			local newManualSmooth = Gui.sliderFloat(
				"Manual Orbit Smoothing Multiplier##povManualSmooth" .. idSuffix,
				oldManualSmooth,
				0,
				1
			)
			k.manualOrbitSmoothingMultiplier = setIfChangedNum(p, oldManualSmooth, newManualSmooth)
			local oldYaw = gmraWrapAngleDeg(tonumber(k.manualOrbitYaw) or 0)
			local newYaw = Gui.sliderFloat("Manual Yaw##povManualYaw" .. idSuffix, oldYaw, -180, 180)
			k.manualOrbitYaw = setIfChangedNum(p, oldYaw, gmraWrapAngleDeg(newYaw))
			local oldPitch = clamp(tonumber(k.manualOrbitPitch) or 0, -89.9, 89.9)
			local newPitch = Gui.sliderFloat("Manual Pitch##povManualPitch" .. idSuffix, oldPitch, -89.9, 89.9)
			k.manualOrbitPitch = setIfChangedNum(p, oldPitch, newPitch)
			local oldAutoSpin = k.manualOrbitAutoSpin == true
			local newAutoSpin = Gui.checkbox("Auto Spin##povManualAutoSpin" .. idSuffix, oldAutoSpin)
			if newAutoSpin ~= oldAutoSpin then
				pushUndoOnce(p)
				k.manualOrbitAutoSpin = newAutoSpin
			end
			local oldSpinSpeed = tonumber(k.manualOrbitSpinSpeed) or 45
			local newSpinSpeed =
				Gui.sliderFloat("Spin Speed (deg/sec)##povManualSpinSpeed" .. idSuffix, oldSpinSpeed, -360, 360)
			k.manualOrbitSpinSpeed = setIfChangedNum(p, oldSpinSpeed, newSpinSpeed)
			Gui.text("Preview + Arrows / WASD adjusts manual yaw and pitch.")
		end
		gmraUnindentBlock()
	end
end

function gmraDrawSelectedPOVKeyEditor(p: Project, idx: number)
	local k = p.tracks.pov[idx]
	if not k then
		return
	end
	local oldT = k.t
	local newT = alignTo(
		Gui.dragFloat("Time (s)##povT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
		p.snap
	)
	if not feq(oldT, newT) then
		pushUndoOnce(p)
		k.t = newT
	end
	k.interp = "cut"
	local oldLayer = k.replayLayerId
	local newLayer = safeSliderInt("Replay Layer##povKeyLayer", oldLayer, 1, #p.replayLayers)
	if oldLayer ~= newLayer then
		pushUndoOnce(p)
		k.replayLayerId = newLayer
	end
	local oldPid = k.playerId
	local newPid = safeDragInt("Player ID##povKeyPlayer", oldPid, 1, 0, 999999)
	if oldPid ~= newPid then
		pushUndoOnce(p)
		k.playerId = newPid
	end
	p.ui.povNearClip = p.ui.povNearClip or 1
	k.nearClip = k.nearClip or 1
	if k.mode ~= "1P" then
		Gui.beginDisabled()
	end
	local oldNC = k.nearClip or 1
	local newNC = Gui.sliderFloat("Near Clip##povNearClipKey", oldNC, 0, 100)
	if not feq(oldNC, newNC) then
		pushUndoOnce(p)
		k.nearClip = newNC
	end
	local oldHide = ((k.hideNearestHead == nil) and (p.ui.hideNearestHead == true)) or (k.hideNearestHead == true)
	local newHide = Gui.checkbox("Hide Nearest Head##povHideNearestHeadKey", oldHide)
	if newHide ~= oldHide then
		pushUndoOnce(p)
		k.hideNearestHead = newHide
	end
	if k.mode ~= "1P" then
		Gui.endDisabled()
	end
	local modeIdx = 1
	if k.mode == "3P" then
		modeIdx = 2
	elseif k.mode == "OUT" then
		modeIdx = 3
	end
	local oldMode = k.mode or "1P"
	modeIdx = comboIndex("POV Mode##povKeyMode", modeIdx, povModeStrings)
	local newMode = (modeIdx == 2 and "3P") or (modeIdx == 3 and "OUT") or "1P"
	if oldMode ~= newMode then
		pushUndoOnce(p)
		k.mode = newMode
	end
	if k.mode == "3P" then
		gmraDrawPOVOrbitKeySettings(p, k, "Key")
	end
	local nm = gmraPlayerNameFromId(k.playerId)
	Gui.text("Player: " .. nm .. "  (ID " .. tostring(k.playerId) .. ")")
	sortPOV(p.tracks.pov)
end

function gmraDrawSelectedKeyEditor(p: Project)
	local selectedEditorDefaultOpen = selectedEditorAutoOpenFrames > 0
	if selectedEditorAutoOpenFrames > 0 then
		selectedEditorAutoOpenFrames -= 1
	end
	if Gui.collapsingHeader("Selected Key Editor##selected") then
		gmraIndentBlock()
		if previewEnabled then
			Gui.text("Preview Camera is ON. Key edits still apply, but camera view is preview-controlled.")
		end
		local interpOptions = { "smooth", "linear", "cut" }
		local row = p.ui.selectedRow
		local selectedIdxs = {}
		if row ~= "" then
			selectedIdxs = getSelectedIndicesForRow(p, row)
		end
		if #selectedIdxs == 0 or row == "" then
			Gui.text("No key selected. Click a keyframe diamond in the tracks above.")
			if liveKeyEditEnabled then
				stopLiveKeyEdit()
			end
		elseif #selectedIdxs > 1 then
			if liveKeyEditEnabled then
				stopLiveKeyEdit()
			end
			Gui.text("Editing Row: " .. row .. "   Selected Keys: " .. tostring(#selectedIdxs))
			if Gui.button("Delete Selected Key(s)##delMultiKeys") then
				pushUndoOnce(p)
				gmraDeleteSelectedKeys(p)
				stopLiveKeyEdit()
			end
			local keys = rowKeys(p, row)
			if row == "POV" then
				Gui.text("POV keys always use cut.")
			elseif keys then
				local mixed = false
				local firstInterp = "smooth"
				local firstKey = keys[selectedIdxs[1]]
				if firstKey then
					firstInterp = firstKey.interp or "smooth"
				end
				for i = 2, #selectedIdxs do
					local key = keys[selectedIdxs[i]]
					local interp = (key and key.interp) or "smooth"
					if interp ~= firstInterp then
						mixed = true
						break
					end
				end
				local batchOptions = mixed and { "(mixed)", "smooth", "linear", "cut" } or interpOptions
				local currentIdx = mixed and 1 or gmraInterpToIndex(firstInterp)
				local newIdx = comboIndex("Interp##multiInterp", currentIdx, batchOptions)
				local newInterp: InterpMode? = nil
				if mixed then
					if newIdx > 1 then
						newInterp = gmraIndexToInterp(newIdx - 1)
					end
				else
					newInterp = gmraIndexToInterp(newIdx)
				end
				if newInterp and (mixed or newInterp ~= firstInterp) then
					pushUndoOnce(p)
					for i = 1, #selectedIdxs do
						local key = keys[selectedIdxs[i]]
						if key then
							key.interp = newInterp
						end
					end
				end
				if row == "Rotation" then
					sortRotationKeys(keys)
				else
					sortKeysByT(keys)
				end
			end
		else
			Gui.text("Editing Row: " .. row .. "   Key Index: " .. tostring(p.ui.selectedKeyIndex))
			if Gui.button("Delete Selected Key(s)##delKey") then
				pushUndoOnce(p)
				gmraDeleteSelectedKeys(p)
				stopLiveKeyEdit()
			end
			local idx = p.ui.selectedKeyIndex
			if row == "Position" then
				local k = p.tracks.position[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##posT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					k.t = setIfChangedNum(p, oldT, newT)
					local oldV = k.v
					local x = Gui.dragFloat("X##posX", oldV.x, 0.1, -999999, 999999)
					local y = Gui.dragFloat("Y##posY", oldV.y, 0.1, -999999, 999999)
					local z = Gui.dragFloat("Z##posZ", oldV.z, 0.1, -999999, 999999)
					local newV = Vec3.new(x, y, z)
					if not vec3eq(oldV, newV) then
						pushUndoOnce(p)
						k.v = newV
					end
					if Gui.button("Set Position From Current Camera##posFromCam") then
						pushUndoOnce(p)
						k.v = Vec3.new(camera.position.x, camera.position.y, camera.position.z)
					end
					local livePos = isLiveKeyEditTarget("Position", idx)
					local wantLivePos = Gui.checkbox("Live Edit Position From Camera##posLive", livePos)
					if wantLivePos ~= livePos then
						if wantLivePos then
							pushUndoOnce(p)
							startLiveKeyEdit("Position", idx)
						else
							stopLiveKeyEdit()
						end
					end
					if livePos then
						Gui.text("Live Position Edit ON (camera movement writes to this key).")
					end
					local oldInterp = k.interp
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##posInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if (oldInterp or "smooth") ~= (newInterp or "smooth") then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.position)
				end
			elseif row == "Rotation" then
				local k = p.tracks.rotation[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##rotT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldQ = k.v
					local oldE = oldQ:euler()
					local ex = Gui.dragFloat("Euler X##rotEX", oldE.x, 0.25, -360, 360)
					local ey = Gui.dragFloat("Euler Y##rotEY", oldE.y, 0.25, -360, 360)
					local ez = Gui.dragFloat("Euler Z##rotEZ", oldE.z, 0.25, -360, 360)
					local eQ = quatNormalize(Quat.fromEuler(ex, ey, ez))
					if not quateq(oldQ, eQ) then
						pushUndoOnce(p)
						k.v = eQ
						oldQ = eQ
					end
					if Gui.collapsingHeader("Advanced Quaternion Values##rotQuatAdv") then
						gmraIndentBlock()
						local qx = Gui.dragFloat("Qx##rotQx", oldQ.x, 0.01, -1, 1)
						local qy = Gui.dragFloat("Qy##rotQy", oldQ.y, 0.01, -1, 1)
						local qz = Gui.dragFloat("Qz##rotQz", oldQ.z, 0.01, -1, 1)
						local qw = Gui.dragFloat("Qw##rotQw", oldQ.w, 0.01, -1, 1)
						local newQ = quatNormalize(Quat.new(qx, qy, qz, qw))
						if not quateq(oldQ, newQ) then
							pushUndoOnce(p)
							k.v = newQ
							oldQ = newQ
						end
						gmraUnindentBlock()
					end
					if Gui.button("Set Rotation From Current Camera##rotFromCam") then
						pushUndoOnce(p)
						k.v = quatNormalize(
							Quat.new(camera.rotation.x, camera.rotation.y, camera.rotation.z, camera.rotation.w)
						)
						oldQ = k.v
					end
					liveKeyEditLockMove =
						Gui.checkbox("Lock Camera Position (rotate only)##rotLiveLock", liveKeyEditLockMove)
					local liveRot = isLiveKeyEditTarget("Rotation", idx)
					local wantLiveRot = Gui.checkbox("Live Edit Rotation From Camera##rotLive", liveRot)
					if wantLiveRot ~= liveRot then
						if wantLiveRot then
							pushUndoOnce(p)
							startLiveKeyEdit("Rotation", idx)
						else
							stopLiveKeyEdit()
						end
					end
					if liveRot then
						Gui.text("Live Rotation Edit ON (turn camera, then disable to keep the key).")
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##rotInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortRotationKeys(p.tracks.rotation)
				end
			elseif row == "Field of View" then
				local k = p.tracks.fov[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##fovT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("FOV##fovV", oldV, 0.25, 1, 179)
					if not feq(oldV, newV) then
						pushUndoOnce(p)
						k.v = newV
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##fovInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.fov)
				end
			elseif row == "DOF F-Stop" then
				local k = p.tracks.dofFstop[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##dofFstopT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("F-Stop##dofFstopV", oldV, 0.05, 0, 256)
					if not feq(oldV, newV) then
						pushUndoOnce(p)
						k.v = math.max(0, newV)
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##dofFstopInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.dofFstop)
				end
			elseif row == "DOF Focus Distance" then
				local k = p.tracks.dofFocalDistance[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##dofFocalT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("Focal Distance##dofFocalV", oldV, 0.1, 0, 100000)
					if not feq(oldV, newV) then
						pushUndoOnce(p)
						k.v = math.max(0, newV)
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##dofFocalInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.dofFocalDistance)
				end
			elseif row == "DOF Sensor Width" then
				local k = p.tracks.dofSensorWidth[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat(
							"Time (s)##dofSensorT",
							oldT,
							p.snap,
							p.timelineStart - 9999,
							p.timelineEnd + 9999
						),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("Sensor Width##dofSensorV", oldV, 0.1, 0, 10000)
					if not feq(oldV, newV) then
						pushUndoOnce(p)
						k.v = math.max(0, newV)
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##dofSensorInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.dofSensorWidth)
				end
			elseif row == "Replay Speed" then
				local k = p.tracks.speed[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##spdT", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("Speed##spdV", oldV, 0.05, 0.01, 25)
					if not feq(oldV, newV) then
						pushUndoOnce(p)
						k.v = newV
					end
					local oldInterp = k.interp or "smooth"
					local i0 = gmraInterpToIndex(oldInterp)
					local i1 = comboIndex("Interp##spdInterp", i0, interpOptions)
					local newInterp = gmraIndexToInterp(i1)
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.speed)
				end
			elseif row == "POV" then
				gmraDrawSelectedPOVKeyEditor(p, idx)
			elseif row == "Timeline Speed" then
				local k = p.tracks.timelineSpeed[idx]
				if k then
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat("Time (s)##tls_t", oldT, p.snap, p.timelineStart - 9999, p.timelineEnd + 9999),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldV = k.v
					local newV = Gui.dragFloat("Timeline speed##tls_v", oldV, 0.05, 0.05, 10)
					k.v = setIfChangedNum(p, oldV, newV)
					local oldInterp = k.interp or "smooth"
					local interpIdx = (oldInterp == "cut" and 3) or (oldInterp == "linear" and 2) or 1
					local newIdx = comboIndex("Interp##tls_i", interpIdx, interpOptions)
					local newInterp = (newIdx == 2 and "linear") or (newIdx == 3 and "cut") or "smooth"
					if oldInterp ~= newInterp then
						pushUndoOnce(p)
						k.interp = newInterp
					end
					sortKeysByT(p.tracks.timelineSpeed)
				end
			elseif row == "ReplayCuts" then
				local cuts = p.tracks.replayCuts or {}
				local k = cuts[idx]
				if k then
					Gui.text("Replay Cut Key  (Layer " .. tostring(k.replayLayerId) .. ")")
					local oldT = k.t
					local newT = alignTo(
						Gui.dragFloat(
							"Timeline Time (s)##rcT",
							oldT,
							p.snap,
							p.timelineStart - 9999,
							p.timelineEnd + 9999
						),
						p.snap
					)
					if not feq(oldT, newT) then
						pushUndoOnce(p)
						k.t = newT
					end
					local oldSrc = k.srcJumpT
					local newSrc = Gui.dragFloat("Jump To Replay Time (s)##rcSrc", oldSrc, 0.1, 0, 9999)
					if not feq(oldSrc, newSrc) then
						pushUndoOnce(p)
						k.srcJumpT = newSrc
					end
					Gui.setItemTooltip(
						"The replay source time this layer will jump to when the playhead crosses this key."
					)
					local oldLayer = k.replayLayerId
					local newLayer = safeSliderInt("Target Layer##rcLayer", oldLayer, 1, #p.replayLayers)
					if oldLayer ~= newLayer then
						pushUndoOnce(p)
						k.replayLayerId = newLayer
					end
					if Gui.button("Delete This Cut Key##rcDel") then
						pushUndoOnce(p)
						table.remove(cuts, idx)
						p.ui.selectedRow = ""
						p.ui.selectedKeyIndex = -1
					end
					sortReplayCuts(cuts)
				end
			end
		end
		gmraUnindentBlock()
	end
end

function gmraAboutBullet(text: string)
	Gui.text("- " .. text)
end

function gmraAboutHeader(text: string)
	if hasFn("separatorText") then
		Gui.separatorText(text)
	else
		Gui.separator()
		Gui.text(text)
	end
end

function gmraAboutCardTitle(text: string)
	Gui.text(text)
end

function gmraAboutItem(title: string, line1: string, line2: string?)
	Gui.text(title .. " - " .. line1)
	if line2 and line2 ~= "" then
		Gui.text(line2)
	end
end

function gmraAboutStep(stepLabel: string, title: string, body: string)
	Gui.text(stepLabel .. ". " .. title .. " - " .. body)
end

function gmraAboutTabButton(id: string, label: string)
	local btnLabel = (aboutActiveTab == id) and ("[ " .. label .. " ]") or label
	if Gui.button(btnLabel .. "##aboutTab_" .. id) then
		aboutActiveTab = id
	end
end

function gmraDrawAboutSection()
	if Gui.collapsingHeader("About") then
		gmraIndentBlock()
		gmraAboutHeader("Replay Camera Animator")
		Gui.text("Make camera shots over replays.")
		Gui.text("Set keys, preview the path, then record it.")
		Gui.separator()
		gmraAboutTabButton("overview", "Overview")
		Gui.sameLine()
		gmraAboutTabButton("workflow", "Workflow")
		Gui.sameLine()
		gmraAboutTabButton("sections", "Sections")
		Gui.sameLine()
		gmraAboutTabButton("tracks", "Tracks")
		Gui.sameLine()
		gmraAboutTabButton("editing", "Editing")
		Gui.sameLine()
		gmraAboutTabButton("terms", "Camera Terms")
		Gui.sameLine()
		gmraAboutTabButton("tips", "Tips")
		Gui.separator()

		if aboutActiveTab == "workflow" then
			gmraAboutHeader("How To Use It")
			gmraAboutStep("1", "Project", "Make or load a project.")
			gmraAboutStep("2", "Replays", "Add a layer and bind a loaded replay.")
			gmraAboutStep("3", "Add Keys", "Pick a key type and add it at the playhead.")
			gmraAboutStep("4", "Edit", "Click a key and fix the values.")
			gmraAboutStep("5", "Preview", "Turn Preview Camera on.")
			gmraAboutStep("6", "Record", "Capture it when it looks good.")
			gmraAboutHeader("Fast First Shot")
			gmraAboutItem("Good Starter", "Add Pos+Rot+FOV first, then add DOF, POV, Replay Cuts, or Replay Freezes only when needed.")
			gmraAboutItem("Replay Freeze Flow", "Add it from Add Key Type, then open Active Freezes to edit or delete it.")
		elseif aboutActiveTab == "sections" then
			gmraAboutHeader("Main UI Parts")
			gmraAboutItem("Project", "Save and load your shot.")
			gmraAboutItem("Timeline", "Add keys and move the playhead.")
			gmraAboutItem("Add Keys", "Drop Position, Rotation, FOV, DOF, POV, speed, Replay Cut, and Replay Freeze keys.")
			gmraAboutItem("Selected Key Editor", "Edit the key you clicked.")
			gmraAboutItem("Smoothing", "Change how the camera flows.")
			gmraAboutItem(
				"Replays",
				"Bind replay layers and edit their timing.",
				"Use Timeline Start for replay position. Use Active Freezes for freeze ranges. Mute hides one layer. Solo lets only solo layers show."
			)
			gmraAboutItem("Settings", "Global options for the tool.")
		elseif aboutActiveTab == "tracks" then
			gmraAboutHeader("Track Rows")
			gmraAboutItem("Position", "Moves the camera.")
			gmraAboutItem("Rotation", "Points the camera.")
			gmraAboutItem("Field of View", "Changes zoom.")
			gmraAboutItem("DOF F-Stop", "Controls depth of field strength.")
			gmraAboutItem("DOF Focus Distance", "Controls what distance is in focus.")
			gmraAboutItem("DOF Sensor Width", "Shapes the depth of field look.")
			gmraAboutItem("Replay Speed", "Changes replay speed.")
			gmraAboutItem("Timeline Speed", "Changes animation speed.")
			gmraAboutItem("POV", "Locks to a player view.")
			gmraAboutItem("Replay Cuts", "Jumps the replay to a new time.")
			gmraAboutItem("Replay Freeze", "Pauses replay source time for part of a layer. Add it from Add Key Type.")
		elseif aboutActiveTab == "editing" then
			gmraAboutHeader("Editing Keys")
			gmraAboutItem("Click", "Select a key.")
			gmraAboutItem("Shift Select", "Select keys across rows so you can delete them together.")
			gmraAboutItem("Arrow Keys", "Left and Right step the playhead one keyframe at a time. Hold to move faster.")
			gmraAboutItem("Right Click", "Open the editor faster.")
			gmraAboutItem("Delete", "Remove the selected key or multi-selection.")
			gmraAboutHeader("Use The Camera")
			gmraAboutItem("Set Position", "Grab the current camera location.")
			gmraAboutItem("Set Rotation", "Grab the current camera rotation.")
			gmraAboutItem("Get Current DOF", "Pull the current depth of field values into the add builder.")
			gmraAboutItem("Live Edit", "Move the camera to update the key.")
			gmraAboutHeader("Replay Freeze Editing")
			gmraAboutItem("Active Freezes", "Open it to pick a freeze, move it to another layer, edit start/end, or delete it.")
			gmraAboutItem("Replay Bars", "The blue replay bars are view-only now. Edit replay timing with sliders and fields.")
		elseif aboutActiveTab == "terms" then
			gmraAboutHeader("Camera Terms")
			gmraAboutItem("FOV", "How wide the camera looks. Higher = wider, lower = more zoomed in.")
			gmraAboutItem("F-Stop", "How strong the blur is. Lower usually means more blur.")
			gmraAboutItem("Focal Distance", "What distance from the camera should be in focus.")
			gmraAboutItem("Sensor Width", "Changes the feel of the depth of field effect.")
			gmraAboutItem("Near Clip", "How close something can get to the camera before it gets cut off.")
			gmraAboutItem("POV", "Makes the camera follow a player view instead of freecam keys.")
			gmraAboutItem("Replay Speed", "Changes how fast the replay itself moves.")
			gmraAboutItem("Timeline Speed", "Changes how fast your camera animation moves.")
		elseif aboutActiveTab == "tips" then
			gmraAboutHeader("Easy Wins")
			gmraAboutItem("Build First", "Keep Preview Camera off while placing keys.")
			gmraAboutItem("Check After", "Turn Preview Camera on when you want to judge the shot.")
			gmraAboutItem("Use Freecam Edit", "Best for placing and live-editing keys from the camera.")
			gmraAboutItem("Use Recording Mode", "Good when you want fewer overlays while recording.")
			gmraAboutHeader("Replay Layers")
			gmraAboutItem("Layer Basics", "Each layer is its own replay source and timing strip.")
			gmraAboutItem("Mute", "Hide one replay layer without deleting it.")
			gmraAboutItem("Solo", "Only show the layers that have Solo on.")
			gmraAboutItem("Replay Freeze", "Use it when you want the replay to pause for part of the shot.")
			gmraAboutHeader("Common Confusions")
			gmraAboutItem("Depth Of Field", "DOF is a preview effect. Judge it with Preview Camera on.")
			gmraAboutItem("Replay Speed", "Changes replay source time speed.")
			gmraAboutItem("Timeline Speed", "Changes animation play speed.")
			gmraAboutItem("POV", "Best for player follow shots and player camera views.")
			gmraAboutItem("Free Camera", "Best for big cinematic moves.")
			gmraAboutItem("Replay Bars", "The bars at the bottom show replay timing, but you edit them with controls, not by dragging.")
			gmraAboutHeader("If You Get Lost")
			gmraAboutItem("Open These", "Project -> Timeline -> Add Keys -> Selected Key Editor")
		else
			gmraAboutHeader("Quick Start")
			gmraAboutStep("1", "Project", "Make or load a project.")
			gmraAboutStep("2", "Replay", "Add a replay layer and bind a replay.")
			gmraAboutStep("3", "Keys", "Use Add Key Type to place the keys you need.")
			gmraAboutStep("4", "Edit", "Click a key to change it.")
			gmraAboutStep("5", "Preview", "Turn Preview Camera on.")
			gmraAboutStep("6", "Record", "Record when it looks good.")
			gmraAboutHeader("What This Is")
			gmraAboutItem("Simple Version", "A tool for making replay camera shots.")
			gmraAboutItem(
				"Think Of It Like",
				"Project = shot, Timeline = motion, Add Keys = new keys, Editor = selected key."
			)
		end

		gmraUnindentBlock()
	end
end

function gmraDrawPOVAddBuilder(p: Project, idSuffix: string, addButtonLabel: string)
	gmraIndentBlock()
	local replayLayerMax = math.max(1, #p.replayLayers)
	povReplayLayerPick = clamp(povReplayLayerPick, 1, replayLayerMax)
	povReplayLayerPick =
		Gui.sliderInt("POV Target Layer##povAddLayer" .. idSuffix, povReplayLayerPick, 1, replayLayerMax)
	if Gui.beginCombo("POV Mode##povAddMode" .. idSuffix, povModeStrings[povModeIndex] or "1P") then
		for i = 1, #povModeStrings do
			if Gui.selectable(povModeStrings[i] .. "##povMode" .. tostring(i) .. idSuffix, i == povModeIndex) then
				povModeIndex = i
			end
		end
		Gui.endCombo()
	end
	local modeStr = povModeStrings[povModeIndex] or "1P"
	if modeStr ~= "1P" then
		Gui.beginDisabled()
	end
	povNearClipAdd = safeSliderFloat("Near Clip (1P only)##povNearClipAdd" .. idSuffix, povNearClipAdd, 0, 100)
	if modeStr ~= "1P" then
		Gui.endDisabled()
	end
	p.ui.hideNearestHead =
		Gui.checkbox("Hide Nearest Head On New 1P Key##povHideNearestHead" .. idSuffix, p.ui.hideNearestHead == true)
	if modeStr == "3P" then
		povOrbitAddState.modeIndex =
			comboIndex("3P Camera Style##povOrbitModeAdd" .. idSuffix, povOrbitAddState.modeIndex, povOrbitModeStrings)
		if Gui.collapsingHeader("3P Orbit Settings##pov3PAdd" .. idSuffix) then
			gmraIndentBlock()
			povOrbitAddState.radius =
				safeSliderFloat("Orbit Radius##povOrbitRadiusAdd" .. idSuffix, povOrbitAddState.radius, 0, 1000)
			povOrbitAddState.height =
				safeSliderFloat("Orbit Height##povOrbitHeightAdd" .. idSuffix, povOrbitAddState.height, -300, 300)
			povOrbitAddState.smoothing =
				safeSliderFloat("Orbit Smoothing##povOrbitSmoothingAdd" .. idSuffix, povOrbitAddState.smoothing, 0, 1)
			if povOrbitAddState.modeIndex == 1 then
				povOrbitAddState.lookAhead = safeSliderFloat(
					"Look Ahead Distance##povOrbitLookAheadAdd" .. idSuffix,
					povOrbitAddState.lookAhead,
					0,
					300
				)
				povOrbitAddState.velocityThreshold = safeSliderFloat(
					"Velocity Threshold##povOrbitThresholdAdd" .. idSuffix,
					povOrbitAddState.velocityThreshold,
					0,
					3000
				)
			else
				povOrbitAddState.manualSmoothingMultiplier = safeSliderFloat(
					"Manual Orbit Smoothing Multiplier##povManualOrbitSmoothAdd" .. idSuffix,
					povOrbitAddState.manualSmoothingMultiplier,
					0,
					1
				)
				povOrbitAddState.manualYaw =
					safeSliderFloat("Manual Yaw##povManualYawAdd" .. idSuffix, povOrbitAddState.manualYaw, -180, 180)
				povOrbitAddState.manualPitch =
					safeSliderFloat("Manual Pitch##povManualPitchAdd" .. idSuffix, povOrbitAddState.manualPitch, -89.9, 89.9)
				povOrbitAddState.autoSpin =
					Gui.checkbox("Auto Spin##povManualAutoSpinAdd" .. idSuffix, povOrbitAddState.autoSpin == true)
				povOrbitAddState.spinSpeed = safeSliderFloat(
					"Spin Speed (deg/sec)##povManualSpinSpeedAdd" .. idSuffix,
					povOrbitAddState.spinSpeed,
					-360,
					360
				)
				Gui.text("Preview + Arrows / WASD adjusts manual yaw and pitch.")
			end
			gmraUnindentBlock()
		end
	end
	local players = getAllPlayers()
	if Gui.collapsingHeader("Select Player##povPick" .. idSuffix) then
		gmraIndentBlock()
		if #players == 0 then
			Gui.text("No players present in game data.")
		else
			local _iconSearch = (type(Icon) == "table" and Icon.Search) or ""
			povPlayerNameSearch =
				Gui.inputText(_iconSearch .. " Filter by name##povFilter" .. idSuffix, povPlayerNameSearch)
			if Gui.beginListBox("Player List##povList" .. idSuffix) then
				for i = 1, #players do
					Gui.pushId("povPlr" .. tostring(i) .. idSuffix)
					local bp = players[i]
					local pl = getPlayer(bp)
					if pl then
						local nm = pl.playerName
						local ok = true
						if povPlayerNameSearch ~= "" then
							ok = string.find(string.lower(nm), string.lower(povPlayerNameSearch)) ~= nil
						end
						if ok then
							local isSelected = false
							if
								povSelectedBasicPlayer
								and bp.playerId == povSelectedBasicPlayer.playerId
								and bp.frameIndex == povSelectedBasicPlayer.frameIndex
							then
								isSelected = true
							end
							if Gui.selectable(nm .. "##pick" .. idSuffix, isSelected) then
								povSelectedBasicPlayer = bp
								povSelectedPlayerName = nm
								povPlayerNameSearch = ""
							end
						end
					end
					Gui.popId()
				end
				Gui.endListBox()
			end
		end
		gmraUnindentBlock()
	end
	Gui.text("Selected Player: " .. (povSelectedPlayerName ~= "" and povSelectedPlayerName or "(none)"))
	gmraUnindentBlock()
	if Gui.button(addButtonLabel .. idSuffix) then
		local pid = 0
		if povSelectedBasicPlayer then
			pid = povSelectedBasicPlayer.playerId
		end
		pushUndoOnce(p)
		local orbitMode: POVOrbitMode? = nil
		local orbitRadius: number? = nil
		local orbitHeight: number? = nil
		local orbitLookAheadDistance: number? = nil
		local orbitSmoothing: number? = nil
		local manualOrbitSmoothingMultiplier: number? = nil
		local orbitVelocityThreshold: number? = nil
		local manualOrbitYaw: number? = nil
		local manualOrbitPitch: number? = nil
		local manualOrbitAutoSpin: boolean? = nil
		local manualOrbitSpinSpeed: number? = nil
		if modeStr == "3P" then
			orbitMode = (povOrbitAddState.modeIndex == 2) and "MANUAL" or "AUTO"
			orbitRadius = povOrbitAddState.radius
			orbitHeight = povOrbitAddState.height
			orbitLookAheadDistance = povOrbitAddState.lookAhead
			orbitSmoothing = povOrbitAddState.smoothing
			manualOrbitSmoothingMultiplier = povOrbitAddState.manualSmoothingMultiplier
			orbitVelocityThreshold = povOrbitAddState.velocityThreshold
			manualOrbitYaw = povOrbitAddState.manualYaw
			manualOrbitPitch = povOrbitAddState.manualPitch
			manualOrbitAutoSpin = povOrbitAddState.autoSpin == true
			manualOrbitSpinSpeed = povOrbitAddState.spinSpeed
		end
		writePOVKey(
			p,
			playhead,
			pid,
			povModeIndex,
			povReplayLayerPick,
			povNearClipAdd,
			p.ui.hideNearestHead == true,
			orbitMode,
			orbitRadius,
			orbitHeight,
			orbitLookAheadDistance,
			orbitSmoothing,
			manualOrbitSmoothingMultiplier,
			orbitVelocityThreshold,
			manualOrbitYaw,
			manualOrbitPitch,
			manualOrbitAutoSpin,
			manualOrbitSpinSpeed
		)
	end
end

function gmraDrawReplayFreezeEditor(p: Project, layer: ReplayLayer, seg: ReplaySegment, idSuffix: string)
	layer.freezes = layer.freezes or {}
	local freezes = layer.freezes
	sortReplayFreezes(freezes)
	local segEnd = seg.dstStart + math.max(0, seg.srcEnd - seg.srcStart)
	if Gui.button("Add Replay Freeze @ Playhead##replayFreezeAdd" .. idSuffix) then
		pushUndoOnce(p)
		local startT = clamp(playhead, seg.dstStart, math.max(seg.dstStart, segEnd - p.snap))
		local endT = clamp(startT + math.max(1, p.snap), startT + p.snap, segEnd)
		freezes[#freezes + 1] = { startT = startT, endT = endT }
		sortReplayFreezes(freezes)
	end
	if #freezes == 0 then
		Gui.text("No replay freezes on this layer.")
		return
	end
	for i = 1, #freezes do
		local freeze = freezes[i]
		gmraClampReplayFreezeRange(seg, freeze, p.snap)
		Gui.separator()
		Gui.text("Replay Freeze " .. tostring(i))
		local oldStart = freeze.startT
		local newStart = alignTo(
			Gui.dragFloat("Start (s)##replayFreezeStart" .. idSuffix .. tostring(i), oldStart, p.snap, seg.dstStart, segEnd),
			p.snap
		)
		if not feq(oldStart, newStart, 1e-6) then
			pushUndoOnce(p)
			freeze.startT = newStart
		end
		local oldEnd = freeze.endT
		local newEnd = alignTo(
			Gui.dragFloat(
				"End (s)##replayFreezeEnd" .. idSuffix .. tostring(i),
				oldEnd,
				p.snap,
				freeze.startT + p.snap,
				segEnd
			),
			p.snap
		)
		if not feq(oldEnd, newEnd, 1e-6) then
			pushUndoOnce(p)
			freeze.endT = newEnd
		end
		gmraClampReplayFreezeRange(seg, freeze, p.snap)
		if Gui.button("Delete Replay Freeze##replayFreezeDelete" .. idSuffix .. tostring(i)) then
			pushUndoOnce(p)
			table.remove(freezes, i)
			break
		end
	end
end

function gmraDrawReplayFreezeStrips(
	p: Project,
	layerId: number,
	layer: ReplayLayer,
	seg: ReplaySegment,
	rangeStart: number,
	rangeEnd: number,
	suppressStripWriteThisFrame: boolean
)
	layer.freezes = layer.freezes or {}
	local freezes = layer.freezes
	if #freezes == 0 then
		return
	end
	sortReplayFreezes(freezes)
	local segEnd = seg.dstStart + math.max(0, seg.srcEnd - seg.srcStart)
	for i = 1, #freezes do
		local freeze = freezes[i]
		gmraClampReplayFreezeRange(seg, freeze, p.snap)
		Gui.text("Replay Freeze " .. tostring(i))
		if hasFn("rangeSlider") then
			local oldStart = freeze.startT
			local oldEnd = freeze.endT
			local widgetId = "replayFreezeStrip##layer" .. tostring(layerId) .. "##" .. tostring(i)
			if hasFn("beginDisabled") then
				Gui.beginDisabled()
			end
			Gui.rangeSlider(
				widgetId,
				Vec2.new(oldStart, oldEnd),
				rangeStart,
				rangeEnd,
				true
			)
			if hasFn("endDisabled") then
				Gui.endDisabled()
			end
		else
			local oldStart = freeze.startT
			local oldEnd = freeze.endT
			local startVal = alignTo(
				Gui.dragFloat(
					"Freeze Start##replayFreezeStripStart" .. tostring(layerId) .. "##" .. tostring(i),
					oldStart,
					p.snap,
					seg.dstStart,
					segEnd
				),
				p.snap
			)
			local endVal = alignTo(
				Gui.dragFloat(
					"Freeze End##replayFreezeStripEnd" .. tostring(layerId) .. "##" .. tostring(i),
					oldEnd,
					p.snap,
					startVal + p.snap,
					segEnd
				),
				p.snap
			)
			if not feq(oldStart, startVal, 1e-6) or not feq(oldEnd, endVal, 1e-6) then
				pushUndoOnce(p)
				freeze.startT = startVal
				freeze.endT = endVal
			end
		end
		gmraClampReplayFreezeRange(seg, freeze, p.snap)
	end
end

function gmraDrawReplayFreezeAddBuilder(p: Project)
	local replayLayerMax = math.max(1, #p.replayLayers)
	rfreezeLayerPickState = clamp(rfreezeLayerPickState, 1, replayLayerMax)
	local activeSeg = getActiveSegmentForLayerAtTime(p, rfreezeLayerPickState, playhead)
	gmraIndentBlock()
	if #p.replayLayers == 0 then
		Gui.text("Add a replay layer first.")
		gmraUnindentBlock()
		return
	end
	rfreezeLayerPickState = safeSliderInt("Target Layer##qq_rfreezeLayer", rfreezeLayerPickState, 1, replayLayerMax)
	rfreezeDurationInputState = Gui.dragFloat("Freeze Length (s)##qq_rfreezeLength", rfreezeDurationInputState, 0.05, p.snap, 99999)
	rfreezeDurationInputState = math.max(p.snap, rfreezeDurationInputState)
	local selectedLayer = p.replayLayers[rfreezeLayerPickState]
	selectedLayer.freezes = selectedLayer.freezes or {}
	local freezes = selectedLayer.freezes
	sortReplayFreezes(freezes)
	if activeSeg then
		local segEnd = activeSeg.dstStart + math.max(0, activeSeg.srcEnd - activeSeg.srcStart)
		local freezeEnd = clamp(playhead + rfreezeDurationInputState, playhead + p.snap, segEnd)
		Gui.text(string.format("New Freeze: %.3f -> %.3f", playhead, freezeEnd))
	else
		Gui.text("Move the playhead onto this layer's replay segment first.")
	end
	if Gui.collapsingHeader("Active Freezes##qq_rfreezeHeader") then
		gmraIndentBlock()
		if #freezes > 0 then
			local freezeOptions = {}
			for i = 1, #freezes do
				local f = freezes[i]
				freezeOptions[i] = string.format("Freeze %d  %.3f -> %.3f", i, f.startT, f.endT)
			end
			rfreezeSelectedIndexState = clamp(rfreezeSelectedIndexState, 1, #freezeOptions)
			rfreezeSelectedIndexState = comboIndex("Freeze List##qq_rfreezeActive", rfreezeSelectedIndexState, freezeOptions)
			local selectedFreeze = freezes[rfreezeSelectedIndexState]
			if selectedFreeze and activeSeg then
				gmraClampReplayFreezeRange(activeSeg, selectedFreeze, p.snap)
				local editLayer = safeSliderInt("Edit Layer##qq_rfreezeEditLayer", rfreezeLayerPickState, 1, replayLayerMax)
				if editLayer ~= rfreezeLayerPickState then
					pushUndoOnce(p)
					local moved = selectedFreeze
					table.remove(freezes, rfreezeSelectedIndexState)
					local targetLayer = p.replayLayers[editLayer]
					targetLayer.freezes = targetLayer.freezes or {}
					targetLayer.freezes[#targetLayer.freezes + 1] = moved
					sortReplayFreezes(targetLayer.freezes)
					rfreezeLayerPickState = editLayer
					rfreezeSelectedIndexState = #targetLayer.freezes
					selectedLayer = targetLayer
					freezes = targetLayer.freezes
					selectedFreeze = freezes[rfreezeSelectedIndexState]
					activeSeg = getActiveSegmentForLayerAtTime(p, rfreezeLayerPickState, playhead)
				end
				if selectedFreeze and activeSeg then
					local oldStart = selectedFreeze.startT
					local newStart = alignTo(
						Gui.dragFloat("Start (s)##qq_rfreezeEditStart", oldStart, p.snap, activeSeg.dstStart, activeSeg.dstStart + math.max(0, activeSeg.srcEnd - activeSeg.srcStart)),
						p.snap
					)
					if not feq(oldStart, newStart, 1e-6) then
						pushUndoOnce(p)
						selectedFreeze.startT = newStart
					end
					local segEnd = activeSeg.dstStart + math.max(0, activeSeg.srcEnd - activeSeg.srcStart)
					local oldEnd = selectedFreeze.endT
					local newEnd = alignTo(
						Gui.dragFloat("End (s)##qq_rfreezeEditEnd", oldEnd, p.snap, selectedFreeze.startT + p.snap, segEnd),
						p.snap
					)
					if not feq(oldEnd, newEnd, 1e-6) then
						pushUndoOnce(p)
						selectedFreeze.endT = newEnd
					end
					gmraClampReplayFreezeRange(activeSeg, selectedFreeze, p.snap)
					if Gui.button("Delete Selected Freeze##qq_rfreezeDelete") then
						pushUndoOnce(p)
						table.remove(freezes, rfreezeSelectedIndexState)
						rfreezeSelectedIndexState = clamp(rfreezeSelectedIndexState, 1, math.max(1, #freezes))
					end
				end
			end
		else
			Gui.text("None")
		end
		gmraUnindentBlock()
	end
	gmraUnindentBlock()
	if activeSeg and Gui.button("Add Replay Freeze @ Playhead##qq_rfreezeInline") then
		pushUndoOnce(p)
		gmraAddReplayFreeze(
			p.replayLayers[rfreezeLayerPickState],
			activeSeg,
			playhead,
			playhead + rfreezeDurationInputState,
			p.snap
		)
		local updated = p.replayLayers[rfreezeLayerPickState].freezes or {}
		rfreezeSelectedIndexState = math.max(1, #updated)
	end
end

function gmraDrawReplaysSection(p: Project)
	if Gui.collapsingHeader("Replays") then
		gmraIndentBlock()
		gmraIndentBlock()
		Gui.text("Load replays in F6, then bind them here.")
		if Gui.button("Add Layer##addLayer") then
			pushUndoOnce(p)
			table.insert(p.replayLayers, {
				name = "Replay Layer " .. tostring(#p.replayLayers + 1),
				muted = false,
				solo = false,
				segments = {},
				freezes = {},
			})
			p.ui.selectedReplayLayerId = #p.replayLayers
		end
		if Gui.button("Remove Selected Layer##rmLayer") then
			pushUndoOnce(p)
			removeReplayLayer(p, clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers))
		end
		p.ui.selectedReplayLayerId =
			Gui.sliderInt("Active Replay Layer##selLayer", p.ui.selectedReplayLayerId, 1, #p.replayLayers)
		local L = p.replayLayers[clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers)]
		if L then
			Gui.separator() -- layer
			L.muted = Gui.checkbox("Mute##mute", L.muted == true)
			L.solo = Gui.checkbox("Solo##solo", L.solo == true)
			local seg = (L.segments and L.segments[1]) or nil
			local loaded = Replay.listLoaded()
			Gui.separator() -- Loaded Replays (from F6)
			if #loaded == 0 then
				Gui.text("None loaded. Open Replay (F6) and click Load.")
			else
				if Gui.beginListBox("Loaded##loadedList") then
					for i = 1, #loaded do
						local nm = loaded[i]
						local picked = (replayPicked ~= "" and string.find(nm, replayPicked, 1, true) ~= nil)
						if Gui.selectable(nm .. "##ld", picked) then
							replayPicked = nm
						end
					end
					Gui.endListBox()
				end
			end
			Gui.separator()
			if Gui.button("Bind Active Layer To Loaded Replay##bindLoaded") then
				if replayPicked ~= "" then
					pushUndoOnce(p)
					if getLoadedReplayIndexByName(replayPicked) then
						bindLayerToLoadedReplay(p, clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers), replayPicked)
					end
				end
			end
			if Gui.button("Clear Active Layer Replay##clearSeg") then
				pushUndoOnce(p)
				clearArray(L.segments)
				L.freezes = {}
				if p.ui.masterReplayName == (seg and seg.replayName or "") then
					p.ui.masterReplayName = ""
				end
			end
			Gui.separator() -- Active Layer Segment
			seg = (L.segments and L.segments[1]) or nil
			if seg then
				Gui.text("Assigned: " .. seg.replayName)
				seg.dstStart = alignTo(
					Gui.dragFloat(
						"Timeline Start##dst",
						seg.dstStart,
						p.snap,
						p.timelineStart - 9999,
						p.timelineEnd + 9999
					),
					p.snap
				)
				local durGuess = getLoadedReplayDurationIfAvailable(seg.replayName)
				if durGuess then
					replayPickedDuration = durGuess
				end
				local maxEnd = durGuess or seg.srcEnd
				local prevSrcStart = seg.srcStart
				local prevSrcEnd = seg.srcEnd
				local newSrcStart =
					Gui.dragFloat("Replay Start##srcStart", prevSrcStart, 0.1, 0, math.max(0, prevSrcEnd - 0.01))
				local newSrcEnd = Gui.dragFloat(
					"Replay End##srcEnd",
					prevSrcEnd,
					0.1,
					prevSrcStart + 0.01,
					(maxEnd or (prevSrcEnd + 999999))
				)
				seg.srcStart = clamp(newSrcStart, 0, prevSrcEnd - 0.01)
				seg.srcEnd = math.max(newSrcEnd, prevSrcStart + 0.01)
				local mapped = replayTimeForLayerAtPlayhead(
					p,
					clamp(p.ui.selectedReplayLayerId, 1, #p.replayLayers),
					seg,
					playhead
				)
				Gui.text(string.format("At timeline %.3f -> replay %.3f", playhead, mapped))
				Gui.separator()
				Gui.text("Replay Freeze")
				Gui.text("Use Add Key Type -> Replay Freeze to add one.")
				Gui.text("Replay bars are locked. Use Timeline Start and Active Freezes to edit them.")
			else
				Gui.text("Assigned: (none)")
				Gui.separator()
				Gui.text("Replay Freeze")
				Gui.text("Bind a replay to this layer before adding freezes.")
			end
		end
		gmraUnindentBlock()
		gmraUnindentBlock()
	end
end
function gmraDrawSettingsSection(p: Project)
	if Gui.collapsingHeader("Settings") then
		gmraIndentBlock()
		if Gui.collapsingHeader("Timeline##cfgTimelineSection") then
			gmraIndentBlock()
			local prevSnap = globalSnapStep
			globalSnapStep = Gui.dragFloat("Snap Step (seconds)##cfgSnap", globalSnapStep, 0.01, 0, 1)
			globalSnapStep = math.max(1e-4, globalSnapStep)
			if not feq(prevSnap, globalSnapStep, 1e-4) then
				config.timelineSnapStep = globalSnapStep
				p.snap = globalSnapStep
				safeSaveConfig()
			end
			local prevTStart = globalTimelineStart
			local prevTEnd = globalTimelineEnd
			local tr = Gui.dragFloat2(
				"Timeline Start / End##cfgTimelineRange",
				Vec2.new(globalTimelineStart, globalTimelineEnd),
				0.1,
				-9999,
				999999
			)
			globalTimelineStart = tr.x
			globalTimelineEnd = math.max(tr.y, globalTimelineStart + 0.1)
			if not feq(prevTStart, globalTimelineStart, 1e-4) or not feq(prevTEnd, globalTimelineEnd, 1e-4) then
				config.timelineStartGlobal = globalTimelineStart
				config.timelineEndGlobal = globalTimelineEnd
				p.timelineStart = globalTimelineStart
				p.timelineEnd = globalTimelineEnd
				safeSaveConfig()
			end
			local prevAuto = globalAutoScrollSpeed
			globalAutoScrollSpeed = Gui.sliderFloat("Auto-Scroll Speed##cfgScrollSpeed", globalAutoScrollSpeed, 0.1, 10)
			if not feq(prevAuto, globalAutoScrollSpeed, 1e-4) then
				config.timelineAutoScrollSpeed = globalAutoScrollSpeed
				p.ui.scrollSpeed = globalAutoScrollSpeed
				safeSaveConfig()
			end
			local prevTlInPreview = config.previewTimelineInPreview == true
			local tlInPreview =
				Gui.checkbox("Enable Timeline While Preview Camera Is ON##cfgTlInPreview", prevTlInPreview)
			if tlInPreview ~= prevTlInPreview then
				config.previewTimelineInPreview = tlInPreview
				safeSaveConfig()
			end
			gmraUnindentBlock()
		end
		if Gui.collapsingHeader("World Draw / Preview##cfgWorldDrawSection") then
			gmraIndentBlock()
			local prevShowPath = showPath
			showPath = Gui.checkbox("Show Camera Path In World##path", showPath)
			if prevShowPath ~= showPath then
				config.showPath = showPath
				safeSaveConfig()
			end
			local prevShowSm = showPathSmoothedLine
			showPathSmoothedLine = Gui.checkbox("Show Smoothed Line##pathSmooth", showPathSmoothedLine)
			if prevShowSm ~= showPathSmoothedLine then
				config.showPathSmoothedLine = showPathSmoothedLine
				safeSaveConfig()
			end
			local prevShowRaw = showPathRawLine
			showPathRawLine = Gui.checkbox("Show Raw Line##pathRaw", showPathRawLine)
			if prevShowRaw ~= showPathRawLine then
				config.showPathRawLine = showPathRawLine
				safeSaveConfig()
			end
			local prevShowDots = showPathDots
			showPathDots = Gui.checkbox("Show Dots##pathDots", showPathDots)
			if prevShowDots ~= showPathDots then
				config.showPathDots = showPathDots
				safeSaveConfig()
			end
			local prevLook = showLookDirection
			showLookDirection = Gui.checkbox("Show Camera Look Direction##lookDir", showLookDirection)
			if prevLook ~= showLookDirection then
				config.showLookDirection = showLookDirection
				safeSaveConfig()
			end
			if showLookDirection then
				local prevLen = lookRayLength
				lookRayLength = Gui.sliderFloat("Look Direction Length##lookLen", lookRayLength, 50, 3000)
				if not feq(prevLen, lookRayLength, 1e-3) then
					config.lookRayLength = lookRayLength
					safeSaveConfig()
				end
			end
			local prevGhost = showGhostFrustum
			showGhostFrustum = Gui.checkbox("Show Ghost Frustum##ghostFrustum", showGhostFrustum)
			if prevGhost ~= showGhostFrustum then
				config.showGhostFrustum = showGhostFrustum
				safeSaveConfig()
			end
			if showGhostFrustum then
				local prevAlong = showGhostFrustumAlongPath
				showGhostFrustumAlongPath =
					Gui.checkbox("Draw Ghost Frustum Along Path##ghostFrustumAlong", showGhostFrustumAlongPath)
				if prevAlong ~= showGhostFrustumAlongPath then
					config.showGhostFrustumAlongPath = showGhostFrustumAlongPath
					safeSaveConfig()
				end
				local prevGhostLen = ghostFrustumLength
				ghostFrustumLength =
					Gui.sliderFloat("Ghost Frustum Length##ghostFrustumLen", ghostFrustumLength, 50, 4000)
				if not feq(prevGhostLen, ghostFrustumLength, 1e-3) then
					config.ghostFrustumLength = ghostFrustumLength
					safeSaveConfig()
				end
				local prevGhostStep = ghostFrustumStepSeconds
				ghostFrustumStepSeconds =
					Gui.sliderFloat("Ghost Frustum Step (s)##ghostFrustumStep", ghostFrustumStepSeconds, 0.05, 3)
				if not feq(prevGhostStep, ghostFrustumStepSeconds, 1e-3) then
					config.ghostFrustumStepSeconds = ghostFrustumStepSeconds
					safeSaveConfig()
				end
				local prevGhostAspect = ghostFrustumAspect
				ghostFrustumAspect =
					Gui.sliderFloat("Ghost Frustum Aspect##ghostFrustumAspect", ghostFrustumAspect, 0.5, 3)
				if not feq(prevGhostAspect, ghostFrustumAspect, 1e-3) then
					config.ghostFrustumAspect = ghostFrustumAspect
					safeSaveConfig()
				end
			end
			local prevSps = samplesPerSecond
			samplesPerSecond = Gui.sliderFloat("Path Samples / Sec##sps", samplesPerSecond, 2, 60)
			if not feq(prevSps, samplesPerSecond, 1e-3) then
				config.pathSamplesPerSecond = samplesPerSecond
				safeSaveConfig()
			end
			gmraUnindentBlock()
		end
		if Gui.collapsingHeader("Keybinds##cfgSettingsKeybinds") then
			gmraIndentBlock()
			gmraDrawKeybindSettings(false)
			gmraUnindentBlock()
		end
		if Gui.collapsingHeader("Debug##cfgDebugSection") then
			gmraIndentBlock()
			local prevApplyPos = debugPreviewApplyPosition
			debugPreviewApplyPosition =
				Gui.checkbox("Preview Apply Position Track##cfgDbgApplyPos", debugPreviewApplyPosition)
			if prevApplyPos ~= debugPreviewApplyPosition then
				config.debugPreviewApplyPosition = debugPreviewApplyPosition
				safeSaveConfig()
			end
			local prevApplyRot = debugPreviewApplyRotation
			debugPreviewApplyRotation =
				Gui.checkbox("Preview Apply Rotation Track##cfgDbgApplyRot", debugPreviewApplyRotation)
			if prevApplyRot ~= debugPreviewApplyRotation then
				config.debugPreviewApplyRotation = debugPreviewApplyRotation
				safeSaveConfig()
			end
			Gui.text("Use these to isolate whether preview jitter is coming from position or rotation.")
			if Gui.button("Dump Rotation Debug##cfgDbgDump") then
				gmraDumpRotationDebug(p)
			end
			if Gui.button("Clear Rotation Debug##cfgDbgDumpClear") then
				GMRA_ROTATION_DEBUG_DUMP_TEXT = ""
				GMRA_ROTATION_DEBUG_DUMP_STATUS = ""
				config.rotationDebugDump = ""
				config.rotationDebugDumpStatus = ""
				gmraClearStoredRotationDebugDump()
				safeSaveConfig()
			end
			if GMRA_ROTATION_DEBUG_DUMP_STATUS ~= "" then
				Gui.text(GMRA_ROTATION_DEBUG_DUMP_STATUS)
				Gui.text("The latest dump is also saved into the script config.")
			end
			if GMRA_ROTATION_DEBUG_DUMP_TEXT ~= "" then
				if Gui.beginListBox("Rotation Debug Output##cfgDbgDumpBox") then
					local shown = 0
					for line in string.gmatch(GMRA_ROTATION_DEBUG_DUMP_TEXT, "([^\n]+)") do
						Gui.text(line)
						shown += 1
						if shown >= 160 then
							break
						end
					end
					Gui.endListBox()
				end
			end
			Gui.text("Loaded replays: " .. tostring(#Replay.listLoaded()))
			if Gui.button("Test Unload All Replays##cfgReplayUnloadAll") then
				gmraUnloadAllLoadedReplaysForTest()
			end
			if replayTestStatus ~= "" then
				Gui.text(replayTestStatus)
			end
			gmraUnindentBlock()
		end
		gmraUnindentBlock()
	end
end

local laneNonce = {
	pos = 0,
	rot = 0,
	fov = 0,
	dofFstop = 0,
	dofFocalDistance = 0,
	dofSensorWidth = 0,
	speed = 0,
	tlspeed = 0,
	pov = 0,
	rc = 0,
}
local activeLane = ""
local lastSelectedByLane: { [string]: { number } } = {}
local dragStartPtsByLane: { [string]: { Vec2 } } = {}
local dragStartTimesByLane: { [string]: { number } } = {}
local dragKeyRefsByLane: { [string]: { any } } = {}
local dragSelectedByLane: { [string]: { number } } = {}
local dragLastDeltaByLane: { [string]: number } = {}
local wasDraggingLane: { [string]: boolean } = {}
function gmraInvalidateLaneWidgets()
	activeLane = ""
	for k, _ in pairs(laneNonce) do
		laneNonce[k] = (laneNonce[k] or 0) + 1
	end
	lastSelectedByLane = {}
	dragStartPtsByLane = {}
	dragStartTimesByLane = {}
	dragKeyRefsByLane = {}
	dragSelectedByLane = {}
	dragLastDeltaByLane = {}
	wasDraggingLane = {}
end
function onGuiImpl()
	Gui.separator() -- Replay Camera Animator
	Gui.text("Mode: " .. mode .. (animating and " (playing)" or ""))
	Gui.separator()
	gmraDrawAboutSection()
	if Gui.collapsingHeader("Project") then
		gmraIndentBlock()
		local names = getProjectNames()
		local curName = projectNameInput
		if curName == "" and #names > 0 then
			curName = names[1]
		end
		if Gui.beginCombo("Current Project##curCombo", curName ~= "" and curName or "(none)") then
			for i = 1, #names do
				local nm = names[i]
				if Gui.selectable(nm .. "##p" .. tostring(i), nm == curName) then
					projectNameInput = nm
				end
			end
			Gui.endCombo()
		end
		if Gui.button("Load Project##proj") then
			if projectNameInput ~= "" then
				loadProjectByName(projectNameInput)
			end
		end
		Gui.sameLine()
		if Gui.button("Save Project##proj") and project then
			saveProject(project :: Project)
		end
		Gui.sameLine()
		if Gui.button("Delete Project##proj") then
			local name = projectNameInput
			if name ~= "" and config.projects and config.projects[name] then
				config.projects[name] = nil
				if project and (project :: Project).projectName == name then
					project = nil
					projectNameInput = ""
				end
				if config.lastProject == name then
					config.lastProject = ""
				end
				safeSaveConfig()
			end
		end
		newProjectNameInput = Gui.inputText("New Project Name##new", newProjectNameInput)
		if Gui.button("Create New Project##proj") then
			project = makeEmptyProject(newProjectNameInput ~= "" and newProjectNameInput or "Untitled")
			projectNameInput = (project :: Project).projectName
			saveProject(project :: Project)
		end
		gmraUnindentBlock()
	end
	if not project then
		Gui.text("Create or load a project to begin.")
		return
	end
	local p = project :: Project
	beginUndoFrame()
	gmraUpdateKeybindCapture()
	p.snap = math.max(1e-4, globalSnapStep)
	p.timelineStart = globalTimelineStart
	p.timelineEnd = math.max(globalTimelineEnd, p.timelineStart + 0.1)
	p.ui.scrollSpeed = globalAutoScrollSpeed
	if Gui.collapsingHeader("Timeline") then
		gmraIndentBlock()
		Gui.separator() -- Timeline
		local _iconPause = (type(Icon) == "table" and Icon.Pause) or "||"
		local _iconPlay = (type(Icon) == "table" and Icon.Play) or ">"
		local playLabel = animating and (_iconPause .. " Pause") or (_iconPlay .. " Play")
		if Gui.button(playLabel .. "##playPause") then
			animating = not animating
		end
		Gui.sameLine()
		if Gui.button("Undo##undo") then
			doUndo()
		end
		Gui.sameLine()
		Gui.text(string.format("Playhead: %.3fs", playhead))
		if Gui.button((previewEnabled and "Preview: ON" or "Preview: OFF") .. "##previewToggle") then
			previewEnabled = not previewEnabled
		end
		Gui.sameLine()
		if Gui.button((editing and "Freecam: ON" or "Freecam: OFF") .. "##freecamEdit") then
			editing = not editing
		end
		Gui.sameLine()
		Gui.setItemTooltip("ON = follow freecam while editing. OFF = no freecam follow.")
		if Gui.button((recordingModeProfile and "Recording: ON" or "Recording: OFF") .. "##timelineRecordingMode") then
			recordingModeProfile = not recordingModeProfile
			config.recordingModeProfile = recordingModeProfile
			safeSaveConfig()
			if recordingModeProfile then
				WorldDraw.clear()
			end
		end
		Gui.separator()
		if Gui.button("Copy##clipCopy") then
			copySelectedKeysToClipboard(p)
		end
		Gui.sameLine()
		if Gui.button("Paste##clipPaste") then
			pasteClipboardAtPlayhead(p, playhead)
		end
		Gui.sameLine()
		if Gui.button("Duplicate##clipDup") then
			duplicateSelectedKeysForward(p)
		end
		if keyClipboardRow ~= "" and #keyClipboardEntries > 0 then
			local keyWord = (#keyClipboardEntries == 1) and "key" or "keys"
			Gui.sameLine()
			Gui.text(
				string.format(
					"Clip: %s (%d %s, %.3fs)",
					keyClipboardRow,
					#keyClipboardEntries,
					keyWord,
					keyClipboardSpan
				)
			)
		else
			Gui.sameLine()
			Gui.text("Clip: empty")
		end
		Gui.separator()
		local replaySpeedVal = evalNum(p.tracks.speed, playhead)
		local tlSpeedVal = evalNum(p.tracks.timelineSpeed, playhead)
		addKeyTypeIndex = comboIndex("Type##qq_keyType", addKeyTypeIndex, addKeyTypeOptions)
		Gui.sameLine()
		if Gui.button("Add Pos+Rot+FOV##qq_prf") then
			pushUndoOnce(p)
			writePositionKey(p, playhead)
			writeRotationKey(p, playhead)
			writeFovKey(p, playhead)
		end
		Gui.setItemTooltip("Quick add for a full camera pose.")
		local addKeyType = addKeyTypeOptions[addKeyTypeIndex] or "Position"
		if addKeyType == "Position" then
			if Gui.button("Add Position Key @ Playhead##qq_posInline") then
				pushUndoOnce(p)
				writePositionKey(p, playhead)
			end
		elseif addKeyType == "Rotation" then
			if Gui.button("Add Rotation Key @ Playhead##qq_rotInline") then
				pushUndoOnce(p)
				writeRotationKey(p, playhead)
			end
		elseif addKeyType == "FOV" then
			gmraIndentBlock()
			addFovValue = Gui.dragFloat("FOV Value##qq_fovValue", addFovValue, 0.25, 1, 179)
			Gui.text(string.format("Current camera FOV: %.2f", camera.fieldOfView))
			if Gui.button("Get Current FOV##qq_useCurrentFov") then
				addFovValue = camera.fieldOfView
			end
			gmraUnindentBlock()
			if Gui.button("Add FOV Key @ Playhead##qq_fovInline") then
				pushUndoOnce(p)
				local tt = alignTo(playhead, p.snap)
				upsertNumKey(p.tracks.fov, tt, clamp(addFovValue, 1, 179), "smooth")
			end
		elseif addKeyType == "Depth Of Field" then
			gmraIndentBlock()
			addDofFstopValue = Gui.dragFloat("F-Stop Value##qq_dofFstop", addDofFstopValue, 0.05, 0, 256)
			addDofFocalDistanceValue =
				Gui.dragFloat("Focal Distance##qq_dofFocal", addDofFocalDistanceValue, 0.1, 0, 100000)
			addDofSensorWidthValue = Gui.dragFloat("Sensor Width##qq_dofSensor", addDofSensorWidthValue, 0.1, 0, 10000)
			if Gui.button("Get Current DOF##qq_useCurrentDof") then
				local curFstop, curFocalDistance, curSensorWidth = gmraReadCurrentDOF()
				addDofFstopValue = curFstop
				addDofFocalDistanceValue = curFocalDistance
				addDofSensorWidthValue = curSensorWidth
			end
			gmraUnindentBlock()
			if Gui.button("Add Depth Of Field Keys @ Playhead##qq_dofInline") then
				pushUndoOnce(p)
				writeDOFKeys(p, playhead, addDofFstopValue, addDofFocalDistanceValue, addDofSensorWidthValue)
			end
		elseif addKeyType == "Replay Speed" then
			gmraIndentBlock()
			replaySpeedVal = Gui.dragFloat("Replay Speed Value##qq_replaySpdVal", replaySpeedVal, 0.05, 0.05, 10)
			gmraUnindentBlock()
			if Gui.button("Add Replay Speed Key @ Playhead##qq_replaySpdInline") then
				pushUndoOnce(p)
				writeSpeedKey(p, playhead, replaySpeedVal)
			end
		elseif addKeyType == "Timeline Speed" then
			gmraIndentBlock()
			tlSpeedVal = Gui.dragFloat("Timeline Speed Value##qq_tlSpdVal", tlSpeedVal, 0.05, 0.05, 10)
			gmraUnindentBlock()
			if Gui.button("Add Timeline Speed Key @ Playhead##qq_tlSpdInline") then
				pushUndoOnce(p)
				tlSpeedVal = math.max(0.05, tlSpeedVal)
				local tt = alignTo(playhead, p.snap)
				upsertNumKey(p.tracks.timelineSpeed, tt, tlSpeedVal, "smooth")
			end
		elseif addKeyType == "POV" then
			gmraIndentBlock()
			Gui.text("Pick the player, mode, and layer, then add the POV key.")
			gmraUnindentBlock()
			gmraDrawPOVAddBuilder(p, "InlineAdd", "Add POV Key @ Playhead##qq_povInline")
		elseif addKeyType == "Replay Cut" then
			local replayLayerMax = math.max(1, #p.replayLayers)
			rcutLayerPickState = clamp(rcutLayerPickState, 1, replayLayerMax)
			local rcutAutoSrcT = 0
			do
				local seg = getActiveSegmentForLayerAtTime(p, rcutLayerPickState, playhead)
				if seg then
					rcutAutoSrcT = replayTimeForLayerAtPlayhead(p, rcutLayerPickState, seg, playhead)
				end
			end
			gmraIndentBlock()
			if #p.replayLayers == 0 then
				Gui.text("Add a replay layer first.")
			else
				rcutLayerPickState = safeSliderInt("Target Layer##qq_rcutLayer", rcutLayerPickState, 1, replayLayerMax)
				Gui.text(string.format("Replay time at playhead: %.3fs", rcutAutoSrcT))
				if Gui.button("Get Current Replay Time##qq_rcutSnap") then
					rcutJumpInputState = rcutAutoSrcT
				end
				rcutJumpInputState = Gui.dragFloat("Jump To Time (s)##qq_rcutJump", rcutJumpInputState, 0.1, 0, 99999)
			end
			gmraUnindentBlock()
			if #p.replayLayers > 0 and Gui.button("Add Replay Cut Key @ Playhead##qq_rcutInline") then
				pushUndoOnce(p)
				writeReplayCutKey(p, playhead, rcutLayerPickState, rcutJumpInputState)
			end
		else
			gmraDrawReplayFreezeAddBuilder(p)
		end

		local function sameIndexList(a: { number }, b: { number }): boolean
			if #a ~= #b then
				return false
			end
			for i = 1, #a do
				if a[i] ~= b[i] then
					return false
				end
			end
			return true
		end
		local function selectLane(base: string, rowName: string, idx: number, selectedIdxs: { number }?)
			local preserveOthers = gmraShiftHeld()
			if activeLane ~= base then
				activeLane = base
			end
			if not preserveOthers then
				for k, _ in pairs(laneNonce) do
					if k ~= base then
						laneNonce[k] = (laneNonce[k] or 0) + 1
					end
				end
				gmraClearSelectedAcrossRows()
			end
			selectedByBase[base] = selectedIdxs or { idx }
			p.ui.selectedRow = rowName
			p.ui.selectedKeyIndex = idx
		end
		local function selectFromLane(
			base: string,
			rowName: string,
			pts: { Vec2 },
			selectedIdxs: { number },
			prevSelected: { number }
		)
			if #selectedIdxs == 0 then
				return
			end
			local selIdx = selectedIdxs[1]
			if not pts[selIdx] then
				return
			end
			local selectionChanged = not sameIndexList(selectedIdxs, prevSelected)
			if selectionChanged or p.ui.selectedRow ~= rowName or p.ui.selectedKeyIndex ~= selIdx then
				selectLane(base, rowName, selIdx, selectedIdxs)
			end
		end
		local function computeRangeStartRounded()
			p.ui.rangeStart = clamp(p.ui.rangeStart, p.timelineStart, p.timelineEnd)
			p.ui.rangeEnd = clamp(p.ui.rangeEnd, p.ui.rangeStart + 0.1, p.timelineEnd)
			return roundUp(p.ui.rangeStart, p.snap)
		end
		if Gui.beginTable("TimelineTable##main", 2) then
			Gui.tableSetupColumn("Name")
			Gui.tableSetupColumn("Timeline")
			Gui.tableHeadersRow()
			Gui.tableNextRow()
			Gui.tableNextColumn()
			Gui.text("Timeline Window")
			Gui.tableNextColumn()
			local timelineWindowBefore = Vec2.new(p.ui.rangeStart, p.ui.rangeEnd)
			if hasFn("rangeSlider") then
				local r = Gui.rangeSlider("timelineWindow##track", timelineWindowBefore, p.timelineStart, p.timelineEnd, true)
				p.ui.rangeStart = r.x
				p.ui.rangeEnd = r.y
			else
				p.ui.rangeStart =
					Gui.dragFloat("Window Start##wS_track", p.ui.rangeStart, 0.1, p.timelineStart, p.timelineEnd)
				p.ui.rangeEnd =
					Gui.dragFloat("Window End##wE_track", p.ui.rangeEnd, 0.1, p.ui.rangeStart + 0.1, p.timelineEnd)
			end
			local timelineWindowInteractingThisFrame = false
			if hasFn("rangeSlider") then
				timelineWindowInteractingThisFrame = gmraUpdateTimelineWindowDragOwnership()
			end
			local timelineWindowDeltaEps = math.max(1e-4, p.snap * 0.25)
			local timelineWindowChangedThisFrame =
				(math.abs(timelineWindowBefore.x - p.ui.rangeStart) > timelineWindowDeltaEps) or
				(math.abs(timelineWindowBefore.y - p.ui.rangeEnd) > timelineWindowDeltaEps)
			local suppressStripWriteThisFrame = timelineWindowInteractingThisFrame or timelineWindowChangedThisFrame
			local rangeStartRounded = computeRangeStartRounded()
			Gui.tableNextRow()
			Gui.tableNextColumn()
			Gui.text("Playhead Scrubber")
			Gui.tableNextColumn()
			local playheadBeforeScrub = playhead
			if hasFn("timeline") then
				local timelineSnap = (animating and previewEnabled) and 0 or p.snap
				playhead = Gui.timeline("timeline##track", playhead, rangeStartRounded, p.ui.rangeEnd, timelineSnap)
			else
				playhead = Gui.sliderFloat("Playhead (s)##ph_track", playhead, rangeStartRounded, p.ui.rangeEnd)
			end
			if not feq(playheadBeforeScrub, playhead, 1e-6) then
				gmraInvalidateLaneWidgets()
			end
			local function laneId(base: string): string
				return "lane##" .. base .. "##n" .. tostring(laneNonce[base] or 0)
			end
			local function drawLane(rowName: string, keys, base: string)
				Gui.tableNextRow()
				Gui.tableNextColumn()
				Gui.text(rowName)
				Gui.tableNextColumn()
				local pts = pointsFromKeys(keys)
				local laneKey = laneId(base)
				local laneDraggingNow = false
				if hasFn("keyframeRow") then
					local prevDragging = (wasDraggingLane[laneKey] == true)
					local lockedPrevSelected: { number } = dragSelectedByLane[laneKey] or {}
					local prevSelected: { number } = lastSelectedByLane[laneKey] or {}
					if prevDragging and #lockedPrevSelected > 0 then
						prevSelected = lockedPrevSelected
					end
					local ptsForWidget = copyPoints(pts)
					if prevDragging and (#prevSelected > 0) then
						local eps = math.max(p.snap * 0.5, 1e-4)
						local dragStart = dragStartPtsByLane[laneKey] or {}
						for i = 1, #dragStart do
							local at = pointAtX(ptsForWidget, dragStart[i].x, eps)
							if at ~= -1 and prevSelected[i] and at ~= prevSelected[i] then
								table.insert(ptsForWidget, ptsForWidget[#ptsForWidget])
							end
						end
					end
					local newPts =
						Gui.keyframeRow(laneKey, ptsForWidget, playhead, rangeStartRounded, p.ui.rangeEnd, p.snap)
					local draggingNow = hasFn("keyframeRowIsDragging") and (Gui.keyframeRowIsDragging(laneKey) == true)
						or false
					laneDraggingNow = draggingNow
					local selectedIdxs: { number } = {}
					if hasFn("keyframeRowSelectedKeyframes") then
						selectedIdxs = Gui.keyframeRowSelectedKeyframes(laneKey) or {}
					end
					local lockedSelectedNow: { number } = dragSelectedByLane[laneKey] or {}
					if draggingNow and #lockedSelectedNow > 0 then
						selectedIdxs = lockedSelectedNow
					elseif #selectedIdxs == 0 then
						selectedIdxs = prevSelected
					end
					local rightClickOnLane = Gui.isItemHovered() and rightMousePressed()
					if rightClickOnLane then
						if #selectedIdxs > 0 then
							selectLane(base, rowName, selectedIdxs[1], selectedIdxs)
						end
						selectedEditorAutoOpenFrames = 6
					end
					if draggingNow then
						if #selectedIdxs > 0 then
							selectLane(base, rowName, selectedIdxs[1], selectedIdxs)
						end
					else
						selectFromLane(base, rowName, newPts, selectedIdxs, prevSelected)
					end
					if draggingNow and not prevDragging then
						if (#selectedIdxs == 0) and (p.ui.selectedRow == rowName) and (p.ui.selectedKeyIndex > 0) then
							selectedIdxs = { p.ui.selectedKeyIndex }
						end
						local startPts: { Vec2 } = {}
						local startTimes: { number } = {}
						local startRefs = {}
						local selectedAtStart: { number } = {}
						for _, kfIndex in ipairs(selectedIdxs) do
							local pt = pts[kfIndex]
							local keyRef = keys[kfIndex]
							if pt and keyRef then
								startPts[#startPts + 1] = Vec2.new(pt.x, pt.y)
								startTimes[#startTimes + 1] = keyRef.t
								startRefs[#startRefs + 1] = keyRef
								selectedAtStart[#selectedAtStart + 1] = kfIndex
							end
						end
						dragStartPtsByLane[laneKey] = startPts
						dragStartTimesByLane[laneKey] = startTimes
						dragKeyRefsByLane[laneKey] = startRefs
						dragSelectedByLane[laneKey] = selectedAtStart
						dragLastDeltaByLane[laneKey] = 0
						pushUndoOnce(p)
					end
					if draggingNow then
						local dragStart = dragStartPtsByLane[laneKey] or {}
						local dragStartTimes = dragStartTimesByLane[laneKey] or {}
						local dragRefs = dragKeyRefsByLane[laneKey] or {}
						local selectedAtStart = dragSelectedByLane[laneKey] or {}
						local dragDelta = computeDragDeltaFromWidget(
							newPts,
							ptsForWidget,
							selectedAtStart,
							dragStart,
							dragLastDeltaByLane[laneKey],
							p.snap
						)
						if dragDelta == nil then
							local firstIdx = selectedAtStart[1] or selectedIdxs[1]
							if dragStart[1] and firstIdx and newPts[firstIdx] then
								dragDelta = newPts[firstIdx].x - dragStart[1].x
							end
						end
						if dragDelta ~= nil then
							dragLastDeltaByLane[laneKey] = dragDelta
							for i = 1, #dragRefs do
								local keyRef = dragRefs[i]
								local startT = dragStartTimes[i]
								if keyRef and startT then
									keyRef.t = alignTo(startT + dragDelta, p.snap)
								end
							end
						end
					else
						if prevDragging then
							resolveDragCollisions(
								keys,
								dragKeyRefsByLane[laneKey] or {},
								dragLastDeltaByLane[laneKey],
								p.snap
							)
						else
							applyTimesFromPoints(keys, newPts, p.snap)
						end
						dragStartPtsByLane[laneKey] = nil
						dragStartTimesByLane[laneKey] = nil
						dragKeyRefsByLane[laneKey] = nil
						dragSelectedByLane[laneKey] = nil
						dragLastDeltaByLane[laneKey] = nil
					end
					if draggingNow and #lockedSelectedNow > 0 then
						lastSelectedByLane[laneKey] = lockedSelectedNow
						selectedByBase[base] = lockedSelectedNow
					else
						lastSelectedByLane[laneKey] = selectedIdxs
						selectedByBase[base] = selectedIdxs
					end
					wasDraggingLane[laneKey] = draggingNow
				else
					Gui.text("(keyframeRow unavailable in this build)")
				end
				if not laneDraggingNow then
					if base == "rot" then
						sortRotationKeys(keys)
					else
						sortKeysByT(keys)
					end
				end
			end
			local previewTimelineEnabled = config.previewTimelineInPreview == true
			local pauseTrackLaneWidgets = previewEnabled and not previewTimelineEnabled
			if pauseTrackLaneWidgets then
				Gui.tableNextRow()
				Gui.tableNextColumn()
				Gui.text("Keyframe Lanes")
				Gui.tableNextColumn()
				Gui.text(
					"Paused while Preview Camera is ON (for smoother playback). Enable timeline-in-preview in Settings to edit."
				)
			else
				drawLane("Position", p.tracks.position, "pos")
				drawLane("Rotation", p.tracks.rotation, "rot")
				drawLane("Field of View", p.tracks.fov, "fov")
				drawLane("DOF F-Stop", p.tracks.dofFstop, "dofFstop")
				drawLane("DOF Focus Distance", p.tracks.dofFocalDistance, "dofFocalDistance")
				drawLane("DOF Sensor Width", p.tracks.dofSensorWidth, "dofSensorWidth")
				drawLane("Replay Speed", p.tracks.speed, "speed")
				drawLane("Timeline Speed", p.tracks.timelineSpeed, "tlspeed")
				do
					local povLaneKey = laneId("pov")
					local povWasDragging = (wasDraggingLane[povLaneKey] == true)
					if not povWasDragging then
						sortPOV(p.tracks.pov)
					end
					Gui.tableNextRow()
					Gui.tableNextColumn()
					Gui.text("POV")
					Gui.tableNextColumn()
					local pts = pointsFromKeys(p.tracks.pov)
					if hasFn("keyframeRow") then
						local prevDragging = povWasDragging
						local lockedPrevSelected: { number } = dragSelectedByLane[povLaneKey] or {}
						local prevSelected: { number } = lastSelectedByLane[povLaneKey] or {}
						if prevDragging and #lockedPrevSelected > 0 then
							prevSelected = lockedPrevSelected
						end
						local newPts =
							Gui.keyframeRow(povLaneKey, pts, playhead, rangeStartRounded, p.ui.rangeEnd, p.snap)
						local selectedIdxs: { number } = (
							hasFn("keyframeRowSelectedKeyframes")
							and (Gui.keyframeRowSelectedKeyframes(povLaneKey) or {})
						) or {}
						local draggingNow = hasFn("keyframeRowIsDragging") and Gui.keyframeRowIsDragging(povLaneKey)
							or false
						local lockedSelectedNow: { number } = dragSelectedByLane[povLaneKey] or {}
						if draggingNow and #lockedSelectedNow > 0 then
							selectedIdxs = lockedSelectedNow
						elseif #selectedIdxs == 0 then
							selectedIdxs = prevSelected
						end
						local rightClickOnPOVLane = Gui.isItemHovered() and rightMousePressed()
						if rightClickOnPOVLane then
							if #selectedIdxs > 0 then
								selectLane("pov", "POV", selectedIdxs[1], selectedIdxs)
							end
							selectedEditorAutoOpenFrames = 6
						end
						if draggingNow then
							if #selectedIdxs > 0 then
								selectLane("pov", "POV", selectedIdxs[1], selectedIdxs)
							end
						else
							selectFromLane("pov", "POV", newPts, selectedIdxs, prevSelected)
						end
						if draggingNow and not prevDragging then
							local startPts: { Vec2 } = {}
							local startTimes: { number } = {}
							local startRefs = {}
							local selectedAtStart: { number } = {}
							for _, kfIndex in ipairs(selectedIdxs) do
								local pt = pts[kfIndex]
								local keyRef = p.tracks.pov[kfIndex]
								if pt and keyRef then
									startPts[#startPts + 1] = Vec2.new(pt.x, pt.y)
									startTimes[#startTimes + 1] = keyRef.t
									startRefs[#startRefs + 1] = keyRef
									selectedAtStart[#selectedAtStart + 1] = kfIndex
								end
							end
							dragStartPtsByLane[povLaneKey] = startPts
							dragStartTimesByLane[povLaneKey] = startTimes
							dragKeyRefsByLane[povLaneKey] = startRefs
							dragSelectedByLane[povLaneKey] = selectedAtStart
							dragLastDeltaByLane[povLaneKey] = 0
							pushUndoOnce(p)
						end
						if draggingNow then
							local dragStart = dragStartPtsByLane[povLaneKey] or {}
							local dragStartTimes = dragStartTimesByLane[povLaneKey] or {}
							local dragRefs = dragKeyRefsByLane[povLaneKey] or {}
							local selectedAtStart = dragSelectedByLane[povLaneKey] or {}
							local dragDelta = computeDragDeltaFromWidget(
								newPts,
								pts,
								selectedAtStart,
								dragStart,
								dragLastDeltaByLane[povLaneKey],
								p.snap
							)
							if dragDelta == nil then
								local firstIdx = selectedAtStart[1] or selectedIdxs[1]
								if dragStart[1] and firstIdx and newPts[firstIdx] then
									dragDelta = newPts[firstIdx].x - dragStart[1].x
								end
							end
							if dragDelta ~= nil then
								dragLastDeltaByLane[povLaneKey] = dragDelta
								for i = 1, #dragRefs do
									local keyRef = dragRefs[i]
									local startT = dragStartTimes[i]
									if keyRef and startT then
										keyRef.t = alignTo(startT + dragDelta, p.snap)
									end
								end
							end
						else
							if prevDragging then
								resolveDragCollisions(
									p.tracks.pov,
									dragKeyRefsByLane[povLaneKey] or {},
									dragLastDeltaByLane[povLaneKey],
									p.snap
								)
							else
								applyTimesFromPoints(p.tracks.pov, newPts, p.snap)
							end
							dragStartPtsByLane[povLaneKey] = nil
							dragStartTimesByLane[povLaneKey] = nil
							dragKeyRefsByLane[povLaneKey] = nil
							dragSelectedByLane[povLaneKey] = nil
							dragLastDeltaByLane[povLaneKey] = nil
						end
						if draggingNow and #lockedSelectedNow > 0 then
							lastSelectedByLane[povLaneKey] = lockedSelectedNow
							selectedByBase["pov"] = lockedSelectedNow
						else
							lastSelectedByLane[povLaneKey] = selectedIdxs
							selectedByBase["pov"] = selectedIdxs
						end
						wasDraggingLane[povLaneKey] = draggingNow
					else
						Gui.text("(keyframeRow unavailable in this build)")
					end
					for i = 1, #p.tracks.pov do
						p.tracks.pov[i].interp = "cut"
					end
					if not (hasFn("keyframeRowIsDragging") and Gui.keyframeRowIsDragging(povLaneKey)) then
						sortPOV(p.tracks.pov)
					end
				end
			end
			-- Replay Cuts lane
			do
				local cuts = p.tracks.replayCuts or {}
				p.tracks.replayCuts = cuts
				local rcLaneKey = laneId("rc")
				Gui.tableNextRow()
				Gui.tableNextColumn()
				Gui.text("Replay Cuts")
				Gui.tableNextColumn()
				if hasFn("keyframeRow") then
					local rcPts = pointsFromKeys(cuts)
					local newRcPts =
						Gui.keyframeRow(rcLaneKey, rcPts, playhead, computeRangeStartRounded(), p.ui.rangeEnd, p.snap)
					local rcDragging = hasFn("keyframeRowIsDragging") and Gui.keyframeRowIsDragging(rcLaneKey) or false
					local prevRcSelected: { number } = lastSelectedByLane[rcLaneKey] or {}
					if not rcDragging then
						local n = math.min(#cuts, #newRcPts)
						for ci = 1, n do
							cuts[ci].t = alignTo(newRcPts[ci].x, p.snap)
						end
						sortReplayCuts(cuts)
					end
					-- Left-click selects; right-click also opens the editor panel
					if hasFn("keyframeRowSelectedKeyframes") then
						local rcSel = Gui.keyframeRowSelectedKeyframes(rcLaneKey) or {}
						if #rcSel == 0 then
							rcSel = prevRcSelected
						end
						if #rcSel > 0 then
							if
								not sameIndexList(rcSel, prevRcSelected)
								or p.ui.selectedRow ~= "ReplayCuts"
								or p.ui.selectedKeyIndex ~= rcSel[1]
							then
								selectLane("rc", "ReplayCuts", rcSel[1], rcSel)
							end
							if Gui.isItemHovered() and rightMousePressed() then
								selectedEditorAutoOpenFrames = 6
							end
						end
						lastSelectedByLane[rcLaneKey] = rcSel
						selectedByBase["rc"] = rcSel
					end
				else
					Gui.text("(keyframeRow unavailable)")
				end
			end
			if pauseTrackLaneWidgets then
				Gui.tableNextRow()
				Gui.tableNextColumn()
				Gui.text("Replay Strips")
				Gui.tableNextColumn()
				Gui.text("Paused while Preview Camera is ON.")
			else
				local replayStripRangeStart = computeRangeStartRounded()
				local replayStripRangeEnd = p.ui.rangeEnd
				for layerId = 1, #p.replayLayers do
					local L = p.replayLayers[layerId]
					local seg = (L and L.segments and L.segments[1]) or nil
					local freezeCount = #(L.freezes or {})
					Gui.tableNextRow()
					Gui.tableNextColumn()
					if seg then
						local label = string.format("Replay %d: %s", layerId, seg.replayName)
						if freezeCount > 0 then
							label = label .. string.format("  [Freeze x%d]", freezeCount)
						end
						Gui.text(label)
					else
						Gui.text(string.format("Replay %d: (none)", layerId))
					end
					Gui.tableNextColumn()
					if seg then
						local dur = (seg.srcEnd - seg.srcStart)
						local stripStart = seg.dstStart
						local stripEnd = seg.dstStart + dur
						if hasFn("rangeSlider") then
							local widgetId = "replayStrip##layer" .. tostring(layerId)
							if hasFn("beginDisabled") then
								Gui.beginDisabled()
							end
							Gui.rangeSlider(
								widgetId,
								Vec2.new(stripStart, stripEnd),
								replayStripRangeStart,
								replayStripRangeEnd,
								true
							)
							if hasFn("endDisabled") then
								Gui.endDisabled()
							end
						else
							seg.dstStart = alignTo(
								Gui.dragFloat(
									"Replay Start##layer" .. tostring(layerId),
									seg.dstStart,
									p.snap,
									p.timelineStart,
									p.timelineEnd
								),
								p.snap
							)
						end
						gmraDrawReplayFreezeStrips(
							p,
							layerId,
							L,
							seg,
							replayStripRangeStart,
							replayStripRangeEnd,
							suppressStripWriteThisFrame
						)
					else
						Gui.text("-")
					end
				end
			end
			Gui.endTable()
		end
		gmraDrawSelectedKeyEditor(p)
		if Gui.collapsingHeader("Smoothing##interp") then
			gmraIndentBlock()
			p.ui.useQuatInterp = Gui.checkbox("Use Quaternion Rotation Interpolation##quat", p.ui.useQuatInterp == true)
			p.ui.globalSmoothing = Gui.sliderFloat("Global Smoothing Mix##gs", p.ui.globalSmoothing or 0, 0, 1)
			gmraTooltip("Master smoothing amount. Higher makes the whole path flow more as one curve.")
			p.ui.posSmoothing = Gui.sliderFloat("Position Curve Blend##ps", p.ui.posSmoothing or 0, 0, 1)
			gmraTooltip("How strongly position keys are blended into one fluid camera path.")
			p.ui.rotSmoothing = Gui.sliderFloat("Rotation Curve Blend##rs", p.ui.rotSmoothing or 0, 0, 1)
			gmraTooltip("How strongly rotation keys are blended into one smooth camera turn.")
			if Gui.collapsingHeader("Advanced Smoothing##advSmooth") then
				gmraIndentBlock()
				p.ui.advancedSmoothing = Gui.checkbox(
					"Enable Advanced Smoothing##advSmoothEnabled",
					(p.ui.advancedSmoothing == nil) or (p.ui.advancedSmoothing == true)
				)
				gmraTooltip("Unlocks the extra controls below so you can shape how the smoothing behaves.")
				local advEnabled = (p.ui.advancedSmoothing == nil) or (p.ui.advancedSmoothing == true)
				if not advEnabled then
					Gui.beginDisabled()
				end
				Gui.separator() -- Position
				p.ui.posOvershootGuard =
					safeSliderFloat("Overshoot Guard##adv_posOvershootGuard", p.ui.posOvershootGuard or 0.4, 0, 1)
				gmraTooltip(
					"Prevents the position path from arcing too far away from your keys on sharp turns. Higher = tighter to keys."
				)
				Gui.separator() -- Rotation
				p.ui.rotKeyflow = safeSliderFloat("Rotation Flow##adv_rotKeyflow", p.ui.rotKeyflow or 0.85, 0, 1)
				gmraTooltip(
					"How freely the rotation flows through keys. High = loose and flowing. Low = tighter to each key."
				)
				p.ui.rotSmoothStrength =
					safeSliderFloat("Rotation Strength##adv_rotSmoothStrength", p.ui.rotSmoothStrength or 1, 0, 1)
				gmraTooltip("Overall strength of rotation smoothing.")
				p.ui.rotLinearMix =
					safeSliderFloat("Rotation Linear Mix##adv_rotLinearMix", p.ui.rotLinearMix or 0, 0, 1)
				gmraTooltip(
					"Blends in straight slerp rotation. 0 = fully smooth Catmull-Rom arc. 1 = straight slerp between keys."
				)
				Gui.separator() -- Presets
				if Gui.button("Flow Through##advPresetFlow") then
					p.ui.globalSmoothing = 0.8
					p.ui.posSmoothing = 0
					p.ui.rotSmoothing = 0
					p.ui.posOvershootGuard = 0.3
					p.ui.rotKeyflow = 0.9
					p.ui.rotLinearMix = 0
					p.ui.rotSmoothStrength = 1
				end
				Gui.sameLine()
				if Gui.button("Balanced##advPresetBalanced") then
					p.ui.globalSmoothing = 0.6
					p.ui.posSmoothing = 0
					p.ui.rotSmoothing = 0
					p.ui.posOvershootGuard = 0.4
					p.ui.rotKeyflow = 0.75
					p.ui.rotLinearMix = 0
					p.ui.rotSmoothStrength = 1
				end
				Gui.sameLine()
				if Gui.button("Soft Arc##advPresetSoft") then
					p.ui.globalSmoothing = 0.5
					p.ui.posSmoothing = 0
					p.ui.rotSmoothing = 0
					p.ui.posOvershootGuard = 0.55
					p.ui.rotKeyflow = 0.6
					p.ui.rotLinearMix = 0
					p.ui.rotSmoothStrength = 1
				end
				Gui.separator() -- Custom Presets
				local presetNames = getSmoothingPresetNames()
				local curPreset = smoothingPresetSelectedName
				if curPreset == "" and (config.lastSmoothingPreset or "") ~= "" then
					curPreset = config.lastSmoothingPreset
				end
				if curPreset == "" and #presetNames > 0 then
					curPreset = presetNames[1]
				end
				if curPreset ~= smoothingPresetSelectedName then
					smoothingPresetSelectedName = curPreset
				end
				if
					Gui.beginCombo("Preset Library##advCustomPresetCombo", curPreset ~= "" and curPreset or "(none)")
				then
					for i = 1, #presetNames do
						local nm = presetNames[i]
						if Gui.selectable(nm .. "##advCustomPreset" .. tostring(i), nm == curPreset) then
							smoothingPresetSelectedName = nm
							config.lastSmoothingPreset = nm
							safeSaveConfig()
						end
					end
					Gui.endCombo()
				end
				local selectedPreset = (config.smoothingPresets or {})[smoothingPresetSelectedName]
				if Gui.button("Load Selected##advCustomPresetLoad") then
					if selectedPreset then
						applySmoothingPreset(p, selectedPreset)
					end
				end
				if Gui.button("Save Over Selected##advCustomPresetSaveOver") then
					if smoothingPresetSelectedName ~= "" then
						saveSmoothingPreset(smoothingPresetSelectedName, p)
					end
				end
				if Gui.button("Delete Selected##advCustomPresetDelete") then
					if smoothingPresetSelectedName ~= "" then
						deleteSmoothingPreset(smoothingPresetSelectedName)
					end
				end
				smoothingPresetNameInput =
					Gui.inputText("New Preset Name##advCustomPresetName", smoothingPresetNameInput)
				if Gui.button("Create Preset##advCustomPresetCreate") then
					local ok = saveSmoothingPreset(smoothingPresetNameInput, p)
					if ok then
						smoothingPresetNameInput = ""
					end
				end
				if Gui.button("Save Smoothing To Config##advSaveSmooth") then
					saveProject(p)
				end
				if not advEnabled then
					Gui.endDisabled()
				end
				gmraUnindentBlock()
			end
			gmraUnindentBlock()
		end
		Gui.separator() -- Timeline
		gmraUnindentBlock()
	end
	gmraDrawReplaysSection(p)
	gmraDrawSettingsSection(p)
end
function onGui()
	local ok, err = pcall(onGuiImpl)
	if not ok then
		if Gui and Gui.text then
			Gui.text("glowmonster.replay.animator UI error")
			Gui.text(tostring(err))
		end
	end
end
function gmraCrossesCut(keys, t0: number, t1: number): boolean
	if not keys or #keys == 0 then
		return false
	end
	for i = 1, #keys do
		local k = keys[i]
		if k and k.interp == "cut" then
			local kt = k.t
			if (t0 < kt and t1 >= kt) or (t0 > kt and t1 <= kt) then
				return true
			end
		end
	end
	return false
end
function mainImpl()
	if config.lastProject and config.lastProject ~= "" then
		loadProjectByName(config.lastProject)
	end
end
function main()
	local ok, _err = pcall(mainImpl)
	if not ok then
	end
end
function tickImpl(dt: number)
	beginUndoFrame()
	runtimeFrameCounter += 1
	if not project then
		return
	end
	local p = project :: Project
	if p.tracks and p.tracks.timelineSpeed == p.tracks.speed then
		p.tracks.timelineSpeed = cloneNumKeys(p.tracks.timelineSpeed)
	end
	gmraUpdateManualPOVOrbitInput(p, dt)
	gmraUpdateKeyframeStepInput(p, dt)
	if spacePressed() then
		animating = not animating
	end
	if deletePressed() then
		pushUndoOnce(p)
		if not gmraDeleteSelectedKeys(p) then
			deleteSelectedKey(p)
		end
	end
	local function undoPressed()
		return gmraActionPressed("undo")
	end
	if undoPressed() then
		doUndo()
	end
	if animating then
		local tlSpeed = evalNum(p.tracks.timelineSpeed, playhead)
		if tlSpeed <= 0 then
			tlSpeed = 0.01
		end
		playhead += dt * tlSpeed
	end
	do
		local jumped = math.abs(playhead - lastPlayheadForCut) > math.max(p.snap * 2, 0.05)
		local cutHit = gmraCrossesCut(p.tracks.position, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.rotation, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.fov, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.dofFstop, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.dofFocalDistance, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.dofSensorWidth, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.timelineSpeed, lastPlayheadForCut, playhead)
			or gmraCrossesCut(p.tracks.speed, lastPlayheadForCut, playhead)
		if jumped or cutHit then
			cutSnapFramesLeft = 2
		end
		lastPlayheadForCut = playhead
	end
	camera.positionSmoothing = 0
	camera.rotationSmoothing = 0
	camera.fieldOfViewSmoothing = 0
	gmraSetCameraHideNearestHead(false)
	if cutSnapFramesLeft > 0 then
		cutSnapFramesLeft -= 1
	end
	do
		local scrollAmount = (p.ui.rangeEnd - p.ui.rangeStart) * p.ui.scrollSpeed * dt
		if animating then
			if playhead > p.ui.rangeEnd and p.ui.rangeEnd < p.timelineEnd then
				p.ui.rangeStart += scrollAmount
				p.ui.rangeEnd += scrollAmount
			end
			if playhead < p.ui.rangeStart and p.ui.rangeStart > p.timelineStart then
				p.ui.rangeStart -= scrollAmount
				p.ui.rangeEnd -= scrollAmount
			end
			p.ui.rangeStart = clamp(p.ui.rangeStart, p.timelineStart, p.timelineEnd)
			p.ui.rangeEnd = clamp(p.ui.rangeEnd, p.ui.rangeStart + 0.1, p.timelineEnd)
		end
	end
	driveReplaysAtTime(p, playhead, dt)
	local shouldPreviewView = previewEnabled and (animating or true)
	if shouldPreviewView then
		camera:followCamera(nil)
		mode = "Preview"
	else
		mode = "Edit"
		if editing and getCameraById then
			local freecam = getCameraById("anotheraxiom.freecam")
			if freecam then
				camera:followCamera(freecam)
			else
				camera:followCamera(nil)
			end
		else
			camera:followCamera(nil)
		end
	end
	if liveKeyEditEnabled then
		if previewEnabled then
			stopLiveKeyEdit()
		else
			applyLiveKeyEditFromCamera(p)
		end
	end
	if previewEnabled then
		evalAndApplyCamera(p, playhead)
		if povAppliedThisFrame then
			camera.positionSmoothing = 0
			camera.rotationSmoothing = 0
			camera.fieldOfViewSmoothing = 0
			applyPOV(p, playhead)
		end
	end
	if previewEnabled then
		WorldDraw.clear()
	else
		drawPath(p)
	end
end
function tick(dt: number)
	local ok, err = pcall(tickImpl, dt)
	if not ok then
		if WorldDraw and WorldDraw.clear then
			WorldDraw.clear()
		end
	end
end
