<main>
	<script type="es6">
    this.fetchData = () => {
      fetch(`/data/users.json`)
        .then((resp) => resp.json()) // Transform the data into json
        .then((data) => {
						this.masterDataUsers = data
						this.users = data
						this.update()
        })
    }
    this.on('mount', () => {
			this.groupFilter=false
			if(location.search.indexOf("group=")===1){
				/// filtered by group also
				this.groupFilter=true
			}
      this.fetchData()
    })

		// search users
		this.doFilter = (e) => {
			if (e.keyCode === 13) {
				const term = e.target.value
				if(term.length > 0){
					let found = false;
					this.users = this.users.filter((item, index) => {
						if(this.groupFilter){
							return  ((item.first.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.last.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.name.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.groups.indexOf(term)!== -1))
						} else {
							((item.first.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.last.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.name.toUpperCase().indexOf(term.toUpperCase())!== -1))
						}
					})
					this.update()
				} else if (this.users.length !== this.masterDataUsers.length){
					this.users = this.masterDataUsers
					this.update()
				}
			}
		}

  </script>

  <div class="main main-screen" id="main-section" data-topbar="scroll">
		<div class="search-wrapper card">
			<input id="search" placeholder="Search users ... " style="position: fixed;top: 20px;z-index: 11;background-color: lightgray;width: 82%;padding-left: 2%;left: 8%;" onkeyup={doFilter}></div>
    <ul class="collection">
			<li each={item in users}  class="collection-item avatar">
	      <img src="{item.image}" alt="" class="circle">
	      <section>{item.first} {item.last}</section>
				<br>
				<section class="secondary">
					<div class="chip" each={group_id in item.groups}>
				    {group_id}
				    <i class="close material-icons">close</i>
				  </div>
				</section>
	    </li>
    </ul>
  </div>
</main>
