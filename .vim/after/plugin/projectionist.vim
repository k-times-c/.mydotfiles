let g:projectionist_heuristics = {
      \    '*': {
      \     '*.c': {
      \       'alternate': '{}.h',
      \       'type': 'source'
      \     },
      \     '*.h': {
      \       'alternate': '{}.c',
      \       'type': 'header'
      \     },
      \
      \     '*.js': {
      \       'alternate': [
      \         '{dirname}/{basename}.test.js',
      \         '{dirname}/__tests__/{basename}-test.js',
      \         '{dirname}/__tests__/{basename}-mocha.js'
      \       ],
      \       'type': 'source'
      \     },
      \     '*.test.js': {
      \       'alternate': '{basename}.js',
      \       'type': 'test',
      \     },
      \     '**/__tests__/*-mocha.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     },
      \     '**/__tests__/*-test.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     },
      \     'test_*.py': {
      \        'alternate': [
      \		'{basename}.py',
      \		'tests/{basename}.py',
      \		'{dirname}/tests/{basename}.py'
      \		],
      \       'type': 'test'
      \	    },
      \     '*_test.py': {
      \        'alternate': [
      \		'{basename}.py',
      \		'{dirname}/{basename}.py',
      \		'{}.py'
      \		],
      \       'type': 'test'
      \	    },
      \     '*.py': {
      \       'alternate': [
      \         '{dirname}/test_{basename}.py',
      \         '{dirname}/{basename}_test.py',
      \         '{dirname}/tests/test_{basename}.py',
      \         '{dirname}/tests/{basename}_test.py'
      \       ],
      \       'type': 'source'
      \     }
      \   }
      \ }
