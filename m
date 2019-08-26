Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42319D51E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 19:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731947AbfHZRkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 13:40:19 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49672 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731256AbfHZRkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 13:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2yalNG19h5+ZJ0+K+fKV92AZ6uS0DLld/DMCD8gWUH0=; b=SdLe3onzSQ8JqdfsdPziXvjnp
        xLxp5o5kiNHSFaTbfKNGwdnaVc/oo7PcB9mrtu14xuvpN+TxuIjTHr/ZT2Iyrh3esmvICGE48NC0B
        w+GiiKyWbTYdIrdCFa9XrRdcYTO86v1XsoLLWCQRNL+bkwyW/I98PSNAuxJ7UT0HoNcY0lD7moZAH
        WY7ouyhjgg2AFoPo0CTcy2/ehiLLobLXLG8qdnRN9aCq1NKmHhqZeGruzoWkxWTEeHTpSrU+1kRs6
        c7615QVvLQH9+mB7FLI+8VnwKQO1DI+HA5WcXbGRGZGSfeMcP4JXSkkeCs7FiyIdV45N/ITJV6yko
        LCGLjS9Vw==;
Received: from 177.17.135.157.dynamic.adsl.gvt.net.br ([177.17.135.157] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2IyX-00066m-R2; Mon, 26 Aug 2019 17:40:18 +0000
Date:   Mon, 26 Aug 2019 14:40:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Olcay Korkmaz <olcay.mz@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: bug: dvbv5-scan segfaults
Message-ID: <20190826144014.02e0a85b@coco.lan>
In-Reply-To: <CADBDwkcKFGLQ_uv4U-gCTXeR09n3uz7dJt3OkufuR_4QsMb0AQ@mail.gmail.com>
References: <CADBDwkcKFGLQ_uv4U-gCTXeR09n3uz7dJt3OkufuR_4QsMb0AQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Olcay,

Em Mon, 26 Aug 2019 19:59:17 +0300
Olcay Korkmaz <olcay.mz@gmail.com> escreveu:

> Hello,
> dvbv5-scan segfaults when scanning transponders at Turksat-42.0E
> (three of transponders are causing the error)

Are you using the latest version of dvbv5-scan from the git tree?

> 
> LANG=en_US.UTF-8 gdb -ex=r --args dvbv5-scan -l UNIVERSAL -S0 -v -o
> Turksat.conf ./Turksat-42.0E
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> Using LNBf UNIVERSAL
>  Universal, Europe
>  Freqs : 10800 to 11800 MHz, LO: 9750 MHz
>  Freqs : 11600 to 12700 MHz, LO: 10600 MHz
> using demux 'dvb0.demux0'
> Device Montage Technology DS3000/TS2020 (/dev/dvb/adapter0/frontend0)
> capabilities:
>      CAN_2G_MODULATION
>      CAN_FEC_1_2
>      CAN_FEC_2_3
>      CAN_FEC_3_4
>      CAN_FEC_4_5
>      CAN_FEC_5_6
>      CAN_FEC_6_7
>      CAN_FEC_7_8
>      CAN_FEC_AUTO
>      CAN_INVERSION_AUTO
>      CAN_QPSK
>      CAN_RECOVER
> DVB API Version 5.11, Current v5 delivery system: DVBS
> Supported delivery systems:
>     [DVBS]
>      DVBS2
> Failed to guess country from the current locale setting.
> 
> ERROR command BANDWIDTH_HZ (5) not found during retrieve
> Cannot calc frequency shift. Either bandwidth/symbol-rate is unavailable (yet).
> Scanning frequency #1 12346000
> frequency: 12346,00 MHz, high_band: 1
> SEC: set voltage to 18V
> DiSEqC TONE: OFF
> DiSEqC command: e0 10 38 f3
> DiSEqC BURST: SEC_MINI_A
> DiSEqC TONE: ON
> L-Band frequency: 1746,00 MHz (offset = 10600,00 MHz)
> FREQUENCY = 12346000
> INVERSION = AUTO
> SYMBOL_RATE = 9600000
> INNER_FEC = 3/4
> POLARIZATION = HORIZONTAL
> DELIVERY_SYSTEM = DVBS
> Got parameters for DVBS:
> FREQUENCY = 12346000
> INVERSION = AUTO
> SYMBOL_RATE = 9600000
> INNER_FEC = 3/4
> POLARIZATION = HORIZONTAL
> DELIVERY_SYSTEM = DVBS
> Lock (0x1f) Signal= 37,86% C/N= 47,97% UCB= 31440 postBER= 0
> dvb_read_sections: waiting for table ID 0x00, program ID 0x00
> dvb_parse_section: received table 0x00, extension ID 0xa414, section 0/0
> dvb_parse_section: table 0x00, extension ID 0xa414: done
> PAT
> | table_id 0x00
> | section_length 25
> | one 3
> | zero 0
> | syntax 1
> | transport_stream_id 42004
> | current_next 1
> | version 14
> | one2 3
> | section_number 0
> | last_section_number 0
> |\ 4 program pids
> | pid 0x0010: service 0x0000
> | pid 0x0065: service 0x3264
> | pid 0x012d: service 0x3265
> | pid 0x0066: service 0x3269
> Program #0 is network PID: 0x0010
> Program #1 ID 0x0065, service ID 0x3264
> dvb_read_sections: waiting for table ID 0x02, program ID 0x65
> dvb_parse_section: received table 0x02, extension ID 0x3264, section 0/0
> dvb_parse_section: table 0x02, extension ID 0x3264: done
> PMT
> | table_id 0x02
> | section_length 112
> | one 3
> | zero 0
> | syntax 1
> | transport_stream_id 12900
> | current_next 1
> | version 7
> | one2 3
> | section_number 0
> | last_section_number 0
> |- pcr_pid 0b54
> | reserved2 7
> | descriptor length 11
> | zero3 0
> | reserved3 15
> | 0x0c: multiplex_buffer_utilization_descriptor
> | 80 b4 81 68 ...h
> | 0x0e: maximum_bitrate_descriptor
> | c0 3e a4 .>.
> |\
> |- stream 0x0b54: Video ISO/IEC 13818-2 (2)
> | descriptor length 16
> | 0x52: stream_identifier_descriptor
> | 01 .
> | 0x02: video_stream_descriptor
> | 1a 48 5f .H_
> | 0x06: ds_alignment_descriptor
> | 02 .
> | 0x0e: maximum_bitrate_descriptor
> | c0 39 4e .9N
> |- stream 0x0bb8: Audio ISO/IEC 13818-3 (4)
> | descriptor length 17
> | 0x52: stream_identifier_descriptor
> | 02 .
> | 0x0a: iso639_language_descriptor
> | lang: tur (type: 0)
> | 0x03: audio_stream_descriptor
> | 67 g
> | 0x0e: maximum_bitrate_descriptor
> | c0 02 90 ...
> |- stream 0x0c1c: Audio ISO/IEC 13818-3 (4)
> | descriptor length 17
> | 0x52: stream_identifier_descriptor
> | 03 .
> | 0x0a: iso639_language_descriptor
> | lang: eng (type: 0)
> | 0x03: audio_stream_descriptor
> | 67 g
> | 0x0e: maximum_bitrate_descriptor
> | c0 01 49 ..I
> |- stream 0x1779: ISO/IEC 13818-1 Private Sections (5)
> | descriptor length 5
> | 0x6f: application_signalling_descriptor
> | 00 10 e0 ...
> |- stream 0x1f48: ISO/IEC 13818-6 type C (c)
> | descriptor length 8
> | 0x52: stream_identifier_descriptor
> | 2e .
> | 0x0e: maximum_bitrate_descriptor
> | c0 00 4b ..K
> |_ 5 streams
> Program #2 ID 0x012d, service ID 0x3265
> dvb_read_sections: waiting for table ID 0x02, program ID 0x12d
> dvb_parse_section: received table 0x02, extension ID 0x3265, section 0/0
> dvb_parse_section: table 0x02, extension ID 0x3265: done
> PMT
> | table_id 0x02
> | section_length 85
> | one 3
> | zero 0
> | syntax 1
> | transport_stream_id 12901
> | current_next 1
> | version 14
> | one2 3
> | section_number 0
> | last_section_number 0
> |- pcr_pid 0b55
> | reserved2 7
> | descriptor length 11
> | zero3 0
> | reserved3 15
> | 0x0c: multiplex_buffer_utilization_descriptor
> | 80 b4 81 68 ...h
> | 0x0e: maximum_bitrate_descriptor
> | c0 35 b9 .5.
> |\
> |- stream 0x0b55: Video ISO/IEC 13818-2 (2)
> | descriptor length 16
> | 0x52: stream_identifier_descriptor
> | 01 .
> | 0x02: video_stream_descriptor
> | 1a 48 5f .H_
> | 0x06: ds_alignment_descriptor
> | 02 .
> | 0x0e: maximum_bitrate_descriptor
> | c0 32 52 .2R
> |- stream 0x0bb9: Audio ISO/IEC 13818-3 (4)
> | descriptor length 17
> | 0x52: stream_identifier_descriptor
> | 02 .
> | 0x0a: iso639_language_descriptor
> | lang: tur (type: 0)
> | 0x03: audio_stream_descriptor
> | 67 g
> | 0x0e: maximum_bitrate_descriptor
> | c0 02 03 ...
> |- stream 0x1773: ISO/IEC 13818-1 Private Sections (5)
> | descriptor length 13
> | 0x0e: maximum_bitrate_descriptor
> | c0 02 ee ...
> | 0x6f: application_signalling_descriptor
> | 00 10 e0 ...
> | 0x52: stream_identifier_descriptor
> | 04 .
> |_ 3 streams
> Program #3 ID 0x0066, service ID 0x3269
> dvb_read_sections: waiting for table ID 0x02, program ID 0x66
> dvb_parse_section: received table 0x02, extension ID 0x3269, section 0/0
> dvb_parse_section: table 0x02, extension ID 0x3269: done
> PMT
> | table_id 0x02
> | section_length 55
> | one 3
> | zero 0
> | syntax 1
> | transport_stream_id 12905
> | current_next 1
> | version 0
> | one2 3
> | section_number 0
> | last_section_number 0
> |- pcr_pid 0bbd
> | reserved2 7
> | descriptor length 23
> | zero3 0
> | reserved3 15
> | 0x0e: maximum_bitrate_descriptor
> | c0 01 41 ..A
> | 0x09: conditional_access_descriptor
> | ca_id 0x2600
> | ca_pid 0x1fff
> | privdata length 0
> | 0x10: smoothing_buffer_descriptor
> | c0 02 71 c0 04 00 ..q...
> | 0x0b: system_clock_descriptor
> | 42 3f B?
> |\
> |- stream 0x0bbd: Audio ISO/IEC 11172 (3)
> | descriptor length 14
> | 0x52: stream_identifier_descriptor
> | 02 .
> | 0x0e: maximum_bitrate_descriptor
> | c0 01 40 ..@
> | 0x0a: iso639_language_descriptor
> | lang: und (type: 0)
> |_ 1 streams
> dvb_read_sections: waiting for table ID 0x40, program ID 0x10
> ERROR dvb_read_sections: no data read on section filter
> ERROR error while reading the NIT table
> dvb_read_sections: waiting for table ID 0x42, program ID 0x11
> dvb_parse_section: received table 0x42, extension ID 0xa414, section 0/0
> dvb_parse_section: table 0x42, extension ID 0xa414: done
> SDT
> | table_id 0x42
> | section_length 67
> | one 3
> | zero 1
> | syntax 1
> | transport_stream_id 42004
> | current_next 1
> | version 4
> | one2 3
> | section_number 0
> | last_section_number 0
> | network_id 1070
> | reserved 255
> |\
> |- service 0x3264
> | EIT schedule 0
> | EIT present following 0
> | free CA mode 0
> | running status 4
> | descriptor length 11
> | 0x48: service_descriptor
> | service type 1
> | provider 'TV8'
> | name 'TV8'
> |- service 0x3265
> | EIT schedule 0
> | EIT present following 0
> | free CA mode 0
> | running status 4
> | descriptor length 15
> | 0x48: service_descriptor
> | service type 1
> | provider 'TV8 5'
> | name 'TV8 5'
> |- service 0x3269
> | EIT schedule 0
> | EIT present following 0
> | free CA mode 1
> | running status 4
> | descriptor length 14
> | 0x48: service_descriptor
> | service type 2
> | provider 'TV8'
> | name 'TV8Ifb'
> |_ 3 services
> Service TV8, provider TV8: digital television
> Storing as channel TV8
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00007ffff7ba5cff in dvb_store_channel ()
>    from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
> (gdb) backtrace


> #0 0x00007ffff7ba5cff in dvb_store_channel ()
>    from /usr/lib/x86_64-linux-gnu/libdvbv5.so.0
> #1 0x00005555555560c6 in run_scan (dvb=0x55555575d2e0, args=0x7fffffffdc80)
>     at dvbv5-scan.c:313
> #2 main (argc=<optimized out>, argv=<optimized out>) at dvbv5-scan.c:562
> 

Just this isn't enough to identify where the error happened. This is
just a call to the libdvbv5, where the dvb_store_channel() function is
implemented.

We can't even reproduce it here, as we would need to have the same
TV signal you're using.

I could try to simulate it here, but I would need you to zap into the
transponder and record ~60 seconds (using dvbv5-zap -P), for me to be
able to use my RF generator and try to simulate the error.

The file will be big, so you'll need to temporarely store it at Google
Drive or some other similar service and pass me a link for downloading
it.

Thanks,
Mauro
