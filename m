Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1DF1927FD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgCYMQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:16 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43374 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGDS9097370;
        Wed, 25 Mar 2020 07:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138573;
        bh=u28QRdngDrneF51m+pjDHNgr3IdFrDEKwJpOm12LLDU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tyZ9mQslWvB7ivFCyI4XjKwkAqU30YkVool4riKYjJvF3Uds1YUMOquTHApdS5bjJ
         FVW8mvnkEH5aVL42Ixhy4PRmK4aLULz4Taaca8zp7MXi02In/uzwQGL185y5KYcmr8
         aLvCBRa0Wh6xtPg5f4BrUr6IbvpirwunTUhIFr1g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCGDcx097426
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:12 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm5B085323;
        Wed, 25 Mar 2020 07:16:11 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 12/19] media: ti-vpe: cal: cleanup CIO power enable/disable
Date:   Wed, 25 Mar 2020 14:15:03 +0200
Message-ID: <20200325121510.25923-13-tomi.valkeinen@ti.com>
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

Move the code to enable and disable ComplexIO power to its own function.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 67 +++++++++++++----------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index aacca33813e7..d8d455576062 100644
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
@@ -860,24 +872,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
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

