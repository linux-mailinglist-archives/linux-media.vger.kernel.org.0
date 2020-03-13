Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A6B184619
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgCMLlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:52 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48712 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMLlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfnCe123441;
        Fri, 13 Mar 2020 06:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099709;
        bh=rPOa4cheVnaOKOB2lw6Rzi6l6lZVjq1sRvGCIBGimCw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rgELRS2Eva7ZsIflewyGUiVLbc77b6fxsdsOYOY1RPo+Ffa41BdpFKuixNRjvfc6J
         6x1dFU4m6ok8VBSK0inI2yABQeq70sFRJWAQ38fBZNap6bLMv3aEdCFx9L67weVyL1
         LzWZgbN81HBnSt1/T2rD4upJepyg3BTvhfdohpXc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfnj9040053;
        Fri, 13 Mar 2020 06:41:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:48 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcoo044014;
        Fri, 13 Mar 2020 06:41:47 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 06/16] media: ti-vpe: cal: remove useless CAL_GEN_* macros
Date:   Fri, 13 Mar 2020 13:41:11 +0200
Message-ID: <20200313114121.32182-6-tomi.valkeinen@ti.com>
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

These macros only obfuscate the code, so drop them.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 20 ++++++++------------
 drivers/media/platform/ti-vpe/cal_regs.h |  9 ---------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0888d6aac3f4..cd788c6687cb 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -775,10 +775,8 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
 	/* 3.B. Program Stop States */
 	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
-	set_field(&val, CAL_GEN_ENABLE,
-		  CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
-	set_field(&val, CAL_GEN_DISABLE,
-		  CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
+	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
+	set_field(&val, 0, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
 	set_field(&val, 407, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
 	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
@@ -787,8 +785,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
 	/* 4. Force FORCERXMODE */
 	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
-	set_field(&val, CAL_GEN_ENABLE,
-		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
+	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		ctx->csi2_port,
@@ -851,8 +848,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 	for (i = 0; i < 10; i++) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_TIMING(ctx->csi2_port),
-				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) ==
-		    CAL_GEN_DISABLE)
+				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
 		usleep_range(1000, 1100);
 	}
@@ -949,13 +945,13 @@ static void csi2_ppi_enable(struct cal_ctx *ctx)
 {
 	reg_write(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
 	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
-			CAL_GEN_ENABLE, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
 static void csi2_ppi_disable(struct cal_ctx *ctx)
 {
 	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
-			CAL_GEN_DISABLE, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
 static void csi2_ctx_config(struct cal_ctx *ctx)
@@ -1030,7 +1026,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
-	set_field(&val, CAL_GEN_ENABLE, CAL_PIX_PROC_EN_MASK);
+	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
 	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
 		reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port)));
@@ -1050,7 +1046,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 		  CAL_WR_DMA_CTRL_MODE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		  CAL_WR_DMA_CTRL_PATTERN_MASK);
-	set_field(&val, CAL_GEN_ENABLE, CAL_WR_DMA_CTRL_STALL_RD_MASK);
+	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
 	reg_write(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
 		reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port)));
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index a29198cc3efe..532d4a95740a 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -100,15 +100,6 @@
 /* CAL Control Module Core Camerrx Control register offsets */
 #define CM_CTRL_CORE_CAMERRX_CONTROL	0x000
 
-/*********************************************************************
-* Generic value used in various field below
-*********************************************************************/
-
-#define CAL_GEN_DISABLE			0
-#define CAL_GEN_ENABLE			1
-#define CAL_GEN_FALSE			0
-#define CAL_GEN_TRUE			1
-
 /*********************************************************************
 * Field Definition Macros
 *********************************************************************/
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

