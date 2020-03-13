db.EmpCol.insert({
	name: {
		fname:'Swapnil',
		lname:'Markhedkar'
	},
	company:'Microsoft',
	designation:'SWE',
	salary:200000,
	age:35,
	expertise:['docker', 'PUBG', 'clash royale'],
	dob: new Date('1999-01-01'),
	email:'ak@gmail.com',
	contact: '90299999',
	address:{
		laddr:'LA',
		paddr:'NYC'
	}
})

// Queries --
db.EmpCol.find(
	{	
		$and:
		[
			{'salary':{$lt:50000}},
			{'designation' : 'Head Clerk'}
		]
	}

).pretty()

db.EmpCol.update(
	{
		'designation':'Tester',
		'company' : 'TCS',
		'age':25
	},
	{
		$set:{
			'designation':'Tester',
			'company' : 'TCS',
			'age':25		
		}
	},
	{
		upsert:true
	}
)

db.EmpCol.update(
	{
		'salary' : {$lt: 50000}
	},
	{
		$mul:{'salary':2}
	},
	{
		multi:true
	}
)

// 5th -
db.EmpCol.find(
	{
		'company':{$ne:'Confluent'}
	}
).pretty()

//prac
db.EmpCol.aggregate([
	{$group:{
		_id:'$company',
		maxsal : {
			$max:'$salary'
		}
	}}
])

//6th-
db.EmpCol.aggregate([
	{$match:{
		dob:ISODate('1999-01-01')
	}},
	{$group:{
		_id:'$company',
		totalSalary : {
			$sum:'$salary'
		}
	}}
])

// 7th -
db.EmpCol.aggregate([
	{$match:{
		name.fname:'Swapnil'
	}},
	{$group:{
		_id:'$expertise',
		totalSalary : {
			$sum:1
		}
	}}
])

// 6 ka 6th -
db.EmpCol.aggregate([
	{$group : {
		_id : "$designation" ,
		totalSalary : {
			$sum : "$salary"
		}
	}}, 
	{$match : {
		ts : {
			$gt : 200000
		}
	}}
])

// 7th 7-
db.EmpCol.aggregate([
	{$project:{
		_id: "name.fname",
		nameUpper : {
			$toUpper: '$name.fname'
		} 
	}},
	{$sort: {
		_id : 1
	}}
])

//7th que 6th subque-
db.EmpCol.aggregate([
	{$group : {
		_id:'$company',
		maxSal : {
			$max:"$salary"
		}
	}},
	{$group : {
		_id:'$company',
		minSal : {
			$min:"$salary"
		}
	}}
])

db.EmpCol.createIndex({designation:1})