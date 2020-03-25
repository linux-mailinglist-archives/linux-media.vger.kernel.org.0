Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D202192804
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgCYMQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41844 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbgCYMQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:28 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGPoa062726;
        Wed, 25 Mar 2020 07:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138585;
        bh=p97UI6EDj7hgYrW1qXw0+zf9DM7cjNU4Hx4vrT+fQf4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kZyVo3kUstCvGLI+SUx6JeW408cGBmor72jiLwwnpCCxsagUs3tJt/JATb1enO6Gw
         tOEqxqCGjFRzTQD0mnAhWk04j3V+09ZFnSgP7HaDIE+YJMnNpS87joTz3rfB7SSFR1
         4QD1vN27JnTwCnFST3aj3v/Ra5FpcSqao1o2NOC4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGPpV003847;
        Wed, 25 Mar 2020 07:16:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:24 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm5I085323;
        Wed, 25 Mar 2020 07:16:23 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 19/19] media: ti-vpe: cal: fix stop state timeout
Date:   Wed, 25 Mar 2020 14:15:10 +0200
Message-ID: <20200325121510.25923-20-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stop-state timeout needs to be over 100us as per CSI spec. With the
CAL fclk of 266 MHZ on DRA76, with the current value the driver uses,
the timeout is 24us. Too small timeout will cause failure to enable the
streaming.

Also, the fclk can be different on other SoCs, as is the case with AM65x
where the fclk is 250 MHz.

This patch fixes the timeout by calculating it correctly based on the
fclk rate.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0f90078ee8c2..d935c628597b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -6,6 +6,7 @@
  * Benoit Parrot, <bparrot@ti.com>
  */
 
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioctl.h>
@@ -340,6 +341,7 @@ static const struct cal_data am654_cal_data = {
  * all instances.
  */
 struct cal_dev {
+	struct clk		*fclk;
 	int			irq;
 	void __iomem		*base;
 	struct resource		*res;
@@ -767,6 +769,7 @@ static void csi2_phy_config(struct cal_ctx *ctx);
 static void csi2_phy_init(struct cal_ctx *ctx)
 {
 	u32 val;
+	u32 sscounter;
 
 	/* Steps
 	 *  1. Configure D-PHY mode and enable required lanes
@@ -803,10 +806,20 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	csi2_phy_config(ctx);
 
 	/* 3.B. Program Stop States */
+	/*
+	 * The stop-state-counter is based on fclk cycles, and we always use
+	 * the x16 and x4 settings, so stop-state-timeout =
+	 * fclk-cycle * 16 * 4 * counter.
+	 *
+	 * Stop-state-timeout must be more than 100us as per CSI2 spec, so we
+	 * calculate a timeout that's 100us (rounding up).
+	 */
+	sscounter = DIV_ROUND_UP(clk_get_rate(ctx->dev->fclk), 10000 *  16 * 4);
+
 	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
 	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
-	set_field(&val, 0, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
-	set_field(&val, 407, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
+	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
+	set_field(&val, sscounter, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
 	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
 		ctx->csi2_port,
@@ -2257,6 +2270,12 @@ static int cal_probe(struct platform_device *pdev)
 	/* save pdev pointer */
 	dev->pdev = pdev;
 
+	dev->fclk = devm_clk_get(&pdev->dev, "fck");
+	if (IS_ERR(dev->fclk)) {
+		dev_err(&pdev->dev, "cannot get CAL fclk\n");
+		return PTR_ERR(dev->fclk);
+	}
+
 	syscon_camerrx = syscon_regmap_lookup_by_phandle(parent,
 							 "ti,camerrx-control");
 	ret = of_property_read_u32_index(parent, "ti,camerrx-control", 1,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

