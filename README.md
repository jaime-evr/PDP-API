## create a plan using curl

```curl -i POST -d 'plan[name]=Example Plan' http://localhost:3000/plans```

## update a plan using curl

```curl -i -X PATCH -d 'plan[name]=ProfesionalPlanUpdated'
http://localhost:3000/plans/4```

## delete a plan using curl

```curl -i -X DELETE http://localhost:3000/plans/4```
