<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>我的借还</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body background="/img/lizhi.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>

<div class="panel panel-default" style="width: 90%;margin-left: 5%;margin-top: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            我的借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="alog">
                <tr>
                    <td>${alog.bookId}</td>
                    <td>
                        <c:choose>
                            <c:when test="${alog.lendDate!=null}">
                                <fmt:formatDate value="${alog.lendDate}" type="date" pattern="yyyy-MM-dd"/>
                            </c:when>
                            <c:otherwise><span style="color: grey">暂无</span></c:otherwise>
                        </c:choose>


                    <td>
                        <c:choose>
                            <c:when test="${alog.backDate!=null}">
                                <fmt:formatDate value="${alog.backDate}" type="date" pattern="yyyy-MM-dd"/>
                            </c:when>
                            <c:otherwise><span style="color: grey">暂无</span></c:otherwise>
                        </c:choose>
                    </td>
                    <c:if test="${empty alog.backDate}">
                        <td><span style="color: orange">未还</span></td>
                    </c:if>
                    <c:if test="${!empty alog.backDate}">
                        <td><span style="color: green">已还</span></td>
                    </c:if>
                    <c:if test="">
                        <td><span style="color: red">超期</span></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
