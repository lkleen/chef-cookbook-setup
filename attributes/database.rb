# to add datebases here add json objects of the following type in an array
databases = [
    {
        :host => 'host1',
        :user => 'user1',
        :pass => 'user1',
        :name => 'database1',
    },
    {
        :host => 'host2',
        :user => 'user2',
        :pass => 'user2',
        :name => 'database2',
    }
]

default['setup']['databases'] = []


