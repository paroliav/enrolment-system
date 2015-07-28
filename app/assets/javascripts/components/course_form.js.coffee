@CourseForm = React.createClass
  getInitialState: ->
    class_id: ''
    class_name: ''
    starting_date: ''
    max_no_of_students: ''

  valid: ->
    @state.class_id && @state.class_name && @state.starting_date && @state.max_no_of_students

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { course: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Class ID'
          name: 'class_id'
          value: @state.class_id
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Class Name'
          name: 'class_name'
          value: @state.class_name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'Starting Date'
          name: 'starting_date'
          value: @state.starting_date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Maximum number of enrollments'
          name: 'max_no_of_students'
          value: @state.max_no_of_students
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Add Class'
