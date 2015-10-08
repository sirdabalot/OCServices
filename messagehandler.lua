local event = require("event")
local components = require("component")
local computer = require("computer")

require("logapi")

local modem = components.modem
local computerComponent = components.computer

function handlePAMessage( eventType, recAddr, sendAddr, port, distance, messageType, messageContents )
	if ( messageType == "TabletMessage" ) then
		messages = logContainer("/messages.log")
		messages:addEntry( entry( nil, messageContents, "MESSAGE" ), true )
		computerComponent.beep( )
	end
end

function start(msg)
	modem.open( 3375 )
	event.listen( "modem_message", handlePAMessage )
end