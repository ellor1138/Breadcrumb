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

			<div class="tab-content subcontent" style="padding-top:10px;">
				<div class="tab-pane active settings" id="Breadcrumb1">
					<dl>
						<dt>Breadcrumb trail navigation activation <span class="pull-right" style="font-weight:normal;">Default: true</span></dt>
						<dd>To activate/deactivate the breadcrumb trail navigation.
							<ul>
								<li><u>set(contentForBreadcrumb=boolean)</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix <span class="pull-right" style="font-weight:normal;">Default: false</span></dt>
						<dd>To add a prefix to the breadcrumb trail navigation.
							<ul>
								<li><u>set(breadcrumbPrefix=boolean)</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix text <span class="pull-right" style="font-weight:normal;">Default: "Home"</span></dt>
						<dd>The string to be used for the breadcrumb prefix.
							<ul>
								<li><u>set(breadcrumbPrefixText="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix link <span class="pull-right" style="font-weight:normal;">Default: {route="home"}</span></dt>
						<dd>The link to be used for the breadcrumb prefix. 
							<ul>
								<li><u>set(breadcrumbPrefixLink="{route=' ', controller=' ', action=' '}")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb prefix class <span class="pull-right" style="font-weight:normal;">Default: "home"</span></dt>
						<dd>The string to be used for the breadcrumb prefix class.
							<ul>
								<li><u>set(breadcrumbPrefixClass="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb class <span class="pull-right" style="font-weight:normal;">Default: "breadcrumb"</span></dt>
						<dd>The class to be append to the &lt;ul&gt; tag of the breadcrumb trail navigation.
							<ul>
								<li><u>set(breadcrumbClass="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb active class <span class="pull-right" style="font-weight:normal;">Default: "active"</span></dt>
						<dd>The class to be append to the &lt;li&gt; tag of the active element of the breadcrumb trail navigation.
							<ul>
								<li><u>set(breadcrumbActiveClass="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb hierarchy separator <span class="pull-right" style="font-weight:normal;">Default: "&lt;span class='divider'&gt;/&lt;/span&gt;"</span></dt>
						<dd>The separator to be used with the breadcrumb trail navigation.
							<ul>
								<li><u>set(breadcrumbSeparator="string")</u></li>
							</ul>
						</dd>
						<dt>Breadcrumb black list <span class="pull-right" style="font-weight:normal;">Default: ""</span></dt>
						<dd>You can set a black list of terms the plugin should remove from the breadcrumb navigation list.
							<ul>
								<li><u>set(breadcrumbBlackList="string,string,string")</u></li>
							</ul>
						</dd>
						<dt>Hide key <span class="pull-right" style="font-weight:normal;">Default: false</span></dt>
						<dd>You can hide the key from the breadcrumb trail navigation.
							<ul>
								<li><u>set(breadcrumbHideKey=boolean)</u></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="tab-pane" id="Pagetitle1">
					<dl>
						<dt>Page title <span class="pull-right" style="font-weight:normal;">Default: true</span></dt>
						<dd>To activate/deactivate the page title creation.
							<ul>
								<li><u>set(contentForPageTitle=boolean)</u></li>
							</ul>
						</dd>
						<dt>Page title prefix <span class="pull-right" style="font-weight:normal;">Default: cgi.remote_addr</span></dt>
						<dd>Text prefix to be added to the page title.
							<ul>
								<li><u>set(pageTitlePrefix="string")</u></li>
							</ul>
						</dd>
					</dl>
				</div>
				<div class="tab-pane" id="Localization1">
					<dl>
						<dt>Localization <span class="pull-right" style="font-weight:normal;">Default: false</span></dt>
						<dd>To use the plugin in conjunction with the Localizator plugin.
							<ul>
								<li><u>set(breadcrumbIsLocalized=boolean)</u></li>
							</ul>
						</dd>
					</dl>
					<br><br>
				</div>
			</div>
		</div>
	</div>
</cfoutput>