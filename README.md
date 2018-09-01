# The problem
---

In the context of workout plan generation you are asked to create a solution that creates the most intense workout by picking entries from a catalog. Each exercise entry (potentially fetched from our API) contains an `average_span` attribute which is the total time taken on average (in minutes) and `average_calorie_consumption` which roughly represents the expected energy spent in calories (numbers may not be accurate). The goal is to maximize the effectiveness of the workout during a given time by picking the most optimal combination of exercises, each exercise being picked only once. 💪

# Explanation

The problem was solved using a DP algorithm based on Knapsack [0 - 1]. Where the weight is the time of the routine. The target is to maximize the burned calories.

## Example

``` ruby
func(
  time: 30,
  exercises: [
    {id: '404c1873-96e5-4767-899a-c28697b4ccd4', name:'Squats', average_span: 20, average_calorie_consumption: 120 },
    {id: '075fe124-5b39-4276-b0ac-de4fd5b38f6f', name: 'Arm curls', average_span: 10, average_calorie_consumption: 25},
    {id: '2085747a-eee5-445a-85fc-92da51709a41', name: 'Plank', average_span: 2, average_calorie_consumption: 10},
    {id: '81fd3a46-e736-4498-9094-f5d7730d1409', name: 'Jumping jacks', average_span: 10, average_calorie_consumption: 35}
  ]
)
```

## Example output:

``` ruby
[
  155,
  [
    {
      :id=>"81fd3a46-e736-4498-9094-f5d7730d1409",
      :name=>"Jumping jacks",
      :average_span=>10,
      :average_calorie_consumption=>35
    },
    { :id=>"404c1873-96e5-4767-899a-c28697b4ccd4",
      :name=>"Squats",
      :average_span=>20,
      :average_calorie_consumption=>120
    }
  ]
]
```

# How to run

```shell
bundle install
bundle exec rspec
```
### From the terminal
```
  $ irb -I lib
  $ require "services/plan_generator"
  $ require "pp"
  $ pp PlanGenerator.new(time: 30,
  exercises: [
    {id: '404c1873-96e5-4767-899a-c28697b4ccd4', name:'Squats', average_span: 20, average_calorie_consumption: 120 },
    {id: '075fe124-5b39-4276-b0ac-de4fd5b38f6f', name: 'Arm curls', average_span: 10, average_calorie_consumption: 25},
    {id: '2085747a-eee5-445a-85fc-92da51709a41', name: 'Plank', average_span: 2, average_calorie_consumption: 10},
    {id: '81fd3a46-e736-4498-9094-f5d7730d1409', name: 'Jumping jacks', average_span: 10, average_calorie_consumption: 35}
  ]).generate
```
