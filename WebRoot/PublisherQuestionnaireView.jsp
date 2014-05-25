<%@ page language="java" import="java.util.*,cn.com.crowdsourcedtesting.bean.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8" />
<title>TCTEST</title>
<meta name="keywords" content="TCTEST" />
<meta name="description" content="TCTEST" />
<meta name="author" content="Holladay" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Font CSS  -->
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" />

<!-- Core CSS  -->
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css" />

<!-- Plugin CSS -->
<link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/timepicker/bootstrap-timepicker.min.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/colorpicker/colorpicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/datepicker/datepicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/daterange/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/formswitch/css/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/tags/tagmanager.css" />
<link rel="stylesheet" type="text/css" href="css/animate.css" />
<link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/css/bootstrap-editable.css" />
<link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/inputs/address/address.css" />
<link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/inputs/typeaheadjs/lib/typeahead.js-bootstrap.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/gritter/css/jquery.gritter.css" />
<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="css/theme.css" />
<link rel="stylesheet" type="text/css" href="css/pages.css" />
<link rel="stylesheet" type="text/css" href="css/plugins.css" />
<link rel="stylesheet" type="text/css" href="css/responsive.css" />

<!-- Demonstration CSS -->
<link rel="stylesheet" type="text/css" href="css/demo.css" />

<!-- Your Custom CSS -->
<link rel="stylesheet" type="text/css" href="css/custom.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="img/favicon.ico" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#createItem").click(function()
{

     $("form.create").submit();
      
    

}
);



$("div#selectButton").click(function()
{

    $("form#selectForm input[name='currentOne']").attr("value",$(this).attr("title"));
    
    
   
     $("form#selectForm input[name='subType']").attr("value","selectQuestion");
    $("form#selectForm").attr("action","questionnaire.do?method=createItem");
    $("form#selectForm").submit();
      
    

}
);


$("div#confirm").click(function()
{
   
   
    $("form#selectForm input[name='currentOne']").attr("value",$("div#currentQuestion h3").attr("id"));
     $("form#selectForm input[name='subType']").attr("value","confirmQuestion");
    $("form#selectForm").attr("action","questionnaire.do?method=createItem");
    $("form#selectForm").submit();
      
    

}
);


$("div#deleteQuestion").click(function()
{

    $("form#selectForm input[name='currentOne']").attr("value",$("div#currentQuestion h3").attr("id"));
    
     $("form#selectForm input[name='subType']").attr("value","deleteQuestion");
    $("form#selectForm").attr("action","questionnaire.do?method=createItem");
    $("form#selectForm").submit();
      
    

}
);

$("div#publishQuetionnaire").click(function()
{

   
    
     $("form#selectForm input[name='subType']").attr("value","publishQuetionnaire");
    $("form#selectForm").attr("action","questionnaire.do?method=createItem");
    $("form#selectForm").submit();
      
    

}
);


});
</script>
</head>

<body>
<%
 
 List<Question> questions = (List<Question>) session.getAttribute("questions");
 String type = (String)session.getAttribute("type");
 Questionnaire questionnaire = (Questionnaire)session.getAttribute("questionnaire");
 String currentID =(String)session.getAttribute("currentID");
 System.out.println(currentID);

  %>
<%try{ %>
<form id="selectForm"  method="post">
  <input type="hidden" name="currentOne"/>
  <input type="hidden" name="subType">
</form>

<!-- Start: Theme Preview Pane -->
<div id="skin-toolbox">
  <div class="skin-toolbox-toggle"> <i class="fa fa-flask"></i> </div>
  <div class="skin-toolbox-panel">
    <h4 class="padding-left-sm">主题选择</h4>
    <form id="skin-toolbox-form" />
    
    <div class="form-group">
      <label class="checkbox-inline">
        <input id="header-option" class="checkbox" type="checkbox" checked="" />
        定制 <b>标题</b> </label>
    </div>
    <div class="form-group">
      <label class="checkbox-inline">
        <input id="sidebar-option" class="checkbox" type="checkbox" />
        定制 <b>侧边栏</b> </label>
    </div>
    <div class="form-group">
      <label class="checkbox-inline option-disabled">
        <input id="breadcrumb-option" class="checkbox" type="checkbox" disabled="" />
        定制 <b>Breadcrumbs</b> </label>
    </div>
    <hr class="short" style="margin: 7px 10px;" />
    <div class="form-group">
      <label class="checkbox-inline">
        <input id="breadcrumb-hidden" class="checkbox" type="checkbox" />
        隐藏 <b>Breadcrumbs</b> </label>
    </div>
    <div class="form-group margin-bottom-lg">
      <label class="checkbox-inline">
        <input id="searchbar-hidden" class="checkbox" type="checkbox" />
        隐藏 <b>搜索框</b> </label>
    </div>
    <h4 class="padding-left-sm">布局选择</h4>
    <div class="form-group">
      <label class="radio-inline">
        <input class="radio" type="radio" name="optionsRadios" id="fullwidth-option" checked="" />
        全屏 </label>
    </div>
    <div class="form-group">
      <label class="radio-inline">
        <input class="radio" type="radio" name="optionsRadios" id="boxed-option" />
        局部</label>
    </div>
    <hr class="short" />
    <div class="form-group"> <a href="customizer.html" id="customizer-link" class="btn btn-warning btn-gradient btn-block padding-bottom padding-top">定制</a> </div>
    </form>
  </div>
</div>
<!-- End: Theme Preview Pane --> 

<!-- Start: Header -->
<header class="navbar navbar-fixed-top">
  <div class="pull-left"> <a class="navbar-brand" href="#">
    <div class="navbar-logo"><img src="img/logos/logo-red.png" class="img-responsive" alt="logo" /></div>
    </a> </div>
  <div class="pull-right header-btns">
    <div class="messages-menu">
      <button type="button" class="btn btn-default btn-gradient btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-comment"></span> <b>4</b> </button>
      <ul class="dropdown-menu checkbox-persist" role="menu">
        <li class="menu-arrow">
          <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">最近消息 <span class="pull-right glyphicons glyphicons-comment"></span></li>
        <li>
          <ul class="dropdown-items">
            <li>
              <div class="item-avatar"><img src="img/avatars/header/2.jpg" class="img-responsive" alt="avatar" /></div>
              <div class="item-message"><b>Maggie</b> - <small class="text-muted">12 minutes ago</small><br />
                Great work Yesterday!</div>
            </li>
            <li>
              <div class="item-avatar"><img src="img/avatars/header/3.jpg" class="img-responsive" alt="avatar" /></div>
              <div class="item-message"><b>Robert</b> - <small class="text-muted">3 hours ago</small><br />
                Is the Titan Project still on?</div>
            </li>
            <li>
              <div class="item-avatar"><img src="img/avatars/header/1.jpg" class="img-responsive" alt="avatar" /></div>
              <div class="item-message"><b>Cynthia</b> - <small class="text-muted">14 hours ago</small><br />
                Don't forget about the staff meeting tomorrow</div>
            </li>
            <li>
              <div class="item-avatar"><img src="img/avatars/header/4.jpg" class="img-responsive" alt="avatar" /></div>
              <div class="item-message"><b>Matt</b> - <small class="text-muted">2 days ago</small><br />
                Thor Project cancelled, Sorry.</div>
            </li>
          </ul>
        </li>
        <li class="dropdown-footer"><a href="#">查看所有消息 <i class="fa fa-caret-right"></i> </a></li>
      </ul>
    </div>
    <div class="alerts-menu">
      <button type="button" class="btn btn-default btn-gradient btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-bell"></span> <b>3</b> </button>
      <ul class="dropdown-menu checkbox-persist" role="menu">
        <li class="menu-arrow">
          <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">最近通知 <span class="pull-right glyphicons glyphicons-bell"></span></li>
        <li>
          <ul class="dropdown-items">
            <li>
              <div class="item-icon"><i style="color: #0066ad;" class="fa fa-facebook"></i> </div>
              <div class="item-message"><a href="#">Facebook likes reached <b>8,200</b></a></div>
            </li>
            <li>
              <div class="item-icon"><i style="color: #5cb85c;" class="fa fa-check"></i> </div>
              <div class="item-message"><a href="#">Robert <b>completed task</b> - Client SEO Revamp</a></div>
            </li>
            <li>
              <div class="item-icon"><i style="color: #f0ad4e" class="fa fa-user"></i> </div>
              <div class="item-mI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  essage"><a href="#"><b>Marko</b> logged 12 hours</a></div>
            </li>
          </ul>
        </li>
        <li class="dropdown-footer"><a href="#">查看所有通知 <i class="fa fa-caret-right"></i> </a></li>
      </ul>
    </div>
    <div class="tasks-menu">
      <button type="button" class="btn btn-default btn-gradient btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-tag"></span> <b>7</b> </button>
      <ul class="dropdown-menu dropdown-checklist checkbox-persist" role="menu">
        <li class="menu-arrow">
          <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">最近任务 <span class="pull-right glyphicons glyphicons-tag"></span></li>
        <li>
          <ul class="dropdown-items">
            <li>
              <div class="item-icon"><i class="fa fa-pencil"></i> </div>
              <div class="item-message text-slash"><a>Try Clicking me!</a></div>
              <div class="item-label"><span class="label label-danger">Urgent</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
            <li>
              <div class="item-icon"><i class="fa fa-phone"></i> </div>
              <div class="item-message text-slash"><a>Contact Client and request Approval</a></div>
              <div class="item-label"><span class="label label-info">Normal</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
            <li>
              <div class="item-icon"><i class="fa fa-flask"></i> </div>
              <div class="item-message text-slash"><a>Find new Python Developer </a></div>
              <div class="item-label"><span class="label label-success">Completed</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
            <li>
              <div class="item-icon"><i class="fa fa-facebook"></i> </div>
              <div class="item-message text-slash"><a>Update Facebook Page with Halloween Pictures</a></div>
              <div class="item-label"><span class="label label-primary">In Progress</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
            <li>
              <div class="item-icon"><i class="fa fa-group"></i> </div>
              <div class="item-message text-slash"><a>Organize next Staff Meeting</a></div>
              <div class="item-label"><span class="label label-success">Completed</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
            <li>
              <div class="item-icon"><i class="fa fa-plane"></i> </div>
              <div class="item-message text-slash"><a>Interview new applicant</a></div>
              <div class="item-label"><span class="label label-warning">Moderate</span></div>
              <div class="item-checkbox">
                <input class="checkbox row-checkbox" type="checkbox" />
              </div>
            </li>
          </ul>
        </li>
        <li class="dropdown-footer"><a href="#">查看所有任务 <i class="fa fa-caret-right"></i> </a></li>
      </ul>
    </div>
    <div class="btn-group user-menu">
      <button type="button" class="btn btn-default btn-gradient btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-user"></span> <b>程冉</b> </button>
      <button type="button" class="btn btn-default btn-gradient btn-sm dropdown-toggle padding-none" data-toggle="dropdown"> <img src="img/avatars/header/header-login.png" alt="user avatar" width="28" height="28" /> </button>
      <ul class="dropdown-menu checkbox-persist" role="menu">
        <li class="menu-arrow">
          <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">你的账户 <span class="pull-right glyphicons glyphicons-user"></span></li>
        <li>
          <ul class="dropdown-items">
            <li>
              <div class="item-icon"><i class="fa fa-envelope-o"></i> </div>
              <a class="item-message" href="messages.html">消息</a> </li>
            <li>
              <div class="item-icon"><i class="fa fa-calendar"></i> </div>
              <a class="item-message" href="calendar.html">日历</a> </li>
            <li class="border-bottom-none">
              <div class="item-icon"><i class="fa fa-cog"></i> </div>
              <a class="item-message" href="customizer.html">设置</a> </li>
            <li class="padding-none">
              <div class="dropdown-lockout"><i class="fa fa-lock"></i> <a href="screen-lock.html">锁定</a></div>
              <div class="dropdown-signout"><i class="fa fa-sign-out"></i> <a href="login.html">登出</a></div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</header>
<!-- End: Header --> 
<!-- Start: Main -->
<div id="main"> 
  <!-- Start: Sidebar -->
  <aside id="sidebar">
    <div id="sidebar-search">
      <form role="search" />
      
      <input type="text" class="search-bar form-control" placeholder="搜索" />
      <i class="fa fa-search field-icon-right"></i>
      <button type="submit" class="btn btn-default hidden"></button>
      </form>
      <div class="sidebar-toggle"> <i class="fa fa-bars"></i> </div>
    </div>
    <div id="sidebar-menu">
      <ul class="nav sidebar-nav">
      <li> <a href="publisher_taskman.html"><span class="glyphicons glyphicons-notes_2"></span><span class="sidebar-title">任务管理</span></a> </li>
        <li> <a href="publisher_tasklist_feedback.html"><span class="glyphicons glyphicons-log_book"></span><span class="sidebar-title">反馈管理</span></a> </li>
        <li class="active"> <a href="PublisherQuestionnaireMainView.jsp"><span class="glyphicons glyphicons-more_items"></span><span class="sidebar-title">问卷管理</span></a> </li>		
        <li> <a href="publisher_hireman.jsp"><span class="glyphicons glyphicons-bullhorn"></span><span class="sidebar-title">招募信息</span></a> </li>
      </ul>
      </li>
      </ul>
    </div>
  </aside>
  <!-- End: Sidebar --> 
  <!-- Start: Content -->
  <section id="content">
  <div id="topbar">
    <ol class="breadcrumb">
      <li><a href="publisher_home.html"><i class="fa fa-home"></i></a></li>
      <li><a href="ManageTestTaskView.jsp">主页</a></li>
      <li><a href="PublisherQuestionnaireMainView.jsp">问卷管理</a></li>
      <li class="active">发布问卷</li>
    </ol>
  </div>
  <div class="container">
    <div class="row">
      <div class="hidden-xs hidden-sm col-md-6">
        <div class="panel panel-visible">
          <div class="panel-heading">
            <div class="panel-title"> <i class="fa fa-pencil"></i> 创建问卷 </div>
          </div>
          <form id="create-event-form" method="post" class="create" action="questionnaire.do?method=createItem">
            <div class="panel-body">
              <div class="form-group">
                <label for="web_url"> 问卷名称 </label>
                <%if(type==null||questionnaire==null||questionnaire.getTitle()==null||"".equals(questionnaire.getTitle())) {%>
                <input type="text" class="form-control event-name"  name="questionnaireName" placeholder="游戏兴趣调查？" />
                <%}else {  %>
                <input type="text" class="form-control event-name" disabled=true value="<%=questionnaire.getTitle() %>" />
                <%} %>
              </div>
              <div id="external-events">
                <%if(questions!=null){
              
              for(int i=0;i<questions.size();i++)
              {
                 Question question = questions.get(i);
              %>
                <div class='external-event' id="selectButton" title="<%=i %>" data-length="2"><%=question.getQuestionContent() %></div>
                <%} } %>
              </div>
            </div>
            <div class="panel-footer">
            <div class="form-group">
              <label for="web_url"> 题目名称 </label>
              <input type="text" name="questionName" class="form-control event-name" placeholder="你喜欢那个Button？" />
            </div>
            <div class="form-group">
              <label for="tagmanager">选项</label>
              <div>
                <input type="text" id="tagmanager" class="form-control tm-input" placeholder="创建选项" />
                <div class="tag-container"> </div>
              </div>
            </div>
            <div class="form-group margin-bottom-none pull-right">
              <button type="button" class="btn btn-success btn-gradient margin-bottom margin-right-sm" id="createItem">创建题目</button>
            </div>
            <div class="clearfix"></div>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="panel">
        <div class="panel-heading">
          <div class="panel-title"><i class="fa fa-book" ></i>问卷发布</div>
          <div class="pull-right"  id="publishQuetionnaire"><a class="btn btn-success btn-gradient margin-bottom margin-right-sm">确认问卷</a></div>
        </div>
        <div class="panel-body">
          <h2 class="text-primary"> 题目预览 </h2>
          <hr/>
          <div class="row">
            <div class="col-md-12">
              <p class="alert alert-success">问卷<b>未填写完整</b>确定提交？</p>
              <div class="form-group">
                <label for="web_url"> 标题 </label>
                <%int current=-1;
                    if(questions!=null&&questions.size()!=0){ 
                    Question question=new Question();
                    if(currentID!=null&&!"".equals(currentID)){
                    
                    try{
                    current=Integer.parseInt(currentID);
                    question = questions.get(current);
                    currentID=null;
                    
                    session.removeAttribute("currentID");
                    }catch(Exception e){
                     session.removeAttribute("currentID");
                     current=questions.size()-1;
                      question = questions.get(current);
                    }
                  }
                    else{
                      current=questions.size()-1;
                      question = questions.get(current);
                    }
                    
                   
                     %>
                <div class="text-center" id="currentQuestion">
                  <h3 class="text-alert" id="<%=current%>"><%=question.getQuestionContent() %></h3>
                </div>
              </div>
              <div class="form-group">
                <label for="textArea">详细内容</label>
              </div>
              <div class="text-left">
                <ol>
                  <%Iterator it = question.getChoices().iterator();
                    int i=0;
                    while(it.hasNext()) {
                     i++;
                      Choice choice =(Choice)it.next();
                    %>
                  <li><a id='<%="answer"+i %>' data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-title='<%="修改选项"+i %>' class="editable editable-click editable-empty"><%=choice.getChoiceContent() %></a></li>
                  <%} %>
                </ol>
              </div>
              <% }%>
              <hr>
              </hr>
              <div class="pull-left" id="deleteQuestion"> <a class="btn btn-alert btn-gradient btn-lg" data-test="bounceInDown">抛弃题目</a> </div>
              <div class="pull-right" id="confirm"> <a class="btn btn-info btn-gradient btn-lg margin-bottom margin-right-sm" >确认题目</a> </div>
            </div>
          </div>
          <div class="row">
            <hr>
            </hr>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
    <div class="col-md-12">
      <div class="row">
        <div class="col-md-12">
          <div class="panel animated" id="animate-me-panel">
            <div class="panel-heading">
              <div class="panel-title"><i class="fa fa-star"></i> 问卷预览 </div>
            </div>
            <div class="panel-body">
              <%if(questionnaire!=null){ %>
              <h4 class="panel-body-title"><%=questionnaire.getTitle() %></h4>
              <hr/>
            
               <p>
                  		<ol>
                  	<% Iterator it = questionnaire.getQuestions().iterator();
                  	while(it.hasNext()){ 
                  	Question  q =(Question) it.next();
                  
                  	%>
                  	 <li><label for="web_url"> <%=q.getQuestionContent()%>? </label>
                    <div class="text-left">
                  	<%
                  	Iterator it2 = q.getChoices().iterator();
                  	while(it2.hasNext()){
                  	Choice choice = (Choice)it2.next();
                  	%>
                      <label class="radio-inline">
                          <input class="radio" type="radio" name="optionsRadios" id="optionsRadios1" value="option1" />
                          <%=choice.getChoiceContent() %> </label>
                       
                    
                    
                  <%} }%></div> </li> <%}%>
                        
                    </ol>
                  </p>
              
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</section>
<!-- End: Content -->
</div>
<!-- End: Main --> 

<!-- Core Javascript - via CDN --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 

<!-- Plugins --> 
<script type="text/javascript" src="vendor/bootstrap/holder.js"></script> 
<script type="text/javascript" src="vendor/plugins/gritter/js/jquery.gritter.min.js"></script> 
<script type="text/javascript" src="vendor/bootstrap/paginator/src/bootstrap-paginator.js"></script> 
<script type="text/javascript" src="vendor/plugins/globalize/globalize.js"></script> 
<script type="text/javascript" src="vendor/plugins/chosen/chosen.jquery.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/daterange/moment.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/daterange/daterangepicker.js"></script> 
<script type="text/javascript" src="vendor/plugins/colorpicker/bootstrap-colorpicker.js"></script> 
<script type="text/javascript" src="vendor/plugins/timepicker/bootstrap-timepicker.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/datepicker/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="vendor/plugins/formswitch/js/bootstrap-switch.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/jquerymask/jquery.maskedinput.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/tags/tagmanager.js"></script> 
<script type="text/javascript" src="vendor/editors/xeditable/js/bootstrap-editable.js"></script> 
<script type="text/javascript" src="vendor/editors/xeditable/inputs/address/address.js"></script> 
<script type="text/javascript" src="vendor/editors/xeditable/inputs/typeaheadjs/lib/typeahead.js"></script> 
<script type="text/javascript" src="vendor/editors/xeditable/inputs/typeaheadjs/typeaheadjs.js"></script> 
<script type="text/javascript" src="vendor/plugins/daterange/moment.min.js"></script> 
<script type="text/javascript" src="vendor/plugins/daterange/daterangepicker.js"></script> 
<script type="text/javascript" src="vendor/plugins/datepicker/bootstrap-datepicker.js"></script> 

<!-- Theme Javascript --> 
<script type="text/javascript" src="js/uniform.min.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 
<script type="text/javascript" src="js/custom.js"></script> 
<script type="text/javascript">
 jQuery(document).ready(function() {

	 // Init Theme Core
	 Core.init();
	 
	 
	 // Init external calendar events
	function FCexternals() {
	  $('#external-events div.external-event').each(function(index) {
					  
		  // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		  // it doesn't need to have a start or end
		  var eventObject = {
			  title: $.trim($(this).text()), // use the element's text as the event title
			  color: ($(this).attr('color')),
		  };

		  // store the Event Object in the DOM element so we can get to it later
		  $(this).data('eventObject', eventObject);

		  // make the event draggable using jQuery UI
		  $(this).draggable({
			  zIndex: 999,
			  revert: true,      // will cause the event to go back to its
			  revertDuration: 0  //  original position after the drag
		  });
		  
	  });
	}

	var count = 0;
	
	// Populate custom external event with form data then
	// run externals() to repopulate event object
	$(".create-event-form").click(function( event ) {
		event.preventDefault();
		count += 1;
		var color = $("#create-event-form .colorpicker").val(),
			title1 = $("#create-event-form input").val();
			
			if (title1 === "" ) {var title1 = "Example Title";}

		
		$("#external-events").append("<div class='external-event' color='" + color + "' style='background:" + color + "'>" + title1 + "</div>");
		title1 = $("#create-event-form input").val("");
		FCexternals();				
	});

	FCexternals();
	
	 //Init jquery Date Picker
	 $('.datepicker').datepicker()
	 
	 //Init jquery Date Range Picker
	 $('input[name="daterange"]').daterangepicker();
	 
	 //Init jquery Color Picker
	 $('.colorpicker').colorpicker() 
	 $('.rgbapicker').colorpicker() 
	 
	 //Init jquery Time Picker
	 $('.timepicker').timepicker();
	  
	 //Init jquery Tags Manager 
	 $(".tm-input").tagsManager({
        tagsContainer: '.tag-container',
		prefilled: [],
		tagClass: 'tm-tag-info',
     });

	 //Init jquery spinner init - default  
	 $(".checkbox").uniform();
 	 $(".radio").uniform();

	//Init jquery spinner init - default
	$("#chosen-list1").chosen();
	$("#chosen-list2").chosen(); 
	  
	//Init jquery spinner init - default
	$("#spinner1").spinner();
	
	//Init jquery spinner init - currency 
	$("#spinner2").spinner({
      min: 5,
      max: 2500,
      step: 25,
      start: 1000,
      //numberFormat: "C"
    });
	
	//Init jquery spinner init - decimal  
	$( "#spinner3" ).spinner({
      step: 0.01,
      numberFormat: "n"
    });
	
	//Init jquery time spinner
    $.widget( "ui.timespinner", $.ui.spinner, {
		options: {
		  // seconds
		  step: 60 * 1000,
		  // hours
		  page: 60
		},
		_parse: function( value ) {
		  if ( typeof value === "string" ) {
			// already a timestamp
			if ( Number( value ) == value ) {
			  return Number( value );
			}
			return +Globalize.parseDate( value );
		  }
		  return value;
		},
	 
		_format: function( value ) {
		  return Globalize.format( new Date(value), "t" );
		}
	  });
    $( "#spinner4" ).timespinner();
	
	
	// Example animate buttons
	$('.animate-me-btns a').click(function () {
		var animateVal = $(this).attr('data-test');
		testAnim(animateVal)		
	});
	
	// Simply adds CSS classes required for animation
	// and then removes them after an elapsed time
	function testAnim(x) {
		$('#animate-me-panel').addClass(x);
		var wait = window.setTimeout( function(){
			$('#animate-me-panel').removeClass(x)},
			1300
		);
	}
	
	//enable / disable xedit
	  $('#enable').click(function() {
		 $('#user .editable').editable('toggleDisabled');
	  });    
	  
	  //editables 
	  $('#username').editable({
			 type: 'text',
			 pk: 1,
			 name: 'username',
			 title: 'Enter username'
	  });
	  
	  $('#firstname').editable({
		  validate: function(value) {
			 if($.trim(value) == '') return 'This field is required';
		  }
	  });
	  $('#answer1').editable({
		  validate: function(value) {
			 if($.trim(value) == '') return 'This field is required';
		  }
	  });
	  $('#answer2').editable({
		  validate: function(value) {
			 if($.trim(value) == '') return 'This field is required';
		  }
	  });
	   $('#answer3').editable({
		  validate: function(value) {
			 if($.trim(value) == '') return 'This field is required';
		  }
	  });
	   $('#answer4').editable({
		  validate: function(value) {
			 if($.trim(value) == '') return 'This field is required';
		  }
	  });
	  $('#sex').editable({
		  prepend: "not selected",
		  source: [
			  {value: 1, text: 'Male'},
			  {value: 2, text: 'Female'}
		  ],
		  display: function(value, sourceData) {
			   var colors = {"": "gray", 1: "green", 2: "blue"},
				   elem = $.grep(sourceData, function(o){return o.value == value;});
				   
			   if(elem.length) {    
				   $(this).text(elem[0].text).css("color", colors[value]); 
			   } else {
				   $(this).empty(); 
			   }
		  }   
	  });    
	  
	  $('#status').editable();   
	  
	  $('#group').editable({
		 showbuttons: false 
	  });   
  
	  $('#vacation').editable({
		  datepicker: { todayBtn: 'linked' } 
	  });  
		  
	  $('#dob').editable();
			
	  $('#event').editable({
		  placement: 'right',
		  combodate: {
			  firstItem: 'name'
		  }
	  });      
	  
	  $('#meeting_start').editable({
		  format: 'yyyy-mm-dd hh:ii',    
		  viewformat: 'dd/mm/yyyy hh:ii',
		  validate: function(v) {
			 if(v && v.getDate() == 10) return 'Day cant be 10!';
		  },
		  datetimepicker: {
			 todayBtn: 'linked',
			 weekStart: 1
		  }        
	  });            
	  
	  $('#comments').editable({
		  showbuttons: 'bottom'
	  }); 
	  
	  $('#note').editable(); 
	  $('#pencil').click(function(e) {
		  e.stopPropagation();
		  e.preventDefault();
		  $('#note').editable('toggle');
	 });   
	 
	  $('#state').editable({
		  source: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
	  }); 
	  
	  $('#state2').editable({
		  value: 'California',
		  typeahead: {
			  name: 'state',
			  local: ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
		  }
	  });   
	 
	 $('#fruits').editable({
		 pk: 1,
		 limit: 3,
		 source: [
		  {value: 1, text: 'banana'},
		  {value: 2, text: 'peach'},
		  {value: 3, text: 'apple'},
		  {value: 4, text: 'watermelon'},
		  {value: 5, text: 'orange'}
		 ]
	  }); 
	  
	  $('#address').editable({
		  url: '/post',
		  value: {
			  city: "Moscow", 
			  street: "Lenina", 
			  building: "12"
		  },
		  validate: function(value) {
			  if(value.city == '') return 'city is required!'; 
		  },
		  display: function(value) {
			  if(!value) {
				  $(this).empty();
				  return; 
			  }
			  var html = '<b>' + $('<div>').text(value.city).html() + '</b>, ' + $('<div>').text(value.street).html() + ' st., bld. ' + $('<div>').text(value.building).html();
			  $(this).html(html); 
		  }         
	  });              
		   
	 $('#user .editable').on('hidden', function(e, reason){
		  if(reason === 'save' || reason === 'nochange') {
			  var $next = $(this).closest('tr').next().find('.editable');
			  if($('#autoopen').is(':checked')) {
				  setTimeout(function() {
					  $next.editable('show');
				  }, 300); 
			  } else {
				  $next.focus();
			  } 
		  }
	 });
	 //notification
	 		$('#publish').click(function(){
			$.gritter.add({
				// (string | mandatory) the heading of the notification
				title: '问卷发布完成!',
				// (string | mandatory) the text inside the notification
				text: '问卷已经生成，请前往 <a href="publisher_queslist.html" style="color:#C5EEFA">问卷查看</a> 查看问卷详细信息。',
				// (string | optional) the image to display on the left
				image: 'img/avatars/2.png',
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: false,
				// (int | optional) the time you want it to be alive for before fading out
				time: ''
			});
			return false;
		});
		$('#confirm').click(function(){
			$.gritter.add({
				// (string | mandatory) the heading of the notification
				title: '题目已经确认!',
				// (string | mandatory) the text inside the notification
				text: '该题目已经确认，请继续完成问卷创建。',
				// (string | optional) the image to display on the left
				image: 'img/avatars/1.png',
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: false,
				// (int | optional) the time you want it to be alive for before fading out
				time: ''
			});
			return false;
		});
	
	//Init jquery masked inputs
	$('.date').mask('99/99/9999');
	$('.time').mask('99:99:99');
	$('.date_time').mask('99/99/9999 99:99:99');
	$('.zip').mask('99999-999');
	$('.phone').mask('(999) 999-9999');
	$('.phoneext').mask("(999) 999-9999 x99999");
	$(".money").mask("999,999,999.999"); 
	$(".product").mask("999.999.999.999"); 
	$(".tin").mask("99-9999999");
	$(".ssn").mask("999-99-9999");
	$(".ip").mask("9ZZ.9ZZ.9ZZ.9ZZ");
	$(".eyescript").mask("~9.99 ~9.99 999");
	$(".custom").mask("9.99.999.9999");
	
});
</script>
</body>
<%}catch(Exception e) 
{
    session.removeAttribute("questionnaire");
    session.removeAttribute("questions");

}%>
</html>
