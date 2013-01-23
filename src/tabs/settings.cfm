<cfoutput>
	<div class="tab-pane active" id="Settings">
		<div class="alert">
			<span class="label label-warning">Important</span> &nbsp;&nbsp;All the plugin settings should be place in config/settings.cfm files.
		</div>

		<div class="tabbable tabs-left">

			<ul class="nav nav-tabs subtabs">
				<li class="active"><a href="##Breadcrumb1" data-toggle="tab">Breadcrumb</a></li>
				<li><a href="##Pagetitle1" data-toggle="tab">Page title</a></li>
				<li><a href="##Localization1" data-toggle="tab">Localization</a></li>
			</ul>

			<div class="tab-content subcontent">
				<div class="tab-pane active" id="Breadcrumb1">
					<dl>
						<dt>Breadcrumb trail navigation activation</dt>
						<dd>To activate/deactivate the breadcrumb trail navigation. (Default=TRUE)
							<ul>
								<li><u>set(contentForBreadcrumb=boolean)</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix</dt>
						<dd>To add a prefix to the breadcrumb trail navigation. (Default=FALSE)
							<ul>
								<li><u>set(breadcrumbPrefix=boolean)</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix text</dt>
						<dd>The string to be used for the breadcrumb prefix. (Default="Home")
							<ul>
								<li><u>set(breadcrumbPrefixText="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix link</dt>
						<dd>The link to be used for the breadcrumb prefix. (Default={route="home"})
							<ul>
								<li><u>set(breadcrumbPrefixLink="{route=' ', controller=' ', action=' '}")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb class</dt>
						<dd>The class to be append to the &lt;ul&gt; tag of the breadcrumb trail navigation. (Default="breadcrumb")
							<ul>
								<li><u>set(breadcrumbClass="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb active class</dt>
						<dd>The class to be append to the &lt;li&gt; tag of the active element of the breadcrumb trail navigation. (Default="active")
							<ul>
								<li><u>set(breadcrumbActiveClass="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb hierarchy separator</dt>
						<dd>The separator to be used with the breadcrumb trail navigation. (Default="&lt;span class='divider'&gt;/&lt;/span&gt;")
							<ul>
								<li><u>set(breadcrumbSeparator="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb black list</dt>
						<dd>You can set a black list of terms the plugin should remove from the breadcrumb navigation list. (Default="")
							<ul>
								<li><u>set(breadcrumbBlackList="string,string,string")</u></li>
							</ul>
						</dd>
						<dt>Hyphen check</dt>
						<dd>When enabling the hyphen check, the plugin will replace the hyphen with the hierarchy separator, creating two separate links. (Default=false)
							<ul>
								<li><u>set(breadcrumbHyphenCheck=boolean)</u></li>
							</ul>
							<div style="padding-top:20px !important;">
								<img src="https://github.com/ellor1138/Breadcrumb/blob/master/src/images/breadcrumbHyphenCheck.png?raw=true" style="padding:10px; border:1px solid ##c4c4c4;">
							</div>
						</dd>
					</dl>
				</div>
				<div class="tab-pane" id="Pagetitle1">
					<dl>
						<dt>Page title</dt>
						<dd>To activate/deactivate the page title creation. (Default=TRUE)
							<ul>
								<li><u>set(contentForPageTitle=boolean)</u></li>
							</ul>
						</dd>
						<dt>Page title prefix</dt>
						<dd>Text prefix to be added to the page title. (Default="cgi.remote_addr")
							<ul>
								<li><u>set(pageTitlePrefix="string")</u></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="tab-pane" id="Localization1">
					<dl>
						<dt>Localization</dt>
						<dd>To use the plugin in conjunction with the Localizator plugin. (Default=FALSE)
							<ul>
								<li><u>set(breadcrumbIsLocalized=boolean)</u></li>
							</ul>
						</dd>
					</dl>
					<br><br>
				</div>
			</div>
		</div>
		<hr />
		<div class="well well-small" style="text-align:center; margin-bottom:0;">
			<span class="label label-inverse">Info</span> &nbsp;&nbsp;The breadcrumb plugin will render a breadcrumb trail navigation in the same format as the Bootstrap breadcrumb component <a href="http://twitter.github.com/bootstrap/components.html##breadcrumbs" target="_blank">http://twitter.github.com/bootstrap</a>
		</div>
	</div>
</cfoutput>