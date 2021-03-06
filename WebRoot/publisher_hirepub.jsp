<%@ page language="java" import="java.util.*,cn.com.crowdsourcedtesting.bean.*,cn.com.other.page.*;" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE html>
<html:html lang="true">
  <head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8" />
<title>TCTEST</title>
<meta name="keywords" content="TCTEST" />
<meta name="description" content="TCTEST" />
<meta name="author" content="Rain Cheng" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Font CSS  -->
<link rel="stylesheet" type="text/css" href="css/opensans.css" />

<!-- Core CSS  -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css" />

<!-- Plugin CSS -->
<link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/timepicker/bootstrap-timepicker.min.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/colorpicker/colorpicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/datepicker/datepicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/daterange/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/formswitch/css/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css" href="vendor/plugins/tags/tagmanager.css" />

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
</head>


<%
 String flag = (String)request.getAttribute("isLegal");
 if(flag == null || flag != "legal")
 {
 	response.sendRedirect("recruitment.do?method=gotoBackStage");
 	return;
 }
 else
 	request.removeAttribute("isLegal");
 %>
 

<body>
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
              <div class="item-message"><a href="#"><b>Marko</b> logged 12 hours</a></div>
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
        
        <li> <a href="PublisherQuestionnaireMainView.jsp"><span class="glyphicons glyphicons-more_items"></span><span class="sidebar-title">问卷管理</span></a> </li>		
        <li class="active"> <a href="publisher_hireman.jsp"><span class="glyphicons glyphicons-bullhorn"></span><span class="sidebar-title">招募信息</span></a> </li>
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
        <li><a href="publisher_home.html">主页</a></li>
        <li><a href="publisher_hireman.jsp">招募信息</a></li>
        <li class="active">发布信息</li>
      </ol>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="panel">
            <div class="panel-heading">
            	<div class="panel-title"><i class="fa fa-cloud-upload"></i>招募信息发布</div>
            </div>
            <div class="panel-body">
              <h2 class="text-primary"> 请填写详细信息 </h2>
              <hr/>
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <p id="instructor" class="alert alert-success">请正确填写信息</p>
                  
                  
                  <form id="AddRecruitmentForm" action="recruitment.do?method=addNewRecruitment" method="post">
                  <div class="form-group">
                    <label for="web_url"> 招募标题 </label>
                    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-bookmark"></i> </span>
                      <input id="RecruitmentTitle" class="form-control" type="text" name="title">
                      </input>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="web_url"> 招募形式</label>
                    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-bookmark"></i> </span>
                      <select  id="isOnline" name="online" onchange="">
 							<option value='-1' selected>------请选择-----</option>
 							<option value='0'>线下</option>
 							<option value='1'>线上</option>
 					  </select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                  	<label for="web_url"> 开始时间</label>
                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-calendar"></i> </span>
                       <input type="text" id="datepicker1" class="form-control datepicker margin-top-none" name="startdate" />                      
                    </div>
                  </div>
                  
                  <div class="form-group">
                  	<label for="web_url"> 截止时间</label>
                    <div class="input-group"> <span class="input-group-addon"><i class="fa fa-calendar"></i> </span>
                       <input type="text" id="datepicker2" class="form-control datepicker margin-top-none" name="enddate" />                      
                     </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="web_url"> 招募地点</label>
                    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-bookmark"></i> </span>
                      <input id="RecruitmentPlace" class="form-control" type="text" name="place">
                      </input>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="web_url"> 招募公司</label>
                    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-bookmark"></i> </span>
                      <input id="RecruitmentCompany" class="form-control" type="text" name="company">
                      </input>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="web_url"> 招募简介</label>
                    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-bookmark"></i> </span>
                      <input id="RecruitmentBrief" class="form-control" type="text" name="brief">
                      </input>
                    </div>
                  </div>
                  
                  <div class="form-group">
                      <label for="textArea">招募内容</label>
                      <div class="input-group">
                        <textarea id="RecruitmentContent" class="form-control" cols="80" rows="6" name="content"></textarea>
                      </div>
                  </div>                                            
                  <hr></hr>
                  <!-- 
                  <div class="pull-left">
                  	<button class="btn btn-gradient btn-lg btn-green" type="button">返回</button>
                  </div>
                   -->
                  <div class="pull-right">
                  	<button id="addRecruitment" class="btn btn-gradient btn-lg btn-green" type="button">完成</button>
                  </div>
                  </form>
                  
                  
                </div>
              </div>
              <div class="row"><hr></hr></div>
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
<script src="js/jquery.min.js"></script> 
<script src="js/jquery-ui.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 

<!-- Plugins - Via CDN --> 
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 
<!--<script type="text/javascript" src="vendor/plugins/datatables/jquery.dataTables.min.js"></script> Local Option --> 

<!-- Plugins --> 
<script type="text/javascript" src="vendor/plugins/datatables/js/datatables.js"></script><!-- Datatable Bootstrap Addon --> 
<script type="text/javascript" src="vendor/editors/xeditable/js/bootstrap-editable.js"></script> 
<script type="text/javascript" src="vendor/plugins/chosen/chosen.jquery.min.js"></script> 

<!-- Theme Javascript --> 
<script type="text/javascript" src="js/uniform.min.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 
<script type="text/javascript" src="js/custom.js"></script> 
<script type="text/javascript" src="vendor/plugins/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {

  Core.init();

  $('#datatable').dataTable( {
	"aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ -1 ] }],
	"oLanguage": { "oPaginate": {"sPrevious": "", "sNext": ""} },
	"iDisplayLength": 6,
	"aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
  });	
  
  $("select[name='datatable_length']").chosen();	
  $.fn.editable.defaults.mode = 'popup';
  $('.xedit').editable();
  $('.datepicker').datepicker();

	
	
	
	//$('#isOnline').onchange(test);	
	$('#addRecruitment').click(function(){
		//alert($('#RecruitmentTitle').val());
		var s_date = $.trim($('#datepicker1').val()).split('/');
		var e_date = $.trim($('#datepicker2').val()).split('/');
		var d1 = new Date();
  		var d2 = new Date();
	    if(s_date != null && s_date.length>2){
	     	d1.setFullYear(Number(s_date[2])) ;
	     	d1.setMonth(Number(s_date[0])-1);
	     	d1.setDate(Number(s_date[1])); 
	    }
	    if(e_date != null && e_date.length>2){
	     	d2.setFullYear(Number(e_date[2])) ;
	     	d2.setMonth(Number(e_date[0])-1);
	     	d2.setDate(Number(e_date[1])); 
	    }
	    //alert(d1.toLocaleString()+"<br>"+d2.toLocaleString());
		
		if($.trim($('#RecruitmentTitle').val())=="")
		{
			$("#instructor").text("招募标题不能为空");
			$('#RecruitmentTitle').focus();
		}
		else if($.trim($('#RecruitmentTitle').val()).length>=20)
		{
			$("#instructor").text("招募标题过长");
			$('#RecruitmentTitle').focus();
		}
		else if($.trim($('#datepicker1').val())=="")
		{
			$("#instructor").text("开始时间不能为空");
			$('#datepicker1').focus();
		}
		else if($.trim($('#datepicker2').val())=="")
		{
			$("#instructor").text("截止时间不能为空");
			$('#datepicker2').focus();
		}
		else if(d2.getTime()-d1.getTime()<=0)
		{
			$("#instructor").text("招募时间错误");
			$('#datepicker1').focus();
		}
		else if($.trim($('#RecruitmentBrief').val())=="")
		{
			$("#instructor").text("招募简介不能为空");
			$('#RecruitmentBrief').focus();
		}
		else if($.trim($('#RecruitmentBrief').val()).length>=250)
		{
			$("#instructor").text("招募简介过长");
			$('#RecruitmentBrief').focus();
		}
		else if($.trim($('#RecruitmentPlace').val()).length>=50)
		{
			$("#instructor").text("招募地点过长");
			$('#RecruitmentBrief').focus();
		}
		else if($.trim($('#RecruitmentCompany').val()).length>=40)
		{
			$("#instructor").text("招募公司过长");
			$('#RecruitmentBrief').focus();
		}
		else if($.trim($('#RecruitmentContent').val())=="")
		{
			$("#instructor").text("招募时间不能为空");
			$('#RecruitmentContent').focus();
		}		
		else
		{
			$("#AddRecruitmentForm").attr("disabled",true);
			$("#AddRecruitmentForm").submit();
		}
	});
});

function checkNull()
{
	alert("test");
}
</script>
</body>
</html:html>
