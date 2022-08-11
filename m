Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE6658F9EF
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbiHKJSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235012AbiHKJR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAC193509
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1460EB81FA5
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A74C433C1;
        Thu, 11 Aug 2022 09:17:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/9] cpia2: deprecate this driver
Date:   Thu, 11 Aug 2022 11:17:42 +0200
Message-Id: <20220811091749.3956641-3-hverkuil-cisco@xs4all.nl>
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

Deprecate the cpia2 driver. This driver does not use the vb2 framework
for video streaming, instead it implements its own version.

We want to get rid of these old drivers, so deprecated it for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/Kconfig                                   | 1 -
 drivers/media/usb/Makefile                                  | 1 -
 drivers/staging/media/Kconfig                               | 1 +
 drivers/staging/media/Makefile                              | 1 +
 .../{media/usb => staging/media/deprecated}/cpia2/Kconfig   | 5 ++++-
 .../{media/usb => staging/media/deprecated}/cpia2/Makefile  | 0
 drivers/staging/media/deprecated/cpia2/TODO                 | 6 ++++++
 .../{media/usb => staging/media/deprecated}/cpia2/cpia2.h   | 0
 .../usb => staging/media/deprecated}/cpia2/cpia2_core.c     | 0
 .../media/deprecated}/cpia2/cpia2_registers.h               | 0
 .../usb => staging/media/deprecated}/cpia2/cpia2_usb.c      | 0
 .../usb => staging/media/deprecated}/cpia2/cpia2_v4l.c      | 0
 12 files changed, 12 insertions(+), 3 deletions(-)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/Kconfig (66%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/cpia2/TODO
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_core.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_registers.h (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_usb.c (100%)
 rename drivers/{media/usb => staging/media/deprecated}/cpia2/cpia2_v4l.c (100%)

diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index af88e0766388..afbb8dd28b5b 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -13,7 +13,6 @@ if MEDIA_USB_SUPPORT
 if MEDIA_CAMERA_SUPPORT
 	comment "Webcam devices"
 
-source "drivers/media/usb/cpia2/Kconfig"
 source "drivers/media/usb/gspca/Kconfig"
 source "drivers/media/usb/pwc/Kconfig"
 source "drivers/media/usb/s2255/Kconfig"
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 25fa2015b179..fa8e16ff9b03 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -24,7 +24,6 @@ obj-$(CONFIG_USB_MSI2500) += msi2500/
 obj-$(CONFIG_USB_PWC) += pwc/
 obj-$(CONFIG_USB_VIDEO_CLASS) += uvc/
 obj-$(CONFIG_VIDEO_AU0828) += au0828/
-obj-$(CONFIG_VIDEO_CPIA2) += cpia2/
 obj-$(CONFIG_VIDEO_CX231XX) += cx231xx/
 obj-$(CONFIG_VIDEO_EM28XX) += em28xx/
 obj-$(CONFIG_VIDEO_GO7007) += go7007/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 3545ba722037..360220ad9ffd 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -57,6 +57,7 @@ menuconfig STAGING_MEDIA_DEPRECATED
 	  If in doubt, say N here.
 
 if STAGING_MEDIA_DEPRECATED
+source "drivers/staging/media/deprecated/cpia2/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
 endif
 
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index c516764b5393..12e0cbbeaad1 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
+obj-$(CONFIG_VIDEO_CPIA2)	+= deprecated/cpia2/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
diff --git a/drivers/media/usb/cpia2/Kconfig b/drivers/staging/media/deprecated/cpia2/Kconfig
similarity index 66%
rename from drivers/media/usb/cpia2/Kconfig
rename to drivers/staging/media/deprecated/cpia2/Kconfig
index da2c6862b4a2..ee3b25a759d4 100644
--- a/drivers/media/usb/cpia2/Kconfig
+++ b/drivers/staging/media/deprecated/cpia2/Kconfig
@@ -1,10 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CPIA2
-	tristate "CPiA2 Video For Linux"
+	tristate "CPiA2 Video For Linux (DEPRECATED)"
 	depends on USB && VIDEO_DEV
 	help
 	  This is the video4linux driver for cameras based on Vision's CPiA2
 	  (Colour Processor Interface ASIC), such as the Digital Blue QX5
 	  Microscope. If you have one of these cameras, say Y here
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  This driver is also available as a module (cpia2).
diff --git a/drivers/media/usb/cpia2/Makefile b/drivers/staging/media/deprecated/cpia2/Makefile
similarity index 100%
rename from drivers/media/usb/cpia2/Makefile
rename to drivers/staging/media/deprecated/cpia2/Makefile
diff --git a/drivers/staging/media/deprecated/cpia2/TODO b/drivers/staging/media/deprecated/cpia2/TODO
new file mode 100644
index 000000000000..92ac8718d164
--- /dev/null
+++ b/drivers/staging/media/deprecated/cpia2/TODO
@@ -0,0 +1,6 @@
+The cpia2 driver does not use the vb2 framework for streaming
+video, instead it implements this in the driver.
+
+To prevent removal of this driver early 2023 it has to be
+converted to use vb2. Contact the linux-media@vger.kernel.org
+mailing list if you want to do this.
diff --git a/drivers/media/usb/cpia2/cpia2.h b/drivers/staging/media/deprecated/cpia2/cpia2.h
similarity index 100%
rename from drivers/media/usb/cpia2/cpia2.h
rename to drivers/staging/media/deprecated/cpia2/cpia2.h
diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/staging/media/deprecated/cpia2/cpia2_core.c
similarity index 100%
rename from drivers/media/usb/cpia2/cpia2_core.c
rename to drivers/staging/media/deprecated/cpia2/cpia2_core.c
diff --git a/drivers/media/usb/cpia2/cpia2_registers.h b/drivers/staging/media/deprecated/cpia2/cpia2_registers.h
similarity index 100%
rename from drivers/media/usb/cpia2/cpia2_registers.h
rename to drivers/staging/media/deprecated/cpia2/cpia2_registers.h
diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/staging/media/deprecated/cpia2/cpia2_usb.c
similarity index 100%
rename from drivers/media/usb/cpia2/cpia2_usb.c
rename to drivers/staging/media/deprecated/cpia2/cpia2_usb.c
diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/staging/media/deprecated/cpia2/cpia2_v4l.c
similarity index 100%
rename from drivers/media/usb/cpia2/cpia2_v4l.c
rename to drivers/staging/media/deprecated/cpia2/cpia2_v4l.c
-- 
2.35.1

