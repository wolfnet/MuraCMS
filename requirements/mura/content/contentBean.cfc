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
<cfcomponent extends="mura.bean.beanExtendable" output="false">
	
<cfproperty name="contentHistID" type="string" default="" required="true" />
<cfproperty name="contentID" type="string" default="" required="true" />
<cfproperty name="sourceID" type="string" default="" required="true" />
<cfproperty name="active" type="numeric" default="0" required="true" />
<cfproperty name="approved" type="numeric" default="0" required="true" />
<cfproperty name="orderno" type="numeric" default="0" required="true" />
<cfproperty name="metaDesc" type="string" default="" required="true" />
<cfproperty name="metaKeyWords" type="string" default="" required="true" />
<cfproperty name="displayStart" type="date" default="" required="true" />
<cfproperty name="displayStop" type="date" default="" required="true" />
<cfproperty name="body" type="string" default="" required="true" />
<cfproperty name="title" type="string" default="" required="true" />
<cfproperty name="menuTitle" type="string" default="" required="true" />
<cfproperty name="URLTitle" type="string" default="" required="true" />
<cfproperty name="HTMLTitle" type="string" default="" required="true" />
<cfproperty name="filename" type="string" default="" required="true" />
<cfproperty name="oldfilename" type="string" default="" required="true" />
<cfproperty name="lastUpdate" type="date" default="" required="true" />
<cfproperty name="display" type="numeric" default="" required="true" />
<cfproperty name="parentID" type="string" default="" required="true" />
<cfproperty name="type" type="string" default="Page" required="true" />
<cfproperty name="newfile" type="string" default="" required="true" />
<cfproperty name="lastUpdateBy" type="string" default="" required="true" />
<cfproperty name="lastUpdateByID" type="string" default="" required="true" />
<cfproperty name="summary" type="string" default="" required="true" />
<cfproperty name="siteID" type="string" default="" required="true" />
<cfproperty name="moduleID" type="string" default="00000000000000000000000000000000000" required="true" />
<cfproperty name="isNav" type="numeric" default="1" required="true" />
<cfproperty name="restricted" type="numeric" default="0" required="true" />
<cfproperty name="target" type="string" default="_self" required="true" />
<cfproperty name="restrictGroups" type="string" default="" required="true" />
<cfproperty name="template" type="string" default="" required="true" />
<cfproperty name="childTemplate" type="string" default="" required="true" />
<cfproperty name="responseMessage" type="string" default="" required="true" />
<cfproperty name="responseChart" type="numeric" default="0" required="true" />
<cfproperty name="responseSendTo" type="string" default="" required="true" />
<cfproperty name="responseDisplayFields" type="string" default="" required="true" />
<cfproperty name="moduleAssign" type="string" default="" required="true" />
<cfproperty name="notes" type="string" default="" required="true" />
<cfproperty name="inheritObjects" type="string" default="Inherit" required="true" />
<cfproperty name="isFeature" type="numeric" default="0" required="true" />
<cfproperty name="isNew" type="numeric" default="1" required="true" />
<cfproperty name="releaseDate" type="date" default="" required="true" />
<cfproperty name="isLocked" type="numeric" default="0" required="true" />
<cfproperty name="nextN" type="numeric" default="10" required="true" />
<cfproperty name="sortBy" type="string" default="orderno" required="true" />
<cfproperty name="sortDirection" type="string" default="asc" required="true" />
<cfproperty name="featureStart" type="date" default="" required="true" />
<cfproperty name="featureStop" type="date" default="" required="true" />
<cfproperty name="fileID" type="string" default="" required="true" />
<cfproperty name="fileSize" type="numeric" default="0" required="true" />
<cfproperty name="fileExt" type="string" default="" required="true" />
<cfproperty name="contentType" type="string" default="" required="true" />
<cfproperty name="contentSubType" type="string" default="" required="true" />
<cfproperty name="forceSSL" type="numeric" default="0" required="true" />
<cfproperty name="remoteURL" type="string" default="" required="true" />
<cfproperty name="remoteID" type="string" default="" required="true" />
<cfproperty name="remotePubDate" type="string" default="" required="true" />
<cfproperty name="remoteSource" type="string" default="" required="true" />
<cfproperty name="remoteSourceURL" type="string" default="" required="true" />
<cfproperty name="credits" type="string" default="" required="true" />
<cfproperty name="audience" type="string" default="" required="true" />
<cfproperty name="keyPoints" type="string" default="" required="true" />
<cfproperty name="searchExclude" type="numeric" default="0" required="true" />
<cfproperty name="displayTitle" type="numeric" default="1" required="true" />
<cfproperty name="path" type="string" default="" required="true" />
<cfproperty name="tags" type="string" default="" required="true" />
<cfproperty name="doCache" type="numeric" default="1" required="true" />
<cfproperty name="created" type="date" default="" required="true" />
<cfproperty name="mobileExclude" type="numeric" default="0" required="true" />
<cfproperty name="changesetID" type="string" default="" required="true" />
<cfproperty name="imageSize" type="string" default="small" required="true" />
<cfproperty name="imageHeight" type="string" default="AUTO" required="true" />
<cfproperty name="imageWidth" type="string" default="AUTO" required="true" />
<cfproperty name="majorVersion" type="numeric" default="0" required="true" />
<cfproperty name="minorVersion" type="numeric" default="0" required="true" />
<cfproperty name="expires" type="date" default="" required="true" />
<cfproperty name="assocFilename" type="date" default="" required="true" />
<cfproperty name="displayInterval" type="string" default="Daily" required="true" />

<cffunction name="init" access="public" returntype="any" output="false">
	
	<cfset super.init(argumentCollection=arguments)>

	<cfset variables.instance.ContentHistID = "" />
	<cfset variables.instance.Contentid = "" />
	<cfset variables.instance.sourceID = "" />
	<cfset variables.instance.Active = 0 />
	<cfset variables.instance.OrderNo = 1 />
	<cfset variables.instance.MetaDesc = "" />
	<cfset variables.instance.MetaKeyWords = "" />
	<cfset variables.instance.Approved = 0 />
	<cfset variables.instance.DisplayStart = "" />
	<cfset variables.instance.Displaystop = "">
	<cfset variables.instance.Body = "" />
	<cfset variables.instance.Title = "" />
	<cfset variables.instance.MenuTitle = "" />
	<cfset variables.instance.URLTitle="" />
	<cfset variables.instance.HTMLTitle="" />
	<cfset variables.instance.Filename = "" />
	<cfset variables.instance.OldFilename = "" />
	<cfset variables.instance.LastUpdate = now() />
	<cfset variables.instance.Display = 1 />
	<cfset variables.instance.ParentID = "" />
	<cfset variables.instance.newFile = "" />
	<cfset variables.instance.type = "Page" />
	<cfset variables.instance.subType = "Default" />
	
	<cfif isDefined("session.mura") and session.mura.isLoggedIn>
		<cfset variables.instance.LastUpdateBy = left(session.mura.fname & " " & session.mura.lname,50) />
		<cfset variables.instance.LastUpdateByID = session.mura.userID />
	<cfelse>
		<cfset variables.instance.LastUpdateBy = "" />
		<cfset variables.instance.LastUpdateByID = "" />
	</cfif>
	
	<cfset variables.instance.Summary = "" />
	<cfset variables.instance.SiteID = "" />
	<cfset variables.instance.ModuleID = "00000000000000000000000000000000000" />
	<cfset variables.instance.IsNav = 1 />
	<cfset variables.instance.Restricted = 0 />
	<cfset variables.instance.Target = "_self" />
	<cfset variables.instance.RestrictGroups = "" />
	<cfset variables.instance.Template = "" />
	<cfset variables.instance.childTemplate=""/>
	<cfset variables.instance.ResponseMessage = "" />
	<cfset variables.instance.ResponseChart = 0 />
	<cfset variables.instance.ResponseSendTo = "" />
	<cfset variables.instance.ResponseDisplayFields = "" />
	<cfset variables.instance.ModuleAssign = "" />
	<cfset variables.instance.notes = "" />
	<cfset variables.instance.inheritObjects = "Inherit" />
	<cfset variables.instance.isFeature = 0 />
	<cfset variables.instance.isNew = 1 />
	<cfset variables.instance.releaseDate = "" />
	<cfset variables.instance.targetParams = "" />
	<cfset variables.instance.IsLocked = 0 />
	<cfset variables.instance.nextN = 10 />
	<cfset variables.instance.sortBy = "orderno" />
	<cfset variables.instance.sortDirection = "asc" />
	<cfset variables.instance.FeatureStart = "" />
	<cfset variables.instance.FeatureStop = "">
	<cfset variables.instance.FileID = "">
	<cfset variables.instance.FileSize = 0>
	<cfset variables.instance.FileExt = "">
	<cfset variables.instance.ContentType = "">
	<cfset variables.instance.ContentSubType = "">
	<cfset variables.instance.forceSSL = 0>
	<cfset variables.instance.remoteURL = "">
	<cfset variables.instance.remoteID = "">
	<cfset variables.instance.remotePubDate = "">
	<cfset variables.instance.remoteSource = "">
	<cfset variables.instance.remoteSourceURL = "">
	<cfset variables.instance.credits = "">
	<cfset variables.instance.audience = "">
	<cfset variables.instance.keyPoints = "">
	<cfset variables.instance.searchExclude = 0>
	<cfset variables.instance.displayTitle = 1>
	<cfset variables.instance.Path = "">
	<cfset variables.instance.tags = "">
	<cfset variables.instance.doCache = 1 />
	<cfset variables.instance.created = now() />
	<cfset variables.instance.mobileExclude = 0 />
	<cfset variables.instance.changesetID = "" />
	<cfset variables.instance.tcontent_id = 0 />
	<cfset variables.instance.imageSize = "small" />
	<cfset variables.instance.imageHeight = "AUTO" />
	<cfset variables.instance.imageWidth = "AUTO" />
	<cfset variables.instance.majorVersion = 0 />
	<cfset variables.instance.minorVersion = 0 />
	<cfset variables.instance.expires = "" />
	<cfset variables.instance.assocFilename = "" />
	<cfset variables.instance.displayInterval = "Daily" />
	<cfset variables.instance.errors=structnew() />
	<cfset variables.instance.categoryID = "" />
	
	<cfset variables.kids = arrayNew(1) />
	<cfset variables.displayRegions = structNew()>
	
	<cfreturn this />
</cffunction>

<cffunction name="setContentManager">
	<cfargument name="contentManager">
	<cfset variables.contentManager=arguments.contentManager>
	<cfreturn this>
</cffunction>

<cffunction name="setConfigBean">
	<cfargument name="configBean">
	<cfset variables.configBean=arguments.configBean>
	<cfreturn this>
</cffunction>

<cffunction name="setSettingsManager">
	<cfargument name="settingsManager">
	<cfset variables.settingsManager=arguments.settingsManager>
	<cfreturn settingsManager>
</cffunction>

<cffunction name="set" returnType="any" output="false" access="public">
    <cfargument name="content" type="any" required="true">
	
	<cfset var starthour = 0 />
	<cfset var stophour = 0 />
	<cfset var pageNum = 2 />
	<cfset var featurestophour="" />
	<cfset var featurestarthour="" />
	<cfset var releasehour="" />
	<cfset var expireshour="" />
	<cfset var prop="" />
	
	<cfif isQuery(arguments.content) and arguments.content.recordcount>
		<cfloop list="#arguments.content.columnlist#" index="prop">
			<cfset setValue(prop,arguments.content[prop][1]) />
		</cfloop>
		
	<cfelseif isStruct(arguments.content)>
		<cfloop collection="#arguments.content#" item="prop">
			<cfset setValue(prop,arguments.content[prop]) />
		</cfloop>
		
		<cfif variables.instance.display eq 2 
			AND isDate(variables.instance.displayStart)>
			
			<cfif isdefined("arguments.content.starthour")
			and isdefined("arguments.content.startMinute")
			and isdefined("arguments.content.startDayPart")>
			
				<cfif arguments.content.startdaypart eq "PM">
					<cfset starthour = arguments.content.starthour + 12>
					
					<cfif starthour eq 24>
						<cfset starthour = 12>
					</cfif>
				<cfelse>
					<cfset starthour = arguments.content.starthour>
					
					<cfif starthour eq 12>
						<cfset starthour = 0>
					</cfif>
				</cfif>
				
				<cfset setDisplayStart(createDateTime(year(variables.instance.displayStart), month(variables.instance.displayStart), day(variables.instance.displayStart),starthour, arguments.content.startMinute, "0"))>
		
			</cfif>
		<cfelseif variables.instance.display eq 2 >
			<cfset variables.instance.display=1 >
			<cfset variables.instance.displayStart="" >
			<cfset variables.instance.displayStop="" >
		</cfif>
		
		<cfif variables.instance.display eq 2 
			AND isDate(variables.instance.displayStop)>
			
			<cfif isdefined("arguments.content.Stophour")
			and isdefined("arguments.content.StopMinute")
			and isdefined("arguments.content.StopDayPart")>
			<cfif arguments.content.stopdaypart eq "PM">
				<cfset stophour = arguments.content.stophour + 12>
				
				<cfif stophour eq 24>
					<cfset stophour = 12>
				</cfif>
			<cfelse>
				<cfset stophour = arguments.content.stophour>
				
				<cfif stophour eq 12>
					<cfset stophour = 0>
				</cfif>
			</cfif>
			
			<cfset setDisplayStop(createDateTime(year(variables.instance.displayStop), month(variables.instance.displayStop), day(variables.instance.displayStop),stophour, arguments.content.StopMinute, "0"))>
			
			</cfif>
		</cfif>
		
		<cfif variables.instance.isFeature eq 2 
			AND isDate(variables.instance.featureStart)
			and isdefined("arguments.content.featurestarthour")
			and isdefined("arguments.content.featurestartMinute")
			and isdefined("arguments.content.featureStartDayPart")>
			
			<cfif arguments.content.featureStartdaypart eq "PM">
				<cfset featurestarthour = arguments.content.featurestarthour + 12>
				
				<cfif featurestarthour eq 24>
					<cfset featurestarthour = 12>
				</cfif>
			<cfelse>
				<cfset featurestarthour = arguments.content.featurestarthour>
				
				<cfif featurestarthour eq 12>
					<cfset featurestarthour = 0>
				</cfif>
			</cfif>
			
			<cfset setFeatureStart(createDateTime(year(variables.instance.featureStart), month(variables.instance.featureStart), day(variables.instance.featureStart),Featurestarthour, arguments.content.featurestartMinute, "0"))>
		</cfif>
		
		<cfif variables.instance.isFeature eq 2 
			AND isDate(variables.instance.featureStop)
			and isdefined("arguments.content.featurestophour")
			and isdefined("arguments.content.featurestopMinute")
			and isdefined("arguments.content.featureStopDayPart")>
			
			<cfif arguments.content.featureStopdaypart eq "PM">
				<cfset featurestophour = arguments.content.featurestophour + 12>
				
				<cfif featurestophour eq 24>
					<cfset featurestophour = 12>
				</cfif>
			<cfelse>
				<cfset featurestophour = arguments.content.featurestophour>
				
				<cfif featurestophour eq 12>
					<cfset featurestophour = 0>
				</cfif>
			</cfif>
			
			<cfset setFeatureStop(createDateTime(year(variables.instance.featureStop), month(variables.instance.featureStop), day(variables.instance.featureStop),Featurestophour, arguments.content.featurestopMinute, "0"))>
		</cfif>
		
		<cfif isDate(variables.instance.releaseDate)>
			
			<cfif isdefined("arguments.content.releasehour")
			and isdefined("arguments.content.releaseMinute")
			and isdefined("arguments.content.releaseDayPart")>
			
				<cfif arguments.content.releasedaypart eq "PM">
					<cfset releasehour = arguments.content.releasehour + 12>
					
					<cfif releasehour eq 24>
						<cfset releasehour = 12>
					</cfif>
				<cfelse>
					<cfset releasehour = arguments.content.releasehour>
					
					<cfif releasehour eq 12>
						<cfset releasehour = 0>
					</cfif>
				</cfif>
				
				<cfset setReleaseDate(createDateTime(year(variables.instance.releaseDate), month(variables.instance.releaseDate), day(variables.instance.releaseDate), releasehour, arguments.content.releaseMinute, "0"))>
		
			</cfif>
		</cfif>
		
		<cfif isDate(variables.instance.expires)>
			
			<cfif isdefined("arguments.content.expireshour")
			and isdefined("arguments.content.expiresMinute")
			and isdefined("arguments.content.expiresDayPart")>
			
				<cfif arguments.content.expiresdaypart eq "PM">
					<cfset expireshour = arguments.content.expireshour + 12>
					
					<cfif expireshour eq 24>
						<cfset expireshour = 12>
					</cfif>
				<cfelse>
					<cfset expireshour = arguments.content.expireshour>
					
					<cfif expireshour eq 12>
						<cfset expireshour = 0>
					</cfif>
				</cfif>
				
				<cfset setExpires(createDateTime(year(variables.instance.expires), month(variables.instance.expires), day(variables.instance.expires), expireshour, arguments.content.expiresMinute, "0"))>
		
			</cfif>
		</cfif>
		
		<cfif isDefined("session.mura") and session.mura.isLoggedIn>
			<cfset variables.instance.LastUpdateBy = left(session.mura.fname & " " & session.mura.lname,50) />
			<cfset variables.instance.LastUpdateByID = session.mura.userID />
		<cfelse>
			<cfset variables.instance.LastUpdateBy = "" />
			<cfset variables.instance.LastUpdateByID = "" />
		</cfif>
		
	</cfif>
	
	<cfreturn this />
</cffunction>

<cffunction name="validate" access="public" output="false">
	<cfset var extErrors=structNew() />
	
	<cfif len(variables.instance.siteID)>
		<cfset extErrors=variables.configBean.getClassExtensionManager().validateExtendedData(getAllValues())>
	</cfif>
		
	<cfset variables.instance.errors=structnew() />
		
	<cfif not structIsEmpty(extErrors)>
		<cfset structAppend(variables.instance.errors,extErrors)>
	</cfif>

	<cfif listFindNoCase('Form,Component',variables.instance.type)
		and variables.contentManager.doesLoadKeyExist(this,'title',variables.instance.title)>
			<cfset variables.instance.errors.titleconflict=variables.settingsManager.getSite(variables.instance.siteID).getRBFactory().getKey("sitemanager.titlenotunique")>
	</cfif>
	
	<cfif variables.instance.isNew 
		and listFindNoCase('File',variables.instance.type)
		and not (len(variables.instance.newfile) or len(variables.instance.fileID))>
			<cfset variables.instance.errors.filemissing=variables.settingsManager.getSite(variables.instance.siteID).getRBFactory().getKey("sitemanager.filemissing")>
	</cfif>

	<cfreturn this>	
</cffunction>
 
<cffunction name="getAllValues" access="public" returntype="struct" output="false">
	<cfargument name="autocomplete" required="true" default="#variables.instance.extendAutoComplete#">
	<cfset var i="">
	<cfset var extData="">
		
	<cfif arguments.autocomplete>
		<cfset extData=getExtendedData().getAllExtendSetData()>
		<cfif not structIsEmpty(extData)>
			<cfset structAppend(variables.instance,extData.data,false)>	
			<cfloop list="#extData.extendSetID#" index="i">
				<cfif not listFind(variables.instance.extendSetID,i)>
					<cfset variables.instance.extendSetID=listAppend(variables.instance.extendSetID,i)>
				</cfif>
			</cfloop>
		</cfif>
		
		<cfif not structIsEmpty(variables.displayRegions)>
			<cfloop collection="#variables.displayRegions#" item="i">
				<cfset variables.instance[i]=variables.contentManager.formatRegionObjectsString(variables.displayRegions[i])>
			</cfloop>
		</cfif>
	</cfif>
		
	<cfset purgeExtendedData()>
	<cfset variables.displayRegions=structNew()>
		
	<cfreturn variables.instance />
</cffunction>

<cffunction name="getContentHistID" returnType="string" output="false" access="public">
    <cfif not len(variables.instance.ContentHistID)>
		<cfset variables.instance.ContentHistID = createUUID() />
	</cfif>
	<cfreturn variables.instance.ContentHistID />
</cffunction>
  
<cffunction name="getContentID" returnType="string" output="false" access="public">
    <cfif not len(variables.instance.contentid)>
		<cfset variables.instance.contentid = createUUID() />
	</cfif>
	<cfreturn variables.instance.contentid />
</cffunction>

<cffunction name="setDisplayStart" output="false" access="public">
    <cfargument name="DisplayStart" type="string" required="true">
	<cfset variables.instance.displayStart = parseDateArg(arguments.displayStart) />
	<cfreturn this>
</cffunction>

<cffunction name="setDisplaystop" output="false" access="public">
    <cfargument name="Displaystop" type="string" required="true">
	<cfset variables.instance.Displaystop = parseDateArg(arguments.Displaystop) />
	<cfreturn this>
</cffunction>

<cffunction name="setExpires" output="false" access="public">
    <cfargument name="expires" type="string" required="true">
	<cfset variables.instance.expires = parseDateArg(arguments.expires) />
	<cfreturn this>
</cffunction>

<cffunction name="setLastUpdate" output="false" access="public">
    <cfargument name="LastUpdate" type="string" required="true">
	<cfset variables.instance.LastUpdate = parseDateArg(arguments.LastUpdate) />
	<cfreturn this>
</cffunction>
  
<cffunction name="setType" output="false" access="public">
    <cfargument name="Type" type="string" required="true">
    
    <cfif arguments.type eq 'Portal'>
		<cfset arguments.type='Folder'>
	</cfif>
	
    <cfset arguments.Type=trim(arguments.Type)>
	
	<cfif len(arguments.Type) and variables.instance.Type neq arguments.Type>
		<cfset variables.instance.Type = arguments.Type />
		<cfset purgeExtendedData()>
		<cfif variables.instance.Type eq "Form">
			<cfset variables.instance.moduleID="00000000000000000000000000000000004">
			<cfset variables.instance.ParentID="00000000000000000000000000000000004">
		<cfelseif variables.instance.Type eq "Component">
			<cfset variables.instance.moduleID="00000000000000000000000000000000003">
			<cfset variables.instance.ParentID="00000000000000000000000000000000003">
		</cfif>
	</cfif>
	
	<cfreturn this>
</cffunction>

<cffunction name="setTitle" output="false" access="public">
    <cfargument name="title" type="string" required="true">
   	<cfset arguments.title=trim(arguments.title)>

   	<cfif len(arguments.title)>
		<cfset variables.instance.title =arguments.title />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setFilename" output="false">
	<cfargument name="filename">
	<cfset variables.instance.filename=left(arguments.filename,255)>
	<cfreturn this>
</cffunction>

<cffunction name="setLastUpdateBy" access="public" output="false">
	<cfargument name="lastUpdateBy" type="String" />
	<cfset variables.instance.lastUpdateBy = left(trim(arguments.lastUpdateBy),50) />
	<cfreturn this>
</cffunction>

<cffunction name="setReleaseDate" output="false" access="public">
    <cfargument name="releaseDate" type="string" required="true">
	<cfset variables.instance.releaseDate = parseDateArg(arguments.releaseDate) />
	<cfreturn this>
</cffunction>
  
<cffunction name="setNextN" output="false" access="public">
    <cfargument name="NextN" type="any" required="true">
	<cfif isNumeric(arguments.NextN)>
   		<cfset variables.instance.NextN = arguments.NextN />
	</cfif>
	<cfreturn this>
</cffunction>
  
<cffunction name="setFeatureStop" output="false" access="public">
    <cfargument name="FeatureStop" type="string" required="true">
    <cfset variables.instance.FeatureStop = parseDateArg(arguments.FeatureStop) />
	<cfreturn this>
</cffunction>

<cffunction name="setFeatureStart" output="false" access="public">
    <cfargument name="FeatureStart" type="string" required="true">
	<cfset variables.instance.FeatureStart = parseDateArg(arguments.FeatureStart) />
	<cfreturn this>
</cffunction>
  
<cffunction name="setRemotePubDate" output="false" access="public">
    <cfargument name="RemotePubDate" type="string" required="true">
	<cfset variables.instance.RemotePubDate = parseDateArg(arguments.RemotePubDate) />
	<cfreturn this>
</cffunction>

<cffunction name="setDisplayTitle" output="false" access="public">
    <cfargument name="DisplayTitle" required="true">
	<cfif isNumeric(arguments.DisplayTitle)>
  	  <cfset variables.instance.DisplayTitle = arguments.DisplayTitle />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setMajorVersion" output="false" access="public">
    <cfargument name="majorVersion" required="true">
	<cfif isNumeric(arguments.majorVersion)>
  	  <cfset variables.instance.majorVersion = arguments.majorVersion />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setMinorVersion" output="false" access="public">
    <cfargument name="minorVersion" required="true">
	<cfif isNumeric(arguments.minorVersion)>
  	  <cfset variables.instance.minorVersion = arguments.minorVersion />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setDoCache" output="false" access="public">
    <cfargument name="doCache" required="true">
	<cfif isNumeric(arguments.doCache)>
    <cfset variables.instance.doCache = arguments.doCache />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setMobileExclude" output="false" access="public">
    <cfargument name="mobileExclude" required="true">
	<cfif isNumeric(arguments.mobileExclude)>
    <cfset variables.instance.mobileExclude = arguments.mobileExclude />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setCreated" output="false" access="public">
    <cfargument name="Created" type="string" required="true">
	<cfset variables.instance.Created = parseDateArg(arguments.Created) />
	<cfreturn this>
</cffunction>

<cffunction name="setImageSize" output="false">
	<cfargument name="imageSize">
	<cfif len(arguments.imageSize)>
		<cfset variables.instance.imageSize = arguments.imageSize>
	</cfif>	
	<cfreturn this>
</cffunction>

<cffunction name="getImageSize" output="false" access="public">
	<cfif variables.instance.imageSize eq "Custom"
	and variables.instance.ImageHeight eq "AUTO" 
	and variables.instance.ImageWidth eq "AUTO">
  	  <cfreturn "small" />
	<cfelse>
		<cfreturn variables.instance.imageSize>
	</cfif>
</cffunction>

<cffunction name="setImageHeight" output="false" access="public">
    <cfargument name="ImageHeight" required="true">
	<cfif isNumeric(arguments.ImageHeight)>
  	  <cfset variables.instance.ImageHeight = arguments.ImageHeight />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="getImageHeight" output="false" access="public">
	<cfif variables.instance.imageSize eq "Custom">
  	  <cfreturn variables.instance.ImageHeight />
	<cfelse>
		<cfreturn "AUTO">
	</cfif>
</cffunction>

<cffunction name="setImageWidth" output="false" access="public">
    <cfargument name="ImageWidth" required="true">
	<cfif isNumeric(arguments.ImageWidth)>
  	  <cfset variables.instance.ImageWidth = arguments.ImageWidth />
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="getImageWidth" output="false" access="public">
	<cfif variables.instance.imageSize eq "Custom">
  	  <cfreturn variables.instance.ImageWidth />
	<cfelse>
		<cfreturn "AUTO">
	</cfif>
</cffunction>

<cffunction name="setDisplayList" output="false">
	<cfargument name="displayList">
	<cfset variables.instance.responseDisplayFields=arguments.displayList>
	<cfreturn this>	
</cffunction>

<cffunction name="getDisplayList" output="false">
	<cfreturn variables.instance.responseDisplayFields>
</cffunction>

<cffunction name="getAvailableDisplayList" output="false">
	<cfset var returnList="">
	<cfset var i=0>
	<cfset var finder=0>
	<cfset var rsExtend=variables.configBean.getClassExtensionManager().getExtendedAttributeList(variables.instance.siteID,"tcontent")>
	
	<cfif variables.instance.type neq "Gallery">
		<cfset returnList="Date,Title,Image,Summary,Body,ReadMore,Credits,Comments,Tags,Rating">
	<cfelse>
		<cfset returnList="Date,Title,Summary,ReadMore,Credits,Comments,Tags,Rating">
	</cfif>

	<cfif rsExtend.recordcount>
		<cfquery name="rsExtend" dbType="query">
			select attribute from rsExtend 
			group by attribute
			order by attribute
		</cfquery>
		<cfset returnList=returnList & "," & valueList(rsExtend.attribute)>
	</cfif>
	
	<cfloop list="#variables.instance.responseDisplayFields#" index="i">
		<cfset finder=listFindNoCase(returnList,i)>
		<cfif finder>
			<cfset returnList=listDeleteAt(returnList,finder)>
		</cfif>
	</cfloop>
	<cfreturn returnList>
</cffunction>

<cffunction name="setCategory" returntype="any" access="public" output="false">
	<cfargument name="categoryID"  required="true" default=""/>
	<cfargument name="isFeature"  required="true" default="0"/>
	<cfargument name="featureStart"  required="true" default=""/>	
	<cfargument name="featureStop"  required="true" default=""/>	
	
	<cfset var catTrim=replace(arguments.categoryID,'-','','ALL')>
	
	<cfset variables.instance["categoryAssign#catTrim#"]=arguments.isFeature />
	
	<cfif not listFind(variables.instance.categoryID,arguments.categoryID)>
		<cfset variables.instance.categoryID=listAppend(variables.instance.categoryID,arguments.categoryID)>
	</cfif>
	
	<cfif arguments.isFeature eq "2">
		<cfif isdate(arguments.featureStart)>
			<cfset variables.instance['featureStart#catTrim#']=arguments.featureStart />
			<cfset variables.instance['startDayPart#catTrim#']=timeFormat(arguments.featureStart,"tt") />
			<cfset variables.instance['starthour#catTrim#']=hour(arguments.featureStart) />
			<cfif variables.instance['startDayPart#catTrim#'] eq 'pm'>
				<cfset variables.instance['starthour#catTrim#']=variables.instance['starthour#catTrim#']-12>
			</cfif>
			<cfset variables.instance['startMinute#catTrim#']=minute(arguments.featureStart) />
		<cfelse>
			<cfset variables.instance["categoryAssign#catTrim#"]=1 />
		</cfif>
		<cfif isdate(arguments.featureStop)>
			<cfset variables.instance['featureStop#catTrim#']=arguments.featureStop />
			<cfset variables.instance['stopDayPart#catTrim#']=timeFormat(arguments.featureStop,"tt") />
			<cfset variables.instance['stophour#catTrim#']=hour(arguments.featureStop) />
			<cfif variables.instance['stopDayPart#catTrim#'] eq 'pm'>
				<cfset variables.instance['stophour#catTrim#']=variables.instance['stophour#catTrim#']-12>
			</cfif>
			<cfset variables.instance['stopMinute#catTrim#']=minute(arguments.featureStop) />
		<cfelse>
			<cfset variables.instance['featureStop#catTrim#']="" />
			<cfset variables.instance['stopDayPart#catTrim#']="" />
			<cfset variables.instance['stophour#catTrim#']="" />
			<cfset variables.instance['stopMinute#catTrim#']="" />
		</cfif>
	</cfif>
	<cfreturn this>
</cffunction>

<cffunction name="setCategories" returntype="any" access="public" output="false">
	<cfargument name="categoryList"  required="true" default=""/>
	<cfargument name="membership"  required="true" default="0"/>
	<cfargument name="featureStart"  required="true" default=""/>	
	<cfargument name="featureStop"  required="true" default=""/>
	
	<cfset var cat = "" />
	<cfloop list="#arguments.categoryList#" index="cat">
		<cfset setCategory(
			cat,
			arguments.membership,
			arguments.featureStart,
			arguments.featureStop	
		) />
	</cfloop>
	<cfreturn this>
</cffunction>

<cffunction name="setAllValues" returntype="any" access="public" output="false">
	<cfargument name="instance">
	<cfset super.setAllValues(argumentCollection=arguments)>
	<cfset variables.displayRegions=structNew()>
	<cfreturn this>
</cffunction>

<cffunction name="getHTMLTitle" returnType="string" output="false" access="public">
	<cfif len(variables.instance.HTMLTitle)>
		<cfreturn variables.instance.HTMLTitle />
	<cfelse>
		<cfreturn variables.instance.MenuTitle />
	</cfif>
</cffunction>
  
<cffunction name="getKidsQuery" returnType="query" output="false" access="public">
	<cfargument name="aggregation" required="true" default="false">
	<cfargument name="applyPermFilter" required="true" default="false">
	<cfargument name="size" required="true" default="0">
	<cfreturn variables.contentManager.getKidsQuery(siteID:variables.instance.siteID, parentID:getContentID(), sortBy:variables.instance.sortBy, sortDirection:variables.instance.sortDirection, aggregation=arguments.aggregation,applyPermFilter=arguments.applyPermFilter,size=arguments.size) />
</cffunction>

<cffunction name="getKidsIterator" returnType="any" output="false" access="public">
	<cfargument name="liveOnly" required="true" default="true">
	<cfargument name="aggregation" required="true" default="false">
	<cfargument name="applyPermFilter" required="true" default="false">
	<cfargument name="size" required="true" default="0">
	<cfset var q="" />
	<cfset var it=getBean("contentIterator")>
	
	<cfif arguments.liveOnly>
		<cfset q=getKidsQuery(aggregation=arguments.aggregation,applyPermFilter=arguments.applyPermFilter,size=arguments.size) />
	<cfelse>
		<cfset q=variables.contentManager.getNest( parentID:getContentID(), siteID:variables.instance.siteID, sortBy:variables.instance.sortby, sortDirection:variables.instance.sortdirection,size=arguments.size) />
	</cfif>
	<cfset it.setQuery(q,variables.instance.nextn)>
	
	<cfreturn it>
</cffunction>

<cffunction name="getKidsCategoryQuery" returntype="any" output="false" access="public">
	<cfreturn variables.contentManager.getCategoriesByParentID(siteID:variables.instance.siteID,parentID:getContentID()) />
</cffunction>

<cffunction name="getKidsCategoryIterator">
	<cfscript>
		var q = getKidsCategoryQuery();
		var it = getBean('categoryIterator').init();
		it.setQuery(q);
		return it;
	</cfscript>
</cffunction>

<cffunction name="getVersionHistoryQuery" returnType="query" output="false" access="public">
	<cfreturn variables.contentManager.getHist(getContentID(), variables.instance.siteID) />
</cffunction>

<cffunction name="getVersionHistoryIterator" returnType="any" output="false" access="public">
	<cfset var q=getVersionHistoryQuery() />
	<cfset var it=getBean("contentIterator")>
	<cfset it.setQuery(q)>
	<cfreturn it>
</cffunction>

<cffunction name="getCategoriesQuery" returnType="query" output="false" access="public">
	<cfreturn variables.contentManager.getCategoriesByHistID(getContentHistID()) />
</cffunction>

<cffunction name="getCategoriesIterator" returnType="any" output="false" access="public">
	<cfset var q=getCategoriesQuery() />
	<cfset var it=getBean("categoryIterator").init()>
	<cfset it.setQuery(q)>
	<cfreturn it>
</cffunction>

<cffunction name="getRelatedContentQuery" returnType="query" output="false" access="public">
	<cfargument name="liveOnly" type="boolean" required="yes" default="false" />
	<cfargument name="today" type="date" required="yes" default="#now()#" />
	<cfargument name="sortBy" type="string" default="created" >
	<cfargument name="sortDirection" type="string" default="desc" >
	
	<cfreturn variables.contentManager.getRelatedContent(variables.instance.siteID, getContentHistID(), arguments.liveOnly, arguments.today,arguments.sortBy,arguments.sortDirection) />
</cffunction>

<cffunction name="getRelatedContentIterator" returnType="any" output="false" access="public">
	<cfargument name="liveOnly" type="boolean" required="yes" default="false" />
	<cfargument name="today" type="date" required="yes" default="#now()#" />
	<cfargument name="sortBy" type="string" default="created" >
	<cfargument name="sortDirection" type="string" default="desc" >
	
	<cfset var q=getRelatedContentQuery(arguments.liveOnly, arguments.today,arguments.sortBy,arguments.sortDirection) />
	<cfset var it=getBean("contentIterator")>
	<cfset it.setQuery(q)>
	<cfreturn it>
</cffunction>

<cffunction name="save" returnType="any" output="false" access="public">
	<cfset var kid="">
	<cfset var i="">
	<cfset setAllValues(variables.contentManager.save(this).getAllValues())>
	
	<cfif arrayLen(variables.kids)>
		<cfloop from="1" to="#arrayLen(variables.kids)#" index="i">
			<cfset kid=variables.kids[i]>
			<cfset kid.save()>
		</cfloop>
	</cfif>
	
	<cfset variables.kids=arrayNew(1)>
	
	<cfreturn this />
</cffunction>

<cffunction name="addChild" output="false">
	<cfargument name="child" hint="Instance of a contentBean">
	<cfset arguments.child.setSiteID(variables.instance.siteID)>
	<cfset arguments.child.setParentID(getContentID())>
	<cfset arguments.child.setModuleID(variables.instance.moduleID)>
	<cfset arrayAppend(variables.kids,arguments.child)>	
	<cfreturn this>
</cffunction>

<cffunction name="addDisplayObject" output="false">
	<cfargument name="regionID">
	<cfargument name="object">
	<cfargument name="objectID">
	<cfargument name="name">
	<cfargument name="params" default="">
	<cfargument name="orderno" default="">
	<cfset var rs=getDisplayRegion(arguments.regionID)>
	<cfset var rows=0>
	
	<cfif isNumeric(arguments.orderno)>
		<cfloop query="rs">
			<cfif rs.objectID eq arguments.objectID
				and rs.object eq arguments.object
				and rs.orderno eq arguments.orderno>
				<cfset querysetcell(rs,"objectid",arguments.objectID,rs.currentrow)/>
				<cfset querysetcell(rs,"object",arguments.object,rs.currentrow)/>
				<cfset querysetcell(rs,"name",arguments.name,rs.currentrow)/>
				<cfset querysetcell(rs,"params",arguments.params,rs.currentrow)/>
				<cfset variables.instance.extendAutoComplete = true />
				<cfreturn this>
			</cfif>
		</cfloop>
	</cfif>
	
	<cfif not hasDisplayObject(argumentCollection=arguments)>
		<cfset queryAddRow(rs,1)/>
		<cfset rows =rs.recordcount />
		<cfset querysetcell(rs,"objectid",arguments.objectID,rows)/>
		<cfset querysetcell(rs,"object",arguments.object,rows)/>
		<cfset querysetcell(rs,"name",arguments.name,rows)/>
		<cfset querysetcell(rs,"params",arguments.params,rows)/>	
		<cfset variables.instance.extendAutoComplete = true />
	</cfif>
	
	<cfreturn this>
</cffunction>

<cffunction name="removeDisplayObject" output="false">
	<cfargument name="regionID">
	<cfargument name="object">
	<cfargument name="objectID">
	<cfset var rs=getDisplayRegion(arguments.regionID)>
	<cfset var rows=0>
	
	<cfif hasDisplayObject(argumentCollection=arguments)>
		<cfquery name="variables.displayRegions.objectlist#arguments.regionID#" dbtype="query">
		select * from rs where
		not (objectID='#arguments.objectID#'
		and object='#arguments.object#')
		</cfquery>
		<cfset variables.instance.extendAutoComplete = true />
	</cfif>
	
	<cfreturn this>
</cffunction>

<cffunction name="hasDisplayObject" output="false" returntype="boolean">
	<cfargument name="regionID">
	<cfargument name="object">
	<cfargument name="objectID">
	<cfset var rs=getDisplayRegion(arguments.regionID)>
	
	<cfquery name="rs" dbtype="query">
		select * from rs where
		objectID='#arguments.objectID#'
		and object='#arguments.object#'
	</cfquery>
	
	<cfreturn rs.recordcount>
</cffunction>
	
<cffunction name="getDisplayRegion" output="false" access="public" returntype="any">
	<cfargument name="regionID">
	<cfset var rs="">
	<cfif not structKeyExists(variables.displayRegions,"objectlist#arguments.regionID#")>
		<cfset variables.displayRegions["objectlist#arguments.regionID#"]=variables.contentManager.getRegionObjects(getContentHistID(), variables.instance.siteID, arguments.regionID)>
	</cfif>
	
	<cfreturn variables.displayRegions["objectlist#arguments.regionID#"]>	
</cffunction>

<cffunction name="deleteVersion" returnType="any" output="false" access="public">
	<cfif not getActive()>
		<cfset variables.contentManager.delete(getAllValues()) />
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cffunction name="deleteVersionHistory" output="false" access="public">
	<cfset variables.contentManager.deleteHistAll(getAllValues()) />
</cffunction>

<cffunction name="delete" output="false" access="public">
	<cfset variables.contentManager.deleteAll(getAllValues()) />
</cffunction>

<cffunction name="loadBy" returnType="any" output="false" access="public">
	<cfif not structKeyExists(arguments,"siteID")>
		<cfset arguments.siteID=variables.instance.siteID>
	</cfif>
	
	<cfset arguments.contentBean=this>
	
	<cfreturn variables.contentManager.read(argumentCollection=arguments)>
</cffunction>

<cffunction name="getStats" returnType="any" output="false" access="public">
	<cfset var statsBean=getBean("stats") />
	<cfset statsBean.setSiteID(variables.instance.siteID)>
	<cfset statsBean.setContentID(getContentID())>
	<cfset statsBean.load()>
	<cfreturn statsBean>
</cffunction>

<cffunction name="getCommentsQuery" returnType="query" output="false" access="public">
	<cfargument name="isEditor" type="boolean" required="true" default="false">
	<cfargument name="sortOrder" type="string" required="true" default="asc">
	<cfargument name="parentID" type="string" required="true" default="">
	<cfreturn variables.contentManager.readComments(getContentID(), variables.instance.siteID, arguments.isEditor, arguments.sortOrder, arguments.parentID) />
</cffunction>

<cffunction name="getCommentsIterator" returnType="any" output="false" access="public">
	<cfargument name="isEditor" type="boolean" required="true" default="false">
	<cfargument name="sortOrder" type="string" required="true" default="asc">
	<cfargument name="parentID" type="string" required="true" default="">
	<cfset var q=getCommentsQuery(arguments.isEditor, arguments.sortOrder, arguments.parentID) />
	<cfset var it=getBean("contentCommentIterator")>
	<cfset it.setQuery(q)>
	<cfreturn it />
</cffunction>

<cffunction name="getParent" output="false" returntype="any">
	<cfif getContentID() neq '00000000000000000000000000000000001'>
		<cfreturn variables.contentManager.read(contentID=variables.instance.parentID,siteID=variables.instance.siteID)>
	<cfelse>
		<cfthrow message="Parent content does not exist.">
	</cfif>
</cffunction>

<cffunction name="getCrumbArray" output="false" returntype="any">
	<cfargument name="sort" required="true" default="asc">
	<cfargument name="setInheritance" required="true" type="boolean" default="false">
	<cfreturn variables.contentManager.getCrumbList(contentID=getContentID(), siteID=variables.instance.siteID, setInheritance=arguments.setInheritance, path=variables.instance.path, sort=arguments.sort)>
</cffunction>

<cffunction name="getCrumbIterator" output="false" returntype="any">
	<cfargument name="sort" required="true" default="asc">
	<cfargument name="setInheritance" required="true" type="boolean" default="false">
	<cfset var a=getCrumbArray(setInheritance=arguments.setInheritance,sort=arguments.sort)>
	<cfset var it=getBean("contentIterator")>
	<cfset it.setArray(a)>
	<cfreturn it>
</cffunction>

<cffunction name="hasDrafts" returntype="any" access="public" output="false">
	<cfreturn variables.contentManager.getHasDrafts(getContentID(),variables.instance.siteID) />
</cffunction>

<cffunction name="getURL" output="false">
	<cfargument name="querystring" required="true" default="">
	<cfargument name="complete" type="boolean" required="true" default="false">
	<cfargument name="showMeta" type="string" required="true" default="0">
	 <cfreturn variables.contentManager.getURL(this, arguments.queryString,arguments.complete, arguments.showMeta)>
</cffunction>

<cffunction name="getAssocURL" output="false">
	<cfif variables.instance.type eq 'Link'>
		<cfreturn variables.instance.body>
	<cfelse>
		 <cfreturn variables.contentManager.getURL(this,'',true)>	
	</cfif>
</cffunction>

<cffunction name="setAssocURL" output="false">
	<cfargument name="assocURL">
	<cfif variables.instance.type eq 'Link'>
		<cfset variables.instance.body=arguments.assocURL>	
	</cfif>
	<cfreturn this>
</cffunction>			

<cffunction name="getEditUrl" access="public" returntype="string" output="false">
	<cfargument name="compactDisplay" type="any" required="true" default="false"/>
	<cfset var returnStr="">
	<cfset var topID="00000000000000000000000000000000001">
	
	<cfif listFindNoCase("Form,Component", variables.instance.type)>
		<cfset topID=variables.instance.moduleID>
	</cfif>
	
	<cfset returnStr= "#variables.configBean.getContext()#/admin/?muraAction=cArch.edit&contentHistId=#getContentHistId()#&contentId=#getContentId()#&Type=#variables.instance.type#&siteId=#variables.instance.siteID#&topId=#topID#&parentId=#variables.instance.parentID#&moduleId=#variables.instance.moduleID#&compactDisplay=#arguments.compactdisplay#" >
	
	<cfreturn returnStr>
</cffunction> 

<cffunction name="hasParent" output="false">
	<cfreturn listLen(variables.instance.path) gt 1>
</cffunction>

<cffunction name="getIsOnDisplay" output="false">
<cfreturn variables.instance.display eq 1 or 
			(
				variables.instance.display eq 2 and variables.instance.displayStart lte now()
				AND (variables.instance.displayStop eq "" or variables.instance.displayStop gte now())
			)
			and (listFind("Page,Folder,Gallery,File,Calendar,Link,Form",variables.instance.type) or listFind(variables.instance.moduleAssign,'00000000000000000000000000000000000'))>
</cffunction>

<cffunction name="getImageURL" output="false">
	<cfargument name="size" required="true" default="undefined">
	<cfargument name="direct" default="true"/>
	<cfargument name="complete" default="false"/>
	<cfargument name="height" default=""/>
	<cfargument name="width" default=""/>
	<cfset arguments.bean=this>
	<cfreturn variables.contentManager.getImageURL(argumentCollection=arguments)>
</cffunction>

<cffunction name="clone" output="false">
	<cfreturn getBean("content").setAllValues(structCopy(getAllValues()))>
</cffunction>

<cffunction name="getExtendBaseID" output="false">
	<cfreturn getContentHistID()>
</cffunction>

</cfcomponent>