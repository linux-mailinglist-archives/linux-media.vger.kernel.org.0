Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3831A768A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437130AbgDNIvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437101AbgDNIvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2F4F20CC7;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=LXT+f0za3eptyCW+DPyNs7MaHrWlm8zhDxhU4H6VBWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LwaefZVW5GDZpnkdcRuQ9t5+pd11EEGh5AzyIPPyWUghfgJmBg+6DA/qPc8zjJDA5
         ctjZb14lFcAUKmbmagVvOzbOQBz7c6erkL+olo2v0fRYc8qZPImTcyDOjflSF5Zk5M
         cCFKHfnt7965jZHTQVJFvag89ROzhLajgUe/ypu8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzV-87; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 10/19] media: docs: update Digital TV faq.rst
Date:   Tue, 14 Apr 2020 10:50:56 +0200
Message-Id: <62e6d7814f839366e9712ee680e6e9323e52eec4.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains lots of obsoleted information. Update it
to reflect the current status and tools used by Digital TV
users and add pointers to the current locations and to
LinuxTV wiki pages.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/faq.rst | 253 ++++++++++++++----------
 1 file changed, 150 insertions(+), 103 deletions(-)

diff --git a/Documentation/admin-guide/media/faq.rst b/Documentation/admin-guide/media/faq.rst
index 52f153d18278..b63548b6f313 100644
--- a/Documentation/admin-guide/media/faq.rst
+++ b/Documentation/admin-guide/media/faq.rst
@@ -5,101 +5,143 @@ FAQ
 
 .. note::
 
-   This documentation is outdated. Please check at the DVB wiki
-   at https://linuxtv.org/wiki for more updated info.
+     1. With Digital TV, a single physical channel may have different
+	contents inside it. The specs call each one as a *service*.
+	This is what a TV user would call "channel". So, in order to
+	avoid confusion, we're calling *transponders* as the physical
+	channel on this FAQ, and *services* for the logical channel.
+     2. The LinuxTV community maintains some Wiki pages with contain
+        a lot of information related to the media subsystem. If you
+        don't find an answer for your needs here, it is likely that
+        you'll be able to get something useful there. It is hosted
+	at:
 
-Some very frequently asked questions about linuxtv-dvb
+	https://www.linuxtv.org/wiki/
+
+Some very frequently asked questions about Linux Digital TV support
 
 1. The signal seems to die a few seconds after tuning.
 
 	It's not a bug, it's a feature. Because the frontends have
 	significant power requirements (and hence get very hot), they
 	are powered down if they are unused (i.e. if the frontend device
-	is closed). The dvb-core.o module parameter "dvb_shutdown_timeout"
+	is closed). The ``dvb-core`` module parameter ``dvb_shutdown_timeout``
 	allow you to change the timeout (default 5 seconds). Setting the
 	timeout to 0 disables the timeout feature.
 
 2. How can I watch TV?
 
-	The driver distribution includes some simple utilities which
-	are mainly intended for testing and to demonstrate how the
-	DVB API works.
-
-	Depending on whether you have a DVB-S, DVB-C or DVB-T card, use
-	apps/szap/szap, czap or tzap. You must supply a channel list
-	in ~/.[sct]zap/channels.conf. If you are lucky you can just copy
-	one of the supplied channel lists, or you can create a new one
-	by running apps/scan/scan. If you run scan on an unknown network
-	you might have to supply some start data in apps/scan/initial.h.
-
-	If you have a card with a built-in hardware MPEG-decoder the
-	drivers create a video4linux device (/dev/v4l/video0) which
-	you can use to watch TV with any v4l application. xawtv is known
-	to work. Note that you cannot change channels with xawtv, you
-	have to zap using [sct]zap. If you want a nice application for
-	TV watching and record/playback, have a look at VDR.
-
-	If your card does not have a hardware MPEG decoder you need
-	a software MPEG decoder. Mplayer or xine are known to work.
-	Newsflash: MythTV also has DVB support now.
-	Note: Only very recent versions of Mplayer and xine can decode.
-	MPEG2 transport streams (TS) directly. Then, run
-	'[sct]zap channelname -r' in one xterm, and keep it running,
-	and start 'mplayer - < /dev/dvb/adapter0/dvr0' or
-	'xine stdin://mpeg2 < /dev/dvb/adapter0/dvr0' in a second xterm.
-	That's all far from perfect, but it seems no one has written
-	a nice DVB application which includes a builtin software MPEG
-	decoder yet.
-
-	Newsflash: Newest xine directly supports DVB. Just copy your
-	channels.conf to ~/.xine and start 'xine dvb://', or select
-	the DVB button in the xine GUI. Channel switching works using the
-	numpad pgup/pgdown (NP9 / NP3) keys to scroll through the channel osd
-	menu and pressing numpad-enter to switch to the selected channel.
-
-	Note: Older versions of xine and mplayer understand MPEG program
-	streams (PS) only, and can be used in conjunction with the
-	ts2ps tool from the Metzler Brother's dvb-mpegtools package.
-
-3. Which other DVB applications exist?
-
-	http://www.cadsoft.de/people/kls/vdr/
+	Together with the Linux Kernel, the Digital TV developers support
+	some simple utilities which are mainly intended for testing
+	and to demonstrate how the DVB API works. This is called DVB v5
+	tools and are grouped together with the ``v4l-utils`` git repository:
+
+	    https://git.linuxtv.org/v4l-utils.git/
+
+	You can find more information at the LinuxTV wiki:
+
+	    https://www.linuxtv.org/wiki/index.php/DVBv5_Tools
+
+	The first step is to get a list of services that are transmitted.
+
+	This is done by using several existing tools. You can use
+	for example the ``dvbv5-scan`` tool. You can find more information
+	about it at:
+
+	    https://www.linuxtv.org/wiki/index.php/Dvbv5-scan
+
+	There are some other applications like ``w_scan`` [#]_ that do a
+	blind scan, trying hard to find all possible channels, but
+	those consumes a large amount of time to run.
+
+	.. [#] https://www.linuxtv.org/wiki/index.php/W_scan
+
+	Also, some applications like ``kaffeine`` have their own code
+	to scan for services. So, you don't need to use an external
+	application to obtain such list.
+
+	Most of such tools need a file containing a list of channel
+	transponders available on your area. So, LinuxTV developers
+	maintain tables of Digital TV channel transponders, receiving
+	patches from the community to keep them updated.
+
+	This list is hosted at:
+
+	    https://git.linuxtv.org/dtv-scan-tables.git
+
+	And packaged on several distributions.
+
+	Kaffeine has some blind scan support for some terrestrial standards.
+	It also relies on DTV scan tables, although it contains a copy
+	of it internally (and, if requested by the user, it will download
+	newer versions of it).
+
+	If you are lucky you can just use one of the supplied channel
+	transponders. If not, you may need to seek for such info at
+	the Internet and create a new file. There are several sites with
+	contains physical channel lists. For cable and satellite, usually
+	knowing how to tune into a single channel is enough for the
+	scanning tool to identify the other channels. On some places,
+	this could also work for terrestrial transmissions.
+
+	Once you have a transponders list, you need to generate a services
+	list with a tool like ``dvbv5-scan``.
+
+	Almost all modern Digital TV cards don't have built-in hardware
+	MPEG-decoders. So, it is up to the application to get a MPEG-TS
+	stream provided by the board, split it into audio, video and other
+	data and decode.
+
+3. Which Digital TV applications exist?
+
+	Several media player applications are capable of tuning into
+	digital TV channels, including Kaffeine, Vlc, mplayer and MythTV.
+
+	Kaffeine aims to be very user-friendly, and it is maintained
+	by one of the Kernel driver developers.
+
+	A comprehensive list of those and other apps can be found at:
+
+	    https://www.linuxtv.org/wiki/index.php/TV_Related_Software
+
+	Some of the most popular ones are linked below:
+
+	https://kde.org/applications/multimedia/org.kde.kaffeine
+		KDE media player, focused on Digital TV support
+
+	https://www.linuxtv.org/vdrwiki/index.php/Main_Page
 		Klaus Schmidinger's Video Disk Recorder
 
-	http://www.metzlerbros.org/dvb/
-		Metzler Bros. DVB development; alternate drivers and
-		DVB utilities, include dvb-mpegtools and tuxzap.
+	https://linuxtv.org/downloads and https://git.linuxtv.org/
+		Digital TV and other media-related applications and
+		Kernel drivers. The ``v4l-utils`` package there contains
+		several swiss knife tools for using with Digital TV.
 
 	http://sourceforge.net/projects/dvbtools/
 		Dave Chapman's dvbtools package, including
 		dvbstream and dvbtune
 
-	http://www.linuxdvb.tv/
-		Henning Holtschneider's site with many interesting
-		links and docs
-
 	http://www.dbox2.info/
 		LinuxDVB on the dBox2
 
-	http://www.tuxbox.org/ and http://cvs.tuxbox.org/
+	http://www.tuxbox.org/
 		the TuxBox CVS many interesting DVB applications and the dBox2
 		DVB source
 
-	https://linuxtv.org/downloads
-		DVB Swiss Army Knife library and utilities
-
 	http://www.nenie.org/misc/mpsys/
 		MPSYS: a MPEG2 system library and tools
 
+	https://www.videolan.org/vlc/index.pt.html
+		Vlc
+
 	http://mplayerhq.hu/
-		mplayer
+		MPlayer
 
 	http://xine.sourceforge.net/ and http://xinehq.de/
-		xine
+		Xine
 
 	http://www.mythtv.org/
-		MythTV - analog TV PVR, but now with DVB support, too
-		(with software MPEG decode)
+		MythTV - analog TV and digital TV PVR
 
 	http://dvbsnoop.sourceforge.net/
 		DVB sniffer program to monitor, analyze, debug, dump
@@ -108,62 +150,67 @@ Some very frequently asked questions about linuxtv-dvb
 
 4. Can't get a signal tuned correctly
 
-	If you are using a Technotrend/Hauppauge DVB-C card *without* analog
-	module, you might have to use module parameter adac=-1 (dvb-ttpci.o).
+	That could be due to a lot of problems. On my personal experience,
+	usually TV cards need stronger signals than TV sets, and are more
+	sensitive to noise. So, perhaps you just need a better antenna or
+	cabling. Yet, it could also be some hardware or driver issue.
+
+	For example, if you are using a Technotrend/Hauppauge DVB-C card
+	*without* analog module, you might have to use module parameter
+	adac=-1 (dvb-ttpci.o).
+
+	Please see the FAQ page at linuxtv.org, as it could contain some
+	valuable information:
+
+	    https://www.linuxtv.org/wiki/index.php/FAQ_%26_Troubleshooting
+
+	If that doesn't work, check at the linux-media ML archives, to
+	see if someone else had a similar problem with your hardware
+	and/or digital TV service provider:
+
+	    https://lore.kernel.org/linux-media/
+
+	If none of this works, you can try sending an e-mail to the
+	linux-media ML and see if someone else could shed some light.
+	The e-mail is linux-media AT vger.kernel.org.
 
 5. The dvb_net device doesn't give me any packets at all
 
-	Run tcpdump on the dvb0_0 interface. This sets the interface
+	Run ``tcpdump`` on the ``dvb0_0`` interface. This sets the interface
 	into promiscuous mode so it accepts any packets from the PID
-	you have configured with the dvbnet utility. Check if there
+	you have configured with the ``dvbnet`` utility. Check if there
 	are any packets with the IP addr and MAC addr you have
-	configured with ifconfig.
+	configured with ``ifconfig`` or with ``ip addr``.
 
-	If tcpdump doesn't give you any output, check the statistics
-	which ifconfig outputs. (Note: If the MAC address is wrong,
-	dvb_net won't get any input; thus you have to run tcpdump
-	before checking the statistics.) If there are no packets at
-	all then maybe the PID is wrong. If there are error packets,
+	If ``tcpdump`` doesn't give you any output, check the statistics
+	which ``ifconfig`` or ``netstat -ni`` outputs. (Note: If the MAC
+	address is wrong, ``dvb_net`` won't get any input; thus you have to
+	run ``tcpdump`` before checking the statistics.) If there are no
+	packets at all then maybe the PID is wrong. If there are error packets,
 	then either the PID is wrong or the stream does not conform to
 	the MPE standard (EN 301 192, http://www.etsi.org/). You can
-	use e.g. dvbsnoop for debugging.
+	use e.g. ``dvbsnoop`` for debugging.
 
-6. The dvb_net device doesn't give me any multicast packets
+6. The ``dvb_net`` device doesn't give me any multicast packets
 
 	Check your routes if they include the multicast address range.
 	Additionally make sure that "source validation by reversed path
-	lookup" is disabled:
-
-.. code-block:: none
+	lookup" is disabled::
 
 	  $ "echo 0 > /proc/sys/net/ipv4/conf/dvb0/rp_filter"
 
-7. What the hell are all those modules that need to be loaded?
+7. What are all those modules that need to be loaded?
 
-	For a dvb-ttpci av7110 based full-featured card the following
-	modules are loaded:
+	In order to make it more flexible and support different hardware
+	combinations, the media subsystem is written on a modular way.
 
-	- videodev: Video4Linux core module. This is the base module that
-	  gives you access to the "analog" tv picture of the av7110 mpeg2
-	  decoder.
-
-	- v4l2-common: common functions for Video4Linux-2 drivers
-
-	- v4l1-compat: backward compatibility layer for Video4Linux-1 legacy
-	  applications
-
-	- dvb-core: DVB core module. This provides you with the
-	  /dev/dvb/adapter entries
-
-	- saa7146: SAA7146 core driver. This is need to access any SAA7146
-	  based card in your system.
-
-	- saa7146_vv: SAA7146 video and vbi functions. These are only needed
-	  for full-featured cards.
-
-	- videobuf-dma-sg: capture helper module for the saa7146_vv driver. This
-	  one is responsible to handle capture buffers.
-
-	- dvb-ttpci: The main driver for AV7110 based, full-featured
-	  DVB-S/C/T cards
+	So, besides the Digital TV hardware module for the main chipset,
+	it also needs to load a frontend driver, plus the Digital TV
+	core. If the board also has remote controller, it will also
+	need the remote controller core and the remote controller tables.
+	The same happens if the board has support for analog TV: the
+	core support for video4linux need to be loaded.
 
+	The actual module names are Linux-kernel version specific, as,
+	from time to time, things change, in order to make the media
+	support more flexible.
-- 
2.25.2

