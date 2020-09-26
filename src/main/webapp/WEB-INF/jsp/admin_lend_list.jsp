<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>借还日志</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/search.css">

    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/u5.jpeg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>

<div style="position: relative;padding-top: 100px">
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

<div style="padding: 70px 550px 10px">
    <form method="post" action="queryLend.html" class="form-inline"  id="searchform">
        <div class="input-group">
            <ul>
                <li>
                   <select name="type" id="type" style="width: 67px;height: 34px;position: relative;top: -12px;">
                       <option value="ser_num" selected>流水号</option>
                       <option value="book_id">图书号</option>
                       <option value="reader_id">学号</option>
                   </select>
                </li>
                <li>
                    <input type="text" placeholder="输入查询字段" class="form-control" id="search" name="searchWord" class="form-control">
                </li>
                <li>
                    <span class="input-group-btn">
                        <input type="submit" value="搜索" class="btn btn-default">
                    </span>
                </li>
            </ul>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''){
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>

<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>流水号</th>
                <th>图书号</th>
                <th>学号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="alog">
                <tr>
                    <td>${alog.ser_num}</td>
                    <td>${alog.bookId}</td>
                    <td>${alog.readerId}</td>
                    <td>
                        <c:choose>
                            <c:when test="${alog.lendDate!=null}">
                                <fmt:formatDate value="${alog.lendDate}" type="date" pattern="yyyy-MM-dd hh:mm"/>
                            </c:when>
                            <c:otherwise><span style="color:grey;">暂无</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${alog.backDate!=null}">
                                <fmt:formatDate value="${alog.backDate}" type="date" pattern="yyyy-MM-dd hh:mm"/>
                            </c:when>
                            <c:otherwise><span style="color:grey;">暂无</span></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="deletelend.html?serNum=<c:out value='${alog.ser_num}'></c:out>">
                            <c:if test="${!empty alog.backDate}">
                                <button type="button" class="btn btn-danger btn-xs">删除</button>
                            </c:if>
                            <c:if test="${empty alog.backDate}">
                                <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>
                            </c:if>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
