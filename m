Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A78761CE7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbjGYPHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 11:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbjGYPHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 11:07:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1396419A7
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 08:07:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4890558;
        Tue, 25 Jul 2023 17:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690297561;
        bh=iYRpADB5yV2tqM/ecRddv0+b5mQ8GWchTD92CeOvT8g=;
        h=From:To:Cc:Subject:Date:From;
        b=kMWGXDkDUBjQynXduP3m53H+48800IqvvGAwM7zuWUYNPjj1CZwepM8zaUzMU/aXO
         V8A7rOxD6G8k0LZmuv0U9q5D2GrhBu8mI9S5T2YRLTJR4ynBdNFyjpeMbq9krlkXiL
         7LGlP2ScY7b3fk+zjZZ+skBr68TF8uYaCAd4YhmA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] staging: media: imx: Merge VIDEO_IMX_CSI into VIDEO_IMX_MEDIA
Date:   Tue, 25 Jul 2023 18:07:07 +0300
Message-Id: <20230725150707.16197-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDEO_IMX_MEDIA Kconfig symbol used to select helpers shared between
independent drivers for different i.MX SoCs, and VIDEO_IMX_MEDIA then
selects drivers specific to the i.MX5 and i.MX6. Now that i.MX7 and
i.MX8 support has moved to drivers/media/ and doesn't depend on
VIDEO_IMX_CSI, there's no need to have separate Kconfig options. Merge
VIDEO_IMX_CSI into VIDEO_IMX_MEDIA.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig  | 17 +++--------------
 drivers/staging/media/imx/Makefile |  7 +++----
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index b42af427b88b..426310e1ea5b 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_IMX_MEDIA
-	tristate "i.MX5/6 V4L2 media core driver"
+	tristate "i.MX5/6 V4L2 media drivers"
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
 	depends on VIDEO_DEV
+	depends on IMX_IPUV3_CORE
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
@@ -12,16 +13,4 @@ config VIDEO_IMX_MEDIA
 	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say yes here to enable support for video4linux media controller
-	  driver for the i.MX5/6 SOC.
-
-if VIDEO_IMX_MEDIA
-menu "i.MX5/6/7/8 Media Sub devices"
-
-config VIDEO_IMX_CSI
-	tristate "i.MX5/6 Camera Sensor Interface driver"
-	depends on IMX_IPUV3_CORE
-	default y
-	help
-	  A video4linux camera sensor interface driver for i.MX5/6.
-endmenu
-endif
+	  drivers for the i.MX5/6 SOC.
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index b69951deff9a..330e0825f506 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -9,7 +9,6 @@ imx6-media-objs := imx-media-dev.o imx-media-internal-sd.o \
 imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
-
-obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
-obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
-obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o
-- 
Regards,

Laurent Pinchart

