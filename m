Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1474F1AF
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 09:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfD3H45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 03:56:57 -0400
Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72]:60915 "EHLO
        4.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfD3H45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 03:56:57 -0400
X-Greylist: delayed 455 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Apr 2019 03:56:56 EDT
Received: from player787.ha.ovh.net (unknown [10.108.35.240])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3182AF0485
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 09:49:19 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player787.ha.ovh.net (Postfix) with ESMTPSA id 0350155C06F1;
        Tue, 30 Apr 2019 07:49:02 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 2/2] media: imx7-media-csi: add i.MX6UL support
Date:   Tue, 30 Apr 2019 09:49:11 +0200
Message-Id: <20190430074911.8361-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18302347411810046999
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
to imx7-media-csi driver.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 This patch needs the following patch from Rui Miguel Silva:
 https://patchwork.linuxtv.org/patch/55657/

 I have tested this patch with a OV5640 sensor (8-bit parallel). The pipeline is:

 Device topology
 - entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                <- "ov5640 1-003c":0 [ENABLED]
        pad1: Source
                [fmt:UYVY8_2X8/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                -> "csi capture":0 [ENABLED]

 - entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "csi":1 [ENABLED]

 - entity 10: ov5640 1-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev1
        pad0: Source
                [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi":0 [ENABLED]

 drivers/staging/media/imx/imx7-media-csi.c | 61 ++++++++++++++++------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a708a0340eb1..ef4534a96fa0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -154,6 +154,11 @@
 
 static const char * const imx7_csi_clk_id[] = {"axi", "dcic", "mclk"};
 
+enum csi_type {
+	IMX7,
+	IMX6UL
+};
+
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -195,6 +200,7 @@ struct imx7_csi {
 	bool is_init;
 	bool is_streaming;
 	bool is_csi2;
+	enum csi_type type;
 
 	struct completion last_eof_completion;
 };
@@ -554,6 +560,14 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	if (csi->type == IMX6UL) {
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
@@ -763,6 +777,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
 	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
 	u32 cr1, cr18;
+	int width = out_pix->width;
 
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		imx7_csi_deinterlace_enable(csi, true);
@@ -772,15 +787,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
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
 
@@ -815,12 +842,9 @@ static int imx7_csi_enable(struct imx7_csi *csi)
 {
 	imx7_csi_sw_reset(csi);
 
-	if (csi->is_csi2) {
-		imx7_csi_dmareq_rff_enable(csi);
-		imx7_csi_hw_enable_irq(csi);
-		imx7_csi_hw_enable(csi);
-		return 0;
-	}
+	imx7_csi_dmareq_rff_enable(csi);
+	imx7_csi_hw_enable_irq(csi);
+	imx7_csi_hw_enable(csi);
 
 	return 0;
 }
@@ -1218,20 +1242,33 @@ static int imx7_csi_clocks_get(struct imx7_csi *csi)
 	return devm_clk_bulk_get(dev, csi->num_clks, csi->clks);
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
 	struct resource *res;
 	int ret;
 
+	of_id = of_match_node(imx7_csi_of_match, node);
+	if (!of_id)
+		return -ENODEV;
+
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
 		return -ENOMEM;
 
 	csi->dev = dev;
+	csi->type = (enum csi_type)of_id->data;
 
 	ret = imx7_csi_clocks_get(csi);
 	if (ret < 0) {
@@ -1349,12 +1386,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
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

