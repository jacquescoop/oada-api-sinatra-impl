require './lib/rest/features'
require './lib/rest/files'
require './lib/rest/metadata'
require './lib/rest/search'

use Files
use Metadata 
use Search 
run Features
