<cfoutput>
	<div class="tab-pane" id="Credits">
		<dl class="dl-horizontal single">
			<dt>Author</dt>
			<dd>#loc.plugin.author#</dd>
			<dt>Plugin name</dt>
			<dd>#capitalize(loc.plugin.name)#</dd>
			<dt>Plugin version</dt>
			<dd>#loc.plugin.version#</dd>
			<dt>Wheels compatibility</dt>
			<dd>#loc.plugin.compatibility#</dd>
			<dt>Release date</dt>
			<dd>January 2013</dd>
			<dt>Project home</dt>
			<dd><a href="#loc.plugin.project#" target="_blank">#loc.plugin.project#</a></dd>
			<dt>Documentation</dt>
			<dd><a href="#loc.plugin.documentation#" target="_blank">#loc.plugin.documentation#</a></dd>
			<dt>Find any bugs?</dt>
			<dd>You can file an issue here:<br /><a href="#loc.plugin.issues#" target="_blank">#loc.plugin.issues#</a></dd>
			<dt>License</dt>
			<dd>#capitalize(loc.plugin.name)# is licensed under the Apache License, Version 2.0.<br /><a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">http://www.apache.org/licenses/LICENSE-2.0</a></dd>
		</dl>
	</div>
</cfoutput>