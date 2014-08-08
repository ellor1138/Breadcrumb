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

			this.version = "1.3";

			application.breadcrumb = {};
			application.breadcrumb = initBreadcrumbPluginSettings();

			return this;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Return plugin settings
		 * ---------------------------------------------------------------------------------------------------
		*/
		public struct function initBreadcrumbPluginSettings() {
			var loc  = {};
			var temp = {};

			// Set application wheels path
			if ( StructKeyExists(application, "$wheels") ) {
				temp.wheels      = "$wheels";
				temp.application = application.$wheels;

			} else if (StructKeyExists(application, "wheels") ) {
				temp.wheels      = "wheels";
				temp.application = application.wheels;
			}

			/* ---------------------------------------------------------------------------------------------------
			 * APPLY DEFAULT SETTINGS IF NOT SUPPLIED IN --> (config/settings.cfm)
		 	 * ---------------------------------------------------------------------------------------------------
			*/
			
			// - SET DEFAULT BREADCRUMB FLAG
			// - set(contentForBreadcrumb="boolean") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "contentForBreadcrumb") ) {
				loc.contentForBreadcrumb = application[temp.wheels].contentForBreadcrumb;
			
			} else {
				loc.contentForBreadcrumb = true;
			}

			// - SET DEFAULT TITLE FLAG
			// - set(contentForPageTitle="boolean") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "contentForPageTitle") ) {
				loc.contentForPageTitle = application[temp.wheels].contentForPageTitle;

			} else {
				loc.contentForPageTitle = true;
			}

			// - SET DEFAULT LOCALIZATION FLAG
			// - set(breadcrumbIsLocalized="boolean") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbIsLocalized") ) {
				loc.breadcrumbIsLocalized = application[temp.wheels].breadcrumbIsLocalized;

			} else {
				loc.breadcrumbIsLocalized = false;
			}

			// - SET FLAG TO ADD HOME AT THE BEGINNING OF BREADCRUMB
			// - set(breadcrumbPrefix="boolean") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbPrefix") ) {
				loc.breadcrumbPrefix = application[temp.wheels].breadcrumbPrefix;

			} else {
				loc.breadcrumbPrefix = false;
			}

			// - SET TEXT OF BREADCRUMB HOME LINK
			// - set(breadcrumbPrefixText="string") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbPrefixText") ) {
				loc.breadcrumbPrefixText = application[temp.wheels].breadcrumbPrefixText;

			} else {
				loc.breadcrumbPrefixText = "Home";
			}

			// - SET ROUTE OF BREADCRUMB LINK
			// - set(breadcrumbPrefixLink="{route='', controller='', action='', key=''}") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbPrefixLink") ) {
				loc.breadcrumbPrefixLink = application[temp.wheels].breadcrumbPrefixLink;

			} else {
				loc.breadcrumbPrefixLink = {route="home"};
			}

			// - SET THE CLASS OF BREADCRUMB PREFIX
			// - set(breadcrumbPrefixClass="string") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbPrefixClass") ) {
				loc.breadcrumbPrefixClass = application[temp.wheels].breadcrumbPrefixClass;

			} else {
				loc.breadcrumbPrefixClass = "home";
			}

			// - SET DEFAULT BREADCRUMB <UL> CLASS
			// - set(breadcrumbClass="string") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbClass") ) {
				loc.breadcrumbClass = application[temp.wheels].breadcrumbClass;

			} else {
				loc.breadcrumbClass = "breadcrumb";
			}

			// - SET DEFAULT BREADCRUMB SELECTED <LI> CLASS
			// - set(breadcrumbActiveClass="string") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbActiveClass") ) {
				loc.breadcrumbActiveClass = application[temp.wheels].breadcrumbActiveClass;

			} else {
				loc.breadcrumbActiveClass = "active";
			}

			// - SET DEFAULT BREADCRUMB PATH SEPARATOR
			// - set(breadcrumbSeparator="chars") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbSeparator") ) {
				loc.breadcrumbSeparator = application[temp.wheels].breadcrumbSeparator;

			} else {
				loc.breadcrumbSeparator = "<span class='divider'>/</span>";
			}

			// - SET DEFAULT BREADCRUMB PROHIBITED ACTION LIST
			// - set(breadcrumbBlackList="create,edit,update") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbBlackList") ) {
				loc.breadcrumbBlackList = application[temp.wheels].breadcrumbBlackList;

			} else {
				loc.breadcrumbBlackList = "";
			}

			// - SET FLAG TO HIDE KEY IN BREADCRUMB
			// - set(breadcrumbHideKey=boolean) --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "breadcrumbHideKey") ) {
				loc.breadcrumbHideKey = application[temp.wheels].breadcrumbHideKey;

			} else {
				loc.breadcrumbHideKey = false;
			}

			// SET DEFAULT PAGE TITLE PREFIX
			// - set(pageTitlePrefix="string") --> (config/settings.cfm)
			if ( StructKeyExists(application[temp.wheels], "pageTitlePrefix") ) {
				loc.pageTitlePrefix = application[temp.wheels].pageTitlePrefix;

			} else {
				loc.pageTitlePrefix = cgi.remote_addr;
			}

			// Plugin configuraitons
			loc.plugin = {};
			loc.plugin.author        = "Simon Allard";
			loc.plugin.name          = "breadcrumb";
			loc.plugin.version       = "2.1.0";
			loc.plugin.compatibility = "1.3";
			loc.plugin.project       = "https://github.com/ellor1138/Breadcrumb";
			loc.plugin.documentation = "https://github.com/ellor1138/Breadcrumb/wiki";
			loc.plugin.issues        = "https://github.com/ellor1138/Breadcrumb/issues";

			loc.settings = {};
			loc.settings.isLocalized          = loc.breadcrumbIsLocalized;
			loc.settings.contentForBreadcrumb = loc.contentForBreadcrumb;
			loc.settings.contentForPageTitle  = loc.contentForPageTitle;

			loc.settings.breadcrumb = {};
			loc.settings.breadcrumb.prefix      = loc.breadcrumbPrefix;
			loc.settings.breadcrumb.prefixText  = loc.breadcrumbPrefixText;
			loc.settings.breadcrumb.prefixLink  = loc.breadcrumbPrefixLink;
			loc.settings.breadcrumb.prefixClass = loc.breadcrumbPrefixClass;
			loc.settings.breadcrumb.class       = loc.breadcrumbClass;
			loc.settings.breadcrumb.activeClass = loc.breadcrumbActiveClass;
			loc.settings.breadcrumb.separator   = loc.breadcrumbSeparator;
			loc.settings.breadcrumb.blackList   = loc.breadcrumbBlackList;
			loc.settings.breadcrumb.hideKey     = loc.breadcrumbHideKey;
			
			loc.settings.page = {};
			loc.settings.page.titlePrefix = loc.pageTitlePrefix;

			return loc;
		}

		// Get plugin settings
		public function getBreadcrumbSettings() {
			var loc = {};

			loc = application.breadcrumb;

			return loc;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Create content for breadcrumb & page title (automatic)
		 * ---------------------------------------------------------------------------------------------------
		*/
		public void function createBreadcrumbAndTitle(params) {
			var loc = {};

			loc.breadcrumb = "";
			loc.separator  = application.breadcrumb.breadcrumbSeparator;

			// Manual breadcrumb
			if ( StructKeyExists(arguments, "params") ) {
				loc.breadcrumbArray = arguments.params;

				for (loc.i = 1; loc.i LTE ArrayLen(loc.breadcrumbArray); loc.i++) {				
					if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
						loc.breadcrumb = loc.breadcrumb & "<li class='" & application.breadcrumb.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";

					} else {
						loc.breadcrumb = loc.breadcrumb & "<li>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
					}
				}

			// Automatic breadcrumb
			} else {
				// Set application wheels path
				if ( StructKeyExists(application, "$wheels") ) {
					loc.application = application.$wheels;

				} else if (StructKeyExists(application, "wheels") ) {
					loc.application = application.wheels;
				}

				loc.url           	= loc.application["rootPath"];
				loc.pathInfoArray 	= ListToArray(cgi.path_info, "/");
				loc.breadcrumbArray = [];

				// Add breadcrumb prefix link & text
				if ( application.breadcrumb.breadcrumbPrefix ) {
					loc.args	   = {};
					loc.args       = application.breadcrumb.breadcrumbPrefixLink;
					loc.args.text  = capitalize(getTranslation(application.breadcrumb.breadcrumbPrefixText));
					
					loc.breadcrumbArray[1] = loc.args;
				}

				// Remove black listed controller/action
				if ( Len(application.breadcrumb.breadcrumbBlackList) ) {
					loc.list = application.breadcrumb.breadcrumbBlackList;

					for (loc.i = 1; loc.i <= ListLen(loc.list); loc.i++) {
						loc.find = ArrayFindNoCase(loc.pathInfoArray, ListGetAt(loc.list, loc.i));

						if ( loc.find ) ArrayDeleteAt(loc.pathInfoArray, loc.find);
					}
				}

				// Remove key
				if ( application.breadcrumb.breadcrumbHideKey && StructKeyExists(params, "key") ) {
					loc.key = params.key;   

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
					if ( loc.i == 1 && application.breadcrumb.breadcrumbPrefix && Len(application.breadcrumb.breadcrumbPrefixClass) ) {
						if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
							loc.breadcrumb = "<li class='" & application.breadcrumb.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";
						
						} else {
							loc.breadcrumb = "<li class='" & application.breadcrumb.breadcrumbPrefixClass & "'>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
						}
					
					} else if (loc.i == ArrayLen(loc.breadcrumbArray) ) {
						loc.breadcrumb = loc.breadcrumb & "<li class='" & application.breadcrumb.breadcrumbActiveClass & "'>" & loc.breadcrumbArray[loc.i].text & "</li>";	
					
					} else {
						loc.breadcrumb = loc.breadcrumb & "<li>" & linkTo(argumentCollection=loc.breadcrumbArray[loc.i]) & loc.separator & "</li>";
					}
				}
			}

			loc.breadcrumb = "<ul class='" & application.breadcrumb.breadcrumbClass & "'>" & loc.breadcrumb & "</ul>";
			
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
			if ( application.breadcrumb.contentForBreadcrumb ) {
				contentFor(breadcrumb=loc.breadcrumb, overwrite=true);
			}

			// Clean & add page title
			if ( application.breadcrumb.contentForPageTitle ) {
				if ( Len(application.breadcrumb.pageTitlePrefix) ) {
					loc.breadCrumb = application.breadcrumb.pageTitlePrefix & application.breadcrumb.breadcrumbSeparator & loc.breadCrumb;
				}
				
				loc.title = ReReplace(loc.breadCrumb,'<(?!(/li)>)[^>]*>',' ','all');
				loc.title = ReReplace(loc.title,'<[^>]*>',' ~ ','all');
				loc.title = ReReplaceNoCase(loc.title,'~','','all');

				if ( application.breadcrumb.breadcrumbPrefix ) {
					loc.separator = ReReplaceNoCase(application.breadcrumb.breadcrumbSeparator,'<[^>]*>','','all');
					
					loc.title = ReplaceNoCase(loc.title,l(application.breadcrumb.breadcrumbPrefixText),'','all');
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
			if ( application.breadcrumb.breadcrumbIsLocalized ) {
				return l(arguments.text);
			
			} else {
				return arguments.text;
			}
		}
	}
</cfscript>