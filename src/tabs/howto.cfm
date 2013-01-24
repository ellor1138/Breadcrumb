<cfoutput>
	<div class="tab-pane" id="HowTo">
		<div class="tabbable tabs-left">
			<ul class="nav nav-tabs subtabs">
				<li class="active"><a href="##Breadcrumb2" data-toggle="tab">Breadcrumb</a></li>
				<li><a href="##Pagetitle2" data-toggle="tab">Page title</a></li>
			</ul>

			<div class="tab-content subcontent">
				<div class="tab-pane active" id="Breadcrumb2">
					<ul class="nav nav-tabs innertabs">
						<li class="active"><a href="##Installation1" data-toggle="tab">Installation</a></li>
						<li><a href="##Automatic1" data-toggle="tab">Automatic usage</a></li>
						<li><a href="##Manual1" data-toggle="tab">Manual usage</a></li>
						<li><a href="##Options1" data-toggle="tab">Options</a></li>
					</ul>
					<div class="tab-content innercontent">
						<div class="tab-pane active" id="Installation1">
							<h4>Installation</h4>
							<p>Add the includeContent() view helper function in your main layout.cfm file <strong><u>or</u></strong> view files.</p>
							<div class="well">
								&lt;div&gt;<br>
								&nbsp;&nbsp;&nbsp;##includeContent("breadcrumb")##<br>
								&lt;/div&gt;
							</div>
						</div>
						<div class="tab-pane" id="Automatic1">
							<h4>Automatic usage</h4>
							<p>In the init block of your controllers, simply add the filters() function.</p>
							<div class="well">
								public void function init() {<br>
								&nbsp;&nbsp;&nbsp;filters(through="createBreadcrumbAndTitle");<br>
								}
							</div>
							<p><span class="label label-inverse">Tips</span> You could also put the filters() function in the init block of Controller.cfc and use the super.init() call in your other controllers.</p>
						</div>
						<div class="tab-pane" id="Manual1">
							<h4>Manual usage</h4>
							<p>To manually build a breadcrumb trail navigation, simply pass an array of struct in your controller's action.</p>
							<div class="well">
								public function index() {<br>
								&nbsp;&nbsp;&nbsp;var loc = [];<br>
									<br>
								&nbsp;&nbsp;&nbsp;loc[1] = {text=&quot;Projects&quot;, controller=&quot;project&quot;, action=&quot;index&quot;};<br>
								&nbsp;&nbsp;&nbsp;loc[2] = {text=&quot;Type&quot;, controller=&quot;project&quot;, action=&quot;type&quot;};<br>
								&nbsp;&nbsp;&nbsp;loc[3] = {text=&quot;Web&quot;, controller=&quot;project&quot;, action=&quot;type&quot;, key=1};<br>
								&nbsp;&nbsp;&nbsp;loc[4] = {text=&quot;Wheels&quot;};<br>
									<br>
								&nbsp;&nbsp;&nbsp;createBreadcrumbAndTitle(loc);<br>
								}
							</div>
							<p>The plugin will render a breadcrumb trail navigation like this:</p>
							<ul class="breadcrumb">
								<li><a href="/project/index">Projects</a><span class="divider">/</span></li>
								<li><a href="/project/type">Type</a><span class="divider">/</span></li>
								<li><a href="/project/type/1">Web</a><span class="divider">/</span></li>
								<li class="active">Wheels</li>
							</ul>
							<p>If you use the breadcrumbPrefix feature, the same code will render a breadcrumb trail navigation like this:</p>
							<ul class="breadcrumb">
								<li><a href="/">Home</a><span class="divider">/</span></li>
								<li><a href="/project/index">Projects</a><span class="divider">/</span></li>
								<li><a href="/project/type">Type</a><span class="divider">/</span></li>
								<li><a href="/project/type/1">Web</a><span class="divider">/</span></li>
								<li class="active">Wheels</li>
							</ul>
						</div>
						<div class="tab-pane" id="Options1">
							<h4>Add title</h4>
							<p>You can add a title at the end of the breadcrumb trail navigation. Simply pass a string to the appendTitle params in you controller's action.</p>
							<div class="well">
								public function index() {<br>
								&nbsp;&nbsp;&nbsp;params.appendTitle = "Welcome!";<br>
								&nbsp;&nbsp;&nbsp;createBreadcrumbAndTitle();<br>
								}
							</div>
							<hr>
							<h4>Hyphen separator</h4>
							<p>Since Wheels converts camelCase controllers to lowercase strings with hyphens as word delimiters in the address bar. You can separate the camelCase controllers to create two separate links.</p>
							<div class="well">
								<p style="border-bottom:1px solid ##333;"><strong>adminProject.cfc</strong></p>
								public function edit() {<br>
								&nbsp;&nbsp;&nbsp;params.separateHyphens = true;<br>
								&nbsp;&nbsp;&nbsp;createBreadcrumbAndTitle();<br>
								}
							</div>
							<div style="padding-top:20px !important; margin-bottom:20px;">
								<img src="https://github.com/ellor1138/Breadcrumb/blob/master/src/images/breadcrumbHyphenCheck.png?raw=true" style="padding:10px; border:1px solid ##c4c4c4;">
							</div>
							<p><span class="label label-inverse">Note</span> This option only work with 2 words camelCase controller i.e., "editUser" or "viewInfo". Complex camelCase controller i.e., "editUserInfo", "viewInfoByCategory" won't be convert in separate links.</p>
						</div>
					</div>
				</div>

				<div class="tab-pane" id="Pagetitle2">
					<ul class="nav nav-tabs innertabs">
						<li class="active"><a href="##Installation2" data-toggle="tab">Installation</a></li>
						<li><a href="##Automatic2" data-toggle="tab">Automatic usage</a></li>
						<li><a href="##Manual2" data-toggle="tab">Manual usage</a></li>
					</ul>
					<div class="tab-content innercontent">
						<div class="tab-pane active" id="Installation2">
							<h4>Installation</h4>
							<p>Add the includeContent() function in the <strong>&lt;title&gt; &lt;/title&gt;</strong> tag of your main layout.cfm file.</p>
							<div class="well">
								&lt;head&gt;<br>
								&nbsp;&nbsp;&nbsp;&lt;title&gt;##includeContent(&quot;pageTitle&quot;)##&lt;/title&gt;<br>
								&lt;/head&gt;
							</div>
						</div>
						<div class="tab-pane" id="Automatic2">
							<h4>Automatic usage</h4>
							<p>The page title is generated from the createBreadcrumbAndTitle() function. If you've set contentForPageTitle() to TRUE, the createBreadcrumbAndTitle() function will automatically create the page title for you.</p>
						</div>
						<div class="tab-pane" id="Manual2">
							<h4>Manual usage</h4>
							<p>You can set the page title manually by passing a string in your controller's action.</p>
							<div class="well">
								public function index() {<br>
								&nbsp;&nbsp;&nbsp;setPageTitle("Welcome!");<br>
								}
							</div>
							<p><span class="label label-inverse">Info</span> Using the setPageTitle() function will bypass the contentForPageTitle() check and the pageTitlePrefix() setting.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</cfoutput>