
<%@ page language="java" import="java.util.*,cn.com.crowdsourcedtesting.modelhelper.*,cn.com.crowdsourcedtesting.bean.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%try{ %>
<html>
<%
	UserType  userType = (UserType)session.getAttribute("UserType");
	Tester tester  = (Tester)session.getAttribute("Tester");
%>
  <head>
   <title>TCTEST</title>

    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- CSS Global Compulsory-->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/headers/header1.css" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="assets/css/style_responsive.css" />
    <link rel="shortcut icon" href="favicon.ico" />        
    <!-- CSS Implementing Plugins -->    
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" /> 
    <link rel="stylesheet" href="assets/plugins/bxslider/jquery.bxslider.css" />             
    <link rel="stylesheet" href="assets/plugins/horizontal-parallax/css/horizontal-parallax.css" />
    <!-- CSS Theme -->    
    <link rel="stylesheet" href="assets/css/themes/default.css" id="style_color" />
    <link rel="stylesheet" href="assets/css/themes/headers/default.css" id="style_color-header-2" />    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </head> 
  <%
  	String flag = (String)request.getAttribute("flag");
  	if(flag == null || flag != "success")
  	{
  		response.sendRedirect("recruitment.do?method=selectRecentRecruitment");
  		return;
  	}
  	else
  	{
  		request.removeAttribute("flag");
  	}
  %>
  <body>
    <!--=== Style Switcher ===-->    
<i class="style-switcher-btn style-switcher-btn-option icon-cogs"></i>
<div class="style-switcher style-switcher-inner">
    <div class="theme-close"><i class="icon-remove"></i></div>
    <div class="theme-heading">主题颜色</div>
    <ul class="unstyled">
        <li class="theme-default theme-active" data-style="default" data-header="dark"></li>
        <li class="theme-blue" data-style="blue" data-header="dark"></li>
        <li class="theme-orange" data-style="orange" data-header="dark"></li>
        <li class="theme-red" data-style="red" data-header="dark"></li>
        <li class="theme-light" data-style="light" data-header="dark"></li>
    </ul>
</div><!--/style-switcher-->
<!--=== End Style Switcher ===-->    

<!--=== Top ===-->    
<div class="top">
    <div class="container">			        
        <div class="row-fluid">
            <ul class="loginbar inline">
                <li><a href="mailto:info@anybiz.com"><i class="icon-envelope-alt"></i>chengran327@gmail.com</a></li>	
                <li><a><i class="icon-phone-sign"></i> 021 4202 2656</a></li>	
                <%if(userType==null){ %>
                <li><a href="login.do?method=testerLogin"><i class="icon-user"></i> 登录</a></li>	
                <%}else if(userType.equals(UserType.Tester)) {%>
                  <li><a href="security.do?method=testerLogout"><i class="icon-user"></i>注销</a></li>
                   <li><a href="personal_center.do?method=testerFindAllQuestionnaire"><%=tester.getTesterName()%></a></li>	
               <% }%>
            </ul>
        </div>        				
    </div><!--/container-->		
</div><!--/top-->
<!--=== End Top ===-->    

<!--=== Header ===-->
<div class="header">               
    <div class="container"> 
        <!-- Logo -->       
        <div class="logo">                                             
            <a href="index.html"><img id="logo-header" src="assets/img/logo2-default.png" alt="Logo" /></a>
        </div><!-- /logo -->        
                                    
        <!-- Menu -->       
        <div class="navbar">                                
            <div class="navbar-inner">                                  
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a><!-- /nav-collapse -->                                  
                <div class="nav-collapse collapse">                                     
                    <ul class="nav">
                        <li class="active">
                           <a href="index.jsp">主页
                            
                            </a>
                           
                      </li>
                        <li>
                            <a href="gifts.do?method=selectAllGifts">礼品中心
                                                        
                            </a>
                                       
                        </li>
                        <li>
                            <a href="testTaskViewList.do">任务广场                            
                            </a>
                        </li>
                        <li>
                            <a href="recruitment.do?method=selectAllRecruitment">招募帖                          
                            </a>
                        </li>
                        <li>
                            <a href="page_clients.html">合作伙伴</a>
      
                        </li>
                       <li>
                            <a href="questionnaire.do?method=pageQuestionnaire">问卷调查
                            </a>
                            
                                                    
                        </li>
                        <li><a class="search search-nav"><i class="icon-search search-btn"></i></a></li>                                
                    </ul>
                    <div class="search-open search-open-inner">
                        <div class="input-append">
                            <form />
                                <input type="text" class="span3" placeholder="Search" />
                                <button type="submit" class="btn-u">Search</button>
                            </form>
                        </div>
                    </div>
                </div><!-- /nav-collapse -->                                
            </div><!-- /navbar-inner -->
        </div><!-- /navbar -->                          
    </div><!-- /container -->               
</div><!--/header -->      
<!--=== End Header ===-->

<!--=== Slider ===-->
<div id="sequence-theme" class="sequence-inner">
    <div id="sequence">
        <img class="prev" src="assets/plugins/horizontal-parallax/images/bt-prev1.png" alt="Previous" />
        <img class="next" src="assets/plugins/horizontal-parallax/images/bt-next1.png" alt="Next" />
        <ul>
            <li class="animate-in">
                <div class="info">
                    <h2>事业腾飞的起点</h2>
                    <p>通过吐槽网，你可以有自己事业的第二春，在这个虚拟的公司里，你将有自己的声望，名誉，甚至，做到CEO</p>
                </div>
                <img class="balloon" src="assets/plugins/horizontal-parallax/images/balloon.png" alt="Balloon" />
            </li>
            <li>
                <div class="info">
                    <h2>高效运营的保障</h2>
                    <p>我么有一只无形的测试军队，为你，为所有人进行测试，高效、便捷</p>
                </div>
                <img class="aeroplane" src="assets/plugins/horizontal-parallax/images/aeroplane.png" alt="Aeroplane" />
            </li>
            <li>
                <div class="info">
                    <h2>减少开支的理由</h2>
                    <p>为中小型公司组建的专业团队，现在，您不需要再为测试养一群程序员了</p>
                </div>
                <img class="kite" src="assets/plugins/horizontal-parallax/images/kite.png" alt="Kite" />
            </li>
        </ul>
    </div>
</div><!--/sequence-theme-->
<!--=== End Slider ===-->

<!-- Purchase Block -->
<div class="row-fluid purchase margin-bottom-30">
    <div class="container">
		<div class="span9">
            <span>吐槽网是一个众包测试网站，服务超过两百家中型企业</span>
        </div>
        <a href="#" class="btn-buy hover-effect">详情</a>
    </div>
</div><!--/row-fluid-->
<!-- End Purchase Block -->

<!--=== Content Part ===-->
<div class="container">		
    <div class="row-fluid">
        <!-- Left Sidebar(Content Part) -->        
        <div class="span9">
            <!-- Our Services -->
            <div class="row-fluid">
                <div class="headline"><h3>服务简介</h3></div>
                <p>吐槽网专为测试而生，用户可以在这里发布自己的测试任务，收集他人的测试报告，从而对自己的产品进行改进。同时用户也可以参与到其他人的测试任务之中，获取积分，赢得礼品。</p><br />
                <div class="row-fluid servive-block servive-block-in">
                    <div class="span4">
                        <h4><a href="#">发布测试</a></h4>
                        <p><i class="icon-bell"></i></p>
                        <p>发布者可以发布自己的测试任务</p>
                    </div>
                    <div class="span4">
                        <h4><a href="#">参与测试</a></h4>
                        <p><i class="icon-bullhorn"></i></p>
                        <p>用户可以参与到已经发布的测试任务</p>
                    </div>
                    <div class="span4">
                        <h4><a href="#">礼品兑换</a></h4>
                        <p><i class=" icon-lightbulb"></i></p>
                        <p>用户可以利用积分兑换想要的礼品</p>
                    </div>
                </div><!--/welcome-block-->
            </div><!--/row-fluid-->        
        
            <!-- Recent Works -->
            <div class="headline">
              <h3>测试产品列表</h3></div>
            <div class="row-fluid margin-bottom-40">
            <%
            	List<Product> products = (List<Product>)request.getAttribute("products");
            	Iterator<Product> iterator = products.iterator();
            	Product product = null;
            %>
                <ul id="list" class="bxslider recent-work">
                <%
                	while(iterator.hasNext())
                	{
                		product = iterator.next();
                	
                %>
                    <li>
                       <div class="booking-blocks">
             <div class="pull-left booking-img">
                <img src="assets/img/new/img1.jpg" alt="" />
                <ul class="unstyled">
                   <li><i class="icon-briefcase"></i> Dell, Google</li>
                   <li><i class="icon-trophy"></i>20 积分</li>
                </ul>
             </div>
             <div style="overflow:hidden;">
                <h2><a href="#"><%=product.getProductName() %></a></h2>
                <!-- <p>对谷歌文档进行测试并拿取丰厚奖励 <a href="#">详细信息</a></p>  -->
             </div>
          </div>
                    </li>
                    <%
					}
                    %>
 					<li>
                       <div class="booking-blocks">
             <div class="pull-left booking-img">
                <img src="assets/img/new/img4.jpg" alt="" />
                <ul class="unstyled">
                   <li><i class="icon-briefcase"></i> Dell, Google</li>
                   <li><i class="icon-trophy"></i>20 积分</li>
                </ul>
             </div>
             <div style="overflow:hidden;">
                <h2><a href="#">谷歌文档测试</a></h2>
                <p>对谷歌文档进行测试并拿取丰厚奖励 <a href="#">详细信息</a></p>
             </div>
          </div>
                    </li>
                     <li>
                       <div class="booking-blocks">
             <div class="pull-left booking-img">
                <img src="assets/img/new/img3.jpg" alt="" />
                <ul class="unstyled">
                   <li><i class="icon-briefcase"></i> Dell, Google</li>
                   <li><i class="icon-trophy"></i>20 积分</li>
                </ul>
             </div>
             <div style="overflow:hidden;">
                <h2><a href="#">谷歌文档测试</a></h2>
                <p>对谷歌文档进行测试并拿取丰厚奖励 <a href="#">详细信息</a></p>
             </div>
          </div>
                    </li>
                     <li>
                       <div class="booking-blocks">
             <div class="pull-left booking-img">
                <img src="assets/img/new/img2.jpg" alt="" />
                <ul class="unstyled">
                   <li><i class="icon-briefcase"></i> Dell, Google</li>
                   <li><i class="icon-trophy"></i>20 积分</li>
                </ul>
             </div>
             <div style="overflow:hidden;">
                <h2><a href="#">谷歌文档测试</a></h2>
                <p>对谷歌文档进行测试并拿取丰厚奖励 <a href="#">详细信息</a></p>
             </div>
          </div>
                    </li>

                </ul>        
            </div><!--/row-->
            <!-- //End Recent Works -->

           

            
        </div><!--/span9-->

        <!-- Right Sidebar -->        
        <div class="span3">
        <%
        	List <Recruitment> recruitments = (List<Recruitment>)request.getAttribute("hirelist");
        	Iterator<Recruitment> it = recruitments.iterator();
        	Recruitment recruitment = null; 
        %>
            <!-- Posts -->
			<div class="posts margin-bottom-30">
                <div class="headline"><h3>近期招募任务</h3></div>
                <%
                	while(it.hasNext())
                	{
                		recruitment = it.next();
                %>
                <dl class="dl-horizontal">
                    <dt><a href="#"><img alt="" src="assets/img/sliders/elastislide/6.jpg" /></a></dt>
                    <dd>
                        <p><a href="recruitment.do?method=selectRecruitment&id=<%=recruitment.getActivityId()%>"><%=recruitment.getActivityName()%></a></p> 
                    </dd>
                </dl>
                <%
                }
                %>
                <!--  <dl class="dl-horizontal">
                    <dt><a href="#"><img alt="" src="assets/img/sliders/elastislide/10.jpg" /></a></dt>
                    <dd>
                        <p><a href="#">qq输入法测试任务</a></p> 
                    </dd>
                </dl>
                <dl class="dl-horizontal">
                    <dt><a href="#"><img alt="" src="assets/img/sliders/elastislide/11.jpg" /></a></dt>
                    <dd>
                        <p><a href="#">安卓客户端测试任务</a></p> 
                    </dd>
                </dl> -->
            </div>
            
            <!-- Why Choose Us -->
            <div class="who margin-bottom-30">
                <div class="headline"><h3>为何选择我们</h3></div>
                <p>我们拥有最全面的功能，最方便的服务以及众多的测试用户。在这里，你可以体会到测试的乐趣！</p>
                <ul class="unstyled">
                    <li><a href="#"><i class="icon-desktop"></i>界面友好</a></li>
                    <li><a href="#"><i class="icon-bullhorn"></i>操作简单</a></li>
                    <li><a href="#"><i class="icon-globe"></i>功能强大</a></li>
                    <li><a href="#"><i class="icon-group"></i>用户众多</a></li>
                </ul>
            </div>

           
           
    </div><!--/row-fluid-->
    <!-- //End Container -->

    <!-- Our Clients -->
    <div id="clients-flexslider" class="flexslider home clients">
        <div class="headline"><h3>合作企业</h3></div>    
        <ul class="slides">
            <li>
                <a href="#">
                    <img src="assets/img/clients/hp_grey.png" alt="" /> 
                    <img src="assets/img/clients/hp.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/igneus_grey.png" alt="" /> 
                    <img src="assets/img/clients/igneus.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/vadafone_grey.png" alt="" /> 
                    <img src="assets/img/clients/vadafone.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/walmart_grey.png" alt="" /> 
                    <img src="assets/img/clients/walmart.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/shell_grey.png" alt="" /> 
                    <img src="assets/img/clients/shell.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/natural_grey.png" alt="" /> 
                    <img src="assets/img/clients/natural.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/aztec_grey.png" alt="" /> 
                    <img src="assets/img/clients/aztec.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/gamescast_grey.png" alt="" /> 
                    <img src="assets/img/clients/gamescast.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/cisco_grey.png" alt="" /> 
                    <img src="assets/img/clients/cisco.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/everyday_grey.png" alt="" /> 
                    <img src="assets/img/clients/everyday.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/cocacola_grey.png" alt="" /> 
                    <img src="assets/img/clients/cocacola.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/spinworkx_grey.png" alt="" /> 
                    <img src="assets/img/clients/spinworkx.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/shell_grey.png" alt="" /> 
                    <img src="assets/img/clients/shell.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/natural_grey.png" alt="" /> 
                    <img src="assets/img/clients/natural.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/gamescast_grey.png" alt="" /> 
                    <img src="assets/img/clients/gamescast.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/everyday_grey.png" alt="" /> 
                    <img src="assets/img/clients/everyday.png" class="color-img" alt="" />
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="assets/img/clients/spinworkx_grey.png" alt="" /> 
                    <img src="assets/img/clients/spinworkx.png" class="color-img" alt="" />
                </a>
            </li>
        </ul>
    </div><!--/flexslider-->
    <!-- //End Our Clients -->
</div><!--/container-->		
<!--=== End Content Part ===-->

<!--=== Footer ===-->
<div class="footer">
	<div class="container">
		<div class="row-fluid">
			<div class="span4">
                <!-- About -->
		        <div class="headline"><h3>关于</h3></div>	
				<p class="margin-bottom-25">TCTest全名为吐槽测试网的英文，该网站致力于为公司打造一个第三方测试团队，为大众创建一个吐槽平台，为你喜欢的软件提出重要的改进意见。</p>	

				
			</div><!--/span4-->	
			
			<div class="span4">
            <!-- Monthly Newsletter -->
		        <div class="headline"><h3>联系我们</h3></div>	
                <address>
					4800号，曹安公路，同济大学软件学院 <br />
					上海市, 中国 <br />
					电话: 131 6293 7287 <br />
					传真: 800 123 3456 <br />
					Email: <a href="mailto:info@anybiz.com" class="">chengran327@gmail.com</a>
                </address>
			</div><!--/span4-->

			<div class="span4">
	

                <!-- Stay Connected -->
		        <div class="headline">
		          <h3>关注我们</h3></div>	
                <ul class="social-icons">
                    <li><a href="#" data-original-title="Feed" class="social_rss"></a></li>
                    <li><a href="#" data-original-title="Facebook" class="social_picasa"></a></li>
                    <li><a href="#" data-original-title="Twitter" class="social_twitter"></a></li>
                    <li><a href="#" data-original-title="Goole Plus" class="social_tumblr"></a></li>
                    <li><a href="#" data-original-title="Pinterest" class="social_pintrest"></a></li>
                    <li><a href="#" data-original-title="Linkedin" class="social_linkedin"></a></li>
                    <li><a href="#" data-original-title="Vimeo" class="social_vimeo"></a></li>
                </ul>
			</div><!--/span4-->
		</div><!--/row-fluid-->	
	</div><!--/container-->	
</div><!--/footer-->	
<!--=== End Footer ===-->

<!--=== Copyright ===-->
<div class="copyright">
	<div class="container">
		<div class="row-fluid">
			<div class="span8">						
	            <p>Copyright &copy; 2014.TCtest All rights reserved.</p>
			</div>
			<div class="span4">	
                <a href="index.html"><img id="logo-footer" src="assets/img/logo2-default.png" class="pull-right" alt="" /></a>
			</div>
		</div><!--/row-fluid-->
	</div><!--/container-->	
</div><!--/copyright-->	
<!--=== End Copyright ===-->

<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="assets/js/modernizr.custom.js"></script>        
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="assets/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="assets/plugins/horizontal-parallax/js/sequence.jquery-min.js"></script>
<script type="text/javascript" src="assets/plugins/horizontal-parallax/js/horizontal-parallax.js"></script>
<script type="text/javascript" src="assets/plugins/bxslider/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initSliders();
        App.initBxSlider();
    });
</script>
<!--[if lt IE 9]>
	<script src="assets/js/respond.js"></script>
<![endif]-->	
  </body>
</html>
<%}catch(Exception e)
{

   response.sendRedirect("security.do?method=goToLogin");	
}
%>