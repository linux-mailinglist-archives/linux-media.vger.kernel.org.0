Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDEB2CBE57
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgLBNbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbgLBNbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:31:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E5CC0617A7
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 05:30:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkSDa-0000LO-VM; Wed, 02 Dec 2020 14:30:52 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkSDa-008CeV-91; Wed, 02 Dec 2020 14:30:50 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Wed,  2 Dec 2020 14:30:37 +0100
Message-Id: <20201202133040.1954837-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201202133040.1954837-1-m.tretter@pengutronix.de>
References: <20201202133040.1954837-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH v2 1/4] media: allegro: move driver out of staging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stateful encoder API was finalized. Nothing is blocking the driver
from being moved out of staging.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2: none
---
 MAINTAINERS                                      |  2 +-
 drivers/media/platform/Kconfig                   | 15 +++++++++++++++
 drivers/media/platform/Makefile                  |  1 +
 .../platform}/allegro-dvt/Makefile               |  0
 .../platform}/allegro-dvt/allegro-core.c         |  0
 .../platform}/allegro-dvt/allegro-mail.c         |  0
 .../platform}/allegro-dvt/allegro-mail.h         |  0
 .../platform}/allegro-dvt/nal-h264.c             |  0
 .../platform}/allegro-dvt/nal-h264.h             |  0
 drivers/staging/media/Kconfig                    |  2 --
 drivers/staging/media/Makefile                   |  1 -
 drivers/staging/media/allegro-dvt/Kconfig        | 16 ----------------
 drivers/staging/media/allegro-dvt/TODO           |  4 ----
 13 files changed, 17 insertions(+), 24 deletions(-)
 rename drivers/{staging/media => media/platform}/allegro-dvt/Makefile (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-core.c (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.c (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.h (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.c (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.h (100%)
 delete mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 delete mode 100644 drivers/staging/media/allegro-dvt/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index a22392994667..479b45878280 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -699,7 +699,7 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	drivers/staging/media/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/
 
 ALLWINNER A10 CSI DRIVER
 M:	Maxime Ripard <mripard@kernel.org>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ffffef2267f4..feb7ac93339c 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -199,6 +199,21 @@ menuconfig V4L_MEM2MEM_DRIVERS
 
 if V4L_MEM2MEM_DRIVERS
 
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  Support for the encoder video IP core by Allegro DVT. This core is
+	  found for example on the Xilinx ZynqMP SoC in the EV family and is
+	  called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
+
 config VIDEO_CODA
 	tristate "Chips&Media Coda multi-standard codec IP"
 	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index b342714228db..a111bc363876 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the video capture/playback device drivers.
 #
 
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT)		+= allegro-dvt/
 obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
 obj-$(CONFIG_VIDEO_CADENCE)		+= cadence/
 obj-$(CONFIG_VIDEO_VIA_CAMERA) += via-camera.o
diff --git a/drivers/staging/media/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
similarity index 100%
rename from drivers/staging/media/allegro-dvt/Makefile
rename to drivers/media/platform/allegro-dvt/Makefile
diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
similarity index 100%
rename from drivers/staging/media/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/allegro-core.c
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
similarity index 100%
rename from drivers/staging/media/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/allegro-mail.c
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/allegro-mail.h
similarity index 100%
rename from drivers/staging/media/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/allegro-mail.h
diff --git a/drivers/staging/media/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
similarity index 100%
rename from drivers/staging/media/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/nal-h264.c
diff --git a/drivers/staging/media/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
similarity index 100%
rename from drivers/staging/media/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/nal-h264.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e8996b1c3b35..ca59986b20f8 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -20,8 +20,6 @@ menuconfig STAGING_MEDIA
 if STAGING_MEDIA && MEDIA_SUPPORT
 
 # Please keep them in alphabetic order
-source "drivers/staging/media/allegro-dvt/Kconfig"
-
 source "drivers/staging/media/atomisp/Kconfig"
 
 source "drivers/staging/media/hantro/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 24b5873ff760..716929a1a313 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
diff --git a/drivers/staging/media/allegro-dvt/Kconfig b/drivers/staging/media/allegro-dvt/Kconfig
deleted file mode 100644
index 6b7107d9995c..000000000000
--- a/drivers/staging/media/allegro-dvt/Kconfig
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	select V4L2_MEM2MEM_DEV
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP
-	select REGMAP_MMIO
-	help
-	  Support for the encoder video IP core by Allegro DVT. This core is
-	  found for example on the Xilinx ZynqMP SoC in the EV family and is
-	  called VCU in the reference manual.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called allegro.
diff --git a/drivers/staging/media/allegro-dvt/TODO b/drivers/staging/media/allegro-dvt/TODO
deleted file mode 100644
index 99e19be0e45a..000000000000
--- a/drivers/staging/media/allegro-dvt/TODO
+++ /dev/null
@@ -1,4 +0,0 @@
-TODO:
-
-- This driver is waiting for the stateful encoder spec and corresponding
-  v4l2-compliance tests to be finalized.
-- 
2.20.1

