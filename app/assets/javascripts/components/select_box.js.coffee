@SelectBox = React.createClass
  render: ->
    React.DOM.select
      name: 'students'
      student in students