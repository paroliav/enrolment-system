@Students = React.createClass
  getInitialState: ->
    edit: false
    students: @props.data
    classes: @props.data
    student_id: ''
    class_id: ''

  getDefaultProps: ->
    students: []
    classes: []
    student_id: ''
    class_id: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleAdd: (e) ->
    e.preventDefault()
    console.log('Add student')
    $.get '/students', {}, (data) =>
      @handleStudentsList(data)
    , 'JSON'
    $.get '/courses', {}, (data) =>
      @handleClassList(data)
    , 'JSON'

  handleStudentsList: (students) ->
    console.log('students', students)
    @setState students: students
#    @setState edit: true

  handleClassList: (classes) ->
    console.log('classes', classes)
    @setState classes: classes
    @setState edit: true

  enrollStudent: (e) ->
    e.preventDefault()
    $.post '/enrollStudent', { student_id: @state.student_id.split(' ')[0], class_id: @state.class_id, student_name: @state.student_id.split(' ')[1] }, (data) =>
      render: -> data
      @setState @getInitialState()
    , 'JSON'

  studentForm: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        onChange: @handleChange
        React.DOM.select
          name: 'student_id'
          className: 'form-control'
          React.DOM.option
            value: ''
            label: 'Select Student'
          for student in @state.students['Students']
            React.DOM.option
              value: student.id + ' ' +student.name
              label: student.id + ' ' +student.name
      React.DOM.div
        className: 'form-group'
        onChange: @handleChange
        React.DOM.select
          name: 'class_id'
          className: 'form-control'
          React.DOM.option
            value: ''
            label: 'Select Class'
          for course in @state.classes
            React.DOM.option
              value: course.class_id
              label: course.class_id + ' ' +course.class_name
        React.DOM.button
          type: 'button'
          className: 'btn btn-primary'
          onClick: @enrollStudent
          'Add Student'

  studentButton: ->
    React.DOM.button
      type: 'button'
      className: 'btn btn-primary'
      onClick: @handleAdd
      'Add Student'


  render: ->
    if @state.edit
      @studentForm()
    else
      @studentButton()
