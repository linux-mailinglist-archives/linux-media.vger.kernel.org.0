Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE90124D596
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgHUM7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgHUM7U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:59:20 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195EAC061387;
        Fri, 21 Aug 2020 05:59:20 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 2so1223969qkf.10;
        Fri, 21 Aug 2020 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ekCKllPOZ8Wr18F4aZIRtwIo8BDZiwXNgOPMTdFB30=;
        b=X6jhyM3o6Gh7eLI4enAeof7JbtyCMdSJ+Xghy+voGJYXiRriYo/QzDUVyd6zhg8hsQ
         HcdpFWrsWXF47sBtSY3wXvJiBmo1TngHgVlJ4jmihua4yMRrJRMNXGq+4bY66WF10OG6
         h6jaI7aQ8veiTdJPKq9+moQfgwc9Jf9+LhB6IPYfyhU94Li51XDwBHQKPxzaU5CmnfPn
         2nu5lpUbb0LUJ3eD56fR1Vwnnz0ahPl1VijHY5KKk1O2GsC/n6Ghui4NY3rESanD3weu
         Hf3ENovl3gkm4BNiUYw/+aFo+RAny0CSIVQhtrwR+yZiy1r2E6bnVOv2vvwtY3tThSwJ
         FTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ekCKllPOZ8Wr18F4aZIRtwIo8BDZiwXNgOPMTdFB30=;
        b=hfJ3P7T3+6SY6+kf9zJcfEPkwMrV4gNaLPWTx2773wdyGHFfebEqoykNtOp2ls4E6m
         GFDQpAY+xv9otyCgKnn1gzz/jbuq3XjsX6T8wiGf0pmEtwWzpe1fyNbvt9Lq2n1N01o3
         Us1QVldbaYbPfxzZ4nuUBTq5la7QC//npAV+sF60qsMNKI9i3KdOvs41DXcmdp76M4OQ
         9DFI5TIIOvLp7mtNfqvgMr1QB0wyYFWc18JRZPvkz2YM15lMWJHKenGq/6KudLvkcJvV
         TOKk9HM4L7r1SghlJ14ajg+11FwoZxZxZIhMWQSnyvDhQ9z14XoqvAkwe2S+WfuC3SGZ
         DV7w==
X-Gm-Message-State: AOAM533xyRDnQIIoxB6erdBtocYEAQulBq3rDZeH3EDYFKPOHkYTQCwj
        AYcjSxnJ3AibD/N83Tkv9cI=
X-Google-Smtp-Source: ABdhPJxPjHdfbBlE0TxZ0BGq4c4Cz7b9lrqTgdgMCzjuaW2E+x0UE5R/F9jAzQdJeR3Ud7/qTxZdYg==
X-Received: by 2002:a05:620a:2041:: with SMTP id d1mr953137qka.401.1598014758934;
        Fri, 21 Aug 2020 05:59:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id w18sm2042525qtk.1.2020.08.21.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:59:18 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [v10 4/4] media: Documentation: vidtv: Add ReST documentation for vidtv
Date:   Fri, 21 Aug 2020 09:58:48 -0300
Message-Id: <20200821125848.1092958-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add documentation for the Virtual Digital TV driver (vidtv) in the
Restructured Text (ReST) format.

This discusses:
- What is vidtv
- Why vidtv is needed
- How to build and run vidtv
- How vidtv is structured
- How to test vidtv
- How to improve vidtv

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../driver-api/media/drivers/index.rst        |   1 +
 .../driver-api/media/drivers/vidtv.rst        | 417 ++++++++++++++++++
 2 files changed, 418 insertions(+)
 create mode 100644 Documentation/driver-api/media/drivers/vidtv.rst

diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index 0df85fc96605..5f340cfdb4cc 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -35,4 +35,5 @@ Digital TV drivers

 	dvb-usb
 	frontends
+	vidtv
 	contributors
diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
new file mode 100644
index 000000000000..303227a67f60
--- /dev/null
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -0,0 +1,417 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================
+vidtv: Virtual Digital TV driver
+================================
+
+Author: Daniel W. S. Almeida <dwlsalmeida@gmail.com>, June 2020.
+
+Background
+----------
+
+Vidtv is a virtual DVB driver that aims to serve as a reference for driver
+writers by serving as a template. It also validates the existing media DVB
+APIs, thus helping userspace application writers.
+
+Currently, it consists of:
+
+- A fake tuner driver, which will report a bad signal quality if the chosen
+  frequency is too far away from a table of valid frequencies for a
+  particular delivery system.
+
+- A fake demod driver, which will constantly poll the fake signal quality
+  returned by the tuner, simulating a device that can lose/reacquire a lock
+  on the signal depending on the CNR levels.
+
+- A fake bridge driver, which is the module responsible for modprobing the
+  fake tuner and demod modules and implementing the demux logic. This module
+  takes parameters at initialization that will dictate how the simulation
+  behaves.
+
+- Code reponsible for encoding a valid MPEG Transport Stream, which is then
+  passed to the bridge driver. This fake stream contains some hardcoded content.
+  For now, we have a single, audio-only channel containing a single MPEG
+  Elementary Stream, which in turn contains a SMPTE 302m encoded sine-wave.
+  Note that this particular encoder was chosen because it is the easiest
+  way to encode PCM audio data in a MPEG Transport Stream.
+
+Building vidtv
+--------------
+vidtv is a test driver and thus is **not** enabled by default when
+compiling the kernel.
+
+In order to enable compilation of vidtv:
+
+- Enable **DVB_TEST_DRIVERS**, then
+- Enable **DVB_VIDTV**
+
+When compiled as a module, expect the following .ko files:
+
+- dvb_vidtv_tuner.ko
+
+- dvb_vidtv_demod.ko
+
+- dvb_vidtv_bridge.ko
+
+Running vidtv
+-------------
+When compiled as a module, run::
+
+	modprobe dvb_vidtv_bridge
+
+That's it! The bridge driver will initialize the tuner and demod drivers as
+part of its own initialization.
+
+You can optionally define some command-line arguments to vidtv.
+
+Command-line arguments to vidtv
+-------------------------------
+Below is a list of all arguments that can be supplied to vidtv:
+
+drop_tslock_prob_on_low_snr
+	Probability of losing the TS lock if the signal quality is bad.
+	This probability be used by the fake demodulator driver to
+	eventually return a status of 0 when the signal quality is not
+	good.
+
+recover_tslock_prob_on_good_snr:
+	Probability recovering the TS lock when the signal improves. This
+	probability be used by the fake demodulator driver to eventually
+	return a status of 0x1f when/if the signal quality improves.
+
+mock_power_up_delay_msec
+	Simulate a power up delay.  Default: 0.
+
+mock_tune_delay_msec
+	Simulate a tune delay.  Default 0.
+
+vidtv_valid_dvb_t_freqs
+	Valid DVB-T frequencies to simulate.
+
+vidtv_valid_dvb_c_freqs
+ 	Valid DVB-C frequencies to simulate.
+
+vidtv_valid_dvb_s_freqs
+	Valid DVB-C frequencies to simulate.
+
+max_frequency_shift_hz,
+	Maximum shift in HZ allowed when tuning in a channel.
+
+si_period_msec
+	How often to send SI packets.  Default: 40ms.
+
+pcr_period_msec
+	How often to send PCR packets.  Default: 40ms.
+
+mux_rate_kbytes_sec
+	Attempt to maintain this bit rate by inserting TS null packets, if
+	necessary.  Default: 4096.
+
+pcr_pid,
+	PCR PID for all channels.  Default: 0x200.
+
+mux_buf_sz_pkts,
+	Size for the mux buffer in multiples of 188 bytes.
+
+vidtv internal structure
+------------------------
+The kernel modules are split in the following way:
+
+vidtv_tuner.[ch]
+	Implements a fake tuner DVB driver.
+
+vidtv_demod.[ch]
+	Implements a fake demodulator DVB driver.
+
+vidtv_bridge.[ch]
+	Implements a bridge driver.
+
+The MPEG related code is split in the following way:
+
+vidtv_ts.[ch]
+	Code to work with MPEG TS packets, such as TS headers, adaptation
+	fields, PCR packets and NULL packets.
+
+vidtv_psi.[ch]
+	This is the PSI generator.  PSI packets contain general information
+	about a MPEG Transport Stream.  A PSI generator is needed so
+	userspace apps can retrieve information about the Transport Stream
+	and eventually tune into a (dummy) channel.
+
+	Because the generator is implemented in a separate file, it can be
+	reused elsewhere in the media subsystem.
+
+	Currently vidtv supports working with 3 PSI tables: PAT, PMT and
+	SDT.
+
+	The specification for PAT and PMT can be found in *ISO 13818-1:
+	Systems*, while the specification for the SDT can be found in *ETSI
+	EN 300 468: Specification for Service Information (SI) in DVB
+	systems*.
+
+	It isn't strictly necessary, but using a real TS file helps when
+	debugging PSI tables. Vidtv currently tries to replicate the PSI
+	structure found in this file: `TS1Globo.ts
+	<https://tsduck.io/streams/brazil-isdb-tb/TS1globo.ts>`_.
+
+	A good way to visualize the structure of streams is by using
+	`DVBInspector <https://sourceforge.net/projects/dvbinspector/>`_.
+
+vidtv_pes.[ch]
+	Implements the PES logic to convert encoder data into MPEG TS
+	packets. These can then be fed into a TS multiplexer and eventually
+	into userspace.
+
+vidtv_encoder.h
+	An interface for vidtv encoders. New encoders can be added to this
+	driver by implementing the calls in this file.
+
+vidtv_s302m.[ch]
+	Implements a S302M encoder to make it possible to insert PCM audio
+	data in the generated MPEG Transport Stream. The relevant
+	specification is available online as *SMPTE 302M-2007: Television -
+	Mapping of AES3 Data into MPEG-2 Transport Stream*.
+
+
+	The resulting MPEG Elementary Stream is conveyed in a private
+	stream with a S302M registration descriptor attached.
+
+	This shall enable passing an audio signal into userspace so it can
+	be decoded and played by media software. The corresponding decoder
+	in ffmpeg is located in 'libavcodec/s302m.c' and is experimental.
+
+vidtv_channel.[ch]
+	Implements a 'channel' abstraction.
+
+	When vidtv boots, it will create some hardcoded channels:
+
+	#. Their services will be concatenated to populate the SDT.
+
+	#. Their programs will be concatenated to populate the PAT
+
+	#. For each program in the PAT, a PMT section will be created
+
+	#. The PMT section for a channel will be assigned its streams.
+
+	#. Every stream will have its corresponding encoder polled in a
+	   loop to produce TS packets.
+	   These packets may be interleaved by the muxer and then delivered
+	   to the bridge.
+
+vidtv_mux.[ch]
+	Implements a MPEG TS mux, loosely based on the ffmpeg
+	implementation in "libavcodec/mpegtsenc.c"
+
+	The muxer runs a loop which is responsible for:
+
+	#. Keeping track of the amount of time elapsed since the last
+	   iteration.
+
+	#. Polling encoders in order to fetch 'elapsed_time' worth of data.
+
+	#. Inserting PSI and/or PCR packets, if needed.
+
+	#. Padding the resulting stream with NULL packets if
+	   necessary in order to maintain the chosen bit rate.
+
+	#. Delivering the resulting TS packets to the bridge
+	   driver so it can pass them to the demux.
+
+Testing vidtv with v4l-utils
+----------------------------
+
+Using the tools in v4l-utils is a great way to test and inspect the output of
+vidtv. It is hosted here: `v4l-utils Documentation
+<https://linuxtv.org/wiki/index.php/V4l-utils>`_.
+
+From its webpage::
+
+	The v4l-utils are a series of packages for handling media devices.
+
+	It is hosted at http://git.linuxtv.org/v4l-utils.git, and packaged
+	on most distributions.
+
+	It provides a series of libraries and utilities to be used to
+	control several aspect of the media boards.
+
+
+Start by installing v4l-utils and then modprobing vidtv::
+
+	modprobe dvb_vidtv_bridge
+
+If the driver is OK, it should load and its probing code will run. This will
+pull in the tuner and demod drivers.
+
+Using dvb-fe-tool
+~~~~~~~~~~~~~~~~~
+
+The first step to check whether the demod loaded successfully is to run::
+
+	$ dvb-fe-tool
+
+This should return what is currently set up at the demod struct, i.e.::
+
+	static const struct dvb_frontend_ops vidtv_demod_ops = {
+		.delsys = {
+			SYS_DVBT,
+			SYS_DVBT2,
+			SYS_DVBC_ANNEX_A,
+			SYS_DVBS,
+			SYS_DVBS2,
+		},
+
+		.info = {
+			.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
+			.frequency_min_hz       = 51 * MHz,
+			.frequency_max_hz       = 2150 * MHz,
+			.frequency_stepsize_hz  = 62500,
+			.frequency_tolerance_hz = 29500 * kHz,
+			.symbol_rate_min        = 1000000,
+			.symbol_rate_max        = 45000000,
+
+			.caps = FE_CAN_FEC_1_2 |
+				FE_CAN_FEC_2_3 |
+				FE_CAN_FEC_3_4 |
+				FE_CAN_FEC_4_5 |
+				FE_CAN_FEC_5_6 |
+				FE_CAN_FEC_6_7 |
+				FE_CAN_FEC_7_8 |
+				FE_CAN_FEC_8_9 |
+				FE_CAN_QAM_16 |
+				FE_CAN_QAM_64 |
+				FE_CAN_QAM_32 |
+				FE_CAN_QAM_128 |
+				FE_CAN_QAM_256 |
+				FE_CAN_QAM_AUTO |
+				FE_CAN_QPSK |
+				FE_CAN_FEC_AUTO |
+				FE_CAN_INVERSION_AUTO |
+				FE_CAN_TRANSMISSION_MODE_AUTO |
+				FE_CAN_GUARD_INTERVAL_AUTO |
+				FE_CAN_HIERARCHY_AUTO,
+		}
+
+		....
+
+For more information on dvb-fe-tools check its online documentation here:
+`dvb-fe-tool Documentation
+<https://www.linuxtv.org/wiki/index.php/Dvb-fe-tool>`_.
+
+Using dvb-scan
+~~~~~~~~~~~~~~
+
+In order to tune into a channel and read the PSI tables, we can use dvb-scan.
+
+For this, one should provide a configuration file known as a 'scan file',
+here's an example::
+
+	[Channel]
+	FREQUENCY = 330000000
+	MODULATION = QAM/AUTO
+	SYMBOL_RATE = 6940000
+	INNER_FEC = AUTO
+	DELIVERY_SYSTEM = DVBC/ANNEX_A
+
+.. note::
+	The parameters depend on the video standard you're testing.
+
+.. note::
+	Vidtv is a fake driver and does not validate much of the information
+	in the scan file. Just specifying 'FREQUENCY' and 'DELIVERY_SYSTEM'
+	should be enough for DVB-T/DVB-T2. For DVB-S/DVB-C however, you
+	should also provide 'SYMBOL_RATE'.
+
+You can browse scan tables online here: `dvb-scan-tables
+<https://git.linuxtv.org/dtv-scan-tables.git>`_.
+
+Assuming this channel is named 'channel.conf', you can then run::
+
+        $ dvbv5-scan channel.conf
+
+For more information on dvb-scan, check its documentation online here:
+`dvb-scan Documentation <https://www.linuxtv.org/wiki/index.php/Dvbscan>`_.
+
+Using dvb-zap
+~~~~~~~~~~~~~
+
+dvbv5-zap is a command line tool that can be used to record MPEG-TS to disk. The
+typical use is to tune into a channel and put it into record mode. The example
+below - which is taken from the documentation - illustrates that::
+
+        $ dvbv5-zap -c dvb_channel.conf "trilhas sonoras" -r
+        using demux '/dev/dvb/adapter0/demux0'
+        reading channels from file 'dvb_channel.conf'
+        service has pid type 05:  204
+        tuning to 573000000 Hz
+        audio pid 104
+          dvb_set_pesfilter 104
+        Lock   (0x1f) Quality= Good Signal= 100.00% C/N= -13.80dB UCB= 70 postBER= 3.14x10^-3 PER= 0
+        DVR interface '/dev/dvb/adapter0/dvr0' can now be opened
+
+The channel can be watched by playing the contents of the DVR interface, with
+some player that recognizes the MPEG-TS format, such as *mplayer* or *vlc*.
+
+By playing the contents of the stream one can visually inspect the workings of
+vidtv, e.g.::
+
+	$ mplayer /dev/dvb/adapter0/dvr0
+
+For more information on dvb-zap check its online documentation here:
+`dvb-zap Documentation
+<https://www.linuxtv.org/wiki/index.php/Dvbv5-zap>`_.
+See also: `zap <https://www.linuxtv.org/wiki/index.php/Zap>`_.
+
+
+What can still be improved in vidtv
+-----------------------------------
+
+Add *debugfs* integration
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Although frontend drivers provide DVBv5 statistics via the .read_status
+call, a nice addition would be to make additional statistics available to
+userspace via debugfs, which is a simple-to-use, RAM-based filesystem
+specifically designed for debug purposes.
+
+The logic for this would be implemented on a separate file so as not to
+pollute the frontend driver.  These statistics are driver-specific and can
+be useful during tests.
+
+The Siano driver is one example of a driver using
+debugfs to convey driver-specific statistics to userspace and it can be
+used as a reference.
+
+This should be further enabled and disabled via a Kconfig
+option for convenience.
+
+Add a way to test video
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Currently, vidtv can only encode PCM audio. It would be great to implement
+a barebones version of MPEG-2 video encoding so we can also test video. The
+first place to look into is *ISO 13818-2: Information technology — Generic
+coding of moving pictures and associated audio information — Part 2: Video*,
+which covers the encoding of compressed video in MPEG Transport Streams.
+
+This might optionally use the Video4Linux2 Test Pattern Generator, v4l2-tpg,
+which resides at::
+
+	drivers/media/common/v4l2-tpg/
+
+
+Add white noise simulation
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The vidtv tuner already has code to identify whether the chosen frequency
+is too far away from a table of valid frequencies. For now, this means that
+the demodulator can eventually lose the lock on the signal, since the tuner will
+report a bad signal quality.
+
+A nice addition is to simulate some noise when the signal quality is bad by:
+
+- Randomly dropping some TS packets. This will trigger a continuity error if the
+  continuity counter is updated but the packet is not passed on to the demux.
+
+- Updating the error statistics accordingly (e.g. BER, etc).
+
+- Simulating some noise in the encoded data.
--
2.28.0

