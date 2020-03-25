Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C74F1927FC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgCYMQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39324 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:14 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGBJZ078532;
        Wed, 25 Mar 2020 07:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138571;
        bh=2rA/3sXSd3gLgD+evYF1BAZJCVt6CdkWVpF86dfeC0M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Jc+n9JjhHgn/qE3qp9QvjqHVT4tYZZbiYQN208PlqtCLkIT7I9hnntKDEYJdjhoYP
         UAV04cyD3j7Idc6GXJH14refPXG/LZ0S3WJV3EIt57sajTSrzjuZk2YWf4JxobR8h0
         h9vVXU45Y3WEhprOrQnwQ6QRsHbXqP3SfKpQIaSg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCGBsP087865
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:10 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm5A085323;
        Wed, 25 Mar 2020 07:16:09 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 11/19] media: ti-vpe: cal: use reg_write_field
Date:   Wed, 25 Mar 2020 14:15:02 +0200
Message-ID: <20200325121510.25923-12-tomi.valkeinen@ti.com>
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

Simplify the code by using reg_write_field() where trivially possible.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 34 ++++++++++++-----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e35565fc4bed..aacca33813e7 100644
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
@@ -862,13 +859,11 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
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
@@ -885,10 +880,9 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
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

