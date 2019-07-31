Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE967CC6C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 21:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfGaTDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 15:03:33 -0400
Received: from 5.mo4.mail-out.ovh.net ([188.165.44.50]:38198 "EHLO
        5.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfGaTDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 15:03:32 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Jul 2019 15:03:31 EDT
Received: from player776.ha.ovh.net (unknown [10.108.57.226])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 3B4C31FC3F2
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2019 18:33:47 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player776.ha.ovh.net (Postfix) with ESMTPSA id A3C58878DD52;
        Wed, 31 Jul 2019 16:33:28 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH v3 2/3] media: imx7-media-csi: add i.MX6UL support
Date:   Wed, 31 Jul 2019 18:33:30 +0200
Message-Id: <20190731163330.32532-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14045319867170182183
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleehgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
to imx7-media-csi driver.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v3:
- rebase on Linux v5.3-rc2
- remove csi_soc_id var as it's not needed anymore thanks to commit
  e0c76a7d3428 ("media: imx7-media-csi: get csi upstream endpoint")

Changes for v2:
 - rebase on top of linuxtv/master
 - mention i.MX6UL/L in header and Kconfig help text
 - rename csi_type to csi_soc_id

 drivers/staging/media/imx/Kconfig          |  4 +--
 drivers/staging/media/imx/imx7-media-csi.c | 30 +++++++++++++++-------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 4c726345dc25..f51476243016 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
 config VIDEO_IMX7_CSI
-	tristate "i.MX7 Camera Sensor Interface driver"
+	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
 	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
 	default y
 	help
 	  Enable support for video4linux camera sensor interface driver for
-	  i.MX7.
+	  i.MX6UL/L or i.MX7.
 endmenu
 endif
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 500b4c08d967..4ca79ff4c9b3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * V4L2 Capture CSI Subdev for Freescale i.MX7 SOC
+ * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
  *
  * Copyright (c) 2019 Linaro Ltd
  *
@@ -765,6 +765,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
 	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
 	u32 cr1, cr18;
+	int width = out_pix->width;
 
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		imx7_csi_deinterlace_enable(csi, true);
@@ -774,15 +775,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 		imx7_csi_buf_stride_set(csi, 0);
 	}
 
-	imx7_csi_set_imagpara(csi, out_pix->width, out_pix->height);
+	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
+
+	if (!csi->is_csi2) {
+		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
+		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
+			width *= 2;
+
+		imx7_csi_set_imagpara(csi, width, out_pix->height);
+
+		cr18 |= (BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
+			BIT_BASEADDR_CHG_ERR_EN);
+		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
 
-	if (!csi->is_csi2)
 		return 0;
+	}
+
+	imx7_csi_set_imagpara(csi, width, out_pix->height);
 
 	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 	cr1 &= ~BIT_GCLK_MODE;
 
-	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
 	cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
 	cr18 |= BIT_DATA_FROM_MIPI;
 
@@ -817,11 +830,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
 {
 	imx7_csi_sw_reset(csi);
 
-	if (csi->is_csi2) {
-		imx7_csi_dmareq_rff_enable(csi);
-		imx7_csi_hw_enable_irq(csi);
-		imx7_csi_hw_enable(csi);
-	}
+	imx7_csi_dmareq_rff_enable(csi);
+	imx7_csi_hw_enable_irq(csi);
+	imx7_csi_hw_enable(csi);
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
@@ -1302,6 +1313,7 @@ static int imx7_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx7_csi_of_match[] = {
 	{ .compatible = "fsl,imx7-csi" },
+	{ .compatible = "fsl,imx6ul-csi" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
-- 
2.21.0

