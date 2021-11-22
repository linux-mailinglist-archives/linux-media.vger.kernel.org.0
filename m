Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D38B4589CB
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 08:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhKVHa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 02:30:29 -0500
Received: from comms.puri.sm ([159.203.221.185]:58866 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233435AbhKVHa2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 02:30:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id C06B7E139C;
        Sun, 21 Nov 2021 23:27:21 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 436LXCLEsQLl; Sun, 21 Nov 2021 23:27:20 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, rmfrfs@gmail.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        robh@kernel.org, shawnguo@kernel.org
Subject: [PATCH v3 1/2] media: imx: imx7-media-csi: add support for imx8mq
Date:   Mon, 22 Nov 2021 08:27:07 +0100
Message-Id: <20211122072708.95269-1-martin.kepplinger@puri.sm>
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
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---

revision history
----------------
v3:
 * fix compiler warning when assigning a 64 bit (void *) to an int
 * add Ruis' Acked-by tag

v2: (thank you Rui and Laurent)
 * rename function and enum
 * remove unrealted newline
 * add Laurents reviewed tag to the bindings patch
 https://lore.kernel.org/linux-media/20211118063347.3370678-1-martin.kepplinger@puri.sm/

v1:
https://lore.kernel.org/linux-media/20211117092710.3084034-1-martin.kepplinger@puri.sm/T/#t



 drivers/staging/media/imx/imx7-media-csi.c | 32 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2288dadb2683..32311fc0e2a4 100644
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
@@ -154,6 +159,11 @@
 #define CSI_CSICR18			0x48
 #define CSI_CSICR19			0x4c
 
+enum imx_csi_model {
+	IMX7_CSI_IMX7 = 0,
+	IMX7_CSI_IMX8MQ,
+};
+
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -189,6 +199,8 @@ struct imx7_csi {
 	bool is_csi2;
 
 	struct completion last_eof_completion;
+
+	enum imx_csi_model model;
 };
 
 static struct imx7_csi *
@@ -537,6 +549,16 @@ static void imx7_csi_deinit(struct imx7_csi *csi,
 	clk_disable_unprepare(csi->mclk);
 }
 
+static void imx7_csi_baseaddr_switch_on_second_frame(struct imx7_csi *csi)
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
@@ -552,6 +574,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
 	/* Enable the RxFIFO DMA and the CSI. */
 	imx7_csi_dmareq_rff_enable(csi);
 	imx7_csi_hw_enable(csi);
+
+	if (csi->model == IMX7_CSI_IMX8MQ)
+		imx7_csi_baseaddr_switch_on_second_frame(csi);
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
@@ -1155,6 +1180,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(csi->regbase))
 		return PTR_ERR(csi->regbase);
 
+	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
+
 	spin_lock_init(&csi->irqlock);
 	mutex_init(&csi->lock);
 
@@ -1249,8 +1276,9 @@ static int imx7_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx7_csi_of_match[] = {
-	{ .compatible = "fsl,imx7-csi" },
-	{ .compatible = "fsl,imx6ul-csi" },
+	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
+	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
+	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
-- 
2.30.2

