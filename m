Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D67A24D58C
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgHUM7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHUM7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:59:05 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20660C061385;
        Fri, 21 Aug 2020 05:59:05 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 6so1106296qtt.0;
        Fri, 21 Aug 2020 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGr5BW2OtCxnTMgNxsDdxAKLsPg4NV1zhaApf883PVo=;
        b=DjEgza0W34IrnLZaFr/54JADtenGApLM0ZG8V/3Ahf1KufLDG4ojvyghFP8BW9CHN8
         xMN05WPuIKL8zYUZGN9BF7f8epqTBbywzDNuq/2Yv0pWo25LuR56qUmrLkKr7DX29P2c
         MMsWfJe0L36RlHbJ1/x1f60FgDrgLjs+frLtB4TqqiX+FcBT5lBuh60NAUPENvNriSHj
         pdt7VbHHHvg7mOkwWwoOgwI4yzyVZCw/o03zXPEgZnS/9Hsqea5bzLd577Qcu46rh2Du
         pwy2fie0U7ufZnahwMtlb5pGT90uyVcU5vvTvym7s60djpyEr05S5PY4u8ZDUtYXXQms
         BMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGr5BW2OtCxnTMgNxsDdxAKLsPg4NV1zhaApf883PVo=;
        b=kJ0DXs35e/SHoEIDQONDGyQfuNve3hfEqGPNUqx2QKwV5kBsdoZelVpjV78sr7Lh19
         ZHXjel4+eoyn5RrClc1QtvUgiplFMu71D25MQjMIFNHuhcS/RYM1sJkrkXGZ26Kgxq3H
         +yDI45sS2P40eXM+RCwk6nMu9BnQ+1q56/eLFQf/39ELVB/6sOh9JuX6QtHTrRl89KKJ
         qtNgHJ8ZxkmTeREh9W7LQnOphE8rGxJn9Tw+eF9pNlvCtZhizynLk4hIYhdv0iO/71d4
         vHDIkgRilwhuKn+zBBtoJgKugl4Wm68efw+EvMRS86crBEs2qsrkFcOcfJK3sLI5DC9z
         yhrA==
X-Gm-Message-State: AOAM5315aUu87ueL7akkMPT/yd+c2JYn4WkC30TSFGTS6B1widiqZzQx
        R6Uv6wh04klDVc6T5pDvCc0=
X-Google-Smtp-Source: ABdhPJyWcEaO/94v89vjAMzTC8Ljo3i5+HqDR4HPAAbVl2dNS5n4tvtfcoifodBcNdvyuy5jeeIqEg==
X-Received: by 2002:ac8:73c3:: with SMTP id v3mr2583216qtp.266.1598014744080;
        Fri, 21 Aug 2020 05:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id w18sm2042525qtk.1.2020.08.21.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:59:03 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [v10 0/4] media: vidtv: Implement a virtual DVB driver
Date:   Fri, 21 Aug 2020 09:58:44 -0300
Message-Id: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem. I am new to the media
subsystem and to kernel development in general.

This driver aims to:
	- Serve as template for new DVB driver writers
	- Help userspace application writers in general
	- Push fake audio/video to userspace for testing
	purposes
	- Push debug information to userspace via debugfs

Current state for this driver:
	- Driver generates PSI information (PAT, PMT, SDT)
	- Driver generates PCR packets
	- Driver generates NULL packets for padding
	- PCM audio stream is decoded by ffmpeg, but no audio is heard yet.


changes in v10:
	s302m encoder got reworked

The Virtual Digital TV Driver (vidtv)

Background
----------

Vidtv is a virtual DVB driver that aims to serve as a reference for driver
writers by serving as a template. It also validates the existing media DVB
APIs, thus helping userspace application writers.

Currently, it consists of:

- A fake tuner driver, which will report a bad signal quality if the chosen
  frequency is too far away from a table of valid frequencies for a
  particular delivery system.

- A fake demod driver, which will constantly poll the fake signal quality
  returned by the tuner, simulating a device that can lose/reacquire a lock
  on the signal depending on the CNR levels.

- A fake bridge driver, which is the module responsible for modprobing the
  fake tuner and demod modules and implementing the demux logic. This module
  takes parameters at initialization that will dictate how the simulation
  behaves.

- Code reponsible for encoding a valid MPEG Transport Stream, which is then
  passed to the bridge driver. This fake stream contains some hardcoded content.
  For now, we have a single, audio-only channel containing a single MPEG
  Elementary Stream, which in turn contains a SMPTE 302m encoded sine-wave.
  Note that this particular encoder was chosen because it is the easiest
  way to encode PCM audio data in a MPEG Transport Stream.

Building vidtv
--------------
vidtv is a test driver and thus is **not** enabled by default when
compiling the kernel.

In order to enable compilation of vidtv:

- Enable **DVB_TEST_DRIVERS**, then
- Enable **DVB_VIDTV**

When compiled as a module, expect the following .ko files:

- dvb_vidtv_tuner.ko

- dvb_vidtv_demod.ko

- dvb_vidtv_bridge.ko

Running vidtv
-------------
When compiled as a module, run::

	modprobe dvb_vidtv_bridge

That's it! The bridge driver will initialize the tuner and demod drivers as
part of its own initialization.

You can optionally define some command-line arguments to vidtv, see the
documentation for more info.

Testing vidtv with v4l-utils
============================

Start by installing v4l-utils and then modprobing vidtv::

	modprobe dvb_vidtv_bridge

If the driver is OK, it should load and its probing code will run. This will
pull in the tuner and demod drivers.

Using dvb-fe-tool
-----------------

The first step to check whether the demod loaded successfully is to run::

	$ dvb-fe-tool

This should return what is currently set up at the demod struct, i.e.::

	static const struct dvb_frontend_ops vidtv_demod_ops = {
		.delsys = {
			SYS_DVBT,
			SYS_DVBT2,
			SYS_DVBC_ANNEX_A,
			SYS_DVBS,
			SYS_DVBS2,
		},

		.info = {
			.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
			.frequency_min_hz       = 51 * MHz,
			.frequency_max_hz       = 2150 * MHz,
			.frequency_stepsize_hz  = 62500,
			.frequency_tolerance_hz = 29500 * kHz,
			.symbol_rate_min        = 1000000,
			.symbol_rate_max        = 45000000,

			.caps = FE_CAN_FEC_1_2 |
				FE_CAN_FEC_2_3 |
				FE_CAN_FEC_3_4 |
				FE_CAN_FEC_4_5 |
				FE_CAN_FEC_5_6 |
				FE_CAN_FEC_6_7 |
				FE_CAN_FEC_7_8 |
				FE_CAN_FEC_8_9 |
				FE_CAN_QAM_16 |
				FE_CAN_QAM_64 |
				FE_CAN_QAM_32 |
				FE_CAN_QAM_128 |
				FE_CAN_QAM_256 |
				FE_CAN_QAM_AUTO |
				FE_CAN_QPSK |
				FE_CAN_FEC_AUTO |
				FE_CAN_INVERSION_AUTO |
				FE_CAN_TRANSMISSION_MODE_AUTO |
				FE_CAN_GUARD_INTERVAL_AUTO |
				FE_CAN_HIERARCHY_AUTO,
		}

		....

Using dvb-scan
--------------

In order to tune into a channel and read the PSI tables, we can use dvb-scan.

For this, one should provide a configuration file known as a 'scan file',
here's an example::

	[Channel]
	FREQUENCY = 330000000
	MODULATION = QAM/AUTO
	SYMBOL_RATE = 6940000
	INNER_FEC = AUTO
	DELIVERY_SYSTEM = DVBC/ANNEX_A

	NOTE:
	The parameters depend on the video standard you're testing.

	NOTE:
	Vidtv is a fake driver and does not validate much of the information
	in the scan file. Just specifying 'FREQUENCY' and 'DELIVERY_SYSTEM'
	should be enough for DVB-T/DVB-T2. For DVB-S/DVB-C however, you
	should also provide 'SYMBOL_RATE'.

Assuming this channel is named 'channel.conf', you can then run::

        $ dvbv5-scan dresden_dvbc_channel.conf

Using dvb-zap
-------------

dvbv5-zap is a command line tool that can be used to record MPEG-TS to disk. The
typical use is to tune into a channel and put it into record mode. The example
below - which is taken from the documentation - illustrates that::

        $ dvbv5-zap -c dvb_channel.conf "trilhas sonoras" -r
        using demux '/dev/dvb/adapter0/demux0'
        reading channels from file 'dvb_channel.conf'
        service has pid type 05:  204
        tuning to 573000000 Hz
        audio pid 104
          dvb_set_pesfilter 104
        Lock   (0x1f) Quality= Good Signal= 100.00% C/N= -13.80dB UCB= 70 postBER= 3.14x10^-3 PER= 0
        DVR interface '/dev/dvb/adapter0/dvr0' can now be opened

The channel can be watched by playing the contents of the DVR interface, with
some player that recognizes the MPEG-TS format, such as *mplayer* or *vlc*.

By playing the contents of the stream one can visually inspect the workings of
vidtv, e.g.::

	$ mplayer /dev/dvb/adapter0/dvr0


Daniel W. S. Almeida (4):
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: add a bridge driver
  media: Documentation: vidtv: Add ReST documentation for vidtv

 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/vidtv.rst        |  417 +++++
 MAINTAINERS                                   |    8 +
 drivers/media/test-drivers/Kconfig            |   16 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    9 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  546 +++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   60 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  306 ++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   76 +
 .../media/test-drivers/vidtv/vidtv_common.c   |   89 ++
 .../media/test-drivers/vidtv/vidtv_common.h   |   33 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  440 ++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   73 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   96 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  479 ++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  160 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  398 +++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  189 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1352 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  593 ++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  552 +++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |   90 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  137 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  130 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  427 ++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |   43 +
 28 files changed, 6732 insertions(+)
 create mode 100644 Documentation/driver-api/media/drivers/vidtv.rst
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h

-- 
2.28.0

