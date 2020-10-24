local BaseClass = {}
BaseClass.__index = BaseClass

local pairs = pairs

function BaseClass:init() end

function BaseClass:inherit()
	local newCls = {}
	
	for k, v in pairs(self) do
		newCls[k] = v
	end
	
	newCls.__index = newCls
	newCls.super = self
	
	return setmetatable(newCls, getmetatable(self))
end

setmetatable(BaseClass, {
	__call = function(cls, ...)
		local obj = setmetatable({}, cls)
		obj.class = cls
		
		obj:new(...)
		return obj
	end})

return function() return BaseClass:inherit() end