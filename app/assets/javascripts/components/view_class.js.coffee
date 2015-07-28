@ViewClass = React.createClass
  getInitialState: ->
    student_courses: @props.data

  getDefaultProps: ->
    student_courses: []

  removeStudent: (student_course) ->
    index = @props.student_courses.indexOf student_course
    student_courses = React.addons.update(@props.student_courses, { $splice: [[index, 1]] })
    @replaceState student_courses: student_courses

  render: ->
    React.DOM.div
      className: 'courses'
      React.DOM.h2
        className: 'title'
        'View Class'
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Class ID'
            React.DOM.th null, 'Student ID'
            React.DOM.th null, 'Student Name'
            React.DOM.th null, 'Enrollment Date'
            React.DOM.th null, 'Actions'
            React.DOM.tbody null,
              for student_course in @props.student_courses
                React.createElement Class, student_course: student_course, handleRemove: @removeStudent
