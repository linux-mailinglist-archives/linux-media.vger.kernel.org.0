Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131721A767C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437074AbgDNIvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729427AbgDNIvM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCF0A20857;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=9Jh/pu02OHsj7midUde5xAfquT9YOkHW4TJYEZPvygg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tA1t/G4CcNV3D1ctEMuGy4Uhre+qLJiqGtFVYxvLpREd0E+YTitfUjBRdiusu1C+y
         CM9mQi10WSZHC5yh5FYFvLlnmsnwFDuqZ+SiMCNvTRwSlbniBBQdLl9sq6/VQjJDbB
         czbktTEaUvRMzi150T+6FjpPA2NcqZAs3Gn0e228=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzB-1T; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 06/19] media: docs: bt8xx.rst: update document info
Date:   Tue, 14 Apr 2020 10:50:52 +0200
Message-Id: <2c741c0e31b5f9931073f4cde8cacf718ad30325.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This document is very outdated, and doesn't match the
upstream current way.

Update it, making some parts a little bit more generic.
While the main focus of this document is digital TV
cards, its content also may also help someone with just
analog TV support.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bt8xx.rst | 136 ++++++++++++++--------
 1 file changed, 85 insertions(+), 51 deletions(-)

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
index d800f7791ada..707919f29c86 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -1,67 +1,95 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+==================================
 How to get the bt8xx cards working
 ==================================
 
-Authors: Richard Walker,
+Authors:
+	 Richard Walker,
 	 Jamie Honan,
 	 Michael Hunold,
 	 Manu Abraham,
 	 Uwe Bugla,
 	 Michael Krufky
 
-.. note::
-
-   This documentation is outdated. Please check at the DVB wiki
-   at https://linuxtv.org/wiki for more updated info.
-
 General information
 -------------------
 
 This class of cards has a bt878a as the PCI interface, and require the bttv driver
 for accessing the i2c bus and the gpio pins of the bt8xx chipset.
-Please see Documentation/admin-guide/media/cards.rst => o Cards based on the Conexant Bt8xx PCI bridge:
 
-Compiling kernel please enable:
+Please see :doc:`cards` for a complete list of Cards based on the
+Conexant Bt8xx PCI bridge supported by the Linux Kernel.
 
-#) ``Device drivers`` => ``Multimedia devices`` => ``Video For Linux`` => ``Enable Video for Linux API 1 (DEPRECATED)``
-#) ``Device drivers`` => ``Multimedia devices`` => ``Video For Linux`` => ``Video Capture Adapters`` => ``BT848 Video For Linux``
-#) ``Device drivers`` => ``Multimedia devices`` => ``Digital Video Broadcasting Devices`` => ``DVB for Linux`` ``DVB Core Support`` ``Bt8xx based PCI Cards``
+In order to be able to compile the kernel, some config options should be
+enabled::
 
-  Please use the following options with care as deselection of drivers which are in fact necessary may result in DVB devices that cannot be tuned due to lack of driver support:
-  You can save RAM by deselecting every frontend module that your DVB card does not need.
+    ./scripts/config -e PCI
+    ./scripts/config -e INPUT
+    ./scripts/config -m I2C
+    ./scripts/config -m MEDIA_SUPPORT
+    ./scripts/config -e MEDIA_PCI_SUPPORT
+    ./scripts/config -e MEDIA_ANALOG_TV_SUPPORT
+    ./scripts/config -e MEDIA_DIGITAL_TV_SUPPORT
+    ./scripts/config -e MEDIA_RADIO_SUPPORT
+    ./scripts/config -e RC_CORE
+    ./scripts/config -m VIDEO_BT848
+    ./scripts/config -m DVB_BT8XX
 
-  First please remove the static dependency of DVB card drivers on all frontend modules for all possible card variants by enabling:
+If you want to automatically support all possible variants of the Bt8xx
+cards, you should also do::
 
-#) ``Device drivers`` => ``Multimedia devices`` => ``Digital Video Broadcasting Devices`` => ``DVB for Linux`` ``DVB Core Support`` ``Load and attach frontend modules as needed``
+    ./scripts/config -e MEDIA_SUBDRV_AUTOSELECT
 
-  If you know the frontend driver that your card needs please enable:
+.. note::
 
-#) ``Device drivers`` => ``Multimedia devices`` => ``Digital Video Broadcasting Devices`` => ``DVB for Linux`` ``DVB Core Support`` ``Customise DVB Frontends`` => ``Customise the frontend modules to build``
+   Please use the following options with care as deselection of drivers which
+   are in fact necessary may result in DVB devices that cannot be tuned due
+   to lack of driver support.
+
+If your goal is to just support an specific board, you may, instead,
+disable MEDIA_SUBDRV_AUTOSELECT and manually select the frontend drivers
+required by your board. With that, you can save some RAM.
+
+You can do that by calling make xconfig/qconfig/menuconfig and look at
+the options on those menu options (only enabled if
+``Autoselect ancillary drivers`` is disabled:
+
+#) ``Device drivers`` => ``Multimedia support`` => ``Customize TV tuners``
+#) ``Device drivers`` => ``Multimedia support`` => ``Customize DVB frontends``
+
+Then, on each of the above menu, please select your card-specific
+frontend and tuner modules.
 
- Then please select your card-specific frontend module.
 
 Loading Modules
 ---------------
 
-Regular case: If the bttv driver detects a bt8xx-based DVB card, all frontend and backend modules will be loaded automatically.
+Regular case: If the bttv driver detects a bt8xx-based DVB card, all
+frontend and backend modules will be loaded automatically.
+
 Exceptions are:
-- Old TwinHan DST cards or clones with or without CA slot and not containing an Eeprom.
-People running udev please see Documentation/admin-guide/media/udev.rst.
 
-In the following cases overriding the PCI type detection for dvb-bt8xx might be necessary:
+- Old TV cards without EEPROMs, sharing a common PCI ID;
+- Old TwinHan DST cards or clones with or without CA slot and not
+  containing an Eeprom.
+
+People running udev please see :doc:`udev`.
+
+In the following cases overriding the PCI type detection for bttv and
+for dvb-bt8xx drivers by passing modprobe parameters may be necessary.
 
 Running TwinHan and Clones
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-.. code-block:: none
+As shown at :doc:`bttv-cardlist`, TwinHan and
+clones use ``card=113`` modprobe parameter. So, in order to properly
+detect it for devices without EEPROM, you should use::
 
 	$ modprobe bttv card=113
 	$ modprobe dst
 
-Useful parameters for verbosity level and debugging the dst module:
-
-.. code-block:: none
+Useful parameters for verbosity level and debugging the dst module::
 
 	verbose=0:		messages are disabled
 		1:		only error messages are displayed
@@ -70,55 +98,61 @@ Useful parameters for verbosity level and debugging the dst module:
 		4:		debug setting
 	dst_addons=0:		card is a free to air (FTA) card only
 		0x20:	card has a conditional access slot for scrambled channels
+	dst_algo=0:		(default) Software tuning algorithm
+	         1:		Hardware tuning algorithm
+
 
 The autodetected values are determined by the cards' "response string".
+
 In your logs see f. ex.: dst_get_device_id: Recognize [DSTMCI].
+
 For bug reports please send in a complete log with verbose=4 activated.
-Please also see Documentation/admin-guide/media/ci.rst.
+Please also see :doc:`ci`.
 
 Running multiple cards
 ~~~~~~~~~~~~~~~~~~~~~~
 
-Examples of card ID's:
+See :doc:`bttv-cardlist` for a complete list of
+Card ID. Some examples:
 
-.. code-block:: none
-
-	Pinnacle PCTV Sat:		 94
-	Nebula Electronics Digi TV:	104
-	pcHDTV HD-2000 TV:		112
-	Twinhan DST and clones:		113
-	Avermedia AverTV DVB-T 771:	123
-	Avermedia AverTV DVB-T 761:	124
-	DViCO FusionHDTV DVB-T Lite:	128
-	DViCO FusionHDTV 5 Lite:	135
+	===========================	===
+	Brand name			ID
+	===========================	===
+	Pinnacle PCTV Sat		 94
+	Nebula Electronics Digi TV	104
+	pcHDTV HD-2000 TV		112
+	Twinhan DST and clones		113
+	Avermedia AverTV DVB-T 77:	123
+	Avermedia AverTV DVB-T 761	124
+	DViCO FusionHDTV DVB-T Lite	128
+	DViCO FusionHDTV 5 Lite		135
+	===========================	===
 
 .. note::
 
-   The order of the card ID should be uprising:
+   When you have multiple cards, the order of the card ID should
+   match the order where they're detected by the system. Please notice
+   that removing/inserting other PCI cards may change the detection
+   order.
 
-   Example:
-
-   .. code-block:: none
+Example::
 
 	$ modprobe bttv card=113 card=135
 
-For a full list of card ID's please see Documentation/admin-guide/media/bttv-cardlist.rst.
-In case of further problems please subscribe and send questions to the mailing list: linux-dvb@linuxtv.org.
+In case of further problems please subscribe and send questions to
+the mailing list: linux-media@vger.kernel.org.
 
 Probing the cards with broken PCI subsystem ID
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-There are some TwinHan cards that the EEPROM has become corrupted for some
-reason. The cards do not have correct PCI subsystem ID. But we can force
-probing the cards with broken PCI subsystem ID
-
-.. code-block:: none
+There are some TwinHan cards whose EEPROM has become corrupted for some
+reason. The cards do not have a correct PCI subsystem ID.
+Still, it is possible to force probing the cards with::
 
 	$ echo 109e 0878 $subvendor $subdevice > \
 		/sys/bus/pci/drivers/bt878/new_id
 
-.. code-block:: none
+The two numbers there are::
 
 	109e: PCI_VENDOR_ID_BROOKTREE
 	0878: PCI_DEVICE_ID_BROOKTREE_878
-
-- 
2.25.2

