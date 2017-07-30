import route from 'riot-route'
<app>

	<script>
		this.on('mount',()=>{
			route((screen, action, other)=>{
				if (!screen) {
					screen = 'groups'
				}

				this.topbar_title = screen
				this.update()

				// riot.mount(this.refs.mount_point, screen)

				App.view.topbarScrollHide()
			})
		})
	</script>

		<div id="app">
		  <nav class="top-nav">
		    <div class="container">
		      <div class="nav-wrapper"><a class="page-title">User Management</a></div>
		    </div>
		  </nav>
	  	<div class="container">
				<a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only">
					<i class="material-icons">menu</i>
				</a>
				<ul id="nav-mobile" class="side-nav fixed" style="transform: translateX(-100%);">
			    <li class="no-padding">
			      <ul class="collapsible collapsible-accordion">
			        <li class="bold"><a class="collapsible-header waves-effect waves-teal">CSS</a>
			          <div class="collapsible-body">
			            <ul>
			              <li><a href="color.html">Color</a></li>
			              <li><a href="grid.html">Grid</a></li>
			              <li><a href="helpers.html">Helpers</a></li>
			              <li><a href="media-css.html">Media</a></li>
			              <li><a href="pulse.html">Pulse</a></li>
			              <li><a href="sass.html">Sass</a></li>
			              <li><a href="shadow.html">Shadow</a></li>
			              <li><a href="table.html">Table</a></li>
			              <li><a href="css-transitions.html">Transitions</a></li>
			              <li><a href="typography.html">Typography</a></li>
			            </ul>
			          </div>
			        </li>
			        <li class="bold active"><a class="collapsible-header active waves-effect waves-teal">Components</a>
			          <div class="collapsible-body" style="display: block;">
			            <ul>
			              <li><a href="badges.html">Badges</a></li>
			              <li class="active"><a href="buttons.html">Buttons</a></li>
			              <li><a href="breadcrumbs.html">Breadcrumbs</a></li>
			              <li><a href="cards.html">Cards</a></li>
			              <li><a href="chips.html">Chips</a></li>
			              <li><a href="collections.html">Collections</a></li>
			              <li><a href="footer.html">Footer</a></li>
			              <li><a href="forms.html">Forms</a></li>
			              <li><a href="icons.html">Icons</a></li>
			              <li><a href="navbar.html">Navbar</a></li>
			              <li><a href="pagination.html">Pagination</a></li>
			              <li><a href="preloader.html">Preloader</a></li>
			            </ul>
			          </div>
			        </li>
			      </ul>
			    </li>
			    <li class="bold"><a href="mobile.html" class="waves-effect waves-teal">Mobile</a></li>
			    <li class="bold"><a href="showcase.html" class="waves-effect waves-teal">Showcase</a></li>
			    <li class="bold"><a href="themes.html" class="waves-effect waves-teal">Themes<span class="new badge"></span></a></li>
			  </ul>
				<topbar title="{topbar_title}"></topbar>
				<main>
					<div ref="mount_point"></div>
				</main>
			</div>
</app>
