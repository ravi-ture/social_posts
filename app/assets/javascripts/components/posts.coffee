@Posts = React.createClass
  getInitialState: ->
    posts: @props.posts
  componentWillMount: ->
    _this = @
    $('form#search_fields input, form#search_fields select').change ->
      $.ajax
        url: '/posts'
        dataType: 'json'
        data: $('#search_fields').serialize()
        success: (data) ->
          _this.setState { posts: data.posts }, ->
            console.log(_this.state.posts, 'checking state')
  render: ->
    React.DOM.table
      id: 'posts_table'
      className: 'table table-striped'
      React.DOM.thead
        id: 'headers'
        React.DOM.tr
          id: 'header_row'
          React.DOM.th
            id: 'index'
            '#'
          React.DOM.th
            id: 'content'
            'Content'
          React.DOM.th
            id: 'posted_at'
            'Posted At'
          React.DOM.th
            id: 'site'
            'Social Site'
          React.DOM.th
            id: 'Social Name'
            'Social Name'
          React.DOM.th
            id: 'link'
            'Link'
      React.DOM.tbody
        id: 'posts_result'
        if @state.posts.length > 0
          @state.posts.map (post, i) ->
            React.DOM.tr
              id: "post_#{post.id}"
              React.createElement(TableCell, {key: 'count', value: (i + 1)})
              React.createElement(TableCell, {key: 'content', value: post.content})
              React.createElement(TableCell, {key: 'posting_time', value: post.posting_time})
              React.createElement(TableCell, {key: 'site', value: post.site})
              React.createElement(TableCell, {key: 'username', value: post.username})
              React.createElement(LinkedCell, {value: post.link})
              
        else
          React.DOM.tr
            id: 'no_posts'
            React.DOM.td
              colspan: 5
              'No Posts Found!'

@TableCell = React.createClass
  render: ->
    React.DOM.td
      id: @props.key
      @props.value

@LinkedCell = React.createClass
  render: ->
     React.DOM.td
      id: "link"
      React.DOM.a
        href: @props.value
        'target': '_blank'
        'Open'
