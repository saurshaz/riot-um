import * as riot from 'riot'
import groups from './users.tag'

let tag

describe('users', () => {
	beforeAll( () => {
		// create mounting point
		const elem = document.createElement('users')

		// elem.setAttribute('name', 'world')
		document.body.appendChild(elem)
		tag = riot.mount(elem, 'users')[0]
	})

	it('should mount the tag', () => {
		expect( document.querySelector('users #search').length )
	})
	it('should the tag has function fetchData', () => {
		console.log( tag.fetchData )
	})
})
