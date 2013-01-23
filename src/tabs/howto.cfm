<cfoutput>
	<div class="tab-pane" id="HowTo">
		<div class="tabbable tabs-left">
			<ul class="nav nav-tabs subtabs">
				<li class="active"><a href="##Breadcrumb2" data-toggle="tab">Breadcrumb</a></li>
				<li><a href="##Pagetitle2" data-toggle="tab">Page title</a></li>
			</ul>

			<div class="tab-content subcontent">
				<div class="tab-pane active" id="Breadcrumb2">
					<h4>Installation</h4>
					<p>Add the includeContent() view helper function in your main layout.cfm file <strong><u>or</u></strong> view files.</p>
					<div class="well">
						&lt;div&gt;<br>
						&nbsp;&nbsp;&nbsp;##includeContent("breadcrumb")##<br>
						&lt;/div&gt;
					</div>
					<hr>
					<h4>Automatic usage</h4>
					<p>In the init block of your controllers, simply add the filters() function.</p>
					<div class="well">
						public void function init() {<br>
						&nbsp;&nbsp;&nbsp;filters(through="createBreadcrumbAndTitle");<br>
						}
					</div>
					<p><span class="label label-inverse">Tips</span> You could also put the filters() function in the init block of Controller.cfc and use the super.init() call in your other controllers.</p>
					<hr>
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
					<p>It will render this breadcrumb trail navigation:</p>
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

				<div class="tab-pane" id="Pagetitle2">
					<h4>Installation</h4>
					<p>Add the includeContent() function in the <strong>&lt;title&gt; &lt;/title&gt;</strong> tag of your main layout.cfm file.</p>
					<div class="well">
						&lt;head&gt;<br>
						&nbsp;&nbsp;&nbsp;&lt;title&gt;##includeContent(&quot;pageTitle&quot;)##&lt;/title&gt;<br>
						&lt;/head&gt;
					</div>
					<hr>
					<h4>Automatic usage</h4>
					<p>The page title is generated from the createBreadcrumbAndTitle() function. If you've set contentForPageTitle() to TRUE, the createBreadcrumbAndTitle() function will automatically create the page title for you.</p>
					<hr>
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
</cfoutput>