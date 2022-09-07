Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778D75B0DB6
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiIGUEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiIGUEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:04:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28EF18B35
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:04:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DF318A3;
        Wed,  7 Sep 2022 22:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662581081;
        bh=XjW177k5DK7mE2Kkli1vE8alWetqg/zDuynN+q6JR00=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KUYvnOP27SGs6S+ThWOmWc+ecdEbFCySVWGQ3yNOGLX4mmlhUE+xV0XQgZcnSMDQc
         y/Rvx5kpa2aRptO0njxcvhlYLjB9WpfQSN1bAssPfnwRadM/wpXMnjoyiuR2nFgBcy
         lYUhzSZC88R1lFlA9CY/Fk8RWnbsxXwLdHtclCPY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 1/6] media: imx: Decouple imx8mq-mipi-csi2 from imx7-media-csi
Date:   Wed,  7 Sep 2022 23:04:19 +0300
Message-Id: <20220907200424.32136-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx8mq-mipi-csi2 driver targets SoCs that also run the
imx7-media-csi driver, but they are distinct. Decouple them in Kconfig
to prepare for destaging of the imx7-media-csi driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Kconfig  | 10 ++++++++++
 drivers/staging/media/imx/Makefile |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 0bacac302d7e..bfb849701489 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -32,3 +32,13 @@ config VIDEO_IMX7_CSI
 	  i.MX6UL/L, i.MX7 or i.MX8M.
 endmenu
 endif
+
+config VIDEO_IMX8MQ_MIPI_CSI2
+	tristate "NXP i.MX8MQ MIPI CSI-2 receiver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  V4L2 driver for the MIPI CSI-2 receiver found in the i.MX8MQ SoC.
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index d82be898145b..cef9f30eb401 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -15,4 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
-obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
-- 
Regards,

Laurent Pinchart

