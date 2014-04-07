<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<c:set var="sectionType" value="${currentNode.properties['sectionElement'].string}"/>
<c:if test="${empty sectionType}">
    <c:set var="sectionType" value="section"/>
</c:if>
<c:set var="sectionCssClass" value="${currentNode.properties['sectionCssClass'].string}"/>
<c:set var="containerCssClass" value="${currentNode.properties['containerCssClass'].string}"/>
<c:if test="${! empty containerCssClass}">
    <c:set var="containerClass">class="${containerCssClass}"</c:set>
</c:if>
<${sectionType} class="${sectionCssClass}" id="${currentNode.name}">
<div class="container ${containerClass}">
    <template:module nodeTypes="bootstrap3mix:predefinedColumns,bootstrap3mix:customColumns"
                     node="${currentNode}" view="mixin" editable="false"/>
</div>
</${sectionType}>
