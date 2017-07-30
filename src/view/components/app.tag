import route from 'riot-route'
<app>

	<script>
		this.on('mount',()=>{
			route((screen, action, other)=>{
				if (!screen) {
					screen = 'main'
				}

				this.topbar_title = screen
				this.update()

				riot.mount(this.refs.mount_point, screen)

				App.view.topbarScrollHide()
			})
		})
	</script>

		<div id="app">
		  <nav class="top-nav">
			<div class="nav-wrapper" style="
			    z-index: 16;background-color: gray;position: fixed;height: 20%;width: 100%;
			"><a class="page-title">User Management</a></div>
		  </nav>
	  	<div class="container" style="margin-top:24%">
				<a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only">
						<i class="material-icons">menu</i>
				</a>
				<ul id="nav-mobile" class="side-nav" style="transform: translateX(-100%);">
			    <li class="bold"><a href="main?group=true" class="waves-effect waves-teal">Groups<span class="new badge"></span></a></li>
			    <li class="bold"><a href="main" class="waves-effect waves-teal">Users<span class="new badge"></span></a></li>
			    <li class="bold"><a href="main" class="waves-effect waves-teal">Advanced Search<span class="new badge"></span></a></li>
			  </ul>
				<topbar title="{topbar_title}"></topbar>
				<main>
					<div ref="mount_point" ></div>
				</main>
			</div>
</app>
