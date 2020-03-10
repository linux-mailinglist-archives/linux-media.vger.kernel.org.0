Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E951317FEF8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgCJNnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:37586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbgCJNnU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:20 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B941246B6;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847798;
        bh=lVHkDNpnpzrcLSRpET+Grjg08DvgSIXFoHTdz6WxjsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fz34zmifYSNidktHPChyGfwuftubeOhtbPAXTxVwR9vkKvUuvSOZ34AhpvAEeH4B2
         HuWLLZ5jsQ6HS9DFRF8yYUAKxGJnXojshn+ypZUTJCeLq5YhuMswhBkaaGM8icc3Uo
         QbfRkArPCt0Zr+nf561dElsB/B9OD/eyI2DhibnQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wl-NH; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org, Mike Isely <isely@pobox.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Antti Palosaari <crope@iki.fi>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Michael Krufky <mkrufky@linuxtv.org>
Subject: [PATCH v2 20/22] media: docs: move driver-specific info to driver-api
Date:   Tue, 10 Mar 2020 14:43:11 +0100
Message-Id: <5dc2f7a4f15397d5e811d5bb8d110ee53135cf07.1583847557.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those documents don't really describe the driver API.

Instead, they contain development-specific information.

Yet, as the main index file describes the content of it as:

	"how specific kernel subsystems work
	 from the point of view of a kernel developer"

It seems to be the better fit.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/drivers}/bttv-devel.rst             |  0
 .../media/drivers}/contributors.rst           |  0
 .../media/drivers}/cpia2_devel.rst            |  0
 .../media/drivers}/cx2341x-devel.rst          |  0
 .../media/drivers}/cx88-devel.rst             |  0
 .../media/drivers}/davinci-vpbe-devel.rst     |  0
 .../media/drivers}/dvb-usb.rst                |  0
 .../media/drivers}/fimc-devel.rst             |  0
 .../media/drivers}/frontends.rst              |  0
 .../media/drivers}/index.rst                  | 29 ++++++++++++++++++-
 .../media/drivers}/pvrusb2.rst                |  0
 .../media/drivers}/pxa_camera.rst             |  0
 .../media/drivers}/radiotrack.rst             |  0
 .../media/drivers}/saa7134-devel.rst          |  0
 .../media/drivers}/sh_mobile_ceu_camera.rst   |  0
 .../media/drivers}/tuners.rst                 |  0
 .../media/drivers}/vimc-devel.rst             |  0
 Documentation/driver-api/media/index.rst      |  2 ++
 Documentation/media/index.rst                 |  1 -
 Documentation/media/v4l-drivers/index.rst     | 14 ---------
 MAINTAINERS                                   |  8 ++---
 drivers/media/dvb-frontends/dib3000.h         |  2 +-
 drivers/media/dvb-frontends/dib3000mb.c       |  2 +-
 drivers/media/dvb-frontends/eds1547.h         |  2 +-
 drivers/media/dvb-frontends/z0194a.h          |  2 +-
 drivers/media/pci/cx18/cx18-streams.c         |  4 +--
 drivers/media/platform/pxa_camera.c           |  4 +--
 drivers/media/radio/Kconfig                   |  2 +-
 drivers/media/usb/dvb-usb-v2/Kconfig          |  2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c          |  2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |  2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.h        |  2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       |  2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.h       |  2 +-
 drivers/media/usb/dvb-usb/Kconfig             |  2 +-
 drivers/media/usb/dvb-usb/a800.c              |  2 +-
 drivers/media/usb/dvb-usb/af9005-fe.c         |  2 +-
 drivers/media/usb/dvb-usb/af9005-remote.c     |  2 +-
 drivers/media/usb/dvb-usb/af9005.c            |  2 +-
 drivers/media/usb/dvb-usb/af9005.h            |  2 +-
 drivers/media/usb/dvb-usb/az6027.c            |  2 +-
 drivers/media/usb/dvb-usb/cxusb.c             |  2 +-
 drivers/media/usb/dvb-usb/dibusb-common.c     |  2 +-
 drivers/media/usb/dvb-usb/dibusb-mb.c         |  2 +-
 drivers/media/usb/dvb-usb/dibusb-mc-common.c  |  2 +-
 drivers/media/usb/dvb-usb/dibusb-mc.c         |  2 +-
 drivers/media/usb/dvb-usb/dibusb.h            |  2 +-
 drivers/media/usb/dvb-usb/digitv.c            |  2 +-
 drivers/media/usb/dvb-usb/dtt200u-fe.c        |  2 +-
 drivers/media/usb/dvb-usb/dtt200u.c           |  2 +-
 drivers/media/usb/dvb-usb/dtt200u.h           |  2 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c      |  2 +-
 drivers/media/usb/dvb-usb/dw2102.c            |  2 +-
 drivers/media/usb/dvb-usb/gp8psk.c            |  2 +-
 drivers/media/usb/dvb-usb/gp8psk.h            |  2 +-
 drivers/media/usb/dvb-usb/m920x.c             |  2 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c       |  2 +-
 drivers/media/usb/dvb-usb/opera1.c            |  2 +-
 drivers/media/usb/dvb-usb/ttusb2.c            |  2 +-
 drivers/media/usb/dvb-usb/ttusb2.h            |  2 +-
 drivers/media/usb/dvb-usb/umt-010.c           |  2 +-
 drivers/media/usb/dvb-usb/vp702x-fe.c         |  2 +-
 drivers/media/usb/dvb-usb/vp702x.c            |  2 +-
 drivers/media/usb/dvb-usb/vp7045-fe.c         |  2 +-
 drivers/media/usb/dvb-usb/vp7045.c            |  2 +-
 drivers/media/usb/dvb-usb/vp7045.h            |  2 +-
 66 files changed, 81 insertions(+), 67 deletions(-)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/bttv-devel.rst (100%)
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/contributors.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cpia2_devel.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cx2341x-devel.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/cx88-devel.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/davinci-vpbe-devel.rst (100%)
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/dvb-usb.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/fimc-devel.rst (100%)
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/frontends.rst (100%)
 rename Documentation/{media/dvb-drivers => driver-api/media/drivers}/index.rst (67%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pvrusb2.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/pxa_camera.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/radiotrack.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/saa7134-devel.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/sh_mobile_ceu_camera.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/tuners.rst (100%)
 rename Documentation/{media/v4l-drivers => driver-api/media/drivers}/vimc-devel.rst (100%)

diff --git a/Documentation/media/v4l-drivers/bttv-devel.rst b/Documentation/driver-api/media/drivers/bttv-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/bttv-devel.rst
rename to Documentation/driver-api/media/drivers/bttv-devel.rst
diff --git a/Documentation/media/dvb-drivers/contributors.rst b/Documentation/driver-api/media/drivers/contributors.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/contributors.rst
rename to Documentation/driver-api/media/drivers/contributors.rst
diff --git a/Documentation/media/v4l-drivers/cpia2_devel.rst b/Documentation/driver-api/media/drivers/cpia2_devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cpia2_devel.rst
rename to Documentation/driver-api/media/drivers/cpia2_devel.rst
diff --git a/Documentation/media/v4l-drivers/cx2341x-devel.rst b/Documentation/driver-api/media/drivers/cx2341x-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cx2341x-devel.rst
rename to Documentation/driver-api/media/drivers/cx2341x-devel.rst
diff --git a/Documentation/media/v4l-drivers/cx88-devel.rst b/Documentation/driver-api/media/drivers/cx88-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/cx88-devel.rst
rename to Documentation/driver-api/media/drivers/cx88-devel.rst
diff --git a/Documentation/media/v4l-drivers/davinci-vpbe-devel.rst b/Documentation/driver-api/media/drivers/davinci-vpbe-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/davinci-vpbe-devel.rst
rename to Documentation/driver-api/media/drivers/davinci-vpbe-devel.rst
diff --git a/Documentation/media/dvb-drivers/dvb-usb.rst b/Documentation/driver-api/media/drivers/dvb-usb.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/dvb-usb.rst
rename to Documentation/driver-api/media/drivers/dvb-usb.rst
diff --git a/Documentation/media/v4l-drivers/fimc-devel.rst b/Documentation/driver-api/media/drivers/fimc-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/fimc-devel.rst
rename to Documentation/driver-api/media/drivers/fimc-devel.rst
diff --git a/Documentation/media/dvb-drivers/frontends.rst b/Documentation/driver-api/media/drivers/frontends.rst
similarity index 100%
rename from Documentation/media/dvb-drivers/frontends.rst
rename to Documentation/driver-api/media/drivers/frontends.rst
diff --git a/Documentation/media/dvb-drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
similarity index 67%
rename from Documentation/media/dvb-drivers/index.rst
rename to Documentation/driver-api/media/drivers/index.rst
index 7a870ee7ac7d..aafff51f7e0e 100644
--- a/Documentation/media/dvb-drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -2,6 +2,34 @@
 
 .. include:: <isonum.txt>
 
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
+
+	bttv-devel
+	cpia2_devel
+	cx2341x-devel
+	cx88-devel
+	davinci-vpbe-devel
+	fimc-devel
+	pvrusb2
+	pxa_camera
+	radiotrack
+	saa7134-devel
+	sh_mobile_ceu_camera
+	tuners
+	vimc-devel
+
+
 ##############################################
 Linux Digital TV driver-specific documentation
 ##############################################
@@ -27,7 +55,6 @@ For more details see the file COPYING in the source distribution of Linux.
 
 .. toctree::
 	:maxdepth: 5
-	:numbered:
 
 	dvb-usb
 	frontends
diff --git a/Documentation/media/v4l-drivers/pvrusb2.rst b/Documentation/driver-api/media/drivers/pvrusb2.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/pvrusb2.rst
rename to Documentation/driver-api/media/drivers/pvrusb2.rst
diff --git a/Documentation/media/v4l-drivers/pxa_camera.rst b/Documentation/driver-api/media/drivers/pxa_camera.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/pxa_camera.rst
rename to Documentation/driver-api/media/drivers/pxa_camera.rst
diff --git a/Documentation/media/v4l-drivers/radiotrack.rst b/Documentation/driver-api/media/drivers/radiotrack.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/radiotrack.rst
rename to Documentation/driver-api/media/drivers/radiotrack.rst
diff --git a/Documentation/media/v4l-drivers/saa7134-devel.rst b/Documentation/driver-api/media/drivers/saa7134-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/saa7134-devel.rst
rename to Documentation/driver-api/media/drivers/saa7134-devel.rst
diff --git a/Documentation/media/v4l-drivers/sh_mobile_ceu_camera.rst b/Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/sh_mobile_ceu_camera.rst
rename to Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst
diff --git a/Documentation/media/v4l-drivers/tuners.rst b/Documentation/driver-api/media/drivers/tuners.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/tuners.rst
rename to Documentation/driver-api/media/drivers/tuners.rst
diff --git a/Documentation/media/v4l-drivers/vimc-devel.rst b/Documentation/driver-api/media/drivers/vimc-devel.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/vimc-devel.rst
rename to Documentation/driver-api/media/drivers/vimc-devel.rst
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index d2842f300bbd..57383df79bd3 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -36,3 +36,5 @@ For more details see the file COPYING in the source distribution of Linux.
     mc-core
     cec-core
     csi2
+
+    drivers/index
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index 0f75280b8c43..a5cd600e0b04 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -16,7 +16,6 @@ Linux Media Subsystem Documentation
    ../driver-api/media/index
 
    v4l-drivers/index
-   dvb-drivers/index
 
 .. only:: html and subproject
 
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index aef375cfb05a..ee7faff88a33 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -31,23 +31,9 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
-	tuners
 	max2175
-	pvrusb2
-	pxa_camera
-	radiotrack
-	sh_mobile_ceu_camera
 	uvcvideo
 
-	bttv-devel
-	cpia2_devel
-	cx2341x-devel
-	cx88-devel
-	davinci-vpbe-devel
-	fimc-devel
-	saa7134-devel
-	vimc-devel
-
 	cx2341x-uapi
 	imx-uapi
 	meye-uapi
diff --git a/MAINTAINERS b/MAINTAINERS
index fbb8b1f13cb8..cf4fd454e053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3621,7 +3621,7 @@ L:	linux-media@vger.kernel.org
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Odd fixes
-F:	Documentation/media/v4l-drivers/bttv*
+F:	Documentation/driver-api/media/drivers/bttv*
 F:	drivers/media/pci/bt8xx/bttv*
 
 BUS FREQUENCY DRIVER FOR SAMSUNG EXYNOS
@@ -4514,7 +4514,7 @@ L:	linux-media@vger.kernel.org
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Odd fixes
-F:	Documentation/media/v4l-drivers/cx88*
+F:	Documentation/driver-api/media/drivers/cx88*
 F:	drivers/media/pci/cx88/
 
 CXD2820R MEDIA DRIVER
@@ -13579,7 +13579,7 @@ L:	linux-media@vger.kernel.org
 W:	http://www.isely.net/pvrusb2/
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
-F:	Documentation/media/v4l-drivers/pvrusb2*
+F:	Documentation/driver-api/media/drivers/pvrusb2*
 F:	drivers/media/usb/pvrusb2/
 
 PWC WEBCAM DRIVER
@@ -14583,7 +14583,7 @@ L:	linux-media@vger.kernel.org
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Odd fixes
-F:	Documentation/media/v4l-drivers/saa7134*
+F:	Documentation/driver-api/media/drivers/saa7134*
 F:	drivers/media/pci/saa7134/
 
 SAA7146 VIDEO4LINUX-2 DRIVER
diff --git a/drivers/media/dvb-frontends/dib3000.h b/drivers/media/dvb-frontends/dib3000.h
index 9118a7a48ef2..3f129efa21de 100644
--- a/drivers/media/dvb-frontends/dib3000.h
+++ b/drivers/media/dvb-frontends/dib3000.h
@@ -14,7 +14,7 @@
  *  Amaury Demol from DiBcom for providing specs and driver
  *  sources, on which this driver (and the dvb-dibusb) are based.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #ifndef DIB3000_H
diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
index 46ed0e20c8fa..0f0480d8576d 100644
--- a/drivers/media/dvb-frontends/dib3000mb.c
+++ b/drivers/media/dvb-frontends/dib3000mb.c
@@ -14,7 +14,7 @@
  *  Amaury Demol from DiBcom for providing specs and driver
  *  sources, on which this driver (and the dvb-dibusb) are based.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/media/dvb-frontends/eds1547.h b/drivers/media/dvb-frontends/eds1547.h
index 907254b85708..bb85a6e27076 100644
--- a/drivers/media/dvb-frontends/eds1547.h
+++ b/drivers/media/dvb-frontends/eds1547.h
@@ -3,7 +3,7 @@
 *
 * Copyright (C) 2008 Igor M. Liplianin (liplianin@me.by)
 *
-* see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+* see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
 */
 
 #ifndef EDS1547
diff --git a/drivers/media/dvb-frontends/z0194a.h b/drivers/media/dvb-frontends/z0194a.h
index 21442905d116..3446ccbf3c1c 100644
--- a/drivers/media/dvb-frontends/z0194a.h
+++ b/drivers/media/dvb-frontends/z0194a.h
@@ -3,7 +3,7 @@
 *
 * Copyright (C) 2008 Igor M. Liplianin (liplianin@me.by)
 *
-* see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+* see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
 */
 
 #ifndef Z0194A
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 0e2365c9f4ad..c41bae118415 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -845,7 +845,7 @@ int cx18_start_v4l2_encode_stream(struct cx18_stream *s)
 
 		/*
 		 * Audio related reset according to
-		 * Documentation/media/v4l-drivers/cx2341x-devel.rst
+		 * Documentation/driver-api/media/drivers/cx2341x-devel.rst
 		 */
 		if (atomic_read(&cx->ana_capturing) == 0)
 			cx18_vapi(cx, CX18_CPU_SET_MISC_PARAMETERS, 2,
@@ -853,7 +853,7 @@ int cx18_start_v4l2_encode_stream(struct cx18_stream *s)
 
 		/*
 		 * Number of lines for Field 1 & Field 2 according to
-		 * Documentation/media/v4l-drivers/cx2341x-devel.rst
+		 * Documentation/driver-api/media/drivers/cx2341x-devel.rst
 		 * Field 1 is 312 for 625 line systems in BT.656
 		 * Field 2 is 313 for 625 line systems in BT.656
 		 */
diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 70c85a2a10f5..3c5fe737d36f 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1016,7 +1016,7 @@ static void pxa_camera_wakeup(struct pxa_camera_dev *pcdev,
  *  - a videobuffer is queued on the pcdev->capture list
  *
  * Please check the "DMA hot chaining timeslice issue" in
- *   Documentation/media/v4l-drivers/pxa_camera.rst
+ *   Documentation/driver-api/media/drivers/pxa_camera.rst
  *
  * Context: should only be called within the dma irq handler
  */
@@ -1438,7 +1438,7 @@ static void pxac_vb2_queue(struct vb2_buffer *vb)
 
 /*
  * Please check the DMA prepared buffer structure in :
- *   Documentation/media/v4l-drivers/pxa_camera.rst
+ *   Documentation/driver-api/media/drivers/pxa_camera.rst
  * Please check also in pxa_camera_check_link_miss() to understand why DMA chain
  * modification while DMA chain is running will work anyway.
  */
diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
index f4df16df19d9..d29e29645e04 100644
--- a/drivers/media/radio/Kconfig
+++ b/drivers/media/radio/Kconfig
@@ -272,7 +272,7 @@ config RADIO_RTRACK
 	  been reported to be used by these cards.
 
 	  More information is contained in the file
-	  <file:Documentation/media/v4l-drivers/radiotrack.rst>.
+	  <file:Documentation/driver-api/media/drivers/radiotrack.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called radio-aimslab.
diff --git a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
index b21a4d413872..ff0ae64424c4 100644
--- a/drivers/media/usb/dvb-usb-v2/Kconfig
+++ b/drivers/media/usb/dvb-usb-v2/Kconfig
@@ -7,7 +7,7 @@ config DVB_USB_V2
 	  USB1.1 and USB2.0 DVB devices.
 
 	  Almost every USB device needs a firmware, please look into
-	  <file:Documentation/media/dvb-drivers/dvb-usb.rst>.
+	  <file:Documentation/driver-api/media/drivers/dvb-usb.rst>.
 
 	  For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 	  <https://linuxtv.org/wiki/index.php/DVB_USB>
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index 19217dcf20f1..42c3b8af0774 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* DVB USB compliant linux driver for GL861 USB2.0 devices.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include <linux/string.h>
 
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 4cf09c5c8216..36a599502f92 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -39,7 +39,7 @@
  * Copyright (C) 2010 Malcolm Priestley (tvboxspy@gmail.com)
  * LME2510(C)(C) Leaguerme (Shenzhen) MicroElectronics Co., Ltd.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  *
  * Known Issues :
  *	LME2510: Non Intel USB chipsets fail to maintain High Speed on
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.h b/drivers/media/usb/dvb-usb-v2/lmedm04.h
index 766a8348624d..4335b6ebcc1c 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.h
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.h
@@ -14,7 +14,7 @@
  * MVB0001F (LME2510C+LGTDQT-P001F)
  *
  * *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_LME2510_H_
 #define _DVB_USB_LME2510_H_
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 55b4ae7037a4..7865fa0a8295 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2010-2014 Michael Krufky (mkrufky@linuxtv.org)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #include <linux/vmalloc.h>
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.h b/drivers/media/usb/dvb-usb-v2/mxl111sf.h
index 70bd2a2a8ec1..e57e5d2353b4 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.h
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2010-2014 Michael Krufky (mkrufky@linuxtv.org)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #ifndef _DVB_USB_MXL111SF_H_
diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index 1a3e5f965ae4..5360dc1a2210 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -7,7 +7,7 @@ config DVB_USB
 	  USB1.1 and USB2.0 DVB devices.
 
 	  Almost every USB device needs a firmware, please look into
-	  <file:Documentation/media/dvb-drivers/dvb-usb.rst>.
+	  <file:Documentation/driver-api/media/drivers/dvb-usb.rst>.
 
 	  For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 	  <https://linuxtv.org/wiki/index.php/DVB_USB>
diff --git a/drivers/media/usb/dvb-usb/a800.c b/drivers/media/usb/dvb-usb/a800.c
index 666213f5d5d8..15bbefe3bc00 100644
--- a/drivers/media/usb/dvb-usb/a800.c
+++ b/drivers/media/usb/dvb-usb/a800.c
@@ -8,7 +8,7 @@
  *   - AVerMedia who kindly provided information and
  *   - Glen Harris who suffered from my mistakes during development.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dibusb.h"
 
diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 6c960f723457..9d6fa0556d7b 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -6,7 +6,7 @@
  *
  * Thanks to Afatech who kindly provided information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "af9005.h"
 #include "af9005-script.h"
diff --git a/drivers/media/usb/dvb-usb/af9005-remote.c b/drivers/media/usb/dvb-usb/af9005-remote.c
index c664353f3911..41d48b3c8d05 100644
--- a/drivers/media/usb/dvb-usb/af9005-remote.c
+++ b/drivers/media/usb/dvb-usb/af9005-remote.c
@@ -8,7 +8,7 @@
  *
  * Thanks to Afatech who kindly provided information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "af9005.h"
 /* debug */
diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index 89b4b5d84cdf..3446bcac8ed1 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -6,7 +6,7 @@
  *
  * Thanks to Afatech who kindly provided information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "af9005.h"
 
diff --git a/drivers/media/usb/dvb-usb/af9005.h b/drivers/media/usb/dvb-usb/af9005.h
index 3179a7c71e8f..11d74dc26d83 100644
--- a/drivers/media/usb/dvb-usb/af9005.h
+++ b/drivers/media/usb/dvb-usb/af9005.h
@@ -6,7 +6,7 @@
  *
  * Thanks to Afatech who kindly provided information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_AF9005_H_
 #define _DVB_USB_AF9005_H_
diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 8de18da0c4bd..d5be540e31a7 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2009 Adams.Xu <adams.xu@azwave.com.cn>
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "az6027.h"
 
diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index c421b603be44..fd058f71ce49 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -18,7 +18,7 @@
  * Copyright (C) 2006, 2007 Chris Pascoe (c.pascoe@itee.uq.edu.au)
  * Copyright (C) 2011, 2017 Maciej S. Szmigiero (mail@maciej.szmigiero.name)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include <media/tuner.h>
 #include <linux/delay.h>
diff --git a/drivers/media/usb/dvb-usb/dibusb-common.c b/drivers/media/usb/dvb-usb/dibusb-common.c
index 59ce2dec11e9..02b51d1a1b67 100644
--- a/drivers/media/usb/dvb-usb/dibusb-common.c
+++ b/drivers/media/usb/dvb-usb/dibusb-common.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #include "dibusb.h"
diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/dvb-usb/dibusb-mb.c
index d4ea72bf09c5..f462c918d5a4 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mb.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
@@ -7,7 +7,7 @@
  * based on GPL code from DiBcom, which has
  * Copyright (C) 2004 Amaury Demol for DiBcom
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dibusb.h"
 
diff --git a/drivers/media/usb/dvb-usb/dibusb-mc-common.c b/drivers/media/usb/dvb-usb/dibusb-mc-common.c
index 967027e29c17..b8cde4cded33 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mc-common.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mc-common.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@desy.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #include "dibusb.h"
diff --git a/drivers/media/usb/dvb-usb/dibusb-mc.c b/drivers/media/usb/dvb-usb/dibusb-mc.c
index ada3bee296c2..e2689977c8c8 100644
--- a/drivers/media/usb/dvb-usb/dibusb-mc.c
+++ b/drivers/media/usb/dvb-usb/dibusb-mc.c
@@ -7,7 +7,7 @@
  * based on GPL code from DiBcom, which has
  * Copyright (C) 2004 Amaury Demol for DiBcom
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dibusb.h"
 
diff --git a/drivers/media/usb/dvb-usb/dibusb.h b/drivers/media/usb/dvb-usb/dibusb.h
index a83326c36ca7..f61de0744821 100644
--- a/drivers/media/usb/dvb-usb/dibusb.h
+++ b/drivers/media/usb/dvb-usb/dibusb.h
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_DIBUSB_H_
 #define _DVB_USB_DIBUSB_H_
diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index 99a39339d45d..906438c5a40f 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -6,7 +6,7 @@
  *
  * partly based on the SDK published by Nebula Electronics
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "digitv.h"
 
diff --git a/drivers/media/usb/dvb-usb/dtt200u-fe.c b/drivers/media/usb/dvb-usb/dtt200u-fe.c
index 00ce723c7bf0..9f83560ba63d 100644
--- a/drivers/media/usb/dvb-usb/dtt200u-fe.c
+++ b/drivers/media/usb/dvb-usb/dtt200u-fe.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2005 Patrick Boettcher <patrick.boettcher@posteo.de>
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dtt200u.h"
 
diff --git a/drivers/media/usb/dvb-usb/dtt200u.c b/drivers/media/usb/dvb-usb/dtt200u.c
index 1e7296b2e5b2..24efa023d827 100644
--- a/drivers/media/usb/dvb-usb/dtt200u.c
+++ b/drivers/media/usb/dvb-usb/dtt200u.c
@@ -6,7 +6,7 @@
  *
  * Thanks to Steve Chang from WideView for providing support for the WT-220U.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dtt200u.h"
 
diff --git a/drivers/media/usb/dvb-usb/dtt200u.h b/drivers/media/usb/dvb-usb/dtt200u.h
index 832f355114e4..696c2c1f3af3 100644
--- a/drivers/media/usb/dvb-usb/dtt200u.h
+++ b/drivers/media/usb/dvb-usb/dtt200u.h
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_DTT200U_H_
 #define _DVB_USB_DTT200U_H_
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 16a0b4a359ea..46ada09ce38a 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -6,7 +6,7 @@
  *
  * Copyright (C) 2004-6 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dvb-usb-common.h"
 
diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index 8b584507dd59..4c82acba318f 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -8,7 +8,7 @@
  *	Terratec Cinergy S2 cards
  * Copyright (C) 2008-2012 Igor M. Liplianin (liplianin@me.by)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include <media/dvb-usb-ids.h>
 #include "dw2102.h"
diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index 1282f701f185..c07f46f5176e 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -9,7 +9,7 @@
  *
  * This module is based off the vp7045 and vp702x modules
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "gp8psk.h"
 #include "gp8psk-fe.h"
diff --git a/drivers/media/usb/dvb-usb/gp8psk.h b/drivers/media/usb/dvb-usb/gp8psk.h
index 2f4c1368eabe..5293dfdd2609 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.h
+++ b/drivers/media/usb/dvb-usb/gp8psk.h
@@ -9,7 +9,7 @@
  *
  * This module is based off the vp7045 and vp702x modules
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_GP8PSK_H_
 #define _DVB_USB_GP8PSK_H_
diff --git a/drivers/media/usb/dvb-usb/m920x.c b/drivers/media/usb/dvb-usb/m920x.c
index d866a1990a7d..b8b99be5564b 100644
--- a/drivers/media/usb/dvb-usb/m920x.c
+++ b/drivers/media/usb/dvb-usb/m920x.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2006 Aapo Tahkola (aet@rasterburn.org)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 
 #include "m920x.h"
diff --git a/drivers/media/usb/dvb-usb/nova-t-usb2.c b/drivers/media/usb/dvb-usb/nova-t-usb2.c
index e368935a5089..e7b290552b66 100644
--- a/drivers/media/usb/dvb-usb/nova-t-usb2.c
+++ b/drivers/media/usb/dvb-usb/nova-t-usb2.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dibusb.h"
 
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 823b33ae828d..e8d784b9d119 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -4,7 +4,7 @@
 * Copyright (C) 2006 Mario Hlawitschka (dh1pa@amsat.org)
 * Copyright (C) 2006 Marco Gittler (g.marco@freenet.de)
 *
-* see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+* see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
 */
 
 #define DVB_USB_LOG_PREFIX "opera"
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index e12a5466b677..fd3e7312daef 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -17,7 +17,7 @@
  * Copyright (c) 2003 Felix Domke <tmbinc@elitedvb.net>
  * Copyright (C) 2005-6 Patrick Boettcher <pb@linuxtv.org>
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #define DVB_USB_LOG_PREFIX "ttusb2"
 #include "dvb-usb.h"
diff --git a/drivers/media/usb/dvb-usb/ttusb2.h b/drivers/media/usb/dvb-usb/ttusb2.h
index 8a3853cd6a26..b34c469d83f9 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.h
+++ b/drivers/media/usb/dvb-usb/ttusb2.h
@@ -6,7 +6,7 @@
  * Copyright (c) 2003 Felix Domke <tmbinc@elitedvb.net>
  * Copyright (C) 2005-6 Patrick Boettcher <pb@linuxtv.de>
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_TTUSB2_H_
 #define _DVB_USB_TTUSB2_H_
diff --git a/drivers/media/usb/dvb-usb/umt-010.c b/drivers/media/usb/dvb-usb/umt-010.c
index a2101bd43349..2181993771ae 100644
--- a/drivers/media/usb/dvb-usb/umt-010.c
+++ b/drivers/media/usb/dvb-usb/umt-010.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2004-5 Patrick Boettcher (patrick.boettcher@posteo.de)
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "dibusb.h"
 
diff --git a/drivers/media/usb/dvb-usb/vp702x-fe.c b/drivers/media/usb/dvb-usb/vp702x-fe.c
index 1c75a9c9dfca..c1e7931900ee 100644
--- a/drivers/media/usb/dvb-usb/vp702x-fe.c
+++ b/drivers/media/usb/dvb-usb/vp702x-fe.c
@@ -12,7 +12,7 @@
  * This file can be removed soon, after the DST-driver is rewritten to provice
  * the frontend-controlling separately.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "vp702x.h"
 
diff --git a/drivers/media/usb/dvb-usb/vp702x.c b/drivers/media/usb/dvb-usb/vp702x.c
index 381b5c898a07..bf54747e2e01 100644
--- a/drivers/media/usb/dvb-usb/vp702x.c
+++ b/drivers/media/usb/dvb-usb/vp702x.c
@@ -9,7 +9,7 @@
  *
  * Thanks to Twinhan who kindly provided hardware and information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "vp702x.h"
 #include <linux/mutex.h>
diff --git a/drivers/media/usb/dvb-usb/vp7045-fe.c b/drivers/media/usb/dvb-usb/vp7045-fe.c
index d253307a35f8..e99740ec2650 100644
--- a/drivers/media/usb/dvb-usb/vp7045-fe.c
+++ b/drivers/media/usb/dvb-usb/vp7045-fe.c
@@ -6,7 +6,7 @@
  *
  * Thanks to Twinhan who kindly provided hardware and information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "vp7045.h"
 
diff --git a/drivers/media/usb/dvb-usb/vp7045.c b/drivers/media/usb/dvb-usb/vp7045.c
index 2baf57216d19..23e3a90af1f4 100644
--- a/drivers/media/usb/dvb-usb/vp7045.c
+++ b/drivers/media/usb/dvb-usb/vp7045.c
@@ -7,7 +7,7 @@
  *
  * Thanks to Twinhan who kindly provided hardware and information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #include "vp7045.h"
 
diff --git a/drivers/media/usb/dvb-usb/vp7045.h b/drivers/media/usb/dvb-usb/vp7045.h
index 818366746c41..1c8438f22b97 100644
--- a/drivers/media/usb/dvb-usb/vp7045.h
+++ b/drivers/media/usb/dvb-usb/vp7045.h
@@ -6,7 +6,7 @@
  *
  * Thanks to Twinhan who kindly provided hardware and information.
  *
- * see Documentation/media/dvb-drivers/dvb-usb.rst for more information
+ * see Documentation/driver-api/media/drivers/dvb-usb.rst for more information
  */
 #ifndef _DVB_USB_VP7045_H_
 #define _DVB_USB_VP7045_H_
-- 
2.24.1

