<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Úm ba la..</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Playfair+Display&display=swap"
        rel="stylesheet">
    <link rel="icon" href="./image/homepage1/Group 1.png">
    <link rel="stylesheet" href="css/index.css">
</head>

<jsp:include page="header.jsp"/>
<body>

    <!-- Page heading -->
    <section id="page-heading">
        <!-- Right seciton -->
        <div class="right half">
            <image class="center-div" src="./image/homepage1/Group 50.png"></image>
        </div>
        <!-- Left section -->
        <div class="vert-cent left half">
            <h1 class="serif">ÚM BA LA</h1>
            <p>“Úm ba la xì bùa” đưa ra cho người truy cập nhiều ý tưởng tái chế đồ vật có sẵn, “biến hóa” chúng thành vật dụng có ích, giảm thiểu lượng rác thải ra môi trường.</p>
        </div>
    </section>

    <!-- Section 1 -->
    <section>
        <!-- Section 1 heading -->
        <div class="heading">
            <svg height="50px" width="95%">
                <line x1="0%" y1="50%" x2="100%" y2="50%" style="stroke:black;stroke-width:1px"></line>
                Your browser doesn't support svg line
                <h1 class="header serif">Chúng tớ là</h1>
            </svg>
        </div>
        <!-- Section 1 body -->
        <div class="body">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus eros tempor massa blandit
                bibendum. Nulla tempor erat ut odio porttitor porttitor. Vestibulum ut dictum metus. Morbi non enim
                tristique, vestibulum lectus quis, interdum felis. Interdum et malesuada fames ac ante ipsum primis in
                faucibus. Nullam semper facilisis nisi in.</p>
            <div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <!--<h2 class="center-text">VIDEO GIá»I THIá»U</h2>
            <video src=""></video>-->
        </div>
    </section>

    <!-- Section 2 -->
    <section>
        <div class="heading">
            <svg height="50px" width="95%">
                <line x1="0%" y1="50%" x2="100%" y2="50%" style="stroke:black;stroke-width:1px"></line>
                Your browser doesn't support svg line
                <h1 class="header serif">Cộng đồng</h1>
            </svg>
        </div>
        <!-- Carousel -->
        <div class="body carousel">
            <!-- Carousel nav buttons -->
            <image onclick="changeSlide(0)" class="button" id="previous-button" src="./image/homepage1/Union-1.png">
            </image>
            <image onclick="changeSlide(1)" class="button" id="next-button" src="./image/Project (3)/Union.png"></image>
            <!-- Slide 1 -->
            <div class="center-text slide">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer cursus, ligula nec iaculis faucibus, enim turpis tristique libero, sed ornare mi nisl non libero. Sed placerat iaculis mauris in euismod. Curabitur placerat leo nibh, sed maximus neque auctor tincidunt. Aliquam dignissim, quam nec rhoncus rutrum, magna lorem vestibulum metus, ut commodo ex quam ac nulla. Maecenas ac rhoncus turpis, ut congue ipsum. Suspendisse neque lacus, dictum porttitor blandit vitae, ultrices non lacus. Etiam maximus magna non nibh cursus, ut eleifend tortor ultrices. Vestibulum vitae augue dapibus, pretium est at, accumsan libero. Quisque eget ullamcorper magna, eu tincidunt ante. Ut sagittis, nunc rutrum imperdiet finibus, elit mauris dignissim est, ac fringilla quam sem a libero. Morbi non lectus vitae odio egestas lobortis pellentesque id erat. Vivamus suscipit aliquet urna non interdum. Sed volutpat ut sapien sit amet bibendum. Sed eu maximus augue. Aenean sagittis metus a laoreet rutrum. Vestibulum consectetur nisi eget scelerisque iaculis.</p>
            </div>
            <!-- Slide 2-->
            <div class="slide" style="display:none;">
                <p class="center-text">
                    Maecenas gravida vehicula sollicitudin. Nulla pellentesque elit ac mauris rutrum posuere. Nunc mollis lacus in turpis rhoncus, vitae mattis orci imperdiet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam scelerisque vehicula justo, et porta turpis accumsan et. Etiam a mi et tellus hendrerit sodales vitae id eros. Sed porta purus et neque tristique interdum. Ut molestie dolor varius, fringilla nulla mollis, aliquam felis. Quisque quis laoreet nunc, congue porta ante. Integer id diam nec enim laoreet blandit. Aenean facilisis, turpis vel molestie porttitor, augue nibh ultricies odio, vel pretium mauris ante eget ante. Nulla ultricies enim in tortor semper, at ullamcorper nisi molestie. In blandit dolor non velit auctor commodo. Etiam quis orci id ante tincidunt maximus. Vivamus libero nibh, ornare in erat non, commodo bibendum turpis.
                </p>
                <div class="grid-container">
                    <image id="item-1" src="./image/Project (3)/Rectangle 16.png"></image>
                    <image id="item-2" src="./image/Project (3)/Rectangle 16.png"></image>
                    <image id="item-3" src="./image/Project (3)/Rectangle 16.png"></image>
                    <image id="item-4" src="./image/Project (3)/Rectangle 16.png"></image>
                </div>
            </div>
        </div>
    </section>
</body>
<jsp:include page="footer.jsp"/>

<script src="javascript/index.js"></script>

</html>
