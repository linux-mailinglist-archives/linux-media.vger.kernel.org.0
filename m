Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F4918AD8C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCSHu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37052 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgCSHu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:58 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7otam085641;
        Thu, 19 Mar 2020 02:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604255;
        bh=uMn+H1I3VC6whujq64chKQJ2XMXDr1iJpFm+lTqaTl4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cGWiqYw+XICZxdOw6KejVe036/yrB2HGQMPOVx587Ts1S/eLkYSJ1nENDdFAZjOaq
         m51arf9Ip2ujVEnw1vxJX0oI20RyCIeYvgtNXt9D1RMYZsBCQkAWHqBGvMMXWSaw8D
         7wegZMAIo2xw1YOyDMT4qEN3NmJyI4cikZt3wG9I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7otmC119105
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:54 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqo047151;
        Thu, 19 Mar 2020 02:50:53 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 11/19] media: ti-vpe: cal: use reg_write_field
Date:   Thu, 19 Mar 2020 09:50:15 +0200
Message-ID: <20200319075023.22151-12-tomi.valkeinen@ti.com>
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

Simplify the code by using reg_write_field() where trivially possible.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 34 ++++++++++++-----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 979f9027a232..5208dfde6fb5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -761,10 +761,9 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	camerarx_phy_enable(ctx);
 
 	/* 2. Reset complex IO - Do not wait for reset completion */
-	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
-	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
-		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
 		ctx->csi2_port,
 		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
@@ -786,18 +785,16 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
 
 	/* 4. Force FORCERXMODE */
-	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
-	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
-	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
+	reg_write_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
+			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		ctx->csi2_port,
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
 
 	/* E. Power up the PHY using the complex IO */
-	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
-	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
-		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
+			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 
 	/* F. Wait for power up completion */
 	for (i = 0; i < 10; i++) {
@@ -869,13 +866,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 static void csi2_phy_deinit(struct cal_ctx *ctx)
 {
 	int i;
-	u32 val;
 
 	/* Power down the PHY using the complex IO */
-	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
-	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
-		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
+			CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 
 	/* Wait for power down completion */
 	for (i = 0; i < 10; i++) {
@@ -892,10 +887,9 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
 		(i >= 10) ? "(timeout)" : "");
 
 	/* Assert Comple IO Reset */
-	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
-	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
-		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 
 	/* Wait for power down completion */
 	for (i = 0; i < 10; i++) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

