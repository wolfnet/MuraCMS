<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfcomponent extends="mura.cfobject" output="false">

<!---- HANDLERS --->
<cffunction name="standardWrongDomainHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cflocation addtoken="no" url="http://#application.settingsManager.getSite(request.siteid).getDomain()##application.configBean.getServerPort()##application.configBean.getContext()##getBean('contentRenderer').getURLStem(arguments.event.getValue('siteID'),arguments.event.getValue('contentBean').getFilename())#">

</cffunction>

<cffunction name="standardTranslationHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset arguments.event.getTranslator('standardHTML').translate(arguments.event)/>

</cffunction>

<cffunction name="standardTrackSessionHandler" output="false" returnType="any">
	<cfargument name="event" required="true">	
	
	<cfset application.sessionTrackingManager.trackRequest(arguments.event.getValue('siteID'),arguments.event.getValue('path'),arguments.event.getValue('keywords'),arguments.event.getValue('contentBean').getcontentID()) />
		
</cffunction>

<cffunction name="standardSetPreviewHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset arguments.event.setValue('track',0)>
	<cfset arguments.event.setValue('nocache',1)>
	<cfset arguments.event.setValue('contentBean',application.contentManager.getcontentVersion(arguments.event.getValue('previewID'),arguments.event.getValue('siteID'),true)) />

</cffunction>

<cffunction name="standardSetPermissionsHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset getBean("userUtility").returnLoginCheck(arguments.event.getValue("MuraScope"))>
	
	<cfset arguments.event.setValue('r',application.permUtility.setRestriction(arguments.event.getValue('crumbdata')))>
	<cfif arguments.event.getValue('r').restrict>
		<cfset arguments.event.setValue('nocache',1)>
	</cfif>
	
</cffunction>

<cffunction name="standardSetLocaleHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfparam name="session.siteID" default="">
	<cfset setLocale(application.settingsManager.getSite(arguments.event.getValue('siteid')).getJavaLocale()) />
	<cfif session.siteid neq arguments.event.getValue('siteid') or not structKeyExists(session,"locale")>
		<!---These are use for admin purposes--->
		<cfset session.siteID=arguments.event.getValue('siteid')>
		<cfset session.userFilesPath = "#application.configBean.getAssetPath()#/#arguments.event.getValue('siteid')#/assets/">
		<cfset application.rbFactory.resetSessionLocale()>
	</cfif>
</cffunction>

<cffunction name="standardSetIsOnDisplayHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfset var crumbdata="">
	<cfset var previewData=getCurrentUser().getValue("ChangesetPreviewData")>
	
	<cfif isStruct(previewData) and listFind(previewData.contentIdList,"'#arguments.event.getValue("contentBean").getContentID()#'")>
		<cfif arrayLen(arguments.event.getValue('crumbData')) gt 1>
			<cfset crumbdata=arguments.event.getValue('crumbdata')>
			<cfset arguments.event.setValue('isOnDisplay',application.contentUtility.isOnDisplay(arguments.event.getValue('contentBean').getdisplay(),arguments.event.getValue('contentBean').getdisplaystart(),arguments.event.getValue('contentBean').getdisplaystop(),arguments.event.getValue('siteID'),arguments.event.getValue('contentBean').getparentid(),crumbdata[2].type))>
		<cfelse>
			<cfset arguments.event.setValue('isOnDisplay',application.contentUtility.isOnDisplay(arguments.event.getValue('contentBean').getdisplay(),arguments.event.getValue('contentBean').getdisplaystart(),arguments.event.getValue('contentBean').getdisplaystop(),arguments.event.getValue('siteID'),arguments.event.getValue('contentBean').getparentid(),"Page"))>
		</cfif>
	<cfelseif arguments.event.valueExists('previewID')>
		<cfset arguments.event.setValue('isOnDisplay',1)>
	<cfelseif arguments.event.getValue('contentBean').getapproved() eq 0>
		<cfset arguments.event.setValue('track',0)>
		<cfset arguments.event.setValue('nocache',1)>
		<cfset arguments.event.setValue('isOnDisplay',0)>
	<cfelseif arrayLen(arguments.event.getValue('crumbData')) gt 1>
		<cfset crumbdata=arguments.event.getValue('crumbdata')>
		<cfset arguments.event.setValue('isOnDisplay',application.contentUtility.isOnDisplay(arguments.event.getValue('contentBean').getdisplay(),arguments.event.getValue('contentBean').getdisplaystart(),arguments.event.getValue('contentBean').getdisplaystop(),arguments.event.getValue('siteID'),arguments.event.getValue('contentBean').getparentid(),crumbdata[2].type))>
	<cfelse>
		<cfset arguments.event.setValue('isOnDisplay',1)>
	</cfif>
	
</cffunction>

<cffunction name="standardSetContentRendererHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfset var $=arguments.event.getValue("muraScope")>
	<cfset arguments.event.setValue('contentRenderer',arguments.event.getSite().getContentRenderer($))/>
	<cfset arguments.event.setValue('themeRenderer',arguments.event.getSite().getThemeRenderer($))/>
</cffunction>

<cffunction name="standardSetContentHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset var renderer=arguments.event.getValue("contentRenderer")>
	<cfset var themeRenderer=arguments.event.getValue("themeRenderer")>
	<cfset var contentArray="">

	<cfif arguments.event.valueExists('previewID')>
		<cfset arguments.event.getHandler("standardSetPreview").handle(arguments.event)>
	<cfelse>
		<cfset arguments.event.getHandler("standardSetAdTracking").handle(arguments.event)>
		
		<cfif not arguments.event.valueExists('contentBean')>
			<cfif len(arguments.event.getValue('linkServID'))>
				<cfset arguments.event.setValue('contentBean',application.contentManager.getActiveContent(listFirst(arguments.event.getValue('linkServID')),arguments.event.getValue('siteid'),true)) />
			<cfelseif len(arguments.event.getValue('currentFilenameAdjusted')) and application.configBean.getLoadContentBy() eq 'urltitle'>
				<cfset arguments.event.setValue('contentBean',application.contentManager.getActiveByURLTitle(listLast(arguments.event.getValue('currentFilenameAdjusted'),'/'),arguments.event.getValue('siteid'),true)) />
			<cfelse>
				<cfset arguments.event.setValue('contentBean',application.contentManager.getActiveContentByFilename(arguments.event.getValue('currentFilenameAdjusted'),arguments.event.getValue('siteid'),true)) />
			</cfif>
		</cfif>
	</cfif>

	<cfif isArray(arguments.event.getValue('contentBean'))>
		<cfset contentArray=arguments.event.getValue('contentBean')>
		<cfset arguments.event.setValue('contentBean',contentArray[1])>
	</cfif>

	<cfset arguments.event.getValidator("standard404").validate(arguments.event)>
	
	<cfif arguments.event.getValue('contentBean').getForceSSL()>
		<cfset arguments.event.setValue('forceSSL',arguments.event.getValue('contentBean').getForceSSL())/>
	</cfif>

	<cfif not arguments.event.valueExists('crumbdata')>
		<cfset arguments.event.setValue('crumbdata',application.contentGateway.getCrumbList(arguments.event.getValue('contentBean').getcontentid(),arguments.event.getContentBean().getSiteID(),true,arguments.event.getValue('contentBean').getPath())) />
	</cfif>
	
	<cfset renderer.crumbdata=arguments.event.getValue("crumbdata")>
	
	<cfif isObject(themeRenderer)>
		<cfset themeRenderer.crumbdata=arguments.event.getValue("crumbdata")>
	</cfif>
</cffunction>

<cffunction name="standardSetAdTrackingHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif arguments.event.getValue('trackSession')>
		<cfset arguments.event.setValue('track',1)>
	<cfelse>
		<cfset arguments.event.setValue('track',0)>
	</cfif>
	
</cffunction>

<cffunction name="standardRequireLoginHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset var loginURL = "" />

	<cfif arguments.event.getValue('isOnDisplay') and arguments.event.getValue('r').restrict and not arguments.event.getValue('r').loggedIn and not listFindNoCase('login,editProfile,search',arguments.event.getValue('display'))>
		<cfset loginURL = application.settingsManager.getSite(request.siteid).getLoginURL() />
		<cfif find('?', loginURL)>
			<cfset loginURL &= "&returnURL=#URLEncodedFormat(arguments.event.getValue('contentRenderer').getCurrentURL())#" />
		<cfelse>
			<cfset loginURL &= "?returnURL=#URLEncodedFormat(arguments.event.getValue('contentRenderer').getCurrentURL())#" />
		</cfif>
		<cflocation addtoken="no" url="#loginURL#">
	</cfif>

</cffunction>

<cffunction name="standardPostLogoutHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cflocation url="#arguments.event.getValue('contentRenderer').getCurrentURL()#" addtoken="false">

</cffunction>

<cffunction name="standardMobileHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfset var renderer=arguments.event.getValue("contentRenderer")>
	
	<cfif fileExists(ExpandPath( "#arguments.event.getSite().getThemeIncludePath()#/templates/mobile.cfm"))>
		<cfset renderer.listFormat="ul">
		<cfset arguments.event.getValue("contentBean").setTemplate("mobile.cfm")>
		<cfset renderer.showAdminToolbar=false>
		<cfset renderer.showMemberToolbar=false>
		<cfset renderer.showEditableObjects=false>
	</cfif>
	
</cffunction>

<cffunction name="standardLinkTranslationHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset arguments.event.getTranslator('standardLink').translate(arguments.event) />

</cffunction>

<cffunction name="standardForceSSLHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif application.utility.isHTTPS()>
		<cflocation addtoken="no" url="http://#application.settingsManager.getSite(arguments.event.getValue('siteID')).getDomain()##application.configBean.getServerPort()##arguments.event.getContentRenderer().getCurrentURL(complete=false,filterVars=false)#">
	<cfelse>
		<cflocation addtoken="no" url="https://#application.settingsManager.getSite(arguments.event.getValue('siteID')).getDomain()##application.configBean.getServerPort()##arguments.event.getContentRenderer().getCurrentURL(complete=false,filterVars=false)#">
	</cfif>
</cffunction>

<cffunction name="standardFileTranslationHandler" output="false" returnType="any">
	<cfargument name="event" required="true">

	<cfset arguments.event.getTranslator('standardFile').translate(arguments.event) />

</cffunction>

<cffunction name="standardDoResponseHandler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfset var showMeta=0>
	<cfset var renderer="">
	<cfset var siteRenderer=arguments.event.getContentRenderer()>
	<cfset var themeRenderer=arguments.event.getThemeRenderer()>
	<cfset var translator="">
	<cfif isObject(themeRenderer) and structKeyExists(themeRenderer,"showItemMeta")>
		<cfset renderer=themeRenderer>
	<cfelse>
		<cfset renderer=siteRenderer>
	</cfif>
	
	<cfset application.pluginManager.announceEvent('onRenderStart', arguments.event)/>
	
	<cfswitch expression="#arguments.event.getValue('contentBean').getType()#">
	<cfcase value="File,Link">
			
		<cfif arguments.event.getValue('isOnDisplay') and ((not arguments.event.getValue('r').restrict) or (arguments.event.getValue('r').restrict and arguments.event.getValue('r').allow))>			
			<cfif arguments.event.getValue('showMeta') neq 1 and not arguments.event.getValue('contentBean').getKidsQuery(size=1).recordcount>
				<cfswitch expression="#arguments.event.getValue('contentBean').getType()#">
					<cfcase value="Link">
						<cfif not renderer.showItemMeta("Link") or arguments.event.getValue('showMeta') eq 2>
							<cfset translator=arguments.event.getHandler('standardLinkTranslation')>
						<cfelse>
							<cfset translator=arguments.event.getHandler('standardTranslation')>
						</cfif>
					</cfcase>
					<cfcase value="File">		
						<cfif not renderer.showItemMeta(arguments.event.getValue('contentBean').getFileExt()) or arguments.event.getValue('showMeta') eq 2 or listFindNoCase('attachment,inline',arguments.event.getValue('method'))>
							<!---<cftry>--->
							<cfset translator=arguments.event.getHandler('standardFileTranslation')>
							<!---
							<cfcatch>
								<cfset arguments.event.setValue('contentBean',application.contentManager.getActiveContentByFilename("404",arguments.event.getValue('siteID'))) />
								<cfset arguments.event.getHandler('standardTranslation').handle(arguments.event) />
							</cfcatch>
							</cftry>
							--->
						<cfelse>
							<cfset translator=arguments.event.getHandler('standardTranslation')>	
						</cfif>
					</cfcase>
				</cfswitch>
			<cfelse>
				<cfset translator=arguments.event.getHandler('standardTranslation')>	
			</cfif>
		<cfelse>
			<cfset translator=arguments.event.getHandler('standardTranslation')>	
		</cfif>	
	</cfcase>
	<cfdefaultcase>
		<cfset translator=arguments.event.getHandler('standardTranslation')>
	</cfdefaultcase>
	</cfswitch>
	
	<cfset translator.handle(arguments.event) />
	
	<cfset application.pluginManager.announceEvent('onRenderEnd', arguments.event)/>
	<cfset arguments.event.getValidator('standardForceSSL').validate(arguments.event)>

</cffunction>

<cffunction name="standard404Handler" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif arguments.event.getValue("contentBean").getIsNew()>
		<cfset getPluginManager().announceEvent("onSite404",arguments.event)>
	</cfif>

	<cfif arguments.event.getValue("contentBean").getIsNew()>
		<cfset arguments.event.setValue('contentBean',application.contentManager.getActiveContentByFilename("404",arguments.event.getValue('siteid'),true)) />
			
		<cfif len(arguments.event.getValue('previewID'))>
			<cfset arguments.event.getContentBean().setBody("The requested version of this content could not be found.")>
		</cfif>
		<cfheader statuscode="404" statustext="Content Not Found" /> 
	</cfif>
	
</cffunction>

<cffunction name="standardDoActionsHandler" output="false" returnType="any">
<cfargument name="event" required="true">

<cfset var a=""/>

<cfif arguments.event.getValue('doaction') neq ''>
<cfloop list="#arguments.event.getValue('doaction')#" index="a">
<cfset doAction(a,arguments.event)>
</cfloop>
</cfif>

</cffunction>

<cffunction name="doAction" output="false">
<cfargument name="theaction" type="string" default="">
<cfargument name="event" required="true">

		<cfswitch expression="#arguments.theaction#">
			<cfcase value="login">
				<cfif fileExists(expandPath("/#application.configBean.getWebRootMap()#/#arguments.event.getValue('siteid')#/includes/loginHandler.cfc"))>
					<cfset createObject("component","#application.configBean.getWebRootMap()#.#arguments.event.getValue('siteid')#.includes.loginHandler").init().handleLogin(arguments.event.getAllValues())>
				<cfelse>
					<cfset application.loginManager.login(arguments.event.getAllValues(),'') />
				</cfif>
			</cfcase>
			
			<cfcase value="return">
				<cfset application.emailManager.track(arguments.event.getValue('emailID'),arguments.event.getValue('email'),'returnClick')>
			</cfcase>
			
			<cfcase value="logout">
				<cfset application.loginManager.logout()>
				<cfset arguments.event.getHandler("standardPostLogout").handle(arguments.event)>
			</cfcase>
			
			<cfcase value="updateprofile">
				<cfif session.mura.isLoggedIn>
					<cfset arguments.event.setValue("userID",session.mura.userID)>
					<cfif isDefined('request.addressAction')>
						<cfif arguments.event.getValue('addressAction') eq "create">
							<cfset application.userManager.createAddress(arguments.event.getAllValues())>
						<cfelseif arguments.event.getValue('addressAction') eq "update">
							<cfset application.userManager.updateAddress(arguments.event.getAllValues())>
						<cfelseif arguments.event.getValue('addressAction') eq "delete">
							<cfset application.userManager.deleteAddress(arguments.event.getValue('addressID'))>
						</cfif>
						<!--- reset the form --->
						<cfset arguments.event.setValue('addressID','')>
						<cfset arguments.event.setValue('addressAction','')>
					<cfelse>
						<cfset arguments.event.setValue('userBean',application.userManager.update( getBean("user").loadBy(userID=arguments.event.getValue("userID")).set(arguments.event.getAllValues()).getAllValues() , iif(event.valueExists('groupID'),de('true'),de('false')),true,arguments.event.getValue('siteID'))) />
						<cfif structIsEmpty(arguments.event.getValue('userBean').getErrors())>
							<cfset application.loginManager.loginByUserID(arguments.event.getAllValues())>
						</cfif>
					</cfif>
				</cfif>
			</cfcase>
			
			<cfcase value="createprofile">
				<cfif application.settingsManager.getSite(arguments.event.getValue('siteid')).getextranetpublicreg() eq 1>
					<cfset arguments.event.setValue("userID","")>
					
					<cfif arguments.event.valueExists("useProtect")>
						<cfset arguments.event.setValue("passedProtect",application.utility.cfformprotect(arguments.event))>
					</cfif>
					
					<cfset arguments.event.setValue('userBean',  getBean("user").loadBy(userID=arguments.event.getValue("userID")).set(arguments.event.getAllValues()).save() ) />		
					<cfif structIsEmpty(arguments.event.getValue('userBean').getErrors()) and not arguments.event.valueExists('passwordNoCache')>
						<cfset application.userManager.sendLoginByUser(arguments.event.getValue('userBean'),arguments.event.getValue('siteid'),arguments.event.getValue('contentRenderer').getCurrentURL(),true) />
					<cfelseif structIsEmpty(arguments.event.getValue('userBean').getErrors()) and arguments.event.valueExists('passwordNoCache') and arguments.event.getValue('userBean').getInactive() eq 0>	
						<cfset arguments.event.setValue('userID',arguments.event.getValue('userBean').getUserID()) />
						<cfset application.loginManager.loginByUserID(arguments.event.getAllValues())>
					</cfif>
				</cfif>
			</cfcase>
			
			<cfcase value="contactsend">
				<cfparam name="request.company" default="">
				<cfset getBean("mailer").send(arguments.event.getAllValues(),arguments.event.getValue('sendTo'),'#iif(arguments.event.getValue('fname') eq '' and arguments.event.getValue('lname') eq '',de('#arguments.event.getValue('company')#'),de('#arguments.event.getValue('fname')# #arguments.event.getValue('lname')#'))#',arguments.event.getValue('subject'),arguments.event.getValue('siteID'),arguments.event.getValue('email'))>
			</cfcase>
			
			<cfcase value="subscribe">
				<cfif arguments.event.valueExists("useProtect")>
					<cfset arguments.event.setValue("passedProtect",application.utility.cfformprotect(arguments.event))>
				<cfelse>
					<cfset arguments.event.setValue("passedProtect",true)>
				</cfif>
				
				<cfif arguments.event.getValue("passedProtect")>
					<cfset application.mailinglistManager.createMember(arguments.event.getAllValues())>
				</cfif>
			</cfcase>
			
			<cfcase value="unsubscribe">
				<cfset application.mailinglistManager.deleteMember(arguments.event.getAllValues())>
			</cfcase>
			
			<cfcase value="masterSubscribe">
				<cfif arguments.event.valueExists("useProtect")>
					<cfset arguments.event.setValue("passedProtect",application.utility.cfformprotect(arguments.event))>
				<cfelse>
					<cfset arguments.event.setValue("passedProtect",true)>
				</cfif>
				
				<cfif arguments.event.getValue("passedProtect")>
					<cfset application.mailinglistManager.masterSubscribe(arguments.event.getAllValues())/>
				</cfif>
			</cfcase>
			
			<cfcase value="setReminder">
				<cfif arguments.event.valueExists("useProtect")>
					<cfset arguments.event.setValue("passedProtect",application.utility.cfformprotect(arguments.event))>
				<cfelse>
					<cfset arguments.event.setValue("passedProtect",true)>
				</cfif>
				
				<cfif arguments.event.getValue("passedProtect")>
					<cfset application.contentManager.setReminder(arguments.event.getValue('contentBean').getcontentid(),arguments.event.getValue('siteID'),arguments.event.getValue('email'),arguments.event.getValue('contentBean').getdisplaystart(),arguments.event.getValue('interval')) />
				</cfif>
			</cfcase>
			
			<cfcase value="forwardEmail">
				<cfif arguments.event.valueExists("useProtect")>
					<cfset arguments.event.setValue("passedProtect",application.utility.cfformprotect(arguments.event))>
				<cfelse>
					<cfset arguments.event.setValue("passedProtect",true)>
				</cfif>
				
				<cfif arguments.event.getValue("passedProtect")>
					<cfset arguments.event.setValue('to',arguments.event.getValue('to1'))/>
					<cfset arguments.event.setValue('to',listAppend(arguments.event.getValue('to'),arguments.event.getValue('to2'))) />
					<cfset arguments.event.setValue('to',listAppend(arguments.event.getValue('to'),arguments.event.getValue('to3'))) />
					<cfset arguments.event.setValue('to',listAppend(arguments.event.getValue('to'),arguments.event.getValue('to4'))) />
					<cfset arguments.event.setValue('to',listAppend(arguments.event.getValue('to'),arguments.event.getValue('to5'))) />
					<cfset application.emailManager.forward(arguments.event.getAllValues()) />
				</cfif>
			</cfcase>
			
		</cfswitch>

</cffunction> 

<!--- VALIDATORS --->
<cffunction name="standardWrongDomainValidator" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif (application.configBean.getMode() eq 'production' and yesNoFormat(arguments.event.getValue("muraValidateDomain"))
				and not application.settingsManager.getSite(request.siteID).isValidDomain(domain:listFirst(cgi.http_host,":"), mode: "either")) 
				and not (listFirst(cgi.http_host,":") eq 'LOCALHOST' and cgi.HTTP_USER_AGENT eq 'vspider')>
			<cfset arguments.event.getHandler("standardWrongDomain").handle(arguments.event)>
		</cfif>
</cffunction>

<cffunction name="standardTrackSessionValidator" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif arguments.event.getValue('trackSession') 
			and len(arguments.event.getValue('contentBean').getcontentID()) 
			and arguments.event.getValue('contentBean').getIsNew() eq 0 
			and arguments.event.getValue('contentBean').getActive() eq 1
			and not arguments.event.valueExists('previewID')>
			<cfset arguments.event.getHandler("standardTrackSession").handle(arguments.event)>
	</cfif>
</cffunction>

<cffunction name="standardRequireLoginValidator" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif arguments.event.getValue('isOnDisplay') and arguments.event.getValue('r').restrict 
			and not arguments.event.getValue('r').loggedIn 
			and (arguments.event.getValue('display') neq 'login' and arguments.event.getValue('display') neq 'editProfile')>
			<cfset arguments.event.getHandler("standardRequireLogin").handle(arguments.event)>
	</cfif>
</cffunction>

<cffunction name="standardMobileValidator" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfif request.muraMobileRequest and not len(arguments.event.getValue('altTheme'))>
		<cfset arguments.event.getHandler("standardMobile").handle(arguments.event)>
	</cfif>
</cffunction>

<cffunction name="standardForceSSLValidator" output="false" returnType="any">
	<cfargument name="event" required="true">
	
	<cfif arguments.event.getValue("contentBean").getFilename() neq "404" 
			and 
			(
				(arguments.event.getValue('forceSSL') or (arguments.event.getValue('r').restrict and application.settingsManager.getSite(arguments.event.getValue('siteID')).getExtranetSSL() eq 1)) and not application.utility.isHTTPS()
				)
			or	(
				not (arguments.event.getValue('r').restrict or arguments.event.getValue('forceSSL')) and application.utility.isHTTPS()	
			)>
		<cfset arguments.event.getHandler("standardForceSSL").handle(arguments.event)>
	</cfif>
</cffunction>

<cffunction name="standard404Validator" output="false" returnType="any">
	<cfargument name="event" required="true">

	<cfif arguments.event.getValue('contentBean').getIsNew() eq 1>
		<cfset arguments.event.getHandler("standard404").handle(arguments.event)>
	</cfif>

</cffunction>

<!--- TRANSLATORS --->
<cffunction name="standardFileTranslator" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfset arguments.event.getValue('contentRenderer').renderFile(arguments.event.getValue('contentBean').getFileID(),arguments.event.getValue('method'),arguments.event.getValue('size')) />
</cffunction>

<cffunction name="standardLinkTranslator" output="false" returnType="any">
	<cfargument name="event" required="true">
	<cfset var theLink=arguments.event.getValue('contentRenderer').setDynamicContent(arguments.event.getValue('contentBean').getBody())>
	
	<cfif left(theLink,1) eq "?">
		<cfset theLink="/" & theLink>
	</cfif>
	<cflocation addtoken="no" statuscode="301" url="#theLink#">
</cffunction>

</cfcomponent>