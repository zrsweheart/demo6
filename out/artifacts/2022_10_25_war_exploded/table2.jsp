<%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/10/26
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="Bean.bean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script th:src="@{/layuimini/js/lay-module/echarts/echarts.js}"></script>
    <script th:src="@{/layuimini/js/lay-module/echarts/wordcloud.js}"></script>
    <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
    <script src="https://www.layuicdn.com/layui/layui.js"></script>

</head>

<jsp:useBean id="util" class="Dao.dao"/>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

    List<bean> list = util.getOne(100);

%>


<div class="container3" id="container3">
    <table class="layui-table"style="table-layout: fixed;word-wrap:break-word;" >
        <thead>
        <tr>
            <td style="width: 200px">政策名称</td>
            <td style="width: 150px">发文机构</td>
            <td style="width: 100px">颁布日期</td>
            <td style="width: 150px">政策分类</td>
            <td style="width: 100px">操作</td>
        </tr>
        </thead>
        <tbody>
        <%for (bean b : list) {%>
        <tr>
            <td style="width: 200px"><%=b.getName()%></td>
            <td style="width: 150px"><%=b.getOrgan()%></td>
            <td style="width: 100px"><%=b.getPubdata()%></td>
            <td style="width: 150px"><%=b.getType()%></td>
            <td style="width: 100px"><a href="update.jsp?id=<%=b.getId()%>"><button type="submit" class="layui-btn"style="background-color: #1571b2">查看详情</button></a> </td>
        </tr>
        <%} %>
        </tbody>
    </table>
</div>




</html>


