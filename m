Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0367058F9F0
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiHKJSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbiHKJR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:17:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8647091D13
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC919615C4
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCFFC433C1;
        Thu, 11 Aug 2022 09:17:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/9] zr364xx: deprecate this driver
Date:   Thu, 11 Aug 2022 11:17:44 +0200
Message-Id: <20220811091749.3956641-5-hverkuil-cisco@xs4all.nl>
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

Deprecate the zr364xx driver. This driver does not use the vb2 framework
for video streaming, instead it uses the old videobuf framework.

We want to get rid of these old drivers, so deprecated it for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/Kconfig                                 | 1 -
 drivers/media/usb/Makefile                                | 1 -
 drivers/staging/media/Kconfig                             | 1 +
 drivers/staging/media/Makefile                            | 1 +
 .../usb => staging/media/deprecated}/zr364xx/Kconfig      | 7 +++++--
 .../usb => staging/media/deprecated}/zr364xx/Makefile     | 0
 drivers/staging/media/deprecated/zr364xx/TODO             | 8 ++++++++
 .../usb => staging/media/deprecated}/zr364xx/zr364xx.c    | 0
 8 files changed, 15 insertions(+), 4 deletions(-)
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/Kconfig (65%)
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/zr364xx/TODO
 rename drivers/{media/usb => staging/media/deprecated}/zr364xx/zr364xx.c (100%)

diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index afbb8dd28b5b..3d0138f8573c 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -18,7 +18,6 @@ source "drivers/media/usb/pwc/Kconfig"
 source "drivers/media/usb/s2255/Kconfig"
 source "drivers/media/usb/usbtv/Kconfig"
 source "drivers/media/usb/uvc/Kconfig"
-source "drivers/media/usb/zr364xx/Kconfig"
 
 endif
 
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index fa8e16ff9b03..7fccc6604b1f 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -12,7 +12,6 @@ obj-y += s2255/
 obj-y += siano/
 obj-y += ttusb-budget/
 obj-y += ttusb-dec/
-obj-y += zr364xx/
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 180f450f9e27..4d134c68ca5c 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -60,6 +60,7 @@ if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/cpia2/Kconfig"
 source "drivers/staging/media/deprecated/meye/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
+source "drivers/staging/media/deprecated/zr364xx/Kconfig"
 endif
 
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index f10f6613a443..27b6e6bf42ba 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -13,4 +13,5 @@ obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
+obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/media/usb/zr364xx/Kconfig b/drivers/staging/media/deprecated/zr364xx/Kconfig
similarity index 65%
rename from drivers/media/usb/zr364xx/Kconfig
rename to drivers/staging/media/deprecated/zr364xx/Kconfig
index a9fb02566c4b..ea29c9d8dca2 100644
--- a/drivers/media/usb/zr364xx/Kconfig
+++ b/drivers/staging/media/deprecated/zr364xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_ZR364XX
-	tristate "USB ZR364XX Camera support"
-	depends on VIDEO_DEV
+	tristate "USB ZR364XX Camera support (DEPRECATED)"
+	depends on USB && VIDEO_DEV
 	select VIDEOBUF_GEN
 	select VIDEOBUF_VMALLOC
 	help
@@ -10,6 +10,9 @@ config USB_ZR364XX
 	  See <file:Documentation/admin-guide/media/zr364xx.rst> for more info
 	  and list of supported cameras.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called zr364xx.
 
diff --git a/drivers/media/usb/zr364xx/Makefile b/drivers/staging/media/deprecated/zr364xx/Makefile
similarity index 100%
rename from drivers/media/usb/zr364xx/Makefile
rename to drivers/staging/media/deprecated/zr364xx/Makefile
diff --git a/drivers/staging/media/deprecated/zr364xx/TODO b/drivers/staging/media/deprecated/zr364xx/TODO
new file mode 100644
index 000000000000..c9908c086f87
--- /dev/null
+++ b/drivers/staging/media/deprecated/zr364xx/TODO
@@ -0,0 +1,8 @@
+This is one of the few drivers still not using the vb2
+framework, so this driver is now deprecated with the intent of
+removing it altogether by the beginning of 2023.
+
+In order to keep this driver it has to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
+
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/staging/media/deprecated/zr364xx/zr364xx.c
similarity index 100%
rename from drivers/media/usb/zr364xx/zr364xx.c
rename to drivers/staging/media/deprecated/zr364xx/zr364xx.c
-- 
2.35.1

