<cfparam name="navbarContainerClass" default="container">
<cfoutput>
	<div class="navbar navbar-inverse span12">
		<div class="navbar-inner">
			<div class="#navbarContainerClass#">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="#$.createHREF(filename='')#">
					#HTMLEditFormat($.siteConfig('site'))#
				</a>
				<div class="nav-collapse collapse">
					<cf_CacheOMatic key="dspPrimaryNav#$.content('contentid')#">
						#$.dspPrimaryNav(
							viewDepth=1,
							id='navPrimary',
							class='nav',
							displayHome='Never',
							closePortals=false,
							showCurrentChildrenOnly=false,
							ulTopClass='nav',
							ulNestedClass='dropdown-menu',
							liHasKidsClass='dropdown',
							liHasKidsCustomString='',
							liHasKidsNestedClass='',
							liNestedClass='',
							aHasKidsClass='dropdown-toggle',
							aHasKidsCustomString='role="button" data-toggle="dropdown" data-target="##"',
							liCurrentClass='active',
							aCurrentClass=''
						)#
					</cf_cacheomatic>
					<!---
						Optional named arguments for Primary Nav are:
							displayHome="Always/Never/Conditional"
							openPortals/closePortals="contentid,contentid" 
								(e.g. show specific sub-content in dropdown nav)
					--->
					<cfif $.currentUser().isLoggedIn()>
						<a id="logout" class="btn" href="./?doaction=logout">Logout</a>
					<cfelse>
						<form id="login" name="frmLogin" method="post" action="?nocache=1" onsubmit="return validate(this);" novalidate="novalidate" class="navbar-form pull-right">
							<input type="text" id="txtUsername" class="span2" name="username" required="true" placeholder="Username" message="#htmlEditFormat($.rbKey('user.usernamerequired'))#" />
							<input type="password" id="txtPassword" class="span2" name="password" required="true" placeholder="Password" message="#htmlEditFormat($.rbKey('user.passwordrequired'))#" />
							<input type="hidden" name="doaction" value="login" />
							<input type="hidden" name="linkServID" value="#HTMLEditFormat($.event('linkServID'))#" />
							<input type="hidden" name="returnURL" value="#HTMLEditFormat($.event('returnURL'))#" />
							<button type="submit" class="btn" value="#htmlEditFormat($.rbKey('user.login'))#">Sign in</button>
						</form>
					</cfif>
				</div><!--/.nav-collapse -->
			</div><!-- .container -->
		</div><!-- /.navbar-inner -->
	</div><!-- /.navbar -->
</cfoutput>