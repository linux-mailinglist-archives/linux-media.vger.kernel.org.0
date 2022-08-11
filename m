Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D28858F9EE
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbiHKJSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234956AbiHKJR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173F7923E9
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8461615D7
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF3C433D6;
        Thu, 11 Aug 2022 09:17:54 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/9] meye: deprecate this driver
Date:   Thu, 11 Aug 2022 11:17:43 +0200
Message-Id: <20220811091749.3956641-4-hverkuil-cisco@xs4all.nl>
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

Deprecate the meye driver. This driver does not use the vb2 framework
for video streaming, instead it implements its own version.

We want to get rid of these old drivers, so deprecated it for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/Kconfig                                   | 1 -
 drivers/media/pci/Makefile                                  | 1 -
 drivers/staging/media/Kconfig                               | 1 +
 drivers/staging/media/Makefile                              | 1 +
 .../{media/pci => staging/media/deprecated}/meye/Kconfig    | 5 ++++-
 .../{media/pci => staging/media/deprecated}/meye/Makefile   | 0
 drivers/staging/media/deprecated/meye/TODO                  | 6 ++++++
 drivers/{media/pci => staging/media/deprecated}/meye/meye.c | 0
 drivers/{media/pci => staging/media/deprecated}/meye/meye.h | 0
 9 files changed, 12 insertions(+), 3 deletions(-)
 rename drivers/{media/pci => staging/media/deprecated}/meye/Kconfig (73%)
 rename drivers/{media/pci => staging/media/deprecated}/meye/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/meye/TODO
 rename drivers/{media/pci => staging/media/deprecated}/meye/meye.c (100%)
 rename drivers/{media/pci => staging/media/deprecated}/meye/meye.h (100%)

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 1224d908713a..84c927516c11 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -13,7 +13,6 @@ if MEDIA_PCI_SUPPORT
 if MEDIA_CAMERA_SUPPORT
 	comment "Media capture support"
 
-source "drivers/media/pci/meye/Kconfig"
 source "drivers/media/pci/solo6x10/Kconfig"
 source "drivers/media/pci/sta2x11/Kconfig"
 source "drivers/media/pci/tw5864/Kconfig"
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index 551169a3e434..6ad7c4dff021 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -32,7 +32,6 @@ obj-$(CONFIG_VIDEO_CX25821) += cx25821/
 obj-$(CONFIG_VIDEO_CX88) += cx88/
 obj-$(CONFIG_VIDEO_DT3155) += dt3155/
 obj-$(CONFIG_VIDEO_IVTV) += ivtv/
-obj-$(CONFIG_VIDEO_MEYE) += meye/
 obj-$(CONFIG_VIDEO_SAA7134) += saa7134/
 obj-$(CONFIG_VIDEO_SAA7164) += saa7164/
 obj-$(CONFIG_VIDEO_SOLO6X10) += solo6x10/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 360220ad9ffd..180f450f9e27 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -58,6 +58,7 @@ menuconfig STAGING_MEDIA_DEPRECATED
 
 if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/cpia2/Kconfig"
+source "drivers/staging/media/deprecated/meye/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
 endif
 
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 12e0cbbeaad1..f10f6613a443 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_VIDEO_CPIA2)	+= deprecated/cpia2/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
+obj-$(CONFIG_VIDEO_MEYE)	+= deprecated/meye/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_STKWEBCAM)	+= deprecated/stkwebcam/
diff --git a/drivers/media/pci/meye/Kconfig b/drivers/staging/media/deprecated/meye/Kconfig
similarity index 73%
rename from drivers/media/pci/meye/Kconfig
rename to drivers/staging/media/deprecated/meye/Kconfig
index 3e69b66f1a5b..f135f8568c85 100644
--- a/drivers/media/pci/meye/Kconfig
+++ b/drivers/staging/media/deprecated/meye/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_MEYE
-	tristate "Sony Vaio Picturebook Motion Eye Video For Linux"
+	tristate "Sony Vaio Picturebook Motion Eye Video For Linux (DEPRECATED)"
 	depends on PCI && VIDEO_DEV
 	depends on SONY_LAPTOP
 	depends on X86 || COMPILE_TEST
@@ -12,5 +12,8 @@ config VIDEO_MEYE
 	  If you say Y or M here, you need to say Y or M to "Sony Laptop
 	  Extras" in the misc device section.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called meye.
diff --git a/drivers/media/pci/meye/Makefile b/drivers/staging/media/deprecated/meye/Makefile
similarity index 100%
rename from drivers/media/pci/meye/Makefile
rename to drivers/staging/media/deprecated/meye/Makefile
diff --git a/drivers/staging/media/deprecated/meye/TODO b/drivers/staging/media/deprecated/meye/TODO
new file mode 100644
index 000000000000..6d1d1433d5a0
--- /dev/null
+++ b/drivers/staging/media/deprecated/meye/TODO
@@ -0,0 +1,6 @@
+The meye driver does not use the vb2 framework for streaming
+video, instead it implements this in the driver.
+
+To prevent removal of this driver early 2023 it has to be
+converted to use vb2. Contact the linux-media@vger.kernel.org
+mailing list if you want to do this.
diff --git a/drivers/media/pci/meye/meye.c b/drivers/staging/media/deprecated/meye/meye.c
similarity index 100%
rename from drivers/media/pci/meye/meye.c
rename to drivers/staging/media/deprecated/meye/meye.c
diff --git a/drivers/media/pci/meye/meye.h b/drivers/staging/media/deprecated/meye/meye.h
similarity index 100%
rename from drivers/media/pci/meye/meye.h
rename to drivers/staging/media/deprecated/meye/meye.h
-- 
2.35.1

