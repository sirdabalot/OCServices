local event = require("event")
local components = require("component")

local modem = components.modem

local nfcrange = 10

function handleNFC( eventType )
	modem.setStrength( nfcrange )
	modem.broadcast( 3380, "NFC" )
	modem.setStrength( 400 )
end

function start(msg)
	modem.open( 3380 )
	nfcrange = args
	event.listen( "tablet_use", handleNFC )
end