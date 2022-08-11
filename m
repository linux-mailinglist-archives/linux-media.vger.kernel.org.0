Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156B558F9F1
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiHKJSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbiHKJSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:18:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1339A92F4B
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:18:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2431B81F8B
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA0BC433D7;
        Thu, 11 Aug 2022 09:17:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/9] tm6000: deprecate this driver
Date:   Thu, 11 Aug 2022 11:17:45 +0200
Message-Id: <20220811091749.3956641-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
References: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate the tm6000 driver. This driver does not use the vb2 framework
for video streaming, instead it uses the old videobuf framework.

We want to get rid of these old drivers, so deprecated it for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/Kconfig                                 | 1 -
 drivers/media/usb/Makefile                                | 1 -
 drivers/staging/media/Kconfig                             | 1 +
 drivers/staging/media/Makefile                            | 1 +
 .../usb => staging/media/deprecated}/tm6000/Kconfig       | 5 ++++-
 .../usb => staging/media/deprecated}/tm6000/Makefile      | 0
 drivers/staging/media/deprecated/tm6000/TODO              | 8 ++++++++
 .../usb => staging/media/deprecated}/tm6000/tm6000-alsa.c | 0
 .../media/deprecated}/tm6000/tm6000-cards.c               | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000-core.c | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000-dvb.c  | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000-i2c.c  | 0
 .../media/deprecated}/tm6000/tm6000-input.c               | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000-regs.h | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000-stds.c | 0
 .../media/deprecated}/tm6000/tm6000-usb-isoc.h            | 0
 .../media/deprecated}/tm6000/tm6000-video.c               | 0
 .../usb => staging/media/deprecated}/tm6000/tm6000.h      | 0
 18 files changed, 14 insertions(+), 3 deletions(-)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/Kconfig (84%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/tm6000/TODO
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-alsa.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-cards.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-core.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-dvb.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-i2c.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-input.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-regs.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-stds.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-usb-isoc.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000-video.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/tm6000/tm6000.h (100%)

diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 3d0138f8573c..813171d25ac5 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -36,7 +36,6 @@ if (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT)
 
 source "drivers/media/usb/au0828/Kconfig"
 source "drivers/media/usb/cx231xx/Kconfig"
-source "drivers/media/usb/tm6000/Kconfig"
 
 endif
 
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 7fccc6604b1f..6d171beea20d 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -29,5 +29,4 @@ obj-$(CONFIG_VIDEO_GO7007) += go7007/
 obj-$(CONFIG_VIDEO_HDPVR) += hdpvr/
 obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
 obj-$(CONFIG_VIDEO_STK1160) += stk1160/
-obj-$(CONFIG_VIDEO_TM6000) += tm6000/
 obj-$(CONFIG_VIDEO_USBTV) += usbtv/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 4d134c68ca5c..85a5275ec16d 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -60,6 +60,7 @@ if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/cpia2/Kconfig"
 source "drivers/staging/media/deprecated/meye/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
+source "drivers/staging/media/deprecated/tm6000/Kconfig"
 source "drivers/staging/media/deprecated/zr364xx/Kconfig"
 endif
 
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 27b6e6bf42ba..073dbae14e89 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
+obj-$(CONFIG_VIDEO_TM6000)	+= deprecated/tm6000/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/media/usb/tm6000/Kconfig b/drivers/staging/media/deprecated/tm6000/Kconfig
similarity index 84%
rename from drivers/media/usb/tm6000/Kconfig
rename to drivers/staging/media/deprecated/tm6000/Kconfig
index 56e977deba81..73d72e49eb28 100644
--- a/drivers/media/usb/tm6000/Kconfig
+++ b/drivers/staging/media/deprecated/tm6000/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TM6000
-	tristate "TV Master TM5600/6000/6010 driver"
+	tristate "TV Master TM5600/6000/6010 driver (DEPRECATED)"
 	depends on VIDEO_DEV && I2C && INPUT && RC_CORE && USB
 	select VIDEO_TUNER
 	select MEDIA_TUNER_XC2028
@@ -13,6 +13,9 @@ config VIDEO_TM6000
 	  only compressed MPEG data over the usb bus, so you need
 	  an external software decoder to watch TV on your computer.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a device and want to use it.
 
 config VIDEO_TM6000_ALSA
diff --git a/drivers/media/usb/tm6000/Makefile b/drivers/staging/media/deprecated/tm6000/Makefile
similarity index 100%
rename from drivers/media/usb/tm6000/Makefile
rename to drivers/staging/media/deprecated/tm6000/Makefile
diff --git a/drivers/staging/media/deprecated/tm6000/TODO b/drivers/staging/media/deprecated/tm6000/TODO
new file mode 100644
index 000000000000..c9908c086f87
--- /dev/null
+++ b/drivers/staging/media/deprecated/tm6000/TODO
@@ -0,0 +1,8 @@
+This is one of the few drivers still not using the vb2
+framework, so this driver is now deprecated with the intent of
+removing it altogether by the beginning of 2023.
+
+In order to keep this driver it has to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
+
diff --git a/drivers/media/usb/tm6000/tm6000-alsa.c b/drivers/staging/media/deprecated/tm6000/tm6000-alsa.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-alsa.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-alsa.c
diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/staging/media/deprecated/tm6000/tm6000-cards.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-cards.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-cards.c
diff --git a/drivers/media/usb/tm6000/tm6000-core.c b/drivers/staging/media/deprecated/tm6000/tm6000-core.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-core.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-core.c
diff --git a/drivers/media/usb/tm6000/tm6000-dvb.c b/drivers/staging/media/deprecated/tm6000/tm6000-dvb.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-dvb.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-dvb.c
diff --git a/drivers/media/usb/tm6000/tm6000-i2c.c b/drivers/staging/media/deprecated/tm6000/tm6000-i2c.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-i2c.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-i2c.c
diff --git a/drivers/media/usb/tm6000/tm6000-input.c b/drivers/staging/media/deprecated/tm6000/tm6000-input.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-input.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-input.c
diff --git a/drivers/media/usb/tm6000/tm6000-regs.h b/drivers/staging/media/deprecated/tm6000/tm6000-regs.h
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-regs.h
rename to drivers/staging/media/deprecated/tm6000/tm6000-regs.h
diff --git a/drivers/media/usb/tm6000/tm6000-stds.c b/drivers/staging/media/deprecated/tm6000/tm6000-stds.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-stds.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-stds.c
diff --git a/drivers/media/usb/tm6000/tm6000-usb-isoc.h b/drivers/staging/media/deprecated/tm6000/tm6000-usb-isoc.h
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-usb-isoc.h
rename to drivers/staging/media/deprecated/tm6000/tm6000-usb-isoc.h
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/staging/media/deprecated/tm6000/tm6000-video.c
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000-video.c
rename to drivers/staging/media/deprecated/tm6000/tm6000-video.c
diff --git a/drivers/media/usb/tm6000/tm6000.h b/drivers/staging/media/deprecated/tm6000/tm6000.h
similarity index 100%
rename from drivers/media/usb/tm6000/tm6000.h
rename to drivers/staging/media/deprecated/tm6000/tm6000.h
-- 
2.35.1

