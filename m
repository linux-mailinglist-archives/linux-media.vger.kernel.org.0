Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E9A19249E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgCYJtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727438AbgCYJtm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:42 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF06E207FF;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=G1Zpf/k6Hb3T03w4vwxLj4X1Ixjyg+fmHSolYDaZla4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MQkXtKbDGZnW+A4PG/8FwWBG3rnIs6OD36lEnpCCZlNa9Wx3/HJjE5cSb7skkmNxA
         kkcSzu9UE4Mc4FtKAEgSS3JogtaJtKl3zq9/qtrM2Fl22KrOtBgzyA1Ce+ic5JQ9H+
         I1J/avKeaH5SDmwlP5/Rz+VMJmcuRl6j37hMlZVo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HTe-7m; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 08/22] media: split test drivers from platform directory
Date:   Wed, 25 Mar 2020 10:49:22 +0100
Message-Id: <adcebf497a4ee112db528502acae85981562d63e.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the first test device was added (vivi.c), there were just
one file. I was too lazy on that time to create a separate
directory just for it, so I kept it together with platform.

Now, we have vivid, vicodec, vim2m and vimc. Also, a new
virtual driver has been prepared to support DVB API.

So, it is time to solve this mess, by placing test stuff
on a separate directory.

It should be noticed that we also have some skeleton drivers
(for V4L and for DVB). For now, we'll keep them separate,
as they're not really test drivers, but instead, just
examples. The DVB frontend ones will likely be part of a new DVB
test driver. By that time, it should make sense to move them
here as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig                         | 15 +++++++++-
 drivers/media/platform/Kconfig                | 23 ---------------
 drivers/media/platform/Makefile               |  5 ----
 drivers/media/test_drivers/Kconfig            | 28 +++++++++++++++++++
 drivers/media/test_drivers/Makefile           |  9 ++++++
 .../vicodec/Kconfig                           |  0
 .../vicodec/Makefile                          |  0
 .../vicodec/codec-fwht.c                      |  0
 .../vicodec/codec-fwht.h                      |  0
 .../vicodec/codec-v4l2-fwht.c                 |  0
 .../vicodec/codec-v4l2-fwht.h                 |  0
 .../vicodec/vicodec-core.c                    |  0
 .../media/{platform => test_drivers}/vim2m.c  |  0
 .../{platform => test_drivers}/vimc/Kconfig   |  0
 .../{platform => test_drivers}/vimc/Makefile  |  0
 .../vimc/vimc-capture.c                       |  0
 .../vimc/vimc-common.c                        |  0
 .../vimc/vimc-common.h                        |  0
 .../vimc/vimc-core.c                          |  0
 .../vimc/vimc-debayer.c                       |  0
 .../vimc/vimc-scaler.c                        |  0
 .../vimc/vimc-sensor.c                        |  0
 .../vimc/vimc-streamer.c                      |  0
 .../vimc/vimc-streamer.h                      |  0
 .../{platform => test_drivers}/vivid/Kconfig  |  0
 .../{platform => test_drivers}/vivid/Makefile |  0
 .../vivid/vivid-cec.c                         |  0
 .../vivid/vivid-cec.h                         |  0
 .../vivid/vivid-core.c                        |  0
 .../vivid/vivid-core.h                        |  0
 .../vivid/vivid-ctrls.c                       |  0
 .../vivid/vivid-ctrls.h                       |  0
 .../vivid/vivid-kthread-cap.c                 |  0
 .../vivid/vivid-kthread-cap.h                 |  0
 .../vivid/vivid-kthread-out.c                 |  0
 .../vivid/vivid-kthread-out.h                 |  0
 .../vivid/vivid-kthread-touch.c               |  0
 .../vivid/vivid-kthread-touch.h               |  0
 .../vivid/vivid-meta-cap.c                    |  0
 .../vivid/vivid-meta-cap.h                    |  0
 .../vivid/vivid-meta-out.c                    |  0
 .../vivid/vivid-meta-out.h                    |  0
 .../vivid/vivid-osd.c                         |  0
 .../vivid/vivid-osd.h                         |  0
 .../vivid/vivid-radio-common.c                |  0
 .../vivid/vivid-radio-common.h                |  0
 .../vivid/vivid-radio-rx.c                    |  0
 .../vivid/vivid-radio-rx.h                    |  0
 .../vivid/vivid-radio-tx.c                    |  0
 .../vivid/vivid-radio-tx.h                    |  0
 .../vivid/vivid-rds-gen.c                     |  0
 .../vivid/vivid-rds-gen.h                     |  0
 .../vivid/vivid-sdr-cap.c                     |  0
 .../vivid/vivid-sdr-cap.h                     |  0
 .../vivid/vivid-touch-cap.c                   |  0
 .../vivid/vivid-touch-cap.h                   |  0
 .../vivid/vivid-vbi-cap.c                     |  0
 .../vivid/vivid-vbi-cap.h                     |  0
 .../vivid/vivid-vbi-gen.c                     |  0
 .../vivid/vivid-vbi-gen.h                     |  0
 .../vivid/vivid-vbi-out.c                     |  0
 .../vivid/vivid-vbi-out.h                     |  0
 .../vivid/vivid-vid-cap.c                     |  0
 .../vivid/vivid-vid-cap.h                     |  0
 .../vivid/vivid-vid-common.c                  |  0
 .../vivid/vivid-vid-common.h                  |  0
 .../vivid/vivid-vid-out.c                     |  0
 .../vivid/vivid-vid-out.h                     |  0
 68 files changed, 51 insertions(+), 29 deletions(-)
 create mode 100644 drivers/media/test_drivers/Kconfig
 create mode 100644 drivers/media/test_drivers/Makefile
 rename drivers/media/{platform => test_drivers}/vicodec/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-fwht.c (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-fwht.h (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-v4l2-fwht.c (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-v4l2-fwht.h (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/vicodec-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vim2m.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vimc/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-capture.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-debayer.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-scaler.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-sensor.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-streamer.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-streamer.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vivid/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-cec.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-cec.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-core.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-ctrls.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-ctrls.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-touch.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-touch.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-osd.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-osd.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-rx.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-rx.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-tx.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-tx.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-rds-gen.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-rds-gen.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-sdr-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-sdr-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-touch-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-touch-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-gen.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-gen.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-out.h (100%)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 7a3e09e87fe1..0ab3f9946945 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -99,7 +99,19 @@ config MEDIA_PLATFORM_SUPPORT
 	  on some GPU and newer CPU chipsets.
 
 	  Say Y when you want to be able so see such devices.
-endmenu # Types of devices to be supported
+
+config MEDIA_TEST_SUPPORT
+	bool "Test drivers"
+	help
+	  Those drivers should not be used on production Kernels, but
+	  can be useful on debug ones. It enables several dummy drivers
+	  that simulate a real hardware. Very useful to test userspace
+	  applications and to validate if the subsystem core is doesn't
+	  have regressions.
+
+	  Say Y when you have a software defined radio device.
+
+endmenu # media support types
 
 if MEDIA_SUPPORT
 
@@ -182,6 +194,7 @@ source "drivers/media/radio/Kconfig"
 
 # Common driver options
 source "drivers/media/common/Kconfig"
+source "drivers/media/test_drivers/Kconfig"
 
 if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c4178420d2c5..80028337bf00 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -529,29 +529,6 @@ config VIDEO_TI_SC
 config VIDEO_TI_CSC
 	tristate
 
-menuconfig V4L_TEST_DRIVERS
-	bool "Media test drivers"
-	depends on MEDIA_CAMERA_SUPPORT
-
-if V4L_TEST_DRIVERS
-
-source "drivers/media/platform/vimc/Kconfig"
-
-source "drivers/media/platform/vivid/Kconfig"
-
-config VIDEO_VIM2M
-	tristate "Virtual Memory-to-Memory Driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
-	select VIDEOBUF2_VMALLOC
-	select V4L2_MEM2MEM_DEV
-	help
-	  This is a virtual test device for the memory-to-memory driver
-	  framework.
-
-source "drivers/media/platform/vicodec/Kconfig"
-
-endif #V4L_TEST_DRIVERS
-
 menuconfig DVB_PLATFORM_DRIVERS
 	bool "DVB platform devices"
 	depends on MEDIA_DIGITAL_TV_SUPPORT
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index d13db96e3015..a0194ef1211f 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -14,11 +14,6 @@ obj-$(CONFIG_VIDEO_PXA27x)	+= pxa_camera.o
 
 obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
 
-obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
-obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
-obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
-obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
-
 obj-y	+= ti-vpe/
 
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
new file mode 100644
index 000000000000..258a4d36c0d3
--- /dev/null
+++ b/drivers/media/test_drivers/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if MEDIA_TEST_SUPPORT
+
+menuconfig V4L_TEST_DRIVERS
+	bool "V4L test drivers"
+	depends on MEDIA_CAMERA_SUPPORT
+
+if V4L_TEST_DRIVERS
+
+source "drivers/media/test_drivers/vimc/Kconfig"
+
+source "drivers/media/test_drivers/vivid/Kconfig"
+
+config VIDEO_VIM2M
+	tristate "Virtual Memory-to-Memory Driver"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select VIDEOBUF2_VMALLOC
+	select V4L2_MEM2MEM_DEV
+	help
+	  This is a virtual test device for the memory-to-memory driver
+	  framework.
+
+source "drivers/media/test_drivers/vicodec/Kconfig"
+
+endif #V4L_TEST_DRIVERS
+
+endif #MEDIA_TEST_SUPPORT
diff --git a/drivers/media/test_drivers/Makefile b/drivers/media/test_drivers/Makefile
new file mode 100644
index 000000000000..74410d3a9f2d
--- /dev/null
+++ b/drivers/media/test_drivers/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the test drivers.
+#
+
+obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
+obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
+obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
+obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
diff --git a/drivers/media/platform/vicodec/Kconfig b/drivers/media/test_drivers/vicodec/Kconfig
similarity index 100%
rename from drivers/media/platform/vicodec/Kconfig
rename to drivers/media/test_drivers/vicodec/Kconfig
diff --git a/drivers/media/platform/vicodec/Makefile b/drivers/media/test_drivers/vicodec/Makefile
similarity index 100%
rename from drivers/media/platform/vicodec/Makefile
rename to drivers/media/test_drivers/vicodec/Makefile
diff --git a/drivers/media/platform/vicodec/codec-fwht.c b/drivers/media/test_drivers/vicodec/codec-fwht.c
similarity index 100%
rename from drivers/media/platform/vicodec/codec-fwht.c
rename to drivers/media/test_drivers/vicodec/codec-fwht.c
diff --git a/drivers/media/platform/vicodec/codec-fwht.h b/drivers/media/test_drivers/vicodec/codec-fwht.h
similarity index 100%
rename from drivers/media/platform/vicodec/codec-fwht.h
rename to drivers/media/test_drivers/vicodec/codec-fwht.h
diff --git a/drivers/media/platform/vicodec/codec-v4l2-fwht.c b/drivers/media/test_drivers/vicodec/codec-v4l2-fwht.c
similarity index 100%
rename from drivers/media/platform/vicodec/codec-v4l2-fwht.c
rename to drivers/media/test_drivers/vicodec/codec-v4l2-fwht.c
diff --git a/drivers/media/platform/vicodec/codec-v4l2-fwht.h b/drivers/media/test_drivers/vicodec/codec-v4l2-fwht.h
similarity index 100%
rename from drivers/media/platform/vicodec/codec-v4l2-fwht.h
rename to drivers/media/test_drivers/vicodec/codec-v4l2-fwht.h
diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/test_drivers/vicodec/vicodec-core.c
similarity index 100%
rename from drivers/media/platform/vicodec/vicodec-core.c
rename to drivers/media/test_drivers/vicodec/vicodec-core.c
diff --git a/drivers/media/platform/vim2m.c b/drivers/media/test_drivers/vim2m.c
similarity index 100%
rename from drivers/media/platform/vim2m.c
rename to drivers/media/test_drivers/vim2m.c
diff --git a/drivers/media/platform/vimc/Kconfig b/drivers/media/test_drivers/vimc/Kconfig
similarity index 100%
rename from drivers/media/platform/vimc/Kconfig
rename to drivers/media/test_drivers/vimc/Kconfig
diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/test_drivers/vimc/Makefile
similarity index 100%
rename from drivers/media/platform/vimc/Makefile
rename to drivers/media/test_drivers/vimc/Makefile
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/test_drivers/vimc/vimc-capture.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-capture.c
rename to drivers/media/test_drivers/vimc/vimc-capture.c
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/test_drivers/vimc/vimc-common.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-common.c
rename to drivers/media/test_drivers/vimc/vimc-common.c
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/test_drivers/vimc/vimc-common.h
similarity index 100%
rename from drivers/media/platform/vimc/vimc-common.h
rename to drivers/media/test_drivers/vimc/vimc-common.h
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/test_drivers/vimc/vimc-core.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-core.c
rename to drivers/media/test_drivers/vimc/vimc-core.c
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/test_drivers/vimc/vimc-debayer.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-debayer.c
rename to drivers/media/test_drivers/vimc/vimc-debayer.c
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/test_drivers/vimc/vimc-scaler.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-scaler.c
rename to drivers/media/test_drivers/vimc/vimc-scaler.c
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/test_drivers/vimc/vimc-sensor.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-sensor.c
rename to drivers/media/test_drivers/vimc/vimc-sensor.c
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/test_drivers/vimc/vimc-streamer.c
similarity index 100%
rename from drivers/media/platform/vimc/vimc-streamer.c
rename to drivers/media/test_drivers/vimc/vimc-streamer.c
diff --git a/drivers/media/platform/vimc/vimc-streamer.h b/drivers/media/test_drivers/vimc/vimc-streamer.h
similarity index 100%
rename from drivers/media/platform/vimc/vimc-streamer.h
rename to drivers/media/test_drivers/vimc/vimc-streamer.h
diff --git a/drivers/media/platform/vivid/Kconfig b/drivers/media/test_drivers/vivid/Kconfig
similarity index 100%
rename from drivers/media/platform/vivid/Kconfig
rename to drivers/media/test_drivers/vivid/Kconfig
diff --git a/drivers/media/platform/vivid/Makefile b/drivers/media/test_drivers/vivid/Makefile
similarity index 100%
rename from drivers/media/platform/vivid/Makefile
rename to drivers/media/test_drivers/vivid/Makefile
diff --git a/drivers/media/platform/vivid/vivid-cec.c b/drivers/media/test_drivers/vivid/vivid-cec.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-cec.c
rename to drivers/media/test_drivers/vivid/vivid-cec.c
diff --git a/drivers/media/platform/vivid/vivid-cec.h b/drivers/media/test_drivers/vivid/vivid-cec.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-cec.h
rename to drivers/media/test_drivers/vivid/vivid-cec.h
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/test_drivers/vivid/vivid-core.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-core.c
rename to drivers/media/test_drivers/vivid/vivid-core.c
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/test_drivers/vivid/vivid-core.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-core.h
rename to drivers/media/test_drivers/vivid/vivid-core.h
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/test_drivers/vivid/vivid-ctrls.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-ctrls.c
rename to drivers/media/test_drivers/vivid/vivid-ctrls.c
diff --git a/drivers/media/platform/vivid/vivid-ctrls.h b/drivers/media/test_drivers/vivid/vivid-ctrls.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-ctrls.h
rename to drivers/media/test_drivers/vivid/vivid-ctrls.h
diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/test_drivers/vivid/vivid-kthread-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-cap.c
rename to drivers/media/test_drivers/vivid/vivid-kthread-cap.c
diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.h b/drivers/media/test_drivers/vivid/vivid-kthread-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-cap.h
rename to drivers/media/test_drivers/vivid/vivid-kthread-cap.h
diff --git a/drivers/media/platform/vivid/vivid-kthread-out.c b/drivers/media/test_drivers/vivid/vivid-kthread-out.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-out.c
rename to drivers/media/test_drivers/vivid/vivid-kthread-out.c
diff --git a/drivers/media/platform/vivid/vivid-kthread-out.h b/drivers/media/test_drivers/vivid/vivid-kthread-out.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-out.h
rename to drivers/media/test_drivers/vivid/vivid-kthread-out.h
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.c b/drivers/media/test_drivers/vivid/vivid-kthread-touch.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-touch.c
rename to drivers/media/test_drivers/vivid/vivid-kthread-touch.c
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.h b/drivers/media/test_drivers/vivid/vivid-kthread-touch.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-kthread-touch.h
rename to drivers/media/test_drivers/vivid/vivid-kthread-touch.h
diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/test_drivers/vivid/vivid-meta-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-meta-cap.c
rename to drivers/media/test_drivers/vivid/vivid-meta-cap.c
diff --git a/drivers/media/platform/vivid/vivid-meta-cap.h b/drivers/media/test_drivers/vivid/vivid-meta-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-meta-cap.h
rename to drivers/media/test_drivers/vivid/vivid-meta-cap.h
diff --git a/drivers/media/platform/vivid/vivid-meta-out.c b/drivers/media/test_drivers/vivid/vivid-meta-out.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-meta-out.c
rename to drivers/media/test_drivers/vivid/vivid-meta-out.c
diff --git a/drivers/media/platform/vivid/vivid-meta-out.h b/drivers/media/test_drivers/vivid/vivid-meta-out.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-meta-out.h
rename to drivers/media/test_drivers/vivid/vivid-meta-out.h
diff --git a/drivers/media/platform/vivid/vivid-osd.c b/drivers/media/test_drivers/vivid/vivid-osd.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-osd.c
rename to drivers/media/test_drivers/vivid/vivid-osd.c
diff --git a/drivers/media/platform/vivid/vivid-osd.h b/drivers/media/test_drivers/vivid/vivid-osd.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-osd.h
rename to drivers/media/test_drivers/vivid/vivid-osd.h
diff --git a/drivers/media/platform/vivid/vivid-radio-common.c b/drivers/media/test_drivers/vivid/vivid-radio-common.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-common.c
rename to drivers/media/test_drivers/vivid/vivid-radio-common.c
diff --git a/drivers/media/platform/vivid/vivid-radio-common.h b/drivers/media/test_drivers/vivid/vivid-radio-common.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-common.h
rename to drivers/media/test_drivers/vivid/vivid-radio-common.h
diff --git a/drivers/media/platform/vivid/vivid-radio-rx.c b/drivers/media/test_drivers/vivid/vivid-radio-rx.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-rx.c
rename to drivers/media/test_drivers/vivid/vivid-radio-rx.c
diff --git a/drivers/media/platform/vivid/vivid-radio-rx.h b/drivers/media/test_drivers/vivid/vivid-radio-rx.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-rx.h
rename to drivers/media/test_drivers/vivid/vivid-radio-rx.h
diff --git a/drivers/media/platform/vivid/vivid-radio-tx.c b/drivers/media/test_drivers/vivid/vivid-radio-tx.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-tx.c
rename to drivers/media/test_drivers/vivid/vivid-radio-tx.c
diff --git a/drivers/media/platform/vivid/vivid-radio-tx.h b/drivers/media/test_drivers/vivid/vivid-radio-tx.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-radio-tx.h
rename to drivers/media/test_drivers/vivid/vivid-radio-tx.h
diff --git a/drivers/media/platform/vivid/vivid-rds-gen.c b/drivers/media/test_drivers/vivid/vivid-rds-gen.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-rds-gen.c
rename to drivers/media/test_drivers/vivid/vivid-rds-gen.c
diff --git a/drivers/media/platform/vivid/vivid-rds-gen.h b/drivers/media/test_drivers/vivid/vivid-rds-gen.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-rds-gen.h
rename to drivers/media/test_drivers/vivid/vivid-rds-gen.h
diff --git a/drivers/media/platform/vivid/vivid-sdr-cap.c b/drivers/media/test_drivers/vivid/vivid-sdr-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-sdr-cap.c
rename to drivers/media/test_drivers/vivid/vivid-sdr-cap.c
diff --git a/drivers/media/platform/vivid/vivid-sdr-cap.h b/drivers/media/test_drivers/vivid/vivid-sdr-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-sdr-cap.h
rename to drivers/media/test_drivers/vivid/vivid-sdr-cap.h
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/test_drivers/vivid/vivid-touch-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-touch-cap.c
rename to drivers/media/test_drivers/vivid/vivid-touch-cap.c
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/test_drivers/vivid/vivid-touch-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-touch-cap.h
rename to drivers/media/test_drivers/vivid/vivid-touch-cap.h
diff --git a/drivers/media/platform/vivid/vivid-vbi-cap.c b/drivers/media/test_drivers/vivid/vivid-vbi-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-cap.c
rename to drivers/media/test_drivers/vivid/vivid-vbi-cap.c
diff --git a/drivers/media/platform/vivid/vivid-vbi-cap.h b/drivers/media/test_drivers/vivid/vivid-vbi-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-cap.h
rename to drivers/media/test_drivers/vivid/vivid-vbi-cap.h
diff --git a/drivers/media/platform/vivid/vivid-vbi-gen.c b/drivers/media/test_drivers/vivid/vivid-vbi-gen.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-gen.c
rename to drivers/media/test_drivers/vivid/vivid-vbi-gen.c
diff --git a/drivers/media/platform/vivid/vivid-vbi-gen.h b/drivers/media/test_drivers/vivid/vivid-vbi-gen.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-gen.h
rename to drivers/media/test_drivers/vivid/vivid-vbi-gen.h
diff --git a/drivers/media/platform/vivid/vivid-vbi-out.c b/drivers/media/test_drivers/vivid/vivid-vbi-out.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-out.c
rename to drivers/media/test_drivers/vivid/vivid-vbi-out.c
diff --git a/drivers/media/platform/vivid/vivid-vbi-out.h b/drivers/media/test_drivers/vivid/vivid-vbi-out.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vbi-out.h
rename to drivers/media/test_drivers/vivid/vivid-vbi-out.h
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/test_drivers/vivid/vivid-vid-cap.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-cap.c
rename to drivers/media/test_drivers/vivid/vivid-vid-cap.c
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.h b/drivers/media/test_drivers/vivid/vivid-vid-cap.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-cap.h
rename to drivers/media/test_drivers/vivid/vivid-vid-cap.h
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/test_drivers/vivid/vivid-vid-common.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-common.c
rename to drivers/media/test_drivers/vivid/vivid-vid-common.c
diff --git a/drivers/media/platform/vivid/vivid-vid-common.h b/drivers/media/test_drivers/vivid/vivid-vid-common.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-common.h
rename to drivers/media/test_drivers/vivid/vivid-vid-common.h
diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/test_drivers/vivid/vivid-vid-out.c
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-out.c
rename to drivers/media/test_drivers/vivid/vivid-vid-out.c
diff --git a/drivers/media/platform/vivid/vivid-vid-out.h b/drivers/media/test_drivers/vivid/vivid-vid-out.h
similarity index 100%
rename from drivers/media/platform/vivid/vivid-vid-out.h
rename to drivers/media/test_drivers/vivid/vivid-vid-out.h
-- 
2.25.1

