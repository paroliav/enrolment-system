@Course = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/courses/#{ @props.course.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteCourse @props.course

  handleView: (e) ->
    e.preventDefault()
    $.get "/classStudents/#{ @props.course.id }", {}, (data) =>
      @props.handleViewCourse data
    , 'JSON'


  courseRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.course.class_id
      React.DOM.td null, @props.course.class_name
      React.DOM.td null, @props.course.starting_date
      React.DOM.td null, @props.course.max_no_of_students
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleView
          'View'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'


  render: ->
    @courseRow()