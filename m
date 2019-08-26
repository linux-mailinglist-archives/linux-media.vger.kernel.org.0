Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8163D9D492
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 18:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbfHZQ7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 12:59:32 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:50747 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbfHZQ7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 12:59:32 -0400
Received: by mail-wm1-f53.google.com with SMTP id v15so236799wml.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=F0PY/txlcVARNn1dRAc+CaNsIuPCmDM/6ARzDAzU7LE=;
        b=gEmvJt4e4pgrw5ykxwEt9YSTd54LBn5dAxsssuOC1GTo8tNjJCFMJLigceQxmJCNv4
         9ngToPcdvrelOD4REXBCH7v0EjXc+tew08CWBUDjhYRUTtIaT6ibDtNGhCVpdoz1eVYb
         uOPC9WUuUU/MurLMf8idg+INBTmBVKObqV8+plGn0aG99dX9rG/kFfdYz5Aeljb7gw9e
         /ErxSmNhvR3vX5WlTYJPtqcRsRxVEQVDPZFOwv9XsIRWQm/87Vt1zhRKjSyQdojwNylv
         eX6nJ4dOMoupUVB9YgXBDn1IKZDaTDB17UzAiC7Q0yRjfmF/SSCc4iLmqCbfbh9k/gDz
         Eqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=F0PY/txlcVARNn1dRAc+CaNsIuPCmDM/6ARzDAzU7LE=;
        b=C5UUvRj0yo8YeSBmFuPMofGOOnCm7GDEZRBGr6gAAEwk+K0Qa+REiW6qY4J7gXRQC8
         SNPFqgaGHzXDjK3mHOUNAIQgX6ii3Ro4DH0PxUYp/3nmX/uYw3fW3GpxdQeeQvqTExgn
         heR/F9Mera7Jkjo5DbdUtZgRQmdL6gT8lG9ed1vIs5Dlr/qqy74fAXP0ERwYvi1smpmq
         6UK0GzfKD+R7FyV8bWrJ1VWXDoX+TGT1OwstN82CGa4Fr7ICX5q2ntKf3lxnDDihx8rB
         Ca6bSkkMqIiQ30cKuSEu78lGGTsUpWmKItGODT9fJEjFQkJEPBhsCpBOd7UnFo366JJ/
         jrJA==
X-Gm-Message-State: APjAAAWcniAw3U8tTFh97h4Cgj5CJgXnxH6SBodf6bpQRIBMy3tjEL7q
        HIIY85rMTNUTisYxxbcEXUeMpiGHCIdBdiXHDiHIvJmu
X-Google-Smtp-Source: APXvYqx5HSmsQgki/rGYFkZQ1R5tl8LxvWXtwZdEh6VfnvtYPovEdxwPNpZqhreSHIHx7aZ8/X0Xb0VjxF7pWyokX+w=
X-Received: by 2002:a1c:20c3:: with SMTP id g186mr22634728wmg.15.1566838769019;
 Mon, 26 Aug 2019 09:59:29 -0700 (PDT)
MIME-Version: 1.0
From:   Olcay Korkmaz <olcay.mz@gmail.com>
Date:   Mon, 26 Aug 2019 19:59:17 +0300
Message-ID: <CADBDwkcKFGLQ_uv4U-gCTXeR09n3uz7dJt3OkufuR_4QsMb0AQ@mail.gmail.com>
Subject: bug: dvbv5-scan segfaults
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
dvbv5-scan segfaults when scanning transponders at Turksat-42.0E
(three of transponders are causing the error)

LANG=en_US.UTF-8 gdb -ex=r --args dvbv5-scan -l UNIVERSAL -S0 -v -o
Turksat.conf ./Turksat-42.0E
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Using LNBf UNIVERSAL
 Universal, Europe
 Freqs : 10800 to 11800 MHz, LO: 9750 MHz
 Freqs : 11600 to 12700 MHz, LO: 10600 MHz
using demux 'dvb0.demux0'
Device Montage Technology DS3000/TS2020 (/dev/dvb/adapter0/frontend0)
capabilities:
     CAN_2G_MODULATION
     CAN_FEC_1_2
     CAN_FEC_2_3
     CAN_FEC_3_4
     CAN_FEC_4_5
     CAN_FEC_5_6
     CAN_FEC_6_7
     CAN_FEC_7_8
     CAN_FEC_AUTO
     CAN_INVERSION_AUTO
     CAN_QPSK
     CAN_RECOVER
DVB API Version 5.11, Current v5 delivery system: DVBS
Supported delivery systems:
    [DVBS]
     DVBS2
Failed to guess country from the current locale setting.

ERROR command BANDWIDTH_HZ (5) not found during retrieve
Cannot calc frequency shift. Either bandwidth/symbol-rate is unavailable (yet).
Scanning frequency #1 12346000
frequency: 12346,00 MHz, high_band: 1
SEC: set voltage to 18V
DiSEqC TONE: OFF
DiSEqC command: e0 10 38 f3
DiSEqC BURST: SEC_MINI_A
DiSEqC TONE: ON
L-Band frequency: 1746,00 MHz (offset = 10600,00 MHz)
FREQUENCY = 12346000
INVERSION = AUTO
SYMBOL_RATE = 9600000
INNER_FEC = 3/4
POLARIZATION = HORIZONTAL
DELIVERY_SYSTEM = DVBS
Got parameters for DVBS:
FREQUENCY = 12346000
INVERSION = AUTO
SYMBOL_RATE = 9600000
INNER_FEC = 3/4
POLARIZATION = HORIZONTAL
DELIVERY_SYSTEM = DVBS
Lock (0x1f) Signal= 37,86% C/N= 47,97% UCB= 31440 postBER= 0
dvb_read_sections: waiting for table ID 0x00, program ID 0x00
dvb_parse_section: received table 0x00, extension ID 0xa414, section 0/0
dvb_parse_section: table 0x00, extension ID 0xa414: done
PAT
| table_id 0x00
| section_length 25
| one 3
| zero 0
| syntax 1
| transport_stream_id 42004
| current_next 1
| version 14
| one2 3
| section_number 0
| last_section_number 0
|\ 4 program pids
| pid 0x0010: service 0x0000
| pid 0x0065: service 0x3264
| pid 0x012d: service 0x3265
| pid 0x0066: service 0x3269
Program #0 is network PID: 0x0010
Program #1 ID 0x0065, service ID 0x3264
dvb_read_sections: waiting for table ID 0x02, program ID 0x65
dvb_parse_section: received table 0x02, extension ID 0x3264, section 0/0
dvb_parse_section: table 0x02, extension ID 0x3264: done
PMT
| table_id 0x02
| section_length 112
| one 3
| zero 0
| syntax 1
| transport_stream_id 12900
| current_next 1
| version 7
| one2 3
| section_number 0
| last_section_number 0
|- pcr_pid 0b54
| reserved2 7
| descriptor length 11
| zero3 0
| reserved3 15
| 0x0c: multiplex_buffer_utilization_descriptor
| 80 b4 81 68 ...h
| 0x0e: maximum_bitrate_descriptor
| c0 3e a4 .>.
|\
|- stream 0x0b54: Video ISO/IEC 13818-2 (2)
| descriptor length 16
| 0x52: stream_identifier_descriptor
| 01 .
| 0x02: video_stream_descriptor
| 1a 48 5f .H_
| 0x06: ds_alignment_descriptor
| 02 .
| 0x0e: maximum_bitrate_descriptor
| c0 39 4e .9N
|- stream 0x0bb8: Audio ISO/IEC 13818-3 (4)
| descriptor length 17
| 0x52: stream_identifier_descriptor
| 02 .
| 0x0a: iso639_language_descriptor
| lang: tur (type: 0)
| 0x03: audio_stream_descriptor
| 67 g
| 0x0e: maximum_bitrate_descriptor
| c0 02 90 ...
|- stream 0x0c1c: Audio ISO/IEC 13818-3 (4)
| descriptor length 17
| 0x52: stream_identifier_descriptor
| 03 .
| 0x0a: iso639_language_descriptor
| lang: eng (type: 0)
| 0x03: audio_stream_descriptor
| 67 g
| 0x0e: maximum_bitrate_descriptor
| c0 01 49 ..I
|- stream 0x1779: ISO/IEC 13818-1 Private Sections (5)
| descriptor length 5
| 0x6f: application_signalling_descriptor
| 00 10 e0 ...
|- stream 0x1f48: ISO/IEC 13818-6 type C (c)
| descriptor length 8
| 0x52: stream_identifier_descriptor
| 2e .
| 0x0e: maximum_bitrate_descriptor
| c0 00 4b ..K
|_ 5 streams
Program #2 ID 0x012d, service ID 0x3265
dvb_read_sections: waiting for table ID 0x02, program ID 0x12d
dvb_parse_section: received table 0x02, extension ID 0x3265, section 0/0
dvb_parse_section: table 0x02, extension ID 0x3265: done
PMT
| table_id 0x02
| section_length 85
| one 3
| zero 0
| syntax 1
| transport_stream_id 12901
| current_next 1
| version 14
| one2 3
| section_number 0
| last_section_number 0
|- pcr_pid 0b55
| reserved2 7
| descriptor length 11
| zero3 0
| reserved3 15
| 0x0c: multiplex_buffer_utilization_descriptor
| 80 b4 81 68 ...h
| 0x0e: maximum_bitrate_descriptor
| c0 35 b9 .5.
|\
|- stream 0x0b55: Video ISO/IEC 13818-2 (2)
| descriptor length 16
| 0x52: stream_identifier_descriptor
| 01 .
| 0x02: video_stream_descriptor
| 1a 48 5f .H_
| 0x06: ds_alignment_descriptor
| 02 .
| 0x0e: maximum_bitrate_descriptor
| c0 32 52 .2R
|- stream 0x0bb9: Audio ISO/IEC 13818-3 (4)
| descriptor length 17
| 0x52: stream_identifier_descriptor
| 02 .
| 0x0a: iso639_language_descriptor
| lang: tur (type: 0)
| 0x03: audio_stream_descriptor
| 67 g
| 0x0e: maximum_bitrate_descriptor
| c0 02 03 ...
|- stream 0x1773: ISO/IEC 13818-1 Private Sections (5)
| descriptor length 13
| 0x0e: maximum_bitrate_descriptor
| c0 02 ee ...
| 0x6f: application_signalling_descriptor
| 00 10 e0 ...
| 0x52: stream_identifier_descriptor
| 04 .
|_ 3 streams
Program #3 ID 0x0066, service ID 0x3269
dvb_read_sections: waiting for table ID 0x02, program ID 0x66
dvb_parse_section: received table 0x02, extension ID 0x3269, section 0/0
dvb_parse_section: table 0x02, extension ID 0x3269: done
PMT
| table_id 0x02
| section_length 55
| one 3
| zero 0
| syntax 1
| transport_stream_id 12905
| current_next 1
| version 0
| one2 3
| section_number 0
| last_section_number 0
|- pcr_pid 0bbd
| reserved2 7
| descriptor length 23
| zero3 0
| reserved3 15
| 0x0e: maximum_bitrate_descriptor
| c0 01 41 ..A
| 0x09: conditional_access_descriptor
| ca_id 0x2600
| ca_pid 0x1fff
| privdata length 0
| 0x10: smoothing_buffer_descriptor
| c0 02 71 c0 04 00 ..q...
| 0x0b: system_clock_descriptor
| 42 3f B?
|\
|- stream 0x0bbd: Audio ISO/IEC 11172 (3)
| descriptor length 14
| 0x52: stream_identifier_descriptor
| 02 .
| 0x0e: maximum_bitrate_descriptor
| c0 01 40 ..@
| 0x0a: iso639_language_descriptor
| lang: und (type: 0)
|_ 1 streams
dvb_read_sections: waiting for table ID 0x40, program ID 0x10
ERROR dvb_read_sections: no data read on section filter
ERROR error while reading the NIT table
dvb_read_sections: waiting for table ID 0x42, program ID 0x11
dvb_parse_section: received table 0x42, extension ID 0xa414, section 0/0
dvb_parse_section: table 0x42, extension ID 0xa414: done
SDT
| table_id 0x42
| section_length 67
| one 3
| zero 1
| syntax 1
| transport_stream_id 42004
| current_next 1
| version 4
| one2 3
| section_number 0
| last_section_number 0
| network_id 1070
| reserved 255
|\
|- service 0x3264
| EIT schedule 0
| EIT present following 0
| free CA mode 0
| running status 4
| descriptor length 11
| 0x48: service_descriptor
| service type 1
| provider 'TV8'
| name 'TV8'
|- service 0x3265
| EIT schedule 0
| EIT present following 0
| free CA mode 0
| running status 4
| descriptor length 15
| 0x48: service_descriptor
| service type 1
| provider 'TV8 5'
| name 'TV8 5'
|- service 0x3269
| EIT schedule 0
| EIT present following 0
| free CA mode 1
| running status 4
| descriptor length 14
| 0x48: service_descriptor
| service type 2
| provider 'TV8'
| name 'TV8Ifb'
|_ 3 services
Service TV8, provider TV8: digital television
Storing as channel TV8

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7ba5cff in dvb_store_channel ()
   from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
(gdb) backtrace
#0 0x00007ffff7ba5cff in dvb_store_channel ()
   from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
#1 0x00005555555560c6 in run_scan (dvb=0x55555575d2e0, args=0x7fffffffdc80)
    at dvbv5-scan.c:313
#2 main (argc=<optimized out>, argv=<optimized out>) at dvbv5-scan.c:562

-- 
Olcay K.
