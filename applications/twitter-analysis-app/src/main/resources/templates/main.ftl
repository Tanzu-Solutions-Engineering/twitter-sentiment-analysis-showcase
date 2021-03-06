<html>
<head>
  <title>Twitter NLP</title>
  <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no' />
  <link rel="stylesheet" type="text/css" href="bootstrap.min.css"></link>
  <link rel="stylesheet" type="text/css" href="keen-dashboards.css"></link>
  <link rel="stylesheet" type="text/css" href="main.css"></link>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script type="text/javascript" src="Tweet.js"></script>
  <script type="text/javascript" src="sendSyntheticTweets.js"></script>
    <link href='https://d1fto35gcfffzn.cloudfront.net/tanzu/favicon.ico' rel='shortcut icon' type='image/vnd.microsoft.icon'>
<!--  <link href="https://d1fto35gcfffzn.cloudfront.net/images/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon"></link>-->
</head>

<body class="application">

</body>

  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="">Twitter NLP</a>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="https://github.com/Tanzu-Solutions-Engineering/twitter-sentiment-analysis.git">Source (GitHub)</a></li>
          <li><a href="https://tanzu.vmware.com/tanzu">tanzu.vmware.com</a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="container-fluid">


      <div class="col-sm-3">
        <div class="chart-wrapper">
                  <div class="chart-title container-fluid">
                      <div class="col-sm-6" style="font-size:20px; color:orange">Selected Tweets</div>
                      <div class="col-sm-6" style="font-size:20px"><canvas id="myCanvas" width="120" height="20"></canvas></div>
                  </div>
          <div class="chart-stage" style="height:825px">

              <!----- Continous Query---------->
              <div style="color:orange">
                  ${continuousQuery}
                  <hr/>
              </div>
              <!------------------>
            <table class="" id="output">
            </table>
          </div>
          <div class="chart-notes">
          </div>
        </div>
        <p class="small text-muted"><a href="https://tanzu.vmware.com/data-science">Tanzu Data Science</a> </p>

      </div>

      <div class="col-sm-9">
        <div class="chart-wrapper">
          <div class="chart-title">
            Stats
          </div>
           <!--svg width="764" height="500"></svg-->

        <div class="chart-stage">
            <div id="container" class="svg-container"></div>
            <div id="container1" class="svg-container"></div>
        </div>
        <div class="chart-notes">
          </div>
        </div>
          <row>
                <div class="chart-wrapper col-sm-6" style="padding-bottom:4px;">
                  <div class="chart-title">
                    Scale testing: Compute sentiment on more Tweets
                  </div>
                  <div class="chart-stage text-center" style="height:100%">
                       <button type="button" class="btn btn-lg btn-primary" onclick="sendTen()">10 Tweets</button>
                       <button type="button" class="btn btn-lg btn-primary" onclick="sendOneHundred()">100 Tweets</button>
                       <button type="button" class="btn btn-lg btn-primary" onclick="sendOneThousand()">1,000 Tweets</button>
                  </div>
                </div>
                <div class="col-sm-1"></div>

                <div class="chart-wrapper col-sm-5">
                  <div class="chart-title">
                    Tweet stats
                  </div>
                  <div class="chart-stage text-center" >
                      <div class="col-sm-6"><p>Tweets/Minute:</p> <b id="tweetsPerMinute">0</b></div>
                      <div class="col-sm-6"><p>Total Tweets:</p> <b id="totalTweets">0</b></div>
                  </div>
                </div>
        </row>
    </div>

    <hr/>

  </div>

  <script type="text/javascript" src="holder.js"></script>
  <script>
    Holder.add_theme("white", { background:"#fff", foreground:"#a7a7a7", size:10 });
  </script>
  <script type="text/javascript" src="keen.min.js"></script>
  <script type="text/javascript" src="meta.js"></script>
  <script src="http://d3js.org/d3.v4.min.js"></script>
  <script type="text/javascript" src="tweetChart.js"></script>
    <script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      var centerX = canvas.width / 2;
      var centerY = canvas.height / 2;
      var radius = 8;

      context.beginPath();
      context.arc(centerX+50, centerY, radius, 0, 2 * Math.PI, false);
      context.fillStyle = 'green';
      context.fill();
      context.fillStyle = 'black';
      context.font = "14px Arial";
      context.fillText("Feed Active:", 10, 15);

        // for tweet stats
        var sentimentComputeURL = '${SENTIMENT_COMPUTE_URL}';
        var sentimentStatsURL = '${SENTIMENT_STATS_URL}';

    </script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-76191007-3', 'auto');
  ga('send', 'pageview');

</script>
</body>

</html>
