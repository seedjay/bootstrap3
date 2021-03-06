<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="currentAliasUser" type="org.jahia.services.usermanager.JahiaUser"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>

<jcr:nodeProperty node="${currentNode}" name="position" var="position"/>
<c:set var="pullClass" value="" />
<c:if test="${not empty position}">
    <c:set var="pullClass" value=" navbar-${position.string}" />
</c:if>
<c:if test="${not renderContext.loggedIn or currentAliasUser.username eq 'guest'}">
    <script type="text/javascript">
        document.onkeydown = function (e) {
            if ((e || window.event).keyCode == 13) document.loginForm.submit();
        };
    </script>
    <ui:loginArea class="navbar-form${pullClass}">
        <div class="form-group">
            <input class="form-control" type="text" maxlength="250" name="username" id="username" placeholder="<fmt:message key="bootstrap3nt_navBarItemLoginForm.username"/>" value=""/>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" maxlength="250" name="password" id="password" placeholder="<fmt:message key="bootstrap3nt_navBarItemLoginForm.password"/>" autocomplete="off"/>
        </div>

        <button type="submit" class="btn btn-default">
            <fmt:message key='bootstrap3nt_navBarItemLoginForm.button.login'/>
        </button>

        <ui:isLoginError var="loginResult">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <fmt:message key="${loginResult == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/>
            </div>
        </ui:isLoginError>

        <c:if test="${not empty param['loginError']}">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <fmt:message key="${param['loginError'] == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/>
            </div>
        </c:if>
    </ui:loginArea>
</c:if>
<c:if test="${renderContext.loggedIn and not (currentAliasUser.username eq 'guest')}">
    <jcr:node var="user" path="${renderContext.user.localPath}"/>
    <form action="<c:url value='${url.logout}'/>" class="navbar-form${pullClass}">
        <button type="submit" class="btn btn-default">
            <fmt:message key="bootstrap3nt_navBarItemLoginForm.button.logout"/>
            ${' '}${jcr:userFullName(user)}<c:if test="${not empty currentAliasUser}">&nbsp;(as&nbsp;${currentAliasUser.username})</c:if>
        </button>
    </form>
</c:if>
