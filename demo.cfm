<cfset identicon = createObject("component","identicon").init() />

<cfset testCount = 20 />

<cfloop from="1" to="#testCount#" index="i">
	<cfset randomString = randomize(i)>
	
	<cfoutput><img src="#identicon.get_identicon(randomString,50,'absolute')#" /></cfoutput>
</cfloop>