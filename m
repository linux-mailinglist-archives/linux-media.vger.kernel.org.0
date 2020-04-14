Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C81B1A768F
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437133AbgDNIvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:52234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437072AbgDNIvM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE84E2085B;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=V/eIPcsSVwad8UyoYAyp58TPr9vQc6czndfCl+S34oY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cgqfdx5Fmm0FwLYNqZR8jTFLVNZMkJwG/70xibZoz9O41fMbfNCBd7QzUEUgawBKl
         FTqy5Bgh73tuHFpI4vMU9mnOgQ9Vc2ovhPHHQvGUGeESJMyI4+Mjg0LvYSQFNq/DNx
         9Ghr7WOn6s0/+JgZ75bsSOuUUFxSjTwoJO+ScDZk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzG-2t; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 07/19] media: docs: update bttv.rst information
Date:   Tue, 14 Apr 2020 10:50:53 +0200
Message-Id: <f478267faf6eccc9fe3d80b0c6f7a63bd03621cd.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This document is... old. The bttv driver was one of the first
drivers at the Kernel. So, the document became a little obsoleted.

Update it to reflect some changes that happened along the time
affecting this driver and the subsystem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bttv.rst | 311 ++++++++++-------------
 1 file changed, 133 insertions(+), 178 deletions(-)

diff --git a/Documentation/admin-guide/media/bttv.rst b/Documentation/admin-guide/media/bttv.rst
index 9b15a0cba283..49382377b1dc 100644
--- a/Documentation/admin-guide/media/bttv.rst
+++ b/Documentation/admin-guide/media/bttv.rst
@@ -1,48 +1,64 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+===============
 The bttv driver
 ===============
 
 Release notes for bttv
 ----------------------
 
-You'll need at least these config options for bttv:
+You'll need at least these config options for bttv::
 
-.. code-block:: none
+    ./scripts/config -e PCI
+    ./scripts/config -m I2C
+    ./scripts/config -m INPUT
+    ./scripts/config -m MEDIA_SUPPORT
+    ./scripts/config -e MEDIA_PCI_SUPPORT
+    ./scripts/config -e MEDIA_ANALOG_TV_SUPPORT
+    ./scripts/config -e MEDIA_DIGITAL_TV_SUPPORT
+    ./scripts/config -e MEDIA_RADIO_SUPPORT
+    ./scripts/config -e RC_CORE
+    ./scripts/config -m VIDEO_BT848
 
-	CONFIG_I2C=m
-	CONFIG_I2C_ALGOBIT=m
-	CONFIG_VIDEO_DEV=m
+If your board has digital TV, you'll also need::
 
-The latest bttv version is available from http://bytesex.org/bttv/
+    ./scripts/config -m DVB_BT8XX
 
+In this case, please see :doc:`bt8xx` for additional notes.
 
 Make bttv work with your card
 -----------------------------
 
-Just try "modprobe bttv" and see if that works.
+If you have bttv compiled and installed, just booting the Kernel
+should be enough for it to try probing it. However, depending
+on the model, the Kernel may require additional information about
+the hardware, as the device may not be able to provide such info
+directly to the Kernel.
 
 If it doesn't bttv likely could not autodetect your card and needs some
 insmod options.  The most important insmod option for bttv is "card=n"
 to select the correct card type.  If you get video but no sound you've
 very likely specified the wrong (or no) card type.  A list of supported
-cards is in CARDLIST.bttv
+cards is in :doc:`bttv-cardlist`.
 
 If bttv takes very long to load (happens sometimes with the cheap
-cards which have no tuner), try adding this to your modules.conf:
-
-.. code-block:: none
+cards which have no tuner), try adding this to your modules configuration
+file (usually, it is either ``/etc/modules.conf`` or some file at
+``/etc/modules-load.d/``, but the actual place depends on your
+distribution)::
 
 	options i2c-algo-bit bit_test=1
 
-For the WinTV/PVR you need one firmware file from the driver CD:
-hcwamc.rbf.  The file is in the pvr45xxx.exe archive (self-extracting
-zip file, unzip can unpack it).  Put it into the /etc/pvr directory or
-use the firm_altera=<path> insmod option to point the driver to the
-location of the file.
+Some cards may require an extra firmware file to work. For example,
+for the WinTV/PVR you need one firmware file from its driver CD,
+called: ``hcwamc.rbf``. It is inside a self-extracting zip file
+called ``pvr45xxx.exe``.  Just placing it at the ``/etc/firmware``
+directory should be enough for it to be autoload during the driver's
+probing mode (e. g. when the Kernel boots or when the driver is
+manually loaded via ``modprobe`` command).
 
-If your card isn't listed in CARDLIST.bttv or if you have trouble making
-audio work, you should read the Sound-FAQ.
+If your card isn't listed in :doc:`bttv-cardlist` or if you have
+trouble making audio work, please read :ref:`still_doesnt_work`.
 
 
 Autodetecting cards
@@ -61,16 +77,19 @@ the Subsystem ID in the second line, looks like this:
 only bt878-based cards can have a subsystem ID (which does not mean
 that every card really has one).  bt848 cards can't have a Subsystem
 ID and therefore can't be autodetected.  There is a list with the ID's
-in bttv-cards.c (in case you are intrested or want to mail patches
-with updates).
+at :doc:`bttv-cardlist` (in case you are intrested or want to mail
+patches with updates).
 
 
+.. _still_doesnt_work:
+
 Still doesn't work?
 -------------------
 
 I do NOT have a lab with 30+ different grabber boards and a
 PAL/NTSC/SECAM test signal generator at home, so I often can't
 reproduce your problems.  This makes debugging very difficult for me.
+
 If you have some knowledge and spare time, please try to fix this
 yourself (patches very welcome of course...)  You know: The linux
 slogan is "Do it yourself".
@@ -92,102 +111,103 @@ at least the country you are living in).
 Modprobe options
 ----------------
 
-Note: "modinfo <module>" prints various information about a kernel
-module, among them a complete and up-to-date list of insmod options.
-This list tends to be outdated because it is updated manually ...
+.. note::
 
-==========================================================================
 
-bttv.o
+   The following argument list can be outdated, as we might add more
+   options if ever needed. In case of doubt, please check with
+   ``modinfo <module>``.
 
-.. code-block:: none
+   This command prints various information about a kernel
+   module, among them a complete and up-to-date list of insmod options.
 
-	the bt848/878 (grabber chip) driver
 
-	insmod args:
-		card=n		card type, see CARDLIST for a list.
-		tuner=n		tuner type, see CARDLIST for a list.
-		radio=0/1	card supports radio
-		pll=0/1/2	pll settings
-			0: don't use PLL
-			1: 28 MHz crystal installed
-			2: 35 MHz crystal installed
 
-		triton1=0/1     for Triton1 (+others) compatibility
-		vsfx=0/1	yet another chipset bug compatibility bit
-				see README.quirks for details on these two.
+bttv
+	The bt848/878 (grabber chip) driver
 
-		bigendian=n	Set the endianness of the gfx framebuffer.
-				Default is native endian.
-		fieldnr=0/1	Count fields.  Some TV descrambling software
-				needs this, for others it only generates
-				50 useless IRQs/sec.  default is 0 (off).
-		autoload=0/1	autoload helper modules (tuner, audio).
-				default is 1 (on).
-		bttv_verbose=0/1/2  verbose level (at insmod time, while
-				looking at the hardware).  default is 1.
-		bttv_debug=0/1	debug messages (for capture).
-				default is 0 (off).
-		irq_debug=0/1	irq handler debug messages.
-				default is 0 (off).
-		gbuffers=2-32	number of capture buffers for mmap'ed capture.
-				default is 4.
-		gbufsize=	size of capture buffers. default and
-				maximum value is 0x208000 (~2MB)
-		no_overlay=0	Enable overlay on broken hardware.  There
-				are some chipsets (SIS for example) which
-				are known to have problems with the PCI DMA
-				push used by bttv.  bttv will disable overlay
-				by default on this hardware to avoid crashes.
-				With this insmod option you can override this.
-		no_overlay=1	Disable overlay. It should be used by broken
-				hardware that doesn't support PCI2PCI direct
-				transfers.
-		automute=0/1	Automatically mutes the sound if there is
-				no TV signal, on by default.  You might try
-				to disable this if you have bad input signal
-				quality which leading to unwanted sound
-				dropouts.
-		chroma_agc=0/1	AGC of chroma signal, off by default.
-		adc_crush=0/1	Luminance ADC crush, on by default.
-		i2c_udelay=     Allow reduce I2C speed. Default is 5 usecs
-				(meaning 66,67 Kbps). The default is the
-				maximum supported speed by kernel bitbang
-				algorithm. You may use lower numbers, if I2C
-				messages are lost (16 is known to work on
-				all supported cards).
+    insmod args::
 
-		bttv_gpio=0/1
-		gpiomask=
-		audioall=
-		audiomux=
-				See Sound-FAQ for a detailed description.
+	    card=n		card type, see CARDLIST for a list.
+	    tuner=n		tuner type, see CARDLIST for a list.
+	    radio=0/1	card supports radio
+	    pll=0/1/2	pll settings
+
+			    0: don't use PLL
+			    1: 28 MHz crystal installed
+			    2: 35 MHz crystal installed
+
+	    triton1=0/1     for Triton1 (+others) compatibility
+	    vsfx=0/1	yet another chipset bug compatibility bit
+			    see README.quirks for details on these two.
+
+	    bigendian=n	Set the endianness of the gfx framebuffer.
+			    Default is native endian.
+	    fieldnr=0/1	Count fields.  Some TV descrambling software
+			    needs this, for others it only generates
+			    50 useless IRQs/sec.  default is 0 (off).
+	    autoload=0/1	autoload helper modules (tuner, audio).
+			    default is 1 (on).
+	    bttv_verbose=0/1/2  verbose level (at insmod time, while
+			    looking at the hardware).  default is 1.
+	    bttv_debug=0/1	debug messages (for capture).
+			    default is 0 (off).
+	    irq_debug=0/1	irq handler debug messages.
+			    default is 0 (off).
+	    gbuffers=2-32	number of capture buffers for mmap'ed capture.
+			    default is 4.
+	    gbufsize=	size of capture buffers. default and
+			    maximum value is 0x208000 (~2MB)
+	    no_overlay=0	Enable overlay on broken hardware.  There
+			    are some chipsets (SIS for example) which
+			    are known to have problems with the PCI DMA
+			    push used by bttv.  bttv will disable overlay
+			    by default on this hardware to avoid crashes.
+			    With this insmod option you can override this.
+	    no_overlay=1	Disable overlay. It should be used by broken
+			    hardware that doesn't support PCI2PCI direct
+			    transfers.
+	    automute=0/1	Automatically mutes the sound if there is
+			    no TV signal, on by default.  You might try
+			    to disable this if you have bad input signal
+			    quality which leading to unwanted sound
+			    dropouts.
+	    chroma_agc=0/1	AGC of chroma signal, off by default.
+	    adc_crush=0/1	Luminance ADC crush, on by default.
+	    i2c_udelay=     Allow reduce I2C speed. Default is 5 usecs
+			    (meaning 66,67 Kbps). The default is the
+			    maximum supported speed by kernel bitbang
+			    algorithm. You may use lower numbers, if I2C
+			    messages are lost (16 is known to work on
+			    all supported cards).
+
+	    bttv_gpio=0/1
+	    gpiomask=
+	    audioall=
+	    audiomux=
+			    See Sound-FAQ for a detailed description.
 
 	remap, card, radio and pll accept up to four comma-separated arguments
 	(for multiple boards).
 
-tuner.o
-
-.. code-block:: none
-
+tuner
 	The tuner driver.  You need this unless you want to use only
-	with a camera or external tuner ...
+	with a camera or the board doesn't provide analog TV tuning.
+
+	insmod args::
 
-	insmod args:
 		debug=1		print some debug info to the syslog
 		type=n		type of the tuner chip. n as follows:
 				see CARDLIST for a complete list.
 		pal=[bdgil]	select PAL variant (used for some tuners
 				only, important for the audio carrier).
 
-tvaudio.o
+tvaudio
+	Provide a single driver for all simple i2c audio control
+	chips (tda/tea*).
 
-.. code-block:: none
+	insmod args::
 
-	new, experimental module which is supported to provide a single
-	driver for all simple i2c audio control chips (tda/tea*).
-
-	insmod args:
 		tda8425  = 1	enable/disable the support for the
 		tda9840  = 1	various chips.
 		tda9850  = 1	The tea6300 can't be autodetected and is
@@ -200,45 +220,12 @@ tvaudio.o
 				the wrong one.
 		debug = 1	print debug messages
 
-	insmod args for tda9874a:
-		tda9874a_SIF=1/2	select sound IF input pin (1 or 2)
-					(default is pin 1)
-		tda9874a_AMSEL=0/1	auto-mute select for NICAM (default=0)
-					Please read note 3 below!
-		tda9874a_STD=n		select TV sound standard (0..8):
-					0 - A2, B/G
-					1 - A2, M (Korea)
-					2 - A2, D/K (1)
-					3 - A2, D/K (2)
-					4 - A2, D/K (3)
-					5 - NICAM, I
-					6 - NICAM, B/G
-					7 - NICAM, D/K (default)
-					8 - NICAM, L
-
-	Note 1: tda9874a supports both tda9874h (old) and tda9874a (new) chips.
-	Note 2: tda9874h/a and tda9875 (which is supported separately by
-	tda9875.o) use the same i2c address so both modules should not be
-	used at the same time.
-	Note 3: Using tda9874a_AMSEL option depends on your TV card design!
-		AMSEL=0: auto-mute will switch between NICAM sound
-			 and the sound on 1st carrier (i.e. FM mono or AM).
-		AMSEL=1: auto-mute will switch between NICAM sound
-			 and the analog mono input (MONOIN pin).
-	If tda9874a decoder on your card has MONOIN pin not connected, then
-	use only tda9874_AMSEL=0 or don't specify this option at all.
-	For example:
-	  card=65 (FlyVideo 2000S) - set AMSEL=1 or AMSEL=0
-	  card=72 (Prolink PV-BT878P rev.9B) - set AMSEL=0 only
-
-msp3400.o
-
-.. code-block:: none
-
+msp3400
 	The driver for the msp34xx sound processor chips. If you have a
 	stereo card, you probably want to insmod this one.
 
-	insmod args:
+	insmod args::
+
 		debug=1/2	print some debug info to the syslog,
 				2 is more verbose.
 		simple=1	Use the "short programming" method.  Newer
@@ -252,40 +239,6 @@ msp3400.o
 				should improve things for french people, the
 				carrier autoscan seems to work with FM only...
 
-tea6300.o - OBSOLETE (use tvaudio instead)
-
-.. code-block:: none
-
-	The driver for the tea6300 fader chip.  If you have a stereo
-	card and the msp3400.o doesn't work, you might want to try this
-	one.  This chip is seen on most STB TV/FM cards (usually from
-	Gateway OEM sold surplus on auction sites).
-
-	insmod args:
-		debug=1		print some debug info to the syslog.
-
-tda8425.o - OBSOLETE (use tvaudio instead)
-
-.. code-block:: none
-
-	The driver for the tda8425 fader chip.  This driver used to be
-	part of bttv.c, so if your sound used to work but does not
-	anymore, try loading this module.
-
-	insmod args:
-		debug=1		print some debug info to the syslog.
-
-tda985x.o - OBSOLETE (use tvaudio instead)
-
-.. code-block:: none
-
-	The driver for the tda9850/55 audio chips.
-
-	insmod args:
-		debug=1		print some debug info to the syslog.
-		chip=9850/9855	set the chip type.
-
-
 If the box freezes hard with bttv
 ---------------------------------
 
@@ -306,15 +259,15 @@ bug.  It is very helpful if you can tell where exactly it broke
 With a hard freeze you probably doesn't find anything in the logfiles.
 The only way to capture any kernel messages is to hook up a serial
 console and let some terminal application log the messages.  /me uses
-screen.  See Documentation/admin-guide/serial-console.rst for details on setting
+screen.  See :doc:`/admin-guide/serial-console` for details on setting
 up a serial console.
 
-Read Documentation/admin-guide/bug-hunting.rst to learn how to get any useful
+Read :doc:`/admin-guide/bug-hunting` to learn how to get any useful
 information out of a register+stack dump printed by the kernel on
 protection faults (so-called "kernel oops").
 
 If you run into some kind of deadlock, you can try to dump a call trace
-for each process using sysrq-t (see Documentation/admin-guide/sysrq.rst).
+for each process using sysrq-t (see :doc:`/admin-guide/sysrq`).
 This way it is possible to figure where *exactly* some process in "D"
 state is stuck.
 
@@ -443,9 +396,7 @@ Other elements of the tvcards array
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 If you are trying to make a new card work you might find it useful to
-know what the other elements in the tvcards array are good for:
-
-.. code-block:: none
+know what the other elements in the tvcards array are good for::
 
 	video_inputs    - # of video inputs the card has
 	audio_inputs    - historical cruft, not used any more.
@@ -678,7 +629,9 @@ Typhoon TV card series:
 ~~~~~~~~~~~~~~~~~~~~~~~
 
 These can be CPH, Flyvideo, Pixelview or KNC1 series.
+
 Typhoon is the brand of Anubis.
+
 Model 50680 got re-used, some model no. had different contents over time.
 
 Models:
@@ -830,12 +783,13 @@ is wrong. If it doesn't work, send me email.
   on their server are the full data-sheets, but don't ask how I found it.
 
 To use the driver I use the following options, the tuner and pll settings might
-be different in your country
+be different in your country. You can force it via modprobe parameters.
+For example::
 
-insmod videodev
-insmod i2c scan=1 i2c_debug=0 verbose=0
-insmod tuner type=1 debug=0
-insmod bttv  pll=1 radio=1 card=17
+    modprobe bttv  tuner=1 pll=28 radio=1 card=17
+
+Sets tuner type 1 (Philips PAL_I), PLL with a 28 MHz crystal, enables
+FM radio and selects bttv card ID 17 (Leadtek WinView 601).
 
 
 KNC One
@@ -854,15 +808,16 @@ KNC One
 Provideo
 ~~~~~~~~
 
-- PV951 or PV-951 (also are sold as:
+-  PV951 or PV-951, now named PV-951T
+   (also are sold as:
    Boeder TV-FM Video Capture Card,
    Titanmedia Supervision TV-2400,
    Provideo PV951 TF,
    3DeMon PV951,
    MediaForte TV-Vision PV951,
    Yoko PV951,
-   Vivanco Tuner Card PCI Art.-Nr.: 68404,
-   ) now named PV-951T
+   Vivanco Tuner Card PCI Art.-Nr.: 68404
+   )
 
 - Surveillance Series:
 
-- 
2.25.2

