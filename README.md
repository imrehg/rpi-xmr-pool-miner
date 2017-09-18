# RPi-XMR-Pool-Miner

Raspberry Pi monero miner for the Raspberry Pi 3 (other versions are not supported),
using [cpuminer-multi](https://github.com/lucasjones/cpuminer-multi), deployed through
[resin.io](https://resin.io).

Set up as required for eg. the [supportXMR](https://supportxmr.com/#/help/getting_started)
pool and these are environment variables to set for the dashboard:

* `EMAIL`: your email address. The pool password format is "MinerIdentifier:Email", and this is the email part
* `MONERO_ADDRESS`: the "username" to the bool, and the address to be paid out to
* `POOL_URL`: the mining pool's address (something like `pool.something.somewhere:2222`

The RPi3 has ~7.5 Hash/s second for reference, with this mining code.

## License

Copyright 2017 Gergely Imreh <imrehg@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
