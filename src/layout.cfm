<cfoutput>
	<cfscript>
		loc = application.wheels.breadcrumbSettings;
	</cfscript>

	<!DOCTYPE html>
		<head>
			<meta charset="utf-8">
			<title><cfoutput>#capitalize(loc.plugin.name)# #loc.plugin.version#</cfoutput></title>
			
			<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
			<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
			
			<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap.min.css" rel="stylesheet">
			
			<cfinclude template="styles.cfm">
		</head>
		
		<body>
			<cfoutput>
				<div class="container"> 
					
					<div class="hero-unit">
						<h1>#capitalize(loc.plugin.name)# #loc.plugin.version#</h1>
						<p>This plugin offer a complete solution to add a breadcrumb trail navigation to your application.</p>
						<h2>Benefits of using this plugin:</h2>
						<ul class="small">
							<li>Automatically create a breadcrumb trail navigation based on your controller/action.</li>
							<li>Manually build your breadcrumb trail navigation by passing an array of struct in your controller's action.</li>
							<li>Exclude certain words from your breadcrumb trail navigation by creating a "black list".</li>
							<li>Customize the hierarchy separator and styles of the breadcrumb trail navigation.</li>
							<li>The plugin can also set the title of your HTML page based on the breadcrumb trail. You can also set the page title manually if needs be.</li>
							<li>Can be use in conjunction with the <a href="http://cfwheels.org/plugins/listing/89" target="_blank">Localizator</a> plugin, to add localization (translation) capabilities.</li>
						</ul>
					</div>

					<div class="row">
						<div class="span12">
							<h1>Plugin usage</h1>

							<ul class="nav nav-tabs" id="maintabs">
								<li class="active"><a href="##Settings" data-toggle="tab">Settings</a></li>
								<li><a href="##HowTo" data-toggle="tab">How to use the plugin</a></li>
								<li><a href="##Log" data-toggle="tab">Change Log</a></li>
								<li><a href="##Credits" data-toggle="tab">Credits</a></li>
							</ul>

							<div class="tab-content" id="maincontent">
								<cfinclude template="tabs/settings.cfm">
								<cfinclude template="tabs/howto.cfm">
								<cfinclude template="tabs/log.cfm">
								<cfinclude template="tabs/credits.cfm">
							</div>
						</div>
					</div>
				</div>
			</cfoutput>
		</body>
	</html>
</cfoutput>