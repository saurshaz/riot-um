import route from 'riot-route'
<app>

	<script>
		this.on('mount',()=>{
			App.view.topbarScrollHide()
		})
	</script>

		<div id="app">
		  <nav class="top-nav">
			<div class="nav-wrapper" style="z-index: 21;background-color: #ff5c69;position: fixed;height: 20%;width: 100%;">
				<a href="#" data-activates="nav-mobile" style="z-index:20;position: fixed;" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only">
					<i class="material-icons">menu</i></a>
					<section class="heading">User Management</section>
				</div>
		  </nav>
	  	<div class="container" style="margin-top:24%">

				<ul id="nav-mobile" class="side-nav" style="transform: translateX(-100%);">
			    <li class="bold"><a href="javascript:location.href='main?group=true'" class="waves-effect waves-teal">Groups<span class="new badge"></span></a></li>
			    <li class="bold"><a href="javascript:location.href='main'" class="waves-effect waves-teal">Users<span class="new badge"></span></a></li>
			    <li class="bold"><a href="javascript:location.href='user?group=filter'" class="waves-effect waves-teal">Users Search (Group based)<span class="new badge"></span></a></li>
			  </ul>
				<topbar title="{topbar_title}"></topbar>
				<main>
					<div ref="mount_point" ></div>
				</main>
			</div>
</app>
