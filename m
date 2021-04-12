Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A635C54A
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238107AbhDLLfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52620 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237993AbhDLLfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:39 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6C043F0;
        Mon, 12 Apr 2021 13:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227320;
        bh=cD0yv/ttYsRrB1znZsAAFbiUil5RqfwDdwLm/dWnIao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZXr91KEDsPnqIuLqBLS/i2rSOilIAbCy+fZnQxHc96Tuq+yEUqqKnA6hyLDp2gWFC
         Z1pDlNCQAOe7izE6a4HL7mB4AYyjSiBQDWxbJ2eHji8QAU3cb1BJxrccllr0jVZc07
         yhvEi9117U6+OJtd4j6jSjQcK1mWQxKbU/UeLqBs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 09/28] media: ti-vpe: cal: Add PPI context
Date:   Mon, 12 Apr 2021 14:34:38 +0300
Message-Id: <20210412113457.328012-10-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL has 8 PPI contexts per PHY, which are used to tag the incoming data.
The current driver only uses the first PPI, but we need to support all
of them to implement multi-stream support.

Add a ppi_ctx field to cal_ctx, which indicates which of the 8 PPI
contexts is used for the particular cal_ctx. Also clean up the PPI
context register macros to take the PPI context number as a parameter.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 10 ++++++----
 drivers/media/platform/ti-vpe/cal.h      |  1 +
 drivers/media/platform/ti-vpe/cal_regs.h | 18 ++----------------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3d57aedbee0a..c550eeb27e79 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -294,7 +294,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
-	val = cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
+	val = cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx));
 	cal_set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
@@ -310,9 +310,10 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
 		      CAL_CSI2_CTX_PACK_MODE_MASK);
-	cal_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
-	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->index,
-		cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
+	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), val);
+	ctx_dbg(3, ctx, "CAL_CSI2_CTX%d(%d) = 0x%08x\n",
+		ctx->phy->instance, ctx->ppi_ctx,
+		cal_read(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx)));
 }
 
 static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
@@ -854,6 +855,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->cal = cal;
 	ctx->phy = cal->phy[inst];
 	ctx->index = inst;
+	ctx->ppi_ctx = inst;
 	ctx->cport = inst;
 
 	ret = cal_ctx_v4l2_init(ctx);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 251bb0ba7b3b..6eb63268f916 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -219,6 +219,7 @@ struct cal_ctx {
 	struct vb2_queue	vb_vidq;
 	u8			index;
 	u8			cport;
+	u8			ppi_ctx;
 };
 
 extern unsigned int cal_debug;
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index f752096dcf7f..5c4f9e642185 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -72,22 +72,8 @@
 #define CAL_CSI2_TIMING(m)		(0x314U + (m) * 0x80U)
 #define CAL_CSI2_VC_IRQENABLE(m)	(0x318U + (m) * 0x80U)
 #define CAL_CSI2_VC_IRQSTATUS(m)	(0x328U + (m) * 0x80U)
-#define CAL_CSI2_CTX0(m)		(0x330U + (m) * 0x80U)
-#define CAL_CSI2_CTX1(m)		(0x334U + (m) * 0x80U)
-#define CAL_CSI2_CTX2(m)		(0x338U + (m) * 0x80U)
-#define CAL_CSI2_CTX3(m)		(0x33cU + (m) * 0x80U)
-#define CAL_CSI2_CTX4(m)		(0x340U + (m) * 0x80U)
-#define CAL_CSI2_CTX5(m)		(0x344U + (m) * 0x80U)
-#define CAL_CSI2_CTX6(m)		(0x348U + (m) * 0x80U)
-#define CAL_CSI2_CTX7(m)		(0x34cU + (m) * 0x80U)
-#define CAL_CSI2_STATUS0(m)		(0x350U + (m) * 0x80U)
-#define CAL_CSI2_STATUS1(m)		(0x354U + (m) * 0x80U)
-#define CAL_CSI2_STATUS2(m)		(0x358U + (m) * 0x80U)
-#define CAL_CSI2_STATUS3(m)		(0x35cU + (m) * 0x80U)
-#define CAL_CSI2_STATUS4(m)		(0x360U + (m) * 0x80U)
-#define CAL_CSI2_STATUS5(m)		(0x364U + (m) * 0x80U)
-#define CAL_CSI2_STATUS6(m)		(0x368U + (m) * 0x80U)
-#define CAL_CSI2_STATUS7(m)		(0x36cU + (m) * 0x80U)
+#define CAL_CSI2_CTX(phy, ppi_ctx)	(0x330U + (phy) * 0x80U + (ppi_ctx) * 4)
+#define CAL_CSI2_STATUS(phy, ppi_ctx)	(0x350U + (phy) * 0x80U + (ppi_ctx) * 4)
 
 /* CAL CSI2 PHY register offsets */
 #define CAL_CSI2_PHY_REG0		0x000
-- 
2.25.1

