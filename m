Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E97265B01
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 10:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgIKICO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 04:02:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgIKICG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 04:02:06 -0400
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7864208FE;
        Fri, 11 Sep 2020 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599811325;
        bh=liJmqmE5sfRfjoJRcU2wgDJUNyJI6EOposRIL6uuu4I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0sIYIF3bPzLkoVDh65SUp5mC+envroHxE33JIpx00CqHDW5YRVghPDt8uXYRGc+3q
         q1ZAIpykbzGnZxKiRCymBeQ88zFRVITF4bF39L2Nh+SA8oHWZdTrEYXDIRD8762tY3
         3XwcUbmqqVCjOsf8RgKcKagRZ5lRWerDUS5BuH6E=
Date:   Fri, 11 Sep 2020 10:02:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     r.verdejo@samsung.com, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
Message-ID: <20200911100200.25214c37@coco.lan>
In-Reply-To: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Em Fri, 21 Aug 2020 09:58:44 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series is work in progress. It represents the current work done on a
> virtual DVB driver for the Linux media subsystem. I am new to the media
> subsystem and to kernel development in general.
> 
> This driver aims to:
> 	- Serve as template for new DVB driver writers
> 	- Help userspace application writers in general
> 	- Push fake audio/video to userspace for testing
> 	purposes
> 	- Push debug information to userspace via debugfs
> 
> Current state for this driver:
> 	- Driver generates PSI information (PAT, PMT, SDT)
> 	- Driver generates PCR packets
> 	- Driver generates NULL packets for padding
> 	- PCM audio stream is decoded by ffmpeg, but no audio is heard yet.
> 
> changes in v10:
> 	s302m encoder got reworked

Thanks for all the hard work on it. Very much appreciated!

I finally found some time to test it. For now, just a quick
test from my side, without passing any arguments to the
driver.

See enclosed.

While there are still a few issues there, I'm considering applying
this series for Kernel 5.10.

My plan is to write some patches on the top of yours, in order to
address the problems I'll find on it. If not something more critical
won't be solved in time, we may still add it at staging/media. 
Let's see.

The problems I noticed so far are:

	1. rmmod doesn't work;
	2. dvbv5-stats doesn't seem to be working properly, as
	   it is reporting signal strengh with a percentage
	   (same for Carrier S/N ratio);
	3. dvbv5-zap wrote an empty audio file (without -P flag).
	   Probably there are still some issues at the program
	   channel descriptor or service;
	4. The provider service field is null. Perhaps we could
	   add some string there, like "linuxtv.org".
	5. Maybe we could also add a simple NIT table, just to
	   avoid dvbv5-scan to wait for it until timeout.

Also, it probably makes sense to add a debugfs interface in
order to allow injecting errors at the stream at runtime.

Regards,
Mauro

---

	$ dvbv5-scan -v foobar
	using demux 'dvb0.demux0'
	Device Dummy demod for DVB-T/T2/C/S/S2 (/dev/dvb/adapter0/frontend0) capabilities:
	     CAN_FEC_1_2
	     CAN_FEC_2_3
	     CAN_FEC_3_4
	     CAN_FEC_4_5
	     CAN_FEC_5_6
	     CAN_FEC_6_7
	     CAN_FEC_7_8
	     CAN_FEC_8_9
	     CAN_FEC_AUTO
	     CAN_GUARD_INTERVAL_AUTO
	     CAN_HIERARCHY_AUTO
	     CAN_INVERSION_AUTO
	     CAN_QAM_16
	     CAN_QAM_32
	     CAN_QAM_64
	     CAN_QAM_128
	     CAN_QAM_256
	     CAN_QAM_AUTO
	     CAN_QPSK
	     CAN_TRANSMISSION_MODE_AUTO
	DVB API Version 5.11, Current v5 delivery system: DVBC/ANNEX_A
	Supported delivery systems: 
	     DVBT
	     DVBT2
	    [DVBC/ANNEX_A]
	     DVBS
	     DVBS2
	Frequency range for the current standard: 
	From:            51.0 MHz
	To:              2.15 GHz
	Step:            62.5 kHz
	Tolerance:       29.5 MHz
	Symbol rate ranges for the current standard: 
	From:            1.00 MBauds
	To:              45.0 MBauds
	Failed to guess country from the current locale setting.
	
	ERROR    command BANDWIDTH_HZ (5) not found during retrieve
	Cannot calc frequency shift. Either bandwidth/symbol-rate is unavailable (yet).
	Scanning frequency #1 330000000
	FREQUENCY = 330000000
	MODULATION = QAM/AUTO
	INVERSION = AUTO
	SYMBOL_RATE = 6940000
	INNER_FEC = AUTO
	DELIVERY_SYSTEM = DVBC/ANNEX_A
	Got parameters for DVBC/ANNEX_A:
	FREQUENCY = 330000000
	MODULATION = QAM/AUTO
	INVERSION = AUTO
	SYMBOL_RATE = 6940000
	INNER_FEC = AUTO
	DELIVERY_SYSTEM = DVBC/ANNEX_A
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	dvb_read_sections: waiting for table ID 0x00, program ID 0x00
	dvb_parse_section: received table 0x00, extension ID 0x0744, section 0/0
	dvb_parse_section: table 0x00, extension ID 0x0744: done
	PAT
	| table_id         0x00
	| section_length      13
	| one                 2
	| zero                0
	| syntax              1
	| transport_stream_id 1860
	| current_next        1
	| version             1
	| one2                3
	| section_number      0
	| last_section_number 0
	|\ 1 program pid
	|  pid 0x0101: service 0x0880
	Program #0 ID 0x0101, service ID 0x0880
	dvb_read_sections: waiting for table ID 0x02, program ID 0x101
	dvb_parse_section: received table 0x02, extension ID 0x0880, section 0/0
	dvb_parse_section: table 0x02, extension ID 0x0880: done
	PMT
	| table_id         0x02
	| section_length      24
	| one                 2
	| zero                0
	| syntax              1
	| transport_stream_id 2176
	| current_next        1
	| version             1
	| one2                3
	| section_number      0
	| last_section_number 0
	|- pcr_pid          0200
	|  reserved2           7
	|  descriptor length   0
	|  zero3               0
	|  reserved3          15
	|\
	|- stream 0x0111: ISO/IEC 13818-1 Private Data (6)
	|    descriptor length   6
	|        0x05: registration_descriptor
	|           42 53 53 44                                        BSSD
	|_  1 streams
	dvb_read_sections: waiting for table ID 0x40, program ID 0x10
	ERROR    dvb_read_sections: no data read on section filter
	ERROR    error while reading the NIT table
	dvb_read_sections: waiting for table ID 0x42, program ID 0x11
	dvb_parse_section: received table 0x42, extension ID 0x0744, section 0/0
	dvb_parse_section: table 0x42, extension ID 0x0744: done
	SDT
	| table_id         0x42
	| section_length      48
	| one                 2
	| zero                1
	| syntax              1
	| transport_stream_id 1860
	| current_next        1
	| version             1
	| one2                3
	| section_number      0
	| last_section_number 0
	| network_id          1860
	| reserved            255
	|\
	|- service 0x0880
	|   EIT schedule          0
	|   EIT present following 0
	|   free CA mode          0
	|   running status        4
	|   descriptor length     31
	|        0x48: service_descriptor
	|           service type  1
	|           provider      '(null)'
	|           name          'S302m: Sine Wave PCM Audio'
	|_  1 services
	Service S302m: Sine Wave PCM Audio, provider (null): digital television
	Storing as channel S302m: Sine Wave PCM Audio
	
	$ dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -m
...
	 PID           FREQ         SPEED       TOTAL
	    0     25.07 p/s   36.826 Kbps       55 KB
	   17     25.07 p/s   36.826 Kbps       55 KB
	  257     25.07 p/s   36.826 Kbps       55 KB
	  273   1335.19 p/s    1.915 Mbps     2943 KB
	  512     25.07 p/s   36.826 Kbps       55 KB
	 8191  16775.59 p/s   24.062 Mbps    36974 KB
	TOT    18211.08 p/s   26.121 Mbps    40138 KB
	
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	
	
	$ dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -t 30 -o pcm_audio.ts
	using demux 'dvb0.demux0'
	reading channels from file 'dvb_channel.conf'
	service has pid type 06:  273
	tuning to 330000000 Hz
	       (0x00) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	Record to file 'pcm_audio.ts' started
	Forcing program stop due to timeout or terminate signal
	
	$ ls -l pcm_audio.ts
	-rw-r--r-- 1 mchehab mchehab 0 Sep 11 09:46 pcm_audio.ts

	$ dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -t 30 -o pcm_audio.ts -P
	using demux 'dvb0.demux0'
	reading channels from file 'dvb_channel.conf'
	service has pid type 06:  273
	tuning to 330000000 Hz
	pass all PID's to TS
	  dvb_set_pesfilter 8192
	dvb_dev_set_bufsize: buffer set to 6160384
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0
	Record to file 'pcm_audio.ts' started
	received 103809840 bytes (3379 Kbytes/sec)
	Lock   (0x1f) Signal= 0.00% C/N= 0.00% UCB= 0 postBER= 0

	$ ls -lh pcm_audio.ts
	-rw-r--r-- 1 mchehab mchehab 100M Sep 11 09:54 pcm_audio.ts


