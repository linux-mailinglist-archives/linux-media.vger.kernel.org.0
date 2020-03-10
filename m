Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8C117FEFB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgCJNnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:37578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727314AbgCJNnU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:20 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E50CF24649;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847798;
        bh=V7cceSSoCF2KsdsgBD+w34oyy1JwtT7BfYLJBKM7Dao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q4fyPIevNS45LO+fjGDbAsojAX3+uKt8whJXa/fu1hZW0hqC4h4aAXPqapstoBQsr
         ALorAer46HFnrwn3ui77m4ZEP9nfVMyjeLWQJLjLls/yWPLtsA0ML4vmyXGLmy8sCK
         QCrVrNc8Rmk+XzHLCt8Zb1NR4TuNzB13jEc3sfdA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wh-Lp; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Todor Tomov <todor.too@gmail.com>,
        Antoine Jacquet <royale@zerezo.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 19/22] media: docs: move user-facing docs to the admin guide
Date:   Tue, 10 Mar 2020 14:43:10 +0100
Message-Id: <05c08367b2c6a5b3f8f29499093d34b1f0d864fe.1583847557.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the driver-specific documentation is meant to help
users of the media subsystem.

Move them to the admin-guide.

It should be noticed, however, that several of those files
are outdated and will require further work in order to make
them useful again.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kernel-parameters.txt         |   4 +-
 .../media}/au0828-cardlist.rst                |   0
 .../media}/avermedia.rst                      |   0
 .../media}/bt8xx.rst                          |   8 +-
 .../media}/bttv-cardlist.rst                  |   0
 .../media}/bttv.rst                           |   0
 .../media}/cafe_ccic.rst                      |   0
 .../media}/cardlist.rst                       |   0
 .../media}/cards.rst                          |   0
 .../dvb-drivers => admin-guide/media}/ci.rst  |   0
 .../media}/cpia2.rst                          |   0
 .../media}/cx23885-cardlist.rst               |   0
 .../media}/cx88-cardlist.rst                  |   0
 .../media}/cx88.rst                           |   0
 .../media}/davinci-vpbe.rst                   |   0
 .../media}/em28xx-cardlist.rst                |   0
 .../dvb-drivers => admin-guide/media}/faq.rst |   0
 .../media}/fimc.rst                           |   0
 .../media}/gspca-cardlist.rst                 |   0
 .../v4l-drivers => admin-guide/media}/imx.rst |   0
 .../media}/imx7.rst                           |   0
 Documentation/admin-guide/media/index.rst     | 104 ++++++++++++++++++
 .../media}/intro.rst                          |   0
 .../media}/ipu3.rst                           |   0
 .../media}/ipu3_rcb.svg                       |   0
 .../media}/ivtv-cardlist.rst                  |   0
 .../media}/ivtv.rst                           |   0
 .../media}/lmedm04.rst                        |   0
 .../media}/meye.rst                           |   0
 .../media}/omap3isp.rst                       |   0
 .../media}/omap4_camera.rst                   |   0
 .../media}/opera-firmware.rst                 |   0
 .../media}/philips.rst                        |   0
 .../media}/pulse8-cec.rst                     |   0
 .../media}/qcom_camss.rst                     |   0
 .../media}/qcom_camss_8x96_graph.dot          |   0
 .../media}/qcom_camss_graph.dot               |   0
 .../media}/rcar-fdp1.rst                      |   0
 .../media}/saa7134-cardlist.rst               |   0
 .../media}/saa7134.rst                        |   0
 .../media}/saa7164-cardlist.rst               |   0
 .../media}/si470x.rst                         |   0
 .../media}/si4713.rst                         |   0
 .../media}/si476x.rst                         |   0
 .../media}/technisat.rst                      |   0
 .../media}/tm6000-cardlist.rst                |   0
 .../media}/ttusb-dec.rst                      |   0
 .../media}/tuner-cardlist.rst                 |   0
 .../media}/udev.rst                           |   0
 .../media}/usbvision-cardlist.rst             |   0
 .../media}/v4l-with-ir.rst                    |   0
 .../media}/vimc.dot                           |   0
 .../media}/vimc.rst                           |   0
 .../media}/vivid.rst                          |   0
 .../media}/zr364xx.rst                        |   0
 Documentation/media/cec-drivers/index.rst     |  34 ------
 Documentation/media/dvb-drivers/index.rst     |  11 --
 Documentation/media/index.rst                 |   4 +-
 Documentation/media/v4l-drivers/index.rst     |  25 -----
 .../zh_CN/video4linux/omap3isp.txt            |   4 +-
 .../media/v4l/dev-sliced-vbi.rst              |   2 +-
 .../media/v4l/ext-ctrls-codec.rst             |   2 +-
 .../media/v4l/ext-ctrls-image-process.rst     |   2 +-
 .../media/v4l/pixfmt-reserved.rst             |   2 +-
 MAINTAINERS                                   |  22 ++--
 drivers/media/pci/bt8xx/Kconfig               |   2 +-
 drivers/media/pci/meye/Kconfig                |   2 +-
 drivers/media/radio/si470x/Kconfig            |   2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |   2 +-
 drivers/media/usb/gspca/Kconfig               |   2 +-
 drivers/media/usb/zr364xx/Kconfig             |   2 +-
 72 files changed, 136 insertions(+), 101 deletions(-)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/au0828-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/avermedia.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/bt8xx.rst (93%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/bttv-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/bttv.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cafe_ccic.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/cards.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/ci.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cpia2.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cx23885-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cx88-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/cx88.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/davinci-vpbe.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/em28xx-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/faq.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/fimc.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/gspca-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/imx.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/imx7.rst (100%)
 create mode 100644 Documentation/admin-guide/media/index.rst
 rename Documentation/{media/dvb-drivers => admin-guide/media}/intro.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ipu3.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ipu3_rcb.svg (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ivtv-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/ivtv.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/lmedm04.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/meye.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/omap3isp.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/omap4_camera.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/opera-firmware.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/philips.rst (100%)
 rename Documentation/{media/cec-drivers => admin-guide/media}/pulse8-cec.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss_8x96_graph.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/qcom_camss_graph.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/rcar-fdp1.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/saa7134-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/saa7134.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/saa7164-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si470x.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si4713.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/si476x.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/technisat.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/tm6000-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/ttusb-dec.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/tuner-cardlist.rst (100%)
 rename Documentation/{media/dvb-drivers => admin-guide/media}/udev.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/usbvision-cardlist.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/v4l-with-ir.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vimc.dot (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vimc.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/vivid.rst (100%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/zr364xx.rst (100%)
 delete mode 100644 Documentation/media/cec-drivers/index.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index f1d0ccffbe72..29a1355d0bed 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -92,6 +92,7 @@ configure specific aspects of kernel behavior to your liking.
    lockup-watchdogs
    LSM/index
    md
+   media/index
    mm/index
    module-signing
    mono
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dbc22d684627..b12e9904a320 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -449,7 +449,7 @@
 	bttv.card=	[HW,V4L] bttv (bt848 + bt878 based grabber cards)
 	bttv.radio=	Most important insmod options are available as
 			kernel args too.
-	bttv.pll=	See Documentation/media/v4l-drivers/bttv.rst
+	bttv.pll=	See Documentation/admin-guide/media/bttv.rst
 	bttv.tuner=
 
 	bulk_remove=off	[PPC]  This parameter disables the use of the pSeries
@@ -2658,7 +2658,7 @@
 			See Documentation/admin-guide/pm/sleep-states.rst.
 
 	meye.*=		[HW] Set MotionEye Camera parameters
-			See Documentation/media/v4l-drivers/meye.rst.
+			See Documentation/admin-guide/media/meye.rst.
 
 	mfgpt_irq=	[IA-32] Specify the IRQ to use for the
 			Multi-Function General Purpose Timers on AMD Geode
diff --git a/Documentation/media/v4l-drivers/au0828-cardlist.rst b/Documentation/admin-guide/media/au0828-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/au0828-cardlist.rst
rename to Documentation/admin-guide/media/au0828-cardlist.rst
diff --git a/Documentation/media/dvb-drivers/avermedia.rst b/Documentation/admin-guide/media/avermedia.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/avermedia.rst
rename to Documentation/admin-guide/media/avermedia.rst
diff --git a/Documentation/media/dvb-drivers/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
similarity index 93%
rename from Documentation/media/dvb-drivers/bt8xx.rst
rename to Documentation/admin-guide/media/bt8xx.rst
index 7936cd96fc8f..d800f7791ada 100644
--- a/Documentation/media/dvb-drivers/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -20,7 +20,7 @@ General information
 
 This class of cards has a bt878a as the PCI interface, and require the bttv driver
 for accessing the i2c bus and the gpio pins of the bt8xx chipset.
-Please see Documentation/media/dvb-drivers/cards.rst => o Cards based on the Conexant Bt8xx PCI bridge:
+Please see Documentation/admin-guide/media/cards.rst => o Cards based on the Conexant Bt8xx PCI bridge:
 
 Compiling kernel please enable:
 
@@ -47,7 +47,7 @@ Loading Modules
 Regular case: If the bttv driver detects a bt8xx-based DVB card, all frontend and backend modules will be loaded automatically.
 Exceptions are:
 - Old TwinHan DST cards or clones with or without CA slot and not containing an Eeprom.
-People running udev please see Documentation/media/dvb-drivers/udev.rst.
+People running udev please see Documentation/admin-guide/media/udev.rst.
 
 In the following cases overriding the PCI type detection for dvb-bt8xx might be necessary:
 
@@ -74,7 +74,7 @@ Useful parameters for verbosity level and debugging the dst module:
 The autodetected values are determined by the cards' "response string".
 In your logs see f. ex.: dst_get_device_id: Recognize [DSTMCI].
 For bug reports please send in a complete log with verbose=4 activated.
-Please also see Documentation/media/dvb-drivers/ci.rst.
+Please also see Documentation/admin-guide/media/ci.rst.
 
 Running multiple cards
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -102,7 +102,7 @@ Examples of card ID's:
 
 	$ modprobe bttv card=113 card=135
 
-For a full list of card ID's please see Documentation/media/v4l-drivers/bttv-cardlist.rst.
+For a full list of card ID's please see Documentation/admin-guide/media/bttv-cardlist.rst.
 In case of further problems please subscribe and send questions to the mailing list: linux-dvb@linuxtv.org.
 
 Probing the cards with broken PCI subsystem ID
diff --git a/Documentation/media/v4l-drivers/bttv-cardlist.rst b/Documentation/admin-guide/media/bttv-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/bttv-cardlist.rst
rename to Documentation/admin-guide/media/bttv-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/bttv.rst b/Documentation/admin-guide/media/bttv.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/bttv.rst
rename to Documentation/admin-guide/media/bttv.rst
diff --git a/Documentation/media/v4l-drivers/cafe_ccic.rst b/Documentation/admin-guide/media/cafe_ccic.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cafe_ccic.rst
rename to Documentation/admin-guide/media/cafe_ccic.rst
diff --git a/Documentation/media/v4l-drivers/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cardlist.rst
rename to Documentation/admin-guide/media/cardlist.rst
diff --git a/Documentation/media/dvb-drivers/cards.rst b/Documentation/admin-guide/media/cards.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/cards.rst
rename to Documentation/admin-guide/media/cards.rst
diff --git a/Documentation/media/dvb-drivers/ci.rst b/Documentation/admin-guide/media/ci.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/ci.rst
rename to Documentation/admin-guide/media/ci.rst
diff --git a/Documentation/media/v4l-drivers/cpia2.rst b/Documentation/admin-guide/media/cpia2.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cpia2.rst
rename to Documentation/admin-guide/media/cpia2.rst
diff --git a/Documentation/media/v4l-drivers/cx23885-cardlist.rst b/Documentation/admin-guide/media/cx23885-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cx23885-cardlist.rst
rename to Documentation/admin-guide/media/cx23885-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/cx88-cardlist.rst b/Documentation/admin-guide/media/cx88-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cx88-cardlist.rst
rename to Documentation/admin-guide/media/cx88-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/cx88.rst b/Documentation/admin-guide/media/cx88.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cx88.rst
rename to Documentation/admin-guide/media/cx88.rst
diff --git a/Documentation/media/v4l-drivers/davinci-vpbe.rst b/Documentation/admin-guide/media/davinci-vpbe.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/davinci-vpbe.rst
rename to Documentation/admin-guide/media/davinci-vpbe.rst
diff --git a/Documentation/media/v4l-drivers/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/em28xx-cardlist.rst
rename to Documentation/admin-guide/media/em28xx-cardlist.rst
diff --git a/Documentation/media/dvb-drivers/faq.rst b/Documentation/admin-guide/media/faq.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/faq.rst
rename to Documentation/admin-guide/media/faq.rst
diff --git a/Documentation/media/v4l-drivers/fimc.rst b/Documentation/admin-guide/media/fimc.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/fimc.rst
rename to Documentation/admin-guide/media/fimc.rst
diff --git a/Documentation/media/v4l-drivers/gspca-cardlist.rst b/Documentation/admin-guide/media/gspca-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/gspca-cardlist.rst
rename to Documentation/admin-guide/media/gspca-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/admin-guide/media/imx.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/imx.rst
rename to Documentation/admin-guide/media/imx.rst
diff --git a/Documentation/media/v4l-drivers/imx7.rst b/Documentation/admin-guide/media/imx7.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/imx7.rst
rename to Documentation/admin-guide/media/imx7.rst
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
new file mode 100644
index 000000000000..5b355c327be1
--- /dev/null
+++ b/Documentation/admin-guide/media/index.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+**Copyright** |copy| 1999-2020 : LinuxTV Developers
+
+This documentation is free software; you can redistribute it and/or modify it
+under the terms of the GNU General Public License as published by the Free
+Software Foundation version 2 of the License.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+more details.
+
+For more details see the file COPYING in the source distribution of Linux.
+
+.. _uapi-v4l-drivers:
+
+################################################
+Video4Linux (V4L)  driver-specific documentation
+################################################
+
+.. only:: html
+
+    .. class:: toc-title
+
+        Table of Contents
+
+.. toctree::
+	:maxdepth: 5
+	:numbered:
+
+	cardlist
+
+	v4l-with-ir
+
+	bttv
+	cafe_ccic
+	cpia2
+	cx88
+	davinci-vpbe
+	fimc
+	imx
+	imx7
+	ipu3
+	ivtv
+	meye
+	omap3isp
+	omap4_camera
+	philips
+	qcom_camss
+	rcar-fdp1
+	saa7134
+	si470x
+	si4713
+	si476x
+	vimc
+	vivid
+
+##############################################
+Linux Digital TV driver-specific documentation
+##############################################
+
+.. only:: html
+
+    .. class:: toc-title
+
+        Table of Contents
+
+.. toctree::
+	:maxdepth: 5
+	:numbered:
+
+	intro
+
+	cards
+	ci
+	faq
+
+	avermedia
+	bt8xx
+	lmedm04
+	opera-firmware
+	technisat
+	ttusb-dec
+	udev
+	zr364xx
+
+#################################
+CEC driver-specific documentation
+#################################
+
+.. only:: html
+
+    .. class:: toc-title
+
+        Table of Contents
+
+.. toctree::
+	:maxdepth: 5
+	:numbered:
+
+	pulse8-cec
diff --git a/Documentation/media/dvb-drivers/intro.rst b/Documentation/admin-guide/media/intro.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/intro.rst
rename to Documentation/admin-guide/media/intro.rst
diff --git a/Documentation/media/v4l-drivers/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/ipu3.rst
rename to Documentation/admin-guide/media/ipu3.rst
diff --git a/Documentation/media/v4l-drivers/ipu3_rcb.svg b/Documentation/admin-guide/media/ipu3_rcb.svg
similarity index 100%
rename from Documentation/media/v4l-drivers/ipu3_rcb.svg
rename to Documentation/admin-guide/media/ipu3_rcb.svg
diff --git a/Documentation/media/v4l-drivers/ivtv-cardlist.rst b/Documentation/admin-guide/media/ivtv-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/ivtv-cardlist.rst
rename to Documentation/admin-guide/media/ivtv-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/ivtv.rst b/Documentation/admin-guide/media/ivtv.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/ivtv.rst
rename to Documentation/admin-guide/media/ivtv.rst
diff --git a/Documentation/media/dvb-drivers/lmedm04.rst b/Documentation/admin-guide/media/lmedm04.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/lmedm04.rst
rename to Documentation/admin-guide/media/lmedm04.rst
diff --git a/Documentation/media/v4l-drivers/meye.rst b/Documentation/admin-guide/media/meye.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/meye.rst
rename to Documentation/admin-guide/media/meye.rst
diff --git a/Documentation/media/v4l-drivers/omap3isp.rst b/Documentation/admin-guide/media/omap3isp.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/omap3isp.rst
rename to Documentation/admin-guide/media/omap3isp.rst
diff --git a/Documentation/media/v4l-drivers/omap4_camera.rst b/Documentation/admin-guide/media/omap4_camera.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/omap4_camera.rst
rename to Documentation/admin-guide/media/omap4_camera.rst
diff --git a/Documentation/media/dvb-drivers/opera-firmware.rst b/Documentation/admin-guide/media/opera-firmware.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/opera-firmware.rst
rename to Documentation/admin-guide/media/opera-firmware.rst
diff --git a/Documentation/media/v4l-drivers/philips.rst b/Documentation/admin-guide/media/philips.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/philips.rst
rename to Documentation/admin-guide/media/philips.rst
diff --git a/Documentation/media/cec-drivers/pulse8-cec.rst b/Documentation/admin-guide/media/pulse8-cec.rst
similarity index 100%
rename from Documentation/media/cec-drivers/pulse8-cec.rst
rename to Documentation/admin-guide/media/pulse8-cec.rst
diff --git a/Documentation/media/v4l-drivers/qcom_camss.rst b/Documentation/admin-guide/media/qcom_camss.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/qcom_camss.rst
rename to Documentation/admin-guide/media/qcom_camss.rst
diff --git a/Documentation/media/v4l-drivers/qcom_camss_8x96_graph.dot b/Documentation/admin-guide/media/qcom_camss_8x96_graph.dot
similarity index 100%
rename from Documentation/media/v4l-drivers/qcom_camss_8x96_graph.dot
rename to Documentation/admin-guide/media/qcom_camss_8x96_graph.dot
diff --git a/Documentation/media/v4l-drivers/qcom_camss_graph.dot b/Documentation/admin-guide/media/qcom_camss_graph.dot
similarity index 100%
rename from Documentation/media/v4l-drivers/qcom_camss_graph.dot
rename to Documentation/admin-guide/media/qcom_camss_graph.dot
diff --git a/Documentation/media/v4l-drivers/rcar-fdp1.rst b/Documentation/admin-guide/media/rcar-fdp1.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/rcar-fdp1.rst
rename to Documentation/admin-guide/media/rcar-fdp1.rst
diff --git a/Documentation/media/v4l-drivers/saa7134-cardlist.rst b/Documentation/admin-guide/media/saa7134-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/saa7134-cardlist.rst
rename to Documentation/admin-guide/media/saa7134-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/saa7134.rst b/Documentation/admin-guide/media/saa7134.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/saa7134.rst
rename to Documentation/admin-guide/media/saa7134.rst
diff --git a/Documentation/media/v4l-drivers/saa7164-cardlist.rst b/Documentation/admin-guide/media/saa7164-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/saa7164-cardlist.rst
rename to Documentation/admin-guide/media/saa7164-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/si470x.rst b/Documentation/admin-guide/media/si470x.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/si470x.rst
rename to Documentation/admin-guide/media/si470x.rst
diff --git a/Documentation/media/v4l-drivers/si4713.rst b/Documentation/admin-guide/media/si4713.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/si4713.rst
rename to Documentation/admin-guide/media/si4713.rst
diff --git a/Documentation/media/v4l-drivers/si476x.rst b/Documentation/admin-guide/media/si476x.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/si476x.rst
rename to Documentation/admin-guide/media/si476x.rst
diff --git a/Documentation/media/dvb-drivers/technisat.rst b/Documentation/admin-guide/media/technisat.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/technisat.rst
rename to Documentation/admin-guide/media/technisat.rst
diff --git a/Documentation/media/v4l-drivers/tm6000-cardlist.rst b/Documentation/admin-guide/media/tm6000-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/tm6000-cardlist.rst
rename to Documentation/admin-guide/media/tm6000-cardlist.rst
diff --git a/Documentation/media/dvb-drivers/ttusb-dec.rst b/Documentation/admin-guide/media/ttusb-dec.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/ttusb-dec.rst
rename to Documentation/admin-guide/media/ttusb-dec.rst
diff --git a/Documentation/media/v4l-drivers/tuner-cardlist.rst b/Documentation/admin-guide/media/tuner-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/tuner-cardlist.rst
rename to Documentation/admin-guide/media/tuner-cardlist.rst
diff --git a/Documentation/media/dvb-drivers/udev.rst b/Documentation/admin-guide/media/udev.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/udev.rst
rename to Documentation/admin-guide/media/udev.rst
diff --git a/Documentation/media/v4l-drivers/usbvision-cardlist.rst b/Documentation/admin-guide/media/usbvision-cardlist.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/usbvision-cardlist.rst
rename to Documentation/admin-guide/media/usbvision-cardlist.rst
diff --git a/Documentation/media/v4l-drivers/v4l-with-ir.rst b/Documentation/admin-guide/media/v4l-with-ir.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/v4l-with-ir.rst
rename to Documentation/admin-guide/media/v4l-with-ir.rst
diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/admin-guide/media/vimc.dot
similarity index 100%
rename from Documentation/media/v4l-drivers/vimc.dot
rename to Documentation/admin-guide/media/vimc.dot
diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/admin-guide/media/vimc.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/vimc.rst
rename to Documentation/admin-guide/media/vimc.rst
diff --git a/Documentation/media/v4l-drivers/vivid.rst b/Documentation/admin-guide/media/vivid.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/vivid.rst
rename to Documentation/admin-guide/media/vivid.rst
diff --git a/Documentation/media/v4l-drivers/zr364xx.rst b/Documentation/admin-guide/media/zr364xx.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/zr364xx.rst
rename to Documentation/admin-guide/media/zr364xx.rst
diff --git a/Documentation/media/cec-drivers/index.rst b/Documentation/media/cec-drivers/index.rst
deleted file mode 100644
index 2b7fcaa4311b..000000000000
--- a/Documentation/media/cec-drivers/index.rst
+++ /dev/null
@@ -1,34 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-.. include:: <isonum.txt>
-
-.. _cec-drivers:
-
-#################################
-CEC driver-specific documentation
-#################################
-
-**Copyright** |copy| 2017 : LinuxTV Developers
-
-This documentation is free software; you can redistribute it and/or modify it
-under the terms of the GNU General Public License as published by the Free
-Software Foundation version 2 of the License.
-
-This program is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
-more details.
-
-For more details see the file COPYING in the source distribution of Linux.
-
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
-
-.. toctree::
-	:maxdepth: 5
-	:numbered:
-
-	pulse8-cec
diff --git a/Documentation/media/dvb-drivers/index.rst b/Documentation/media/dvb-drivers/index.rst
index 9d3fce544f85..7a870ee7ac7d 100644
--- a/Documentation/media/dvb-drivers/index.rst
+++ b/Documentation/media/dvb-drivers/index.rst
@@ -29,17 +29,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
-	intro
-	avermedia
-	bt8xx
-	cards
-	ci
 	dvb-usb
-	faq
-	lmedm04
-	opera-firmware
-	technisat
-	ttusb-dec
-	udev
 	frontends
 	contributors
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index 308f6a396d1c..0f75280b8c43 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -14,9 +14,9 @@ Linux Media Subsystem Documentation
 
    ../userspace-api/media/index
    ../driver-api/media/index
-   dvb-drivers/index
+
    v4l-drivers/index
-   cec-drivers/index
+   dvb-drivers/index
 
 .. only:: html and subproject
 
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 8962a86dad70..aef375cfb05a 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -31,38 +31,13 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
-	v4l-with-ir
 	tuners
-	cardlist
-	bttv
-	cafe_ccic
-	cpia2
-	cx88
-	davinci-vpbe
-	fimc
-	imx
-	imx7
-	ipu3
-	ivtv
 	max2175
-	meye
-	omap3isp
-	omap4_camera
-	philips
 	pvrusb2
 	pxa_camera
-	qcom_camss
 	radiotrack
-	rcar-fdp1
-	saa7134
 	sh_mobile_ceu_camera
-	si470x
-	si4713
-	si476x
 	uvcvideo
-	vimc
-	vivid
-	zr364xx
 
 	bttv-devel
 	cpia2_devel
diff --git a/Documentation/translations/zh_CN/video4linux/omap3isp.txt b/Documentation/translations/zh_CN/video4linux/omap3isp.txt
index e9f29375aa95..75e481985630 100644
--- a/Documentation/translations/zh_CN/video4linux/omap3isp.txt
+++ b/Documentation/translations/zh_CN/video4linux/omap3isp.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/media/v4l-drivers/omap3isp.rst
+Chinese translated version of Documentation/admin-guide/media/omap3isp.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -11,7 +11,7 @@ Maintainer: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 	  David Cohen <dacohen@gmail.com>
 Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
-Documentation/media/v4l-drivers/omap3isp.rst 的中文翻译
+Documentation/admin-guide/media/omap3isp.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 0767299e9105..751c6590e774 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -438,7 +438,7 @@ MPEG stream.
 *Historical context*: This format specification originates from a
 custom, embedded, sliced VBI data format used by the ``ivtv`` driver.
 This format has already been informally specified in the kernel sources
-in the file ``Documentation/media/v4l-drivers/cx2341x.rst`` . The
+in the file ``Documentation/media/v4l-drivers/cx2341x-uapi.rst`` . The
 maximum size of the payload and other aspects of this format are driven
 by the CX23415 MPEG decoder's capabilities and limitations with respect
 to extracting, decoding, and displaying sliced VBI data embedded within
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index f64f6fc4fd75..f81016c97a0d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -116,7 +116,7 @@ enum v4l2_mpeg_stream_vbi_fmt -
     * - ``V4L2_MPEG_STREAM_VBI_FMT_IVTV``
       - VBI in private packets, IVTV format (documented in the kernel
 	sources in the file
-	``Documentation/media/v4l-drivers/cx2341x.rst``)
+	``Documentation/media/v4l-drivers/cx2341x-uapi.rst``)
 
 
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index e47103aa32ed..bb9d484c25e4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -53,7 +53,7 @@ Image Process Control IDs
 
 ``V4L2_CID_DEINTERLACING_MODE (menu)``
     The video deinterlacing mode (such as Bob, Weave, ...). The menu items are
-    driver specific and are documented in :ref:`v4l-drivers`.
+    driver specific and are documented in :ref:`uapi-v4l-drivers`.
 
 ``V4L2_CID_DIGITAL_GAIN (integer)``
     Digital gain is the value by which all colour components
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 8ef90b0df864..dbdcf6c9f072 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -58,7 +58,7 @@ please make a proposal on the linux-media mailing list.
       - YUV 4:2:0 format used by the IVTV driver.
 
 	The format is documented in the kernel sources in the file
-	``Documentation/media/v4l-drivers/cx2341x.rst``
+	``Documentation/media/v4l-drivers/cx2341x-uapi.rst``
     * .. _V4L2-PIX-FMT-CPIA1:
 
       - ``V4L2_PIX_FMT_CPIA1``
diff --git a/MAINTAINERS b/MAINTAINERS
index b5af1feb5ba1..fbb8b1f13cb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3711,7 +3711,7 @@ M:	Jonathan Corbet <corbet@lwn.net>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
-F:	Documentation/media/v4l-drivers/cafe_ccic*
+F:	Documentation/admin-guide/media/cafe_ccic*
 F:	drivers/media/platform/marvell-ccic/
 
 CAIF NETWORK LAYER
@@ -6180,7 +6180,7 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/usb/em28xx/
-F:	Documentation/media/v4l-drivers/em28xx*
+F:	Documentation/admin-guide/media/em28xx*
 
 EMBEDDED LINUX
 M:	Paul Gortmaker <paul.gortmaker@windriver.com>
@@ -8529,8 +8529,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/ipu3/
 F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
-F:	Documentation/media/v4l-drivers/ipu3.rst
-F:	Documentation/media/v4l-drivers/ipu3_rcb.svg
+F:	Documentation/admin-guide/media/ipu3.rst
+F:	Documentation/admin-guide/media/ipu3_rcb.svg
 
 INTEL IXP4XX QMGR, NPE, ETHERNET and HSS SUPPORT
 M:	Krzysztof Halasa <khalasa@piap.pl>
@@ -8953,7 +8953,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	https://linuxtv.org
 S:	Maintained
-F:	Documentation/media/v4l-drivers/ivtv*
+F:	Documentation/admin-guide/media/ivtv*
 F:	drivers/media/pci/ivtv/
 F:	include/uapi/linux/ivtv*
 
@@ -10322,7 +10322,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx.txt
-F:	Documentation/media/v4l-drivers/imx.rst
+F:	Documentation/admin-guide/media/imx.rst
 F:	drivers/staging/media/imx/
 F:	include/linux/imx-media.h
 F:	include/media/imx.h
@@ -10341,7 +10341,7 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/imx7-csi.txt
 F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
-F:	Documentation/media/v4l-drivers/imx7.rst
+F:	Documentation/admin-guide/media/imx7.rst
 F:	drivers/staging/media/imx/imx7-media-csi.c
 F:	drivers/staging/media/imx/imx7-mipi-csis.c
 
@@ -13570,7 +13570,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/usb/pulse8-cec/*
-F:	Documentation/media/cec-drivers/pulse8-cec.rst
+F:	Documentation/admin-guide/media/pulse8-cec.rst
 
 PVRUSB2 VIDEO4LINUX DRIVER
 M:	Mike Isely <isely@pobox.com>
@@ -13820,7 +13820,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,camss.txt
-F:	Documentation/media/v4l-drivers/qcom_camss.rst
+F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
@@ -16828,7 +16828,7 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Odd fixes
 F:	drivers/media/usb/tm6000/
-F:	Documentation/media/v4l-drivers/tm6000*
+F:	Documentation/admin-guide/media/tm6000*
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
@@ -17502,7 +17502,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	http://royale.zerezo.com/zr364xx/
 S:	Maintained
-F:	Documentation/media/v4l-drivers/zr364xx*
+F:	Documentation/admin-guide/media/zr364xx*
 F:	drivers/media/usb/zr364xx/
 
 USER-MODE LINUX (UML)
diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
index 75d172a6f54c..3f56decbb681 100644
--- a/drivers/media/pci/bt8xx/Kconfig
+++ b/drivers/media/pci/bt8xx/Kconfig
@@ -17,7 +17,7 @@ config VIDEO_BT848
 	help
 	  Support for BT848 based frame grabber/overlay boards. This includes
 	  the Miro, Hauppauge and STB boards. Please read the material in
-	  <file:Documentation/media/v4l-drivers/bttv.rst> for more information.
+	  <file:Documentation/admin-guide/media/bttv.rst> for more information.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called bttv.
diff --git a/drivers/media/pci/meye/Kconfig b/drivers/media/pci/meye/Kconfig
index b37da612dd0c..fed1f4a01817 100644
--- a/drivers/media/pci/meye/Kconfig
+++ b/drivers/media/pci/meye/Kconfig
@@ -7,7 +7,7 @@ config VIDEO_MEYE
 	help
 	  This is the video4linux driver for the Motion Eye camera found
 	  in the Vaio Picturebook laptops. Please read the material in
-	  <file:Documentation/media/v4l-drivers/meye.rst> for more information.
+	  <file:Documentation/admin-guide/media/meye.rst> for more information.
 
 	  If you say Y or M here, you need to say Y or M to "Sony Laptop
 	  Extras" in the misc device section.
diff --git a/drivers/media/radio/si470x/Kconfig b/drivers/media/radio/si470x/Kconfig
index a1ba8bc54b62..7161bd6cd13c 100644
--- a/drivers/media/radio/si470x/Kconfig
+++ b/drivers/media/radio/si470x/Kconfig
@@ -30,7 +30,7 @@ config USB_SI470X
 
 	  Please have a look at the documentation, especially on how
 	  to redirect the audio stream from the radio to your sound device:
-	  Documentation/media/v4l-drivers/si470x.rst
+	  Documentation/admin-guide/media/si470x.rst
 
 	  Say Y here if you want to connect this type of radio to your
 	  computer's USB port.
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 62d3566bf7ee..4cf09c5c8216 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -22,7 +22,7 @@
  *
  * LME2510C + M88RS2000
  *
- * For firmware see Documentation/media/dvb-drivers/lmedm04.rst
+ * For firmware see Documentation/admin-guide/media/lmedm04.rst
  *
  * I2C addresses:
  * 0xd0 - STV0288	- Demodulator
diff --git a/drivers/media/usb/gspca/Kconfig b/drivers/media/usb/gspca/Kconfig
index 77a360958239..0283e3b908e4 100644
--- a/drivers/media/usb/gspca/Kconfig
+++ b/drivers/media/usb/gspca/Kconfig
@@ -9,7 +9,7 @@ menuconfig USB_GSPCA
 	  Say Y here if you want to enable selecting webcams based
 	  on the GSPCA framework.
 
-	  See <file:Documentation/media/v4l-drivers/gspca-cardlist.rst> for more info.
+	  See <file:Documentation/admin-guide/media/gspca-cardlist.rst> for more info.
 
 	  This driver uses the Video For Linux API. You must say Y or M to
 	  "Video For Linux" to use this driver.
diff --git a/drivers/media/usb/zr364xx/Kconfig b/drivers/media/usb/zr364xx/Kconfig
index 55b06c833667..49b4257487bb 100644
--- a/drivers/media/usb/zr364xx/Kconfig
+++ b/drivers/media/usb/zr364xx/Kconfig
@@ -7,7 +7,7 @@ config USB_ZR364XX
 	help
 	  Say Y here if you want to connect this type of camera to your
 	  computer's USB port.
-	  See <file:Documentation/media/v4l-drivers/zr364xx.rst> for more info
+	  See <file:Documentation/admin-guide/media/zr364xx.rst> for more info
 	  and list of supported cameras.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.24.1

