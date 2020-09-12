Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC22E2678CF
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 10:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgILIWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 04:22:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43679 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgILIWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 04:22:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H0nHkm4TKPTBMH0nJkWKrv; Sat, 12 Sep 2020 10:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599898922; bh=6SjuXs2KFO+Err5mleaFSr8+wRtwixNWP0fhD6VCWLw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ry12o66KvZZ+wYf/Fpv4e52kAEiJQ97ye6jq96IlRJk+9orWReXV2VxZZWuFEKoVf
         cyoAY6fvUONwcEMY1G6enENDTy5NIubRrf4iFC10ZxgWho6XVtaEhJjbKxd9ZO0QCw
         eMiP66OxnQ8PfkiHE5pz+5ngO7D8izg0ZmxQE2bOYVrgY6tGEwGQ9hTLz8aUmjOfpY
         1bsHnqpXUc/PJB1vr8Lx8ASTR6xeSld26nYAUbBc8GeOPKcY16ZYn9L/ys/q3bZiqo
         VvZj6IPyoMA+v75WEMbEyqzJ2+mlHuje4IzkAx/MnsVJhUxL27EPpDUKGAYux+7I3p
         sp/GW0pLvt44A==
Subject: Re: [v10 0/4] media: vidtv: Implement a virtual DVB driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <94faa1f5-22b2-1a01-0812-526e8cf17596@xs4all.nl>
Date:   Sat, 12 Sep 2020 10:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAGneQ37XvGzDjhXe7718BiuOcAmxOuG1i9DCi9QyPebwLHnNpMuU87GG9NnLeAENH51QMZfM7+L5uoHW5W5z2CBOkt0kCGbYrcguZTkobmQW4GFu2EJ
 aRytMmy4/AUG89rT9qD+dkWryE74Y+v1u1fAKkNRuAV7EITe/cnw7H8ysRutZQJYdCno+nD+ZKFnyYUHHKJDt6Mzy6E/gSuu1NZZ/d3MIQlIMvoV0JpXWdoX
 r87XDDU4C60qQKcZ14e0W54qmNVLxBR6QKtJlMm1+oExK1O9svfnNvNjX7DXHOfXMZOZRIlRwIwb09uDquMBUFk5gGLRl4AYAlTRixXOJyDl5JN3BaNT8o02
 Jn+gy5lIk4C6dQHO6dgoZkjL30sqbq8DB7qaarw3vYQlgg05JgXJCm+5SrPVY5yrFSBoy2eH7Nnk5z6kNu/MEJgx+YPmMgVUjqz2AIajRo7VxCHcgpAY0oHu
 xAXpvT5n/KhhKWnDdFoz8NP52J3LgxhD3yckuLQBrtnpbPvA0qyGu/IC+wHG4PDDNs/Vza+OIJpnwy56IMI59008MsQh6O0Lp7SaqA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

First of all, thank you for all your work on this. I see that Mauro merged
this v10, and after testing I posted a patch for the Kconfig, since that
seems to be wrong.

I have some more questions below, my apologies if that's been asked before.

On 21/08/2020 14:58, Daniel W. S. Almeida wrote:
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
> 
> changes in v10:
> 	s302m encoder got reworked
> 
> The Virtual Digital TV Driver (vidtv)
> 
> Background
> ----------
> 
> Vidtv is a virtual DVB driver that aims to serve as a reference for driver
> writers by serving as a template. It also validates the existing media DVB
> APIs, thus helping userspace application writers.
> 
> Currently, it consists of:
> 
> - A fake tuner driver, which will report a bad signal quality if the chosen
>   frequency is too far away from a table of valid frequencies for a
>   particular delivery system.
> 
> - A fake demod driver, which will constantly poll the fake signal quality
>   returned by the tuner, simulating a device that can lose/reacquire a lock
>   on the signal depending on the CNR levels.
> 
> - A fake bridge driver, which is the module responsible for modprobing the
>   fake tuner and demod modules and implementing the demux logic. This module
>   takes parameters at initialization that will dictate how the simulation
>   behaves.
> 
> - Code reponsible for encoding a valid MPEG Transport Stream, which is then
>   passed to the bridge driver. This fake stream contains some hardcoded content.
>   For now, we have a single, audio-only channel containing a single MPEG
>   Elementary Stream, which in turn contains a SMPTE 302m encoded sine-wave.
>   Note that this particular encoder was chosen because it is the easiest
>   way to encode PCM audio data in a MPEG Transport Stream.
> 
> Building vidtv
> --------------
> vidtv is a test driver and thus is **not** enabled by default when
> compiling the kernel.
> 
> In order to enable compilation of vidtv:
> 
> - Enable **DVB_TEST_DRIVERS**, then
> - Enable **DVB_VIDTV**
> 
> When compiled as a module, expect the following .ko files:
> 
> - dvb_vidtv_tuner.ko
> 
> - dvb_vidtv_demod.ko
> 
> - dvb_vidtv_bridge.ko

Why the dvb_ prefix? All virtual drivers just start with 'vi'.

And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
Just like the other virtual media drivers?

> 
> Running vidtv
> -------------
> When compiled as a module, run::
> 
> 	modprobe dvb_vidtv_bridge
> 
> That's it! The bridge driver will initialize the tuner and demod drivers as
> part of its own initialization.
> 
> You can optionally define some command-line arguments to vidtv, see the
> documentation for more info.
> 
> Testing vidtv with v4l-utils
> ============================

For regression testing of vidtv during the daily build it would be great if
the contrib/test/test-media script can be enhanced to include vidtv.

This is run during the daily build with a kernel that has lockdep and many
other checks enabled, so it is very helpful to verify that no regressions
happened.

Note that this script relies on the /dev/mediaX devices to run the tests. I
noticed that vidtv doesn't appear to create a /dev/mediaX device, even though
CONFIG_MEDIA_CONTROLLER_DVB=y. This is definitely something that would be good
to support in vidtv.

Regards,

	Hans

> 
> Start by installing v4l-utils and then modprobing vidtv::
> 
> 	modprobe dvb_vidtv_bridge
> 
> If the driver is OK, it should load and its probing code will run. This will
> pull in the tuner and demod drivers.
> 
> Using dvb-fe-tool
> -----------------
> 
> The first step to check whether the demod loaded successfully is to run::
> 
> 	$ dvb-fe-tool
> 
> This should return what is currently set up at the demod struct, i.e.::
> 
> 	static const struct dvb_frontend_ops vidtv_demod_ops = {
> 		.delsys = {
> 			SYS_DVBT,
> 			SYS_DVBT2,
> 			SYS_DVBC_ANNEX_A,
> 			SYS_DVBS,
> 			SYS_DVBS2,
> 		},
> 
> 		.info = {
> 			.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
> 			.frequency_min_hz       = 51 * MHz,
> 			.frequency_max_hz       = 2150 * MHz,
> 			.frequency_stepsize_hz  = 62500,
> 			.frequency_tolerance_hz = 29500 * kHz,
> 			.symbol_rate_min        = 1000000,
> 			.symbol_rate_max        = 45000000,
> 
> 			.caps = FE_CAN_FEC_1_2 |
> 				FE_CAN_FEC_2_3 |
> 				FE_CAN_FEC_3_4 |
> 				FE_CAN_FEC_4_5 |
> 				FE_CAN_FEC_5_6 |
> 				FE_CAN_FEC_6_7 |
> 				FE_CAN_FEC_7_8 |
> 				FE_CAN_FEC_8_9 |
> 				FE_CAN_QAM_16 |
> 				FE_CAN_QAM_64 |
> 				FE_CAN_QAM_32 |
> 				FE_CAN_QAM_128 |
> 				FE_CAN_QAM_256 |
> 				FE_CAN_QAM_AUTO |
> 				FE_CAN_QPSK |
> 				FE_CAN_FEC_AUTO |
> 				FE_CAN_INVERSION_AUTO |
> 				FE_CAN_TRANSMISSION_MODE_AUTO |
> 				FE_CAN_GUARD_INTERVAL_AUTO |
> 				FE_CAN_HIERARCHY_AUTO,
> 		}
> 
> 		....
> 
> Using dvb-scan
> --------------
> 
> In order to tune into a channel and read the PSI tables, we can use dvb-scan.
> 
> For this, one should provide a configuration file known as a 'scan file',
> here's an example::
> 
> 	[Channel]
> 	FREQUENCY = 330000000
> 	MODULATION = QAM/AUTO
> 	SYMBOL_RATE = 6940000
> 	INNER_FEC = AUTO
> 	DELIVERY_SYSTEM = DVBC/ANNEX_A
> 
> 	NOTE:
> 	The parameters depend on the video standard you're testing.
> 
> 	NOTE:
> 	Vidtv is a fake driver and does not validate much of the information
> 	in the scan file. Just specifying 'FREQUENCY' and 'DELIVERY_SYSTEM'
> 	should be enough for DVB-T/DVB-T2. For DVB-S/DVB-C however, you
> 	should also provide 'SYMBOL_RATE'.
> 
> Assuming this channel is named 'channel.conf', you can then run::
> 
>         $ dvbv5-scan dresden_dvbc_channel.conf
> 
> Using dvb-zap
> -------------
> 
> dvbv5-zap is a command line tool that can be used to record MPEG-TS to disk. The
> typical use is to tune into a channel and put it into record mode. The example
> below - which is taken from the documentation - illustrates that::
> 
>         $ dvbv5-zap -c dvb_channel.conf "trilhas sonoras" -r
>         using demux '/dev/dvb/adapter0/demux0'
>         reading channels from file 'dvb_channel.conf'
>         service has pid type 05:  204
>         tuning to 573000000 Hz
>         audio pid 104
>           dvb_set_pesfilter 104
>         Lock   (0x1f) Quality= Good Signal= 100.00% C/N= -13.80dB UCB= 70 postBER= 3.14x10^-3 PER= 0
>         DVR interface '/dev/dvb/adapter0/dvr0' can now be opened
> 
> The channel can be watched by playing the contents of the DVR interface, with
> some player that recognizes the MPEG-TS format, such as *mplayer* or *vlc*.
> 
> By playing the contents of the stream one can visually inspect the workings of
> vidtv, e.g.::
> 
> 	$ mplayer /dev/dvb/adapter0/dvr0
> 
> 
> Daniel W. S. Almeida (4):
>   media: vidtv: implement a tuner driver
>   media: vidtv: implement a demodulator driver
>   media: vidtv: add a bridge driver
>   media: Documentation: vidtv: Add ReST documentation for vidtv
> 
>  .../driver-api/media/drivers/index.rst        |    1 +
>  .../driver-api/media/drivers/vidtv.rst        |  417 +++++
>  MAINTAINERS                                   |    8 +
>  drivers/media/test-drivers/Kconfig            |   16 +
>  drivers/media/test-drivers/Makefile           |    1 +
>  drivers/media/test-drivers/vidtv/Kconfig      |   11 +
>  drivers/media/test-drivers/vidtv/Makefile     |    9 +
>  .../media/test-drivers/vidtv/vidtv_bridge.c   |  546 +++++++
>  .../media/test-drivers/vidtv/vidtv_bridge.h   |   60 +
>  .../media/test-drivers/vidtv/vidtv_channel.c  |  306 ++++
>  .../media/test-drivers/vidtv/vidtv_channel.h  |   76 +
>  .../media/test-drivers/vidtv/vidtv_common.c   |   89 ++
>  .../media/test-drivers/vidtv/vidtv_common.h   |   33 +
>  .../media/test-drivers/vidtv/vidtv_demod.c    |  440 ++++++
>  .../media/test-drivers/vidtv/vidtv_demod.h    |   73 +
>  .../media/test-drivers/vidtv/vidtv_encoder.h  |   96 ++
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  |  479 ++++++
>  drivers/media/test-drivers/vidtv/vidtv_mux.h  |  160 ++
>  drivers/media/test-drivers/vidtv/vidtv_pes.c  |  398 +++++
>  drivers/media/test-drivers/vidtv/vidtv_pes.h  |  189 +++
>  drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1352 +++++++++++++++++
>  drivers/media/test-drivers/vidtv/vidtv_psi.h  |  593 ++++++++
>  .../media/test-drivers/vidtv/vidtv_s302m.c    |  552 +++++++
>  .../media/test-drivers/vidtv/vidtv_s302m.h    |   90 ++
>  drivers/media/test-drivers/vidtv/vidtv_ts.c   |  137 ++
>  drivers/media/test-drivers/vidtv/vidtv_ts.h   |  130 ++
>  .../media/test-drivers/vidtv/vidtv_tuner.c    |  427 ++++++
>  .../media/test-drivers/vidtv/vidtv_tuner.h    |   43 +
>  28 files changed, 6732 insertions(+)
>  create mode 100644 Documentation/driver-api/media/drivers/vidtv.rst
>  create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
>  create mode 100644 drivers/media/test-drivers/vidtv/Makefile
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h
> 

