@Class = React.createClass

  handleRemoveStudent: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/student_courses/#{ @props.student_course.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleRemove @props.student_course

  classRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.student_course.class_id
      React.DOM.td null, @props.student_course.student_id
      React.DOM.td null, @props.student_course.student_name
      React.DOM.td null, @props.student_course.created_at
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleRemoveStudent
          'Remove'


  render: ->
    @classRow()