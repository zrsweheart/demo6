<%--
  Created by IntelliJ IDEA.
  User: 榕宝
  Date: 2022/10/25
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>石铁大学籍信息管理系统</title>
  <script th:src="@{/layuimini/js/lay-module/echarts/echarts.js}"></script>
  <script th:src="@{/layuimini/js/lay-module/echarts/wordcloud.js}"></script>
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui/css/layui.css" />
  <script src="https://www.layuicdn.com/layui/layui.js"></script>
  <style>
    .success {
      background-color: rgba(199, 199, 199, 0.94);
    }

    #container1 {
      box-shadow: 5px 5px 5px 5px #b6b6b6;
      border-radius: 20px;
    }

    #container2 {
      box-shadow: 5px 5px 5px 5px #b6b6b6;
      border-radius: 20px;
    }
    /*整个tab层居中，宽度为600px*/
    #tabDiv {

      margin: 1em auto;

      background-color:white ;

    }
    /*tab头的样式*/
    #tabsHead {

      height: 226px;
      background-color:#136bab ;


    }
    /*已选tab头（超链接）的样式*/
    .curtab {
      padding-top: 10px;
      padding-right: 20px;
      padding-bottom: 0px;
      padding-left: 10px;
      border-right: #294224 1px solid;
      font-weight: bold;
      float: left;
      cursor: pointer;

    }
    /*未选tab头（超链接）的样式*/
    .tabs {
      border-right: #ffffff 1px solid;
      padding-top: 10px;
      padding-right: 20px;
      padding-bottom: 0px;
      padding-left: 10px;
      font-weight: normal;
      float: left;
      cursor: pointer;
    }
    a {
      color: #ffffff;
      text-decoration:none;
      font-size:17px;/*设置字体大小*/
      font-weight:500;/*调整字体粗细*/

    }

    a:hover {
      color: #ffffff;

      font-size:19px;
    }
    .biaoti{
      font-family:"幼圆";/*设置字体*/
      font-size:30px;/*设置字体大小*/
      font-weight:900;/*调整字体粗细*/
      color:#136dab;

    }

  </style>
  <script type="text/jscript">
        //显示tab（tabHeadId：tab头中当前的超链接；tabContentId要显示的层ID）
        function showTab(tabHeadId,tabContentId)
        {
            //tab层
            var tabDiv = document.getElementById("tabDiv");
            //将tab层中所有的内容层设为不可见
            //遍历tab层下的所有子节点
            var taContents = tabDiv.childNodes;
            for(i=0; i<taContents.length; i++)
            {
                //将所有内容层都设为不可见
                if(taContents[i].id!=null && taContents[i].id != 'tabsHead')
                {
                    taContents[i].style.display = 'none';
                }
            }
            //将要显示的层设为可见
            document.getElementById(tabContentId).style.display = 'block';
            //遍历tab头中所有的超链接
            var tabHeads = document.getElementById('tabsHead').getElementsByTagName('a');
            for(i=0; i<tabHeads.length; i++)
            {
                //将超链接的样式设为未选的tab头样式
                tabHeads[i].className='tabs';
            }
            //将当前超链接的样式设为已选tab头样式
            document.getElementById(tabHeadId).className='curtab';
            document.getElementById(tabHeadId).blur();
        }
</script>





</head>

<div style="width:100%;height:90px;  background-color:white ;">

  <div style="width: 330px;height: 80px; margin:auto;">
<p>&nbsp;</p>
    <div  style="width: 70px;height: 70px;background: url(LOGO.png); background-size:cover ;text-align: center;float:left"></div>


    <div style="float:left">
      <p>&nbsp;</p>
      <p class="biaoti">&nbsp;科技政策查询系统</p>

    </div></div>

</div>
<div id="tabDiv" style="width:100%;height:100%;margin: auto; ">


  <div id="tabsHead" style="float:left;width:13%;height:905px;text-align:center;   ">


    <div  style="width:120px;height:80px; margin:auto; padding:0;  "> <p>&nbsp;</p> <a id="tabs1" class="curtab" href="javascript:showTab('tabs1','tabContent1')">政策查询</a></div>


    <div  style="width:120px;height:80px; text-align: center; margin:auto;  ">  <p>&nbsp;</p><a id="tabs2" class="tabs" href="javascript:showTab('tabs2','tabContent2')">政策分类</a>  </div>



    <div  style="width:120px;height:80px; text-align: center; margin:auto;  ">  <p>&nbsp;</p><a id="tabs3" class="tabs" href="javascript:showTab('tabs3','tabContent3')">******</a>  </div>


    <div  style="width:120px;height:80px; text-align: center; margin:auto; ">  <p>&nbsp;</p><a id="tabs5" class="tabs" href="index.jsp ">退出登录</a>  </div>



  </div>

  <div id="tabContent1"   style="width:87%;height:660px;float:left; position:relative;  ">
    <div  style="width:100%;height:65px;float:left; position:relative; display: table-cell;vertical-align: middle;  background-color: rgba(232,232,232,0.76) ">

    <form class="layui-form"action="table1.jsp" method="post" target="hideIframe1" >
      <p>&nbsp;</p>
      <div class="layui-form-item">

        <div class="layui-inline">

          <label class="layui-form-label">
            政策名称：
          </label>
          <div class="layui-input-inline">
            <input type="text" name="name"  class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <label class="layui-form-label">
            政策文号：
          </label>
          <div class="layui-input-inline">
            <input type="text" name="document"  class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <label class="layui-form-label">
            发文机构：
          </label>
          <div class="layui-input-inline">
            <input type="text" name="organ"  class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <div class="layui-input-inline">
            <button type="submit" class="layui-btn" lay-submit lay-filter="demo1"style="background-color: #1571b2">查询</button>
          </div>
        </div>
      </div>
    </form>
    </div>
    <div class="container3">
      <iframe id="myIframe1" name="hideIframe1" style="" src="table1.jsp" frameborder="0" width="100%" height="850px"></iframe>
    </div>
  </div>

  <div id="tabContent2" class="main" style="width:84%;height:660px;float:left; display: none;position:relative;margin: 30px auto">


    <div class="container3">
      <iframe id="myIframe2" name="hideIframe2" style="" src="stutable2.jsp" frameborder="0" width="100%" height="660px"></iframe>
    </div>
  </div>


  <div id="tabContent3" class="main" style="width:84%;height:660px;float:left;position:relative;display: none;margin: 30px auto">
    <div class="container3">
      <iframe id="myIframe3" name="hideIframe3" style="" src="stutable3.jsp" frameborder="0" width="100%" height="660px"></iframe>
    </div>
  </div>

  <div id="tabContent4" class="main" style="width:84%;height:660px;float:left;position:relative;display: none;margin: 30px auto">
    <div class="container3">
      <iframe id="myIframe4" name="hideIframe3" style="" src="stutable4.jsp" frameborder="0" width="100%" height="660px"></iframe>
    </div>
  </div>


</html>
