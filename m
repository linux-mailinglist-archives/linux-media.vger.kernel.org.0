Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2800218AD8E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCSHvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:51:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40592 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgCSHu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7ouGt123802;
        Thu, 19 Mar 2020 02:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604257;
        bh=s5RIzkUXdXgS/5uYg+EaZUGNkT6uauDdwwxvpe+7FRk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nc+xsV5E4v/DeWeJcHURBQvfknk3S+mUIEib5F6eMUNHdA17eL0/u1pMpDCBMeWXI
         AiXqYLOFtnJ5LAMSYXOGUgLUn9tAW7mXQWwiz9dBAdr7zhc2Eue+X5iKDncH+NeMy7
         DvThr/Ij44d2Bh9jHa/bZjZTHLYfclYKZxxCxjfQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7ouJV026714;
        Thu, 19 Mar 2020 02:50:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:56 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqp047151;
        Thu, 19 Mar 2020 02:50:55 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 12/19] media: ti-vpe: cal: cleanup CIO power enable/disable
Date:   Thu, 19 Mar 2020 09:50:16 +0200
Message-ID: <20200319075023.22151-13-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the code to enable and disable ComplexIO power to its own function.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 67 +++++++++++++----------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5208dfde6fb5..ed32b199aabe 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -733,11 +733,39 @@ static void disable_irqs(struct cal_ctx *ctx)
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
 }
 
+static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
+{
+	u32 target_state;
+	unsigned int i;
+
+	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
+		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
+
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
+
+	for (i = 0; i < 10; i++) {
+		u32 current_state;
+
+		current_state = reg_read_field(ctx->dev,
+					       CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
+
+		if (current_state == target_state)
+			break;
+
+		usleep_range(1000, 1100);
+	}
+
+	if (i == 10)
+		ctx_err(ctx, "Failed to power %s complexio\n",
+			enable ? "up" : "down");
+}
+
 static void csi2_phy_config(struct cal_ctx *ctx);
 
 static void csi2_phy_init(struct cal_ctx *ctx)
 {
-	int i;
 	u32 val;
 
 	/* Steps
@@ -792,23 +820,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
 
 	/* E. Power up the PHY using the complex IO */
-	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
-			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-
-	/* F. Wait for power up completion */
-	for (i = 0; i < 10; i++) {
-		if (reg_read_field(ctx->dev,
-				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_ON)
-			break;
-		usleep_range(1000, 1100);
-	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered UP %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
-		(i >= 10) ? "(timeout)" : "");
+	csi2_cio_power(ctx, true);
 }
 
 static void csi2_wait_for_phy(struct cal_ctx *ctx)
@@ -867,24 +879,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
 {
 	int i;
 
-	/* Power down the PHY using the complex IO */
-	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
-			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-
-	/* Wait for power down completion */
-	for (i = 0; i < 10; i++) {
-		if (reg_read_field(ctx->dev,
-				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_OFF)
-			break;
-		usleep_range(1000, 1100);
-	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered Down %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
-		(i >= 10) ? "(timeout)" : "");
+	csi2_cio_power(ctx, false);
 
 	/* Assert Comple IO Reset */
 	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

