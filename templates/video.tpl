<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head
        content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="http://getbootstrap.com/favicon.ico">
        <title>{$title}</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media
        queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js">
            </script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js">
            </script>
        <![endif]-->
        <link href="css/video-js.css" rel="stylesheet" type="text/css">
        <script src="js/video.js">
        </script>
        <script>
            videojs.options.flash.swf = "media/video-js.swf";

            function jumptime(e) {
                var v = videojs("example_video_1");
                v.play();
                v.currentTime(e.value);
            }
        </script>
    </head>
    
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">
                            Toggle navigation
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                    </button>
                    <a class="navbar-brand" href="#">
                    {$siteName}
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">
                                Link
                                <span class="sr-only">
                                    (current)
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Link
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                            aria-expanded="false">
                                播放列表
                                <span class="caret">
                                </span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">
                                        Action
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Another action
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Something else here
                                    </a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">
                                        Separated link
                                    </a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">
                                        One more separated link
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input class="form-control" placeholder="Search" type="text">
                        </div>
                        <button type="submit" class="btn btn-default">
                            Submit
                        </button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">
                                登录
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="word-wrap:break-word;">
            <div class="row">
                <!-- row for video-->
                <div class="col-sm-8 autoheight">
                    <video id="example_video_1" class="video-js vjs-default-skin" controls
                    preload="auto" height="100%" width="100%" poster="http://video-js.zencoder.com/oceans-clip.png"
                    data-setup='{$playerOptions}'>
                        {section name=source loop=$sourceList}
                        <source src="{$sourceList[source].encodedPath}"
                        type='{$sourceList[source].type}' />
                        {/section}
                        {section name=track loop=$trackList}
                        <track kind="{$trackList[track].kind}" src="{$trackList[track].encodedPath}" srclang="{$trackList[track].langcode}" label="{$trackList[track].label}" default="default"></track>
                        <!-- Tracks need an ending tag thanks to IE9 -->
                        {/section}
                        <p class="vjs-no-js">
                            To view this video please enable JavaScript, and consider upgrading to
                            a web browser that
                            <a href="http://videojs.com/html5-video-support/" target="_blank">
                                supports HTML5 video
                            </a>
                        </p>
                    </video>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default autoheight" style="overflow-y:scroll">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                章节跳转
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="list-group" id="chapter-list">
                            {section name=cl loop = $chapterList}
                                <button class="list-group-item" value="{$chapterList[cl].startTime}" type="button" onclick="jumptime(this)">
                                {$chapterList[cl].text}
                                </button>
                            {sectionelse}
                                <p>没有章节</p>
                            {/section}
                            </div>
                        </div>
                    </div>
                </div>
            </div>        
            <div class="row">
                <!-- row for description-->
                <div class="col-sm-8">
                    <h3>
                       {$videoTitle}
                    </h3>
                    <p>
                       {$videoDescription}
                     </p>
                </div>
                <div class="col-sm-4">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvNjR4NjQKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNGVhMDQ1NzdiYyB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE0ZWEwNDU3N2JjIj48cmVjdCB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMi41IiB5PSIzNi44Ij42NHg2NDwvdGV4dD48L2c+PC9nPjwvc3ZnPg=="
                                alt="...">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                Uploader
                            </h4>
                            June 6, 2014 18:30
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <footer class="blog-footer">
                <p>
                    Simple Video Serivce
                </p>
                <p>
                    Built with
                    <a href="http://getbootstrap.com/">
                        Bootstrap
                    </a>
                    and Video.js.
                </p>
                <p>
                    <a href="#">
                        Back to top
                    </a>
                </p>
            </footer>
        </div>
        <!-- /.container -->
        <script>
            var videoplayer = videojs("example_video_1");
            videoplayer.ready(function() {
                myPlayer = this;
                myPlayer.volume(2);
                //myPlayer.play();
            })
        </script>
        <!-- Bootstrap core JavaScript==================================================-
        ->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js">
        </script>
        <script src="js/bootstrap.js">
        </script>
    </body>

</html>