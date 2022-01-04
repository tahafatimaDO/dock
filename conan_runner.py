#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys
from conans.client.command import main
from conans.errors import ConanInvalidConfiguration


if __name__ == '__main__':
    try:
        rc = main(sys.argv[1:])
    except SystemExit as err:
        if err.code == 6:
            print('caught ConanInvalidConfiguration')
            sys.exit(0)
        else:
            sys.exit(err.code)
    else:
        sys.exit(rc)
