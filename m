Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42DC58F9F3
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiHKJSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235023AbiHKJSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:18:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA69592F4A
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:17:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49842615CD
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B23C433C1;
        Thu, 11 Aug 2022 09:17:57 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/9] fsl-viu: deprecate this driver
Date:   Thu, 11 Aug 2022 11:17:46 +0200
Message-Id: <20220811091749.3956641-7-hverkuil-cisco@xs4all.nl>
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

Deprecate the fsl-viu driver. This driver does not use the vb2 framework
for video streaming, instead it uses the old videobuf framework.

We want to get rid of these old drivers, so deprecated it for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/nxp/Kconfig              | 12 ------------
 drivers/media/platform/nxp/Makefile             |  1 -
 drivers/staging/media/Kconfig                   |  1 +
 drivers/staging/media/Makefile                  |  1 +
 .../staging/media/deprecated/fsl-viu/Kconfig    | 17 +++++++++++++++++
 .../staging/media/deprecated/fsl-viu/Makefile   |  2 ++
 drivers/staging/media/deprecated/fsl-viu/TODO   |  8 ++++++++
 .../media/deprecated/fsl-viu}/fsl-viu.c         |  0
 8 files changed, 29 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/Kconfig
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/Makefile
 create mode 100644 drivers/staging/media/deprecated/fsl-viu/TODO
 rename drivers/{media/platform/nxp => staging/media/deprecated/fsl-viu}/fsl-viu.c (100%)

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 1ac0a6e91111..797fa2db3f41 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -15,18 +15,6 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
-config VIDEO_VIU
-	tristate "NXP VIU Video Driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
-	select VIDEOBUF_DMA_CONTIG
-	help
-	  Support for Freescale VIU video driver. This device captures
-	  video data, or overlays video on DIU frame buffer.
-
-	  Say Y here if you want to enable VIU device on MPC5121e Rev2+.
-	  In doubt, say N.
-
 # mem2mem drivers
 
 config VIDEO_IMX_PXP
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index efc38c6578ce..dd3e54c1a0dd 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -5,4 +5,3 @@ obj-y += imx-jpeg/
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
-obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 85a5275ec16d..7d5922a60dd5 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -58,6 +58,7 @@ menuconfig STAGING_MEDIA_DEPRECATED
 
 if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/cpia2/Kconfig"
+source "drivers/staging/media/deprecated/fsl-viu/Kconfig"
 source "drivers/staging/media/deprecated/meye/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
 source "drivers/staging/media/deprecated/tm6000/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 073dbae14e89..0bbfdc269630 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_TM6000)	+= deprecated/tm6000/
+obj-$(CONFIG_VIDEO_VIU)		+= deprecated/fsl-viu/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/staging/media/deprecated/fsl-viu/Kconfig b/drivers/staging/media/deprecated/fsl-viu/Kconfig
new file mode 100644
index 000000000000..3617f7d8aa1c
--- /dev/null
+++ b/drivers/staging/media/deprecated/fsl-viu/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_VIU
+	tristate "NXP VIU Video Driver (DEPRECATED)"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
+	select VIDEOBUF_DMA_CONTIG
+	help
+	  Support for Freescale VIU video driver. This device captures
+	  video data, or overlays video on DIU frame buffer.
+
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
+	  Say Y here if you want to enable VIU device on MPC5121e Rev2+.
+	  In doubt, say N.
+
+
diff --git a/drivers/staging/media/deprecated/fsl-viu/Makefile b/drivers/staging/media/deprecated/fsl-viu/Makefile
new file mode 100644
index 000000000000..931ec56ad08c
--- /dev/null
+++ b/drivers/staging/media/deprecated/fsl-viu/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
diff --git a/drivers/staging/media/deprecated/fsl-viu/TODO b/drivers/staging/media/deprecated/fsl-viu/TODO
new file mode 100644
index 000000000000..c9908c086f87
--- /dev/null
+++ b/drivers/staging/media/deprecated/fsl-viu/TODO
@@ -0,0 +1,8 @@
+This is one of the few drivers still not using the vb2
+framework, so this driver is now deprecated with the intent of
+removing it altogether by the beginning of 2023.
+
+In order to keep this driver it has to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
+
diff --git a/drivers/media/platform/nxp/fsl-viu.c b/drivers/staging/media/deprecated/fsl-viu/fsl-viu.c
similarity index 100%
rename from drivers/media/platform/nxp/fsl-viu.c
rename to drivers/staging/media/deprecated/fsl-viu/fsl-viu.c
-- 
2.35.1

