Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE64318461C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgCMLl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48724 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMLl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfsvY123459;
        Fri, 13 Mar 2020 06:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099714;
        bh=b2STpgkF36Vz5tlqL8TS3XKLeZCz/CPgv44HpmzEHo0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fUbf8ie9hW6rrDVaUsg/jayRJh1Oz2uSmC8wwW9wa96xrt5+4V6qY89rzZ7Squ6Ut
         ECg6P4XCa9FJ/bzzDQ4pIDG+hGyCKdP9kirYxuPUY97lHuNAD5O3Nk/PaQpTwd4QEi
         6Ak00GbFEHQ4Tk4f97DRDMhus/cxjvZTIFG7wuX0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfsDx074658
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:54 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:53 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcor044014;
        Fri, 13 Mar 2020 06:41:52 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 09/16] media: ti-vpe: cal: cleanup CIO power enable/disable
Date:   Fri, 13 Mar 2020 13:41:14 +0200
Message-ID: <20200313114121.32182-9-tomi.valkeinen@ti.com>
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

Move the code to enable and disable ComplexIO power to its own function.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 68 ++++++++++++++---------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ebea5fa28691..771ad7c14c96 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -731,11 +731,40 @@ static void disable_irqs(struct cal_ctx *ctx)
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
 }
 
+static void csi2_cio_pwr(struct cal_ctx *ctx, bool enable)
+{
+	u32 target_state;
+	int i;
+
+	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
+		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
+
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			target_state,
+			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
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
@@ -790,23 +819,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
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
+	csi2_cio_pwr(ctx, true);
 }
 
 static void csi2_wait_for_phy(struct cal_ctx *ctx)
@@ -865,24 +878,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
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
+	csi2_cio_pwr(ctx, false);
 
 	/* Assert Comple IO Reset */
 	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

