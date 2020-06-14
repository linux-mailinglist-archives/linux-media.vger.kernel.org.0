Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CD91F8B7F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgFOAA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgFOAAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB0C71295;
        Mon, 15 Jun 2020 02:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179216;
        bh=RoX5jKKwbAOkSfEgxFMEtqmKlfQ+z1jY7puu4/ov+Hk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Im9EH5ZYx4W58tQNNCdn7zFJiLjUYA33zv5rhbEIt9YIgj95bnXoA/iVawQzrL6DR
         a8p5s+szAmWsca9O0fAEs/Gwj9cfv3KSqsa5l52CGryDP4TruWavZSPJuE9dT8Pu4/
         9xYd1m2cSes6kIGwVTEZRCp5/ZjhvuWgzDp4htLs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 013/107] media: ti-vpe: cal: Make loop indices unsigned where applicable
Date:   Mon, 15 Jun 2020 02:58:10 +0300
Message-Id: <20200614235944.17716-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many loop indices only take positive values. Make them unsigned.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0a4c2d1f72ef..a407dbeaa720 100644
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
 
@@ -1224,7 +1224,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
 				dev_err_ratelimited(&dev->pdev->dev,
-						    "CIO%d error: %#08x\n", i, cio_stat);
+						    "CIO%u error: %#08x\n", i, cio_stat);
 
 				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
 					  cio_stat);
@@ -1912,8 +1912,8 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 {
 	struct cal_ctx *ctx = notifier_to_ctx(notifier);
 	struct v4l2_subdev_mbus_code_enum mbus_code;
+	unsigned int i, j, k;
 	int ret = 0;
-	int i, j, k;
 
 	if (ctx->sensor) {
 		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
@@ -1937,7 +1937,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			continue;
 
 		ctx_dbg(2, ctx,
-			"subdev %s: code: %04x idx: %d\n",
+			"subdev %s: code: %04x idx: %u\n",
 			subdev->name, mbus_code.code, j);
 
 		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
@@ -1946,7 +1946,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			if (mbus_code.code == fmt->code) {
 				ctx->active_fmt[i] = fmt;
 				ctx_dbg(2, ctx,
-					"matched fourcc: %s: code: %04x idx: %d\n",
+					"matched fourcc: %s: code: %04x idx: %u\n",
 					fourcc_to_str(fmt->fourcc),
 					fmt->code, i);
 				ctx->num_active_fmt = ++i;
@@ -2264,9 +2264,9 @@ static int cal_probe(struct platform_device *pdev)
 	struct device_node *parent = pdev->dev.of_node;
 	struct regmap *syscon_camerrx;
 	u32 syscon_camerrx_offset;
+	unsigned int i;
 	int ret;
 	int irq;
-	int i;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -2402,7 +2402,7 @@ static int cal_remove(struct platform_device *pdev)
 {
 	struct cal_dev *dev = platform_get_drvdata(pdev);
 	struct cal_ctx *ctx;
-	int i;
+	unsigned int i;
 
 	cal_dbg(1, dev, "Removing %s\n", CAL_MODULE_NAME);
 
-- 
Regards,

Laurent Pinchart

