<main style="
    width: 100%;
    padding-left: 0px;
    padding-top: 0px;
">
	<script type="es6">
    this.fetchData = () => {
			if(this.masterList==='group'){
				fetch(`/data/groups.json`)
					.then((resp) => resp.json()) // Transform the data into json
					.then((data) => {
						this.masterDataGroups = data
						this.groups = data
						this.masterList = 'group'
						this.update()
					})
			} else {
				fetch(`/data/users.json`)
					.then((resp) => resp.json()) // Transform the data into json
					.then((data) => {
						this.masterDataUsers = data
						this.users = data
						this.masterList = 'user'
						this.update()
					})
			}
    }

		// search users
		this.doFilter = (e) => {
			if (e.keyCode === 13) {
				const term = e.target.value
				if(term.length > 0){
					let found = false;
					if(this.masterList==='group'){
						this.groups = this.masterDataGroups.filter((item, index) => {
							return ((item.first.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.last.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.name.toUpperCase().indexOf(term.toUpperCase())!== -1))
						})
					} else if(this.masterList==='user'){
						this.users = this.masterDataUsers.filter((item, index) => {
							if(this.groupFilter){
								return  ((item.first.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.last.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.name.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.groups.indexOf(term)!== -1))
							} else {
								return ((item.first.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.last.toUpperCase().indexOf(term.toUpperCase())!== -1) || (item.name.toUpperCase().indexOf(term.toUpperCase())!== -1))
							}
						})
					} else {
						return ((item.name.toUpperCase().indexOf(term.toUpperCase())!== -1) )
					}
					this.update()
				} else {
					if (this.masterList==='user' && this.users.length !== this.masterDataUsers.length){
						this.users = this.masterDataUsers
						this.update()
					} else if (this.masterList==='group' && this.groups.length !== this.masterDataGroups.length){
						this.groups = this.masterDataGroups
						this.update()
					}
				}
			}
		}


    this.on('mount', () => {
			this.groupFilter=false
			this.masterList='user'
			if(location.search.indexOf("group=true")===1){
				/// listing is of groups
				this.masterList='group'
			} else {
				/// user listing, filtered by group also
				if(location.search.indexOf("group=filter")===1){
					this.groupFilter=true
				}
			}
      this.fetchData()
    })


  </script>
	<input id="search" placeholder="Search users ... " style="position: fixed;top: 24%;z-index: 11;background-color: lightgray;width: 82%;padding-left: 2%;left: 8%;" onkeyup="{doFilter}">
  <div class="main main-screen" id="main-section" data-topbar="scroll" style="margin-top: 10%;">
			<ul class="collection" if={masterList === 'user'}>
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
			<ul class="collection" if={masterList === 'group'}>
				<li each={item in groups}  class="collection-item avatar">
		      <img src="{item.image}" alt="" class="circle">
		      <section>{item.name}</section>
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
