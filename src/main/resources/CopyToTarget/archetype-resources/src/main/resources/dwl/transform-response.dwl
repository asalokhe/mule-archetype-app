%dw 2.0
output application/json
---
{
	"message": if( p('msg') != null ) p('msg') else "Create Archetype Component"
}