Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CC037C17
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 20:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbfFFSTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 14:19:17 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:32875 "EHLO
        7.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfFFSTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 14:19:16 -0400
X-Greylist: delayed 9594 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jun 2019 14:19:15 EDT
Received: from player697.ha.ovh.net (unknown [10.109.143.246])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id B8D6A1CAC05
        for <linux-media@vger.kernel.org>; Thu,  6 Jun 2019 17:39:19 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player697.ha.ovh.net (Postfix) with ESMTPSA id D6299697A73E;
        Thu,  6 Jun 2019 15:38:59 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
Date:   Thu,  6 Jun 2019 17:38:24 +0200
Message-Id: <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3721943620884780228
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
to imx7-media-csi driver.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v2:
 - rebase on top of linuxtv/master
 - mention i.MX6UL/L in header and Kconfig help text
 - rename csi_type to csi_soc_id

 drivers/staging/media/imx/Kconfig          |  4 +-
 drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index ad3d7df6bb3c..8b6dc42c39e0 100644
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
index 9101566f3f67..902bdce594cf 100644
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
@@ -152,6 +152,11 @@
 #define CSI_CSICR18		0x48
 #define CSI_CSICR19		0x4c
 
+enum csi_soc_id {
+	IMX7,
+	IMX6UL
+};
+
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -191,6 +196,7 @@ struct imx7_csi {
 	bool is_init;
 	bool is_streaming;
 	bool is_csi2;
+	enum csi_soc_id soc_id;
 
 	struct completion last_eof_completion;
 };
@@ -548,6 +554,14 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	if (csi->soc_id == IMX6UL) {
+		mutex_lock(&csi->lock);
+		csi->is_csi2 = false;
+		mutex_unlock(&csi->lock);
+
+		return 0;
+	}
+
 	ret = imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
 	if (ret) {
 		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
@@ -757,6 +771,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
 	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
 	u32 cr1, cr18;
+	int width = out_pix->width;
 
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		imx7_csi_deinterlace_enable(csi, true);
@@ -766,15 +781,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
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
 
@@ -809,11 +836,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
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
@@ -1166,19 +1191,32 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
+static const struct of_device_id imx7_csi_of_match[] = {
+	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7 },
+	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX6UL },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
+
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct imx_media_dev *imxmd;
 	struct imx7_csi *csi;
+	const struct of_device_id *of_id;
 	int ret;
 
+	of_id = of_match_node(imx7_csi_of_match, node);
+	if (!of_id)
+		return -ENODEV;
+
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
 		return -ENOMEM;
 
 	csi->dev = dev;
+	csi->soc_id = (enum csi_soc_id)of_id->data;
 
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(csi->mclk)) {
@@ -1294,12 +1332,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id imx7_csi_of_match[] = {
-	{ .compatible = "fsl,imx7-csi" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
-
 static struct platform_driver imx7_csi_driver = {
 	.probe = imx7_csi_probe,
 	.remove = imx7_csi_remove,
-- 
2.19.2

