Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDE04543B4
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbhKQJaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:30:39 -0500
Received: from comms.puri.sm ([159.203.221.185]:51378 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233303AbhKQJaa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:30:30 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 979DFDF722;
        Wed, 17 Nov 2021 01:27:31 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4qV44hPShOAV; Wed, 17 Nov 2021 01:27:30 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh@kernel.org, shawnguo@kernel.org
Cc:     kernel@pengutronix.de, kernel@puri.sm, linux-imx@nxp.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 1/2] media: imx: imx7-media-csi: add support for imx8mq
Date:   Wed, 17 Nov 2021 10:27:09 +0100
Message-Id: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modeled after the NXP driver mx6s_capture.c that this driver is based on,
imx8mq needs different settings for the baseaddr_switch mechanism. Define
the needed bits and set that for imx8mq.

Without these settings, the system will "sometimes" hang completely when
starting to stream (the interrupt will never be called).

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/imx/imx7-media-csi.c | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2288dadb2683..8619cf2fc694 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -122,6 +123,10 @@
 #define BIT_DATA_FROM_MIPI		BIT(22)
 #define BIT_MIPI_YU_SWAP		BIT(21)
 #define BIT_MIPI_DOUBLE_CMPNT		BIT(20)
+#define BIT_MASK_OPTION_FIRST_FRAME	(0 << 18)
+#define BIT_MASK_OPTION_CSI_EN		(1 << 18)
+#define BIT_MASK_OPTION_SECOND_FRAME	(2 << 18)
+#define BIT_MASK_OPTION_ON_DATA		(3 << 18)
 #define BIT_BASEADDR_CHG_ERR_EN		BIT(9)
 #define BIT_BASEADDR_SWITCH_SEL		BIT(5)
 #define BIT_BASEADDR_SWITCH_EN		BIT(4)
@@ -154,6 +159,12 @@
 #define CSI_CSICR18			0x48
 #define CSI_CSICR19			0x4c
 
+enum imx_soc {
+	IMX6UL = 0,
+	IMX7,
+	IMX8MQ,
+};
+
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -189,6 +200,8 @@ struct imx7_csi {
 	bool is_csi2;
 
 	struct completion last_eof_completion;
+
+	enum imx_soc type;
 };
 
 static struct imx7_csi *
@@ -537,6 +550,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi,
 	clk_disable_unprepare(csi->mclk);
 }
 
+static void imx8mq_baseaddr_switch(struct imx7_csi *csi)
+{
+	u32 cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
+
+	cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
+		BIT_BASEADDR_CHG_ERR_EN;
+	cr18 |= BIT_MASK_OPTION_SECOND_FRAME;
+	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
+}
+
 static void imx7_csi_enable(struct imx7_csi *csi)
 {
 	/* Clear the Rx FIFO and reflash the DMA controller. */
@@ -551,7 +574,11 @@ static void imx7_csi_enable(struct imx7_csi *csi)
 
 	/* Enable the RxFIFO DMA and the CSI. */
 	imx7_csi_dmareq_rff_enable(csi);
+
 	imx7_csi_hw_enable(csi);
+
+	if (csi->type == IMX8MQ)
+		imx8mq_baseaddr_switch(csi);
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
@@ -1155,6 +1182,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(csi->regbase))
 		return PTR_ERR(csi->regbase);
 
+	csi->type = (enum imx_soc)of_device_get_match_data(&pdev->dev);
+
 	spin_lock_init(&csi->irqlock);
 	mutex_init(&csi->lock);
 
@@ -1249,8 +1278,9 @@ static int imx7_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx7_csi_of_match[] = {
-	{ .compatible = "fsl,imx7-csi" },
-	{ .compatible = "fsl,imx6ul-csi" },
+	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX8MQ },
+	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7 },
+	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX6UL },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
-- 
2.30.2

