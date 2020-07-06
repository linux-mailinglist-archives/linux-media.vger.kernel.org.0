Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625B6215E7C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbgGFShm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbgGFShl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA3212BE;
        Mon,  6 Jul 2020 20:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060654;
        bh=spdoj2NpFbuU9popchVmDGHZFfDYk2OKFtNUZt33QRQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ibiEHobAuv7ogsrCJ3vqGlSOS1Ojv4YJgST21xvy4mVPRmyYvfr/a5N4FfgfpnB9E
         hQW+XU+Z+BmM5LuSc/yqhvOND3dWjduBtYLKY+i2eVesRiPMjZiuVSzTQZTCAbaevH
         1QZjIxwJ/XQ/kvQY5fNfLZwClhxNZdYQO434915I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 013/108] media: ti-vpe: cal: Make loop indices unsigned where applicable
Date:   Mon,  6 Jul 2020 21:35:34 +0300
Message-Id: <20200706183709.12238-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many loop indices only take positive values. Make them unsigned.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
Changes since v1:

- Add the loop indices in cal_irq()
---
 drivers/media/platform/ti-vpe/cal.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index edb1034f3b04..579f823451f4 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -488,7 +488,7 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev)
 {
 	struct reg_field *field;
 	struct cal_csi2_phy *phy;
-	int i, j;
+	unsigned int i, j;
 
 	if (!dev->data)
 		return -EINVAL;
@@ -901,7 +901,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 
 static void csi2_phy_deinit(struct cal_ctx *ctx)
 {
-	int i;
+	unsigned int i;
 
 	csi2_cio_power(ctx, false);
 
@@ -1212,7 +1212,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 
 	status = reg_read(dev, CAL_HL_IRQSTATUS(0));
 	if (status) {
-		int i;
+		unsigned int i;
 
 		reg_write(dev, CAL_HL_IRQSTATUS(0), status);
 
@@ -1225,7 +1225,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
 				dev_err_ratelimited(&dev->pdev->dev,
-						    "CIO%d error: %#08x\n", i, cio_stat);
+						    "CIO%u error: %#08x\n", i, cio_stat);
 
 				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
 					  cio_stat);
@@ -1236,7 +1236,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	/* Check which DMA just finished */
 	status = reg_read(dev, CAL_HL_IRQSTATUS(1));
 	if (status) {
-		int i;
+		unsigned int i;
 
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(1), status);
@@ -1259,7 +1259,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	/* Check which DMA just started */
 	status = reg_read(dev, CAL_HL_IRQSTATUS(2));
 	if (status) {
-		int i;
+		unsigned int i;
 
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(2), status);
@@ -1917,8 +1917,8 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 {
 	struct cal_ctx *ctx = notifier_to_ctx(notifier);
 	struct v4l2_subdev_mbus_code_enum mbus_code;
+	unsigned int i, j, k;
 	int ret = 0;
-	int i, j, k;
 
 	if (ctx->sensor) {
 		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
@@ -1942,7 +1942,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			continue;
 
 		ctx_dbg(2, ctx,
-			"subdev %s: code: %04x idx: %d\n",
+			"subdev %s: code: %04x idx: %u\n",
 			subdev->name, mbus_code.code, j);
 
 		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
@@ -1951,7 +1951,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			if (mbus_code.code == fmt->code) {
 				ctx->active_fmt[i] = fmt;
 				ctx_dbg(2, ctx,
-					"matched fourcc: %s: code: %04x idx: %d\n",
+					"matched fourcc: %s: code: %04x idx: %u\n",
 					fourcc_to_str(fmt->fourcc),
 					fmt->code, i);
 				ctx->num_active_fmt = ++i;
@@ -2269,9 +2269,9 @@ static int cal_probe(struct platform_device *pdev)
 	struct device_node *parent = pdev->dev.of_node;
 	struct regmap *syscon_camerrx;
 	u32 syscon_camerrx_offset;
+	unsigned int i;
 	int ret;
 	int irq;
-	int i;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -2407,7 +2407,7 @@ static int cal_remove(struct platform_device *pdev)
 {
 	struct cal_dev *dev = platform_get_drvdata(pdev);
 	struct cal_ctx *ctx;
-	int i;
+	unsigned int i;
 
 	cal_dbg(1, dev, "Removing %s\n", CAL_MODULE_NAME);
 
-- 
Regards,

Laurent Pinchart

