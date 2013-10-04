<cfscript>
	component output=false {
		/*
			---------------------------------------------------------------------------------------------------
				Copyright © 2012 Simon Allard
				
				Licensed under the Apache License, Version 2.0 (the "License");
				you may not use this file except in compliance with the License.
				You may obtain a copy of the License at
				
					http://www.apache.org/licenses/LICENSE-2.0
				
				Unless required by applicable law or agreed to in writing, software
				distributed under the License is distributed on an "AS IS" BASIS,
				WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
				See the License for the specific language governing permissions and
				limitations under the License.
			---------------------------------------------------------------------------------------------------
		*/
		
		/* ---------------------------------------------------------------------------------------------------
		 * @hint Constructor
		 * ---------------------------------------------------------------------------------------------------
		*/
		public function init() {
			var loc = {};

			/* ---------------------------------------------------------------------------------------------------
			 * APPLY DEFAULT SETTINGS IF NOT SUPPLIED IN --> (config/settings.cfm)
		 	 * ---------------------------------------------------------------------------------------------------
			*/

			// - SET DEFAULT BREADCRUMB FLAG
			// - set(contentForBreadcrumb="boolean") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.contentForBreadcrumb") ) {
				application.wheels.contentForBreadcrumb = true;
			}

			// - SET DEFAULT TITLE FLAG
			// - set(contentForPageTitle="boolean") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.contentForPageTitle") ) {
				application.wheels.contentForPageTitle = true;
			}

						// - SET DEFAULT LOCALIZATION FLAG
			// - set(breadcrumbIsLocalized="boolean") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbIsLocalized") ) {
				application.wheels.breadcrumbIsLocalized = false;
			}

			// - SET FLAG TO ADD HOME AT THE BEGINNING OF BREADCRUMB
			// - set(breadcrumbPrefix="boolean") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbPrefix") ) {
				application.wheels.breadcrumbPrefix = false;
			}

			// - SET TEXT OF BREADCRUMB HOME LINK
			// - set(breadcrumbPrefixText="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbPrefixText") ) {
				application.wheels.breadcrumbPrefixText = "Home";
			}

			// - SET ROUTE OF BREADCRUMB LINK
			// - set(breadcrumbPrefixLink="{route='', controller='', action='', key=''}") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbPrefixLink") ) {
				application.wheels.breadcrumbPrefixLink = {route="home"};
			}

			// - SET THE CLASS OF BREADCRUMB PREFIX
			// - set(breadcrumbPrefixClass="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbPrefixClass") ) {
				application.wheels.breadcrumbPrefixClass = "home";
			}

			// - SET DEFAULT BREADCRUMB <UL> CLASS
			// - set(breadcrumbClass="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbClass") ) {
				application.wheels.breadcrumbClass = "breadcrumb";
			}

			// - SET DEFAULT BREADCRUMB SELECTED <LI> CLASS
			// - set(breadcrumbActiveClass="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbActiveClass") ) {
				application.wheels.breadcrumbActiveClass = "active";
			}

			// - SET DEFAULT BREADCRUMB PATH SEPARATOR
			// - set(breadcrumbSeparator="chars") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbSeparator") ) {
				application.wheels.breadcrumbSeparator = "<span class='divider'>/</span>";
			}

			// - SET DEFAULT BREADCRUMB PROHIBITED ACTION LIST
			// - set(breadcrumbBlackList="create,edit,update") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbBlackList") ) {
				application.wheels.breadcrumbBlackList = "";
			}

			// - SET FLAG TO HIDE KEY IN BREADCRUMB
			// - set(breadcrumbHideKey=boolean) --> (config/settings.cfm)
			if ( !isDefined("application.wheels.breadcrumbHideKey") ) {
				application.wheels.breadcrumbHideKey = false;
			}

			// SET DEFAULT PAGE TITLE PREFIX
			// - set(pageTitlePrefix="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.pageTitlePrefix") ) {
				application.wheels.pageTitlePrefix = cgi.remote_addr;
			}

			this.version = "1.1.8";

			return this;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Return plugin settings
		 * ---------------------------------------------------------------------------------------------------
		*/
		public struct function getBreadcrumbSettings() {
			var loc = {};

			loc.plugin = {};
			loc.plugin.author        = "Simon Allard";
			loc.plugin.name          = "breadcrumb";
			loc.plugin.version       = "2.0.0";
			loc.plugin.compatibility = "1.1.8";
			loc.plugin.project       = "https://github.com/ellor1138/Breadcrumb";
			loc.plugin.documentation = "https://github.com/ellor1138/Breadcrumb/wiki";
			loc.plugin.issues        = "https://github.com/ellor1138/Breadcrumb/issues";

			loc.settings = {};
			loc.settings.isLocalized          = application.wheels.breadcrumbIsLocalized;
			loc.settings.contentForBreadcrumb = application.wheels.contentForBreadcrumb;
			loc.settings.contentForPageTitle  = application.wheels.contentForPageTitle;

			loc.settings.breadcrumb = {};
			loc.settings.breadcrumb.prefix      = application.wheels.breadcrumbPrefix;
			loc.settings.breadcrumb.prefixText  = application.wheels.breadcrumbPrefixText;
			loc.settings.breadcrumb.prefixLink  = application.wheels.breadcrumbPrefixLink;
			loc.settings.breadcrumb.prefixClass = application.wheels.breadcrumbPrefixClass;
			loc.settings.breadcrumb.class       = application.wheels.breadcrumbClass;
			loc.settings.breadcrumb.activeClass = application.wheels.breadcrumbActiveClass;
			loc.settings.breadcrumb.separator   = application.wheels.breadcrumbSeparator;
			loc.settings.breadcrumb.blackList   = application.wheels.breadcrumbBlackList;
			loc.settings.breadcrumb.hideKey     = application.wheels.breadcrumbHideKey;
			
			loc.settings.page = {};
			loc.settings.page.titlePrefix = application.wheels.pageTitlePrefix;

			return loc;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Create content for breadcrumb & page title (automatic)
		 * ---------------------------------------------------------------------------------------------------
		*/
		public void function createBreadcrumbAndTitle(params) {
			var loc = {};

			loc.breadcrumb = "";
			loc.separator  = application.wheels.breadcrumbSeparator;

			// Manual breadcrumb
			if ( StructKeyExists(arguments, "params") ) {
				loc.breadcrumbArray = arguments.params;

				for (loc.i = 1; loc.i LTE ArrayLen(loc.breadcrumbArray); loc.i++) {				
					if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
						loc.breadcrumb = loc.breadcrumb & "<li class='" & application.wheels.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";

					} else {
						loc.breadcrumb = loc.breadcrumb & "<li>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
					}
				}

			// Automatic breadcrumb
			} else {
				loc.url           	= application.wheels.rootPath;
				loc.pathInfoArray 	= ListToArray(cgi.path_info, "/");
				loc.breadcrumbArray = [];

				// Add breadcrumb prefix link & text
				if ( application.wheels.breadcrumbPrefix ) {
					loc.args	   = {};
					loc.args       = application.wheels.breadcrumbPrefixLink;
					loc.args.text  = capitalize(getTranslation(application.wheels.breadcrumbPrefixText));
					
					loc.breadcrumbArray[1] = loc.args;
				}

				// Remove black listed controller/action
				if ( Len(application.wheels.breadcrumbBlackList) ) {
					loc.list = application.wheels.breadcrumbBlackList;

					for (loc.i = 1; loc.i <= ListLen(loc.list); loc.i++) {
						loc.find = ArrayFindNoCase(loc.pathInfoArray, ListGetAt(loc.list, loc.i));

						if ( loc.find ) ArrayDeleteAt(loc.pathInfoArray, loc.find);
					}
				}

				// Remove key
				if ( application.wheels.breadcrumbHideKey && StructKeyExists(params, "key") ) {
					loc.key  = params.key;
					loc.find = ArrayFindNoCase(loc.pathInfoArray, loc.key);

					if ( loc.find  ) ArrayDeleteAt(loc.pathInfoArray, loc.find);
				}

				// Add custom title
				if ( StructKeyExists(params, "appendTitle") ) {
					ArrayAppend(loc.pathInfoArray, params.appendTitle);

					StructDelete(params, "appendTitle");
				}

				// Get constructed breadcrumb array count
				loc.count = ArrayLen(loc.breadcrumbArray);

				// Add breadcrumb bits from path info array
				for (loc.i = 1; loc.i <= ArrayLen(loc.pathInfoArray); loc.i++) {
					loc.count++;

					loc.url = loc.url & "/" & loc.pathInfoArray[loc.i];

					loc.args      = {};
					loc.args.href = loc.url;
					loc.args.text = capitalize(getTranslation(loc.pathInfoArray[loc.i]));

					loc.breadcrumbArray[loc.count] = loc.args;
				}

				// Contruct final html list
				for (loc.i = 1; loc.i <= ArrayLen(loc.breadcrumbArray); loc.i++) {
					if ( loc.i == 1 && application.wheels.breadcrumbPrefix && Len(application.wheels.breadcrumbPrefixClass) ) {
						if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
							loc.breadcrumb = "<li class='" & application.wheels.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";
						
						} else {
							loc.breadcrumb = "<li class='" & application.wheels.breadcrumbPrefixClass & "'>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
						}
					
					} else if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
						loc.breadcrumb = loc.breadcrumb & "<li class='" & application.wheels.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";	
					
					} else {
						loc.breadcrumb = loc.breadcrumb & "<li>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
					}
				}
			}

			loc.breadcrumb = "<ul class='" & application.wheels.breadcrumbClass & "'>" & loc.breadcrumb & "</ul>";
			
			// Add breadcrumb to content
			addContentFor(loc.breadcrumb);
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Set page title <title>...</title>
		 * ---------------------------------------------------------------------------------------------------
		*/
		public string function setBreadcrumbPageTitle(required string title="") {
			contentFor(pageTitle=arguments.title, overwrite=true);
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Add breadcrumb and page title to wheels contentFor function
		 * ---------------------------------------------------------------------------------------------------
		*/
		public void function addContentFor(required string breadcrumb) {
			var loc = arguments;

			// Add breadcrumb
			if ( application.wheels.contentForBreadcrumb ) {
				contentFor(breadcrumb=loc.breadcrumb, overwrite=true);
			}

			// Clean & add page title
			if ( application.wheels.contentForPageTitle ) {
				if ( Len(application.wheels.pageTitlePrefix) ) {
					loc.breadCrumb = application.wheels.pageTitlePrefix & application.wheels.breadcrumbSeparator & loc.breadCrumb;
				}
				
				loc.title = ReReplace(loc.breadCrumb,'<(?!(/li)>)[^>]*>',' ','all');
				loc.title = ReReplace(loc.title,'<[^>]*>',' ~ ','all');
				loc.title = ReReplaceNoCase(loc.title,'~','','all');

				if ( application.wheels.breadcrumbPrefix ) {
					loc.separator = ReReplaceNoCase(application.wheels.breadcrumbSeparator,'<[^>]*>','','all');
					
					loc.title = ReplaceNoCase(loc.title,l(application.wheels.breadcrumbPrefixText),'','all');
					loc.title = ReplaceNoCase(loc.title, '#loc.separator##loc.separator#','#loc.separator#','all');
					loc.title = ReplaceNoCase(loc.title, '#loc.separator#','','');
					loc.title = ReplaceNoCase(loc.title, '#loc.separator#',' #loc.separator# ','all');
				}

				contentFor(pageTitle=loc.title, overwrite=true);
			}
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Text translation
		 * --> Use in conjunction with Localizator plugin
		 * --> http://cfwheels.org/plugins/listing/89
		 * ---------------------------------------------------------------------------------------------------
		*/
		public string function getTranslation(required string text) {
			if ( application.wheels.breadcrumbIsLocalized ) {
				return l(arguments.text);
			
			} else {
				return arguments.text;
			}
		}
	}
</cfscript>