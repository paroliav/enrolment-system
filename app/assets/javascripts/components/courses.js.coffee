@Courses = React.createClass
  getInitialState: ->
    courses: @props.data

  getDefaultProps: ->
    courses: []
    student_courses: []

  addCourse: (course) ->
    courses = React.addons.update(@state.courses, { $push: [course] })
    @setState courses: courses

  deleteCourse: (course) ->
    index = @state.courses.indexOf course
    courses = React.addons.update(@state.courses, { $splice: [[index, 1]] })
    @replaceState courses: courses

  viewCourse: (student_courses) ->
    console.log('view', student_courses)
#    students = React.addons.update(@state.student_courses, student_courses)
#    console.log('students', students)
    @setState student_courses: student_courses

  render: ->
    React.DOM.div
      className: 'courses'
      React.DOM.h2
        className: 'title'
        'Classes'
      React.DOM.div
      React.createElement CourseForm, handleNewRecord: @addCourse
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Class ID'
            React.DOM.th null, 'Class Name'
            React.DOM.th null, 'Starting Date'
            React.DOM.th null, '# of Students'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for course in @state.courses
            React.createElement Course, course: course, handleDeleteCourse: @deleteCourse, handleViewCourse: @viewCourse
      React.DOM.div
      React.createElement Students
      React.DOM.div
      React.createElement ViewClass, student_courses: @state.student_courses
