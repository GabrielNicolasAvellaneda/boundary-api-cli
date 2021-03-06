#
# Copyright 2014-2015 Boundary, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
from boundary import ApiCli
import json


class SourceDelete(ApiCli):
    def __init__(self):
        ApiCli.__init__(self)
        self.method = "DELETE"
        self.path = "v1/sources/byName"
        self.sources = None

    def addArguments(self):
        ApiCli.addArguments(self)
        self.parser.add_argument('-s', '--sources', dest='sources', metavar='source1[,source2]',
                                 action='store', required=True, help='List of sources to delete')

    def getArguments(self):
        """
        Extracts the specific arguments of this CLI
        """
        ApiCli.getArguments(self)

        # Get the list of sources separated by commas
        if self.args.sources is not None:
            self.sources = self.args.sources

        payload = {"names": []}
        if self.sources is not None:
            source_list = str.split(self.sources, ',')
            for s in source_list:
                payload['names'].append(s)

        self.data = json.dumps(payload, sort_keys=True)
        self.headers = {'Content-Type': 'application/json', "Accept": "application/json"}

    def getDescription(self):
        return "Delete sources from a Boundary account"
