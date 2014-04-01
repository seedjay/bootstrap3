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
<c:set var="colName" value="${currentNode.name}"/>
<c:set var="grid" value="${currentNode.properties['grid'].string}"/>
<c:choose>
    <c:when test="${grid == '4_8'}">
        <div class="col-md-4"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
        <div class="col-md-8"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '8_4'}">
        <div class="col-md-8"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-4"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '3_9'}">
        <div class="col-md-3"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
        <div class="col-md-9"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '9_3'}">
        <div class="col-md-9"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-3"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '2_10'}">
        <div class="col-md-2"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
        <div class="col-md-10"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '10_2'}">
        <div class="col-md-10"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-2"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '4_4_4'}">
        <div class="col-md-4"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-4"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
        <div class="col-md-4"><template:area path="${colName}-extra" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '3_6_3'}">
        <div class="col-md-3"><template:area path="${colName}-side1" areaAsSubNode="true"/></div>
        <div class="col-md-6"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-3"><template:area path="${colName}-extra" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '3_3_3_3'}">
        <div class="col-md-3"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-3"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
        <div class="col-md-3"><template:area path="${colName}-extra" areaAsSubNode="true"/></div>
        <div class="col-md-3"><template:area path="${colName}-extra2" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '6_6'}">
        <div class="col-md-6"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
        <div class="col-md-6"><template:area path="${colName}-side" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '12'}">
        <div class="col-md-12"><template:area path="${colName}-main" areaAsSubNode="true"/></div>
    </c:when>
    <c:when test="${grid == '0'}">
        <template:area path="${colName}" areaAsSubNode="true"/>
    </c:when>
    <c:otherwise>
        <c:if test="${renderContext.editMode}">
            <div class="col-md-12">
                <div class="alert">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong><fmt:message key="bootstrap3mix_predefinedColumns.message.warning"/>!</strong> <fmt:message
                        key="bootstrap3mix_predefinedColumns.message.couldNotDisplayGrid"/> ${grid}.
                </div>
            </div>
        </c:if>
    </c:otherwise>
</c:choose>