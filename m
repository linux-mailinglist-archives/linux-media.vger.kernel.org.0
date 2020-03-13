Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE7B184623
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCMLmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:42:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47974 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMLmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:42:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBg5uf034329;
        Fri, 13 Mar 2020 06:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099725;
        bh=vbNhDSoBagF+0s+Eh4g3TQdB9UubHDWexxAO59e0WNo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RfLVdT1+cCUHP35AT/3hWKRXN1/F/cPyE/RC6nW4ryKdVsD/X6bIeRwYjfd0KL/PY
         906HtRKm2e8AaHsyiUf6md7uwzWiUuT3LPUYe8jjjClpJoCsGi5uXqINc0QQRqkwEd
         w4r3TOl1wa44z1K5qJhikpJCkG/FMzeYsvYc7GXQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBg5P7011145
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:42:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:42:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:42:05 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcp0044014;
        Fri, 13 Mar 2020 06:42:03 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 16/16] media: ti-vpe: cal: fix stop state timeout
Date:   Fri, 13 Mar 2020 13:41:21 +0200
Message-ID: <20200313114121.32182-16-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index df5a4281838b..e9dd405b8eb1 100644
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
@@ -766,6 +768,7 @@ static void csi2_phy_config(struct cal_ctx *ctx);
 static void csi2_phy_init(struct cal_ctx *ctx)
 {
 	u32 val;
+	u32 sscounter;
 
 	/* Steps
 	 *  1. Configure D-PHY mode and enable required lanes
@@ -802,10 +805,13 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	csi2_phy_config(ctx);
 
 	/* 3.B. Program Stop States */
+	/* Must be more than 100us */
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
@@ -2263,6 +2269,12 @@ static int cal_probe(struct platform_device *pdev)
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

