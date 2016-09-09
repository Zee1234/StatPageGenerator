local CSS = {}
CSS.__index = CSS


---Initialize a new CSS class object.
--@return CSS class object (duh?)
function CSS:new()
  local obj = {}
  setmetatable(obj,CSS)
  
  obj.styles = {}
  obj.styles.insert = table.insert
  
  return obj
end

---Finalize a CSS class object
--@return the CSS string
function CSS:structure()
  return table.concat(self.styles)
end


---Add border radius definitions to a CSS class.
--@param tl top left radius (number)
--@param tr top right radius (number)
--@param br bottom right radius (number)
--@param bl bottom left radius (number)
--@return same CSS class + border radius style
function CSS:borderRadius(tl,tr,br,bl)
  local filling = string.format("%gpx %gpx %gpx %gpx;",tl and tl or "0",tr and tr or "0",br and br or "0",bl and bl or "0")
  self.styles:insert("-webkit-box-shadow: "..filling.."box-shadow: "..filling)
  return self
end

---Add box shadow definitions to a CSS class.
--@param inset Is it inset or not?
--@param hl horizontal length (number)
--@param v1 vertical length (number)
--@param br blur radius (number)
--@param s spread (number)
--@param hex hex color code (string)
--@return same CSS class + box shadow style
function CSS:boxShadow(inset,hl,vl,br,s,hex)
  local filling = string.format("%s %gpx %gpx %gpx %gpx #%s;",inset and "inset" or "",hl,vl,br,s,hex)
  self.styles:insert("-webkit-box-shadow:"..filling.."box-shadow:"..filling)
  return self
end

---Add text shadow definitions to a CSS class.
--@param hl horizontal length (number)
--@param v1 vertical length (number)
--@param br blur radius (number)
--@param hex hex color code (string)
--@return same CSS class + text shadow style
function CSS:textShadow(hl,vl,br,hex)
  local filling = string.format("%gpx %gpx %gpx #%s;",hl,vl,br,hex)
  self.styles:insert("text-shadow:"..filling)
  return self
end

---Add transition definitions to a CSS class.
--@param prop property to be animated (string)
--@param duration how long it takes (number)
--@param unit seconds (s) or milliseconds (ms) (string)
--@param func animation style/function (string)
--@return same CSS class + transition style
function CSS:transitionSingle(prop,duration,unit,func)
  local filling = string.format("%s %g%s %s;",prop,duration,unit,func)
  self.styles:insert(string.format("-webkit-transition:%s-moz-transition:%s-ms-transition:%s-o-transition:%stransition:%s",filling,filling,filling,filling,filling))
  return self
end

---Add gradient background definitions to a CSS class.
--@param dir source location of the gradient (direction, kind of) (string)
--@param hex1 initial color (string)
--@param hex2 final color (string)
--@return same CSS class + simple gradient style
function CSS:gradientSimple(dir,hex1,hex2)
  local filling = string.format("linear-gradient%(%s,#%s 0%%,#%s 100%%);",dir,hex1,hex2)
  self.styles:insert(string.format("background:#%s;background:-moz-%s;background:-webkit-%s;background:%s;",hex1,filling,filling,filling))
  return self
end

---Add opacity definitions to a CSS class.
--@param dir opacity (0-1 number) (% string)
--@return same CSS class + opacity style
function CSS:opacity(num)
  self.styles:insert("opacity:"..num..";")
  return self
end

---Add height definitions to a CSS class.
--@param str height (string)
--@return same CSS class + height style
function CSS:height(str)
  self.styles:insert("height:"..str..";")
  return self
end

---Add max-height definitions to a CSS class.
--@param str max-height (string)
--@return same CSS class + max-height style
function CSS:maxHeight(str)
  self.styles:insert("opacity:"..str..";")
  return self
end

---Add width definitions to a CSS class.
--@param str width (string)
--@return same CSS class + width style
function CSS:width(str)
  self.styles:insert("width:"..str..";")
  return self
end

---Add max-width definitions to a CSS class.
--@param str max-width (string)
--@return same CSS class + max-width style
function CSS:maxWidth(str)
  self.styles:insert("max-width:"..str..";")
  return self
end

---Add overflow definitions to a CSS class.
--@param str overflow handling method (string)
--@return same CSS class + overflow style
function CSS:overflow(str)
  self.styles:insert("overflow:"..str..";")
  return self
end


---Add padding definitions to a CSS class.
--@param t top padding (string)
--@param r right padding (string)
--@param b bottom padding (string)
--@param l left padding (string)
--@return same CSS class + padding style
function CSS:padding(t,r,b,l)
  self.styles:insert(string.format("padding:%s %s %s %s;",t,r,b,l))
  return self
end

---Add margin definitions to a CSS class.
--@param t top margin (string)
--@param r right margin (string)
--@param b bottom margin (string)
--@param l left margin (string)
--@return same CSS class + margin style
function CSS:margin(t,r,b,l)
  self.styles:insert(string.format("margin:%s %s %s %s;",t,r,b,l))
  return self
end

function CSS:backgroundColor(hex)
  self.styles:insert("background-color:#"..hex..";")
  return self
end

function CSS:backgroundImage(url)
  self.styles:insert("background-image:url('"..url.."');")
  return self
end

function CSS:fontColor(hex)
  self.styles:insert("color:#"..hex..";")
  return self
end

function CSS:fontFamily(str)
  self.styles:insert("font-family:"..str..";")
  return self
end

function CSS:fontStyle(str)
  self.styles:insert("font-style:"..str..";")
  return self
end

function CSS:fontSize(str)
  self.styles:insert("font-size:"..str..";")
  return self
end

function CSS:fontWeight(str)
  self.styles:insert("font-weight:"..str..";")
  return self
end

function CSS:fontVariant(str)
  self.styles:insert("font-variant:"..str..";")
  return self
end

function CSS:display(str)
  self.styles:insert("display:"..str..";")
  return self
end





























 