#!/usr/bin/env python

if __name__ == '__main__':
    import io
    import struct
    import sys

    if len(sys.argv) < 2:
        print('USAGE: zip2rmskin.py file.zip', file=sys.stderr)
        sys.exit(1)

    with open(sys.argv[1], 'ab') as f:
        f.seek(0, io.SEEK_END)
        size = f.tell()
        footer = struct.pack('Qb7s', size, 0, b'RMSKIN\0')
        f.write(footer)
