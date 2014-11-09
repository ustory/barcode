<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>条形码生成系统</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="images/bootstrap.min.css">
<link rel="stylesheet" href="images/bootstrap-theme.min.css">
<!-- jQuery文件 -->
<script src="images/jquery-1.10.2.min.js"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="images/bootstrap.min.js"></script>
<!-- JQuery打印插件 -->
<script src="images/jquery.PrintArea.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<a class="navbar-brand" href="/barcode"><span class="glyphicon glyphicon-home"> Barcode</span></a>
							<p class="navbar-text navbar-right">专业条形码生成系统</p>
						</div>
					</div>
					<!-- /.container-fluid -->
				</nav>

				<div class="jumbotron" style="padding-left: 45px;">
					<h2>
						【专业条形码生成系统】 <small>使用方法</small>
					</h2>
					<p>
						<span class="glyphicon glyphicon-hand-right"> <small>选择条形码类型</small></span>
					</p>
					<p>
						<span class="glyphicon glyphicon-hand-right"> <small>填写条形码内容</small></span>
					</p>
					<p>
						<span class="glyphicon glyphicon-hand-right"> <small>个性化设置条形码</small></span>
					</p>
					<p>
						<span class="glyphicon glyphicon-hand-right"> <small>生成条形码</small></span>
					</p>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-sm-6 col-xs-12">
				<form>
					<p>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-barcode"> 类型</span></span> <input type="hidden" name="codeType" id="codeType" value="code128">
						<div class="btn-group">
							<div class="btn-group codeType" name="codeType" id="codeTypeButton">
								<button type="button" class="btn btn-default" onclick="changeInfo('最大128个字符')">code128</button>
								<button type="button" class="btn btn-default" onclick="changeInfo('可输入字母数字或-.空格$/+')">code39</button>
								<button type="button" class="btn btn-default" onclick="changeInfo('13位数字')">ean13</button>
								<button type="button" class="btn btn-default" onclick="changeInfo('可输入数字，ABCD，或+-*/$.:')">codabar</button>
							</div>
						</div>
					</div>
					</p>
					<p>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-comment"> 内容</span></span><input type="text" name="code" id="code" class="form-control"
							placeholder="必填，只能输入字母或数字的集合" onfocus="clearMessage()">
					</div>
					</p>
					<p>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-text-width"> 模块宽度</span></span><input type="text" name="width" id="width" class="form-control"
							placeholder="可选参数，条码中较窄图形的宽度，默认值：0.53mm"><span class="input-group-addon">mm</span>
					</div>
					</p>
					<p>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-text-height"> 高度</span></span><input type="text" name="height" id="height" class="form-control"
							placeholder="可选参数，默认值:47.4mm"><span class="input-group-addon">mm</span>
					</div>
					</p>
					<p>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-picture"> 输出图片类型</span></span> <input type="hidden" name="imgType" id="imgType" value="jpg">
						<div class="btn-group" name="imgType" id="imgTypeButton">
							<button type="button" class="btn btn-default">jpg</button>
							<button type="button" class="btn btn-default">png</button>
							<button type="button" class="btn btn-default">gif</button>
							<button type="button" class="btn btn-default">bmp</button>
						</div>
					</div>
					</p>
					<button type="button" class="btn btn-default" onclick="createBarcode()">
						<span class="glyphicon glyphicon-wrench"> 生成条形码</span>
					</button>
				</form>
			</div>
			<div class="col-sm-6 col-xs-12">
				<div class="alert alert-danger" role="alert" style="display: none" id="alert-error">
					<button type="button" class="close" onclick="clearMessage()">×</button>
					<span class="glyphicon glyphicon-ban-circle"> 条形码制作过程出现异常，请稍后重试.</span>
				</div>
				<div class="printBarcode">
					<img id="barcodeimg" src="<%=request.getContextPath()%>/barcodeimg/barcode.jpg?type=code128&msg=12345678&fmt=jpg" />
				</div>
				<button type="button" class="btn btn-default" onclick="printBarcode()">
					<span class="glyphicon glyphicon-print"> 打印条形码</span>
				</button>
				<a id="barcodeimga" class="btn btn-default" href="<%=request.getContextPath()%>/barcodeimg/barcode.jpg?type=code128&msg=12345678&fmt=jpg"> <span
					class="glyphicon glyphicon-download-alt"> 下载条形码</span>
				</a>
			</div>
		</div>

		<div class="row-fluid">
			<div class="col-md-12">
				<address style="border-top: 1px solid #e5e5e5; padding-top: 20px; margin-top: 20px;">
					<span class="glyphicon glyphicon-book"> <strong>滁州学院</strong></span><br /> <span class="glyphicon glyphicon-pushpin"> 安徽省, 滁州市, 琅琊区, 丰乐大道1528号</span><br /> <span
						class="glyphicon glyphicon-phone-alt"> (021) 456-7890</span>
				</address>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$().ready(function(){
			$('button').click(function(){
				var parnetId = $(this).parent().attr("name");
				$("#"+parnetId).val($(this).html());
				$('#'+parnetId+'Button > button').each(function(){
					$(this).removeClass('btn-success');
				})
			 	$(this).addClass('btn-success');
			});
		});

		function clearMessage(){
			$("#alert-error").attr("style","display: none");
		}
		
		function changeInfo(info){
			$('#code').attr('placeholder','必填，'+info+'，不能是中文');
		}
		//制作条形码
		function createBarcode(){
			$("#alert-error").attr("style","display: none");
			var url_ = "barcodeimg/barcode.jpg?";
			if (!$("#code").val()) {
				$("#alert-error").attr("style", "");
				$("#alert-error > span").html(" 请输入条形码内容");
				return;
			}
			url_ += "msg=" + $("#code").val();
			if ($("#codeType").val()) {
				url_ += "&type=" + $("#codeType").val();
			}
			if ($("#width").val()) {
				url_ += "&mw=" + $("#width").val() / 2.54;
			}
			if ($("#height").val()) {
				url_ += "&height=" + $("#height").val() / 2.54;
			}
			if ($("#imgType").val()) {
				url_ += "&fmt=" + $("#imgType").val();
			}
			//ajax先提交请求，如果报错，在此处理，避免页面显示错误
			$.ajaxSetup({
		  		statusCode: {
		    		500: function() {
		    			$("#alert-error").attr("style", "");
						$("#alert-error > span").html(" 条形码内容格式错误");
		    		}
		  	     }
			});
			$.ajax({url:url_,success:function(data){
				$("#barcodeimg").attr("src", "<%=request.getContextPath()%>/" + url_);
				$("#barcodeimga").attr("href", "<%=request.getContextPath()%>/" + url_);
			}});
		}
		//打印条形码
		function printBarcode(){
			$(".printBarcode").printArea();
		}
	</script>
</body>
</html>