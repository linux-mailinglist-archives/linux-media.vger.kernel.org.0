Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6CFB1927FA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgCYMQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41812 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG7dt062608;
        Wed, 25 Mar 2020 07:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138567;
        bh=40dKL0Rs6Tir0975wNv4gsR8uaF+xxdSkAXOOCeWmvU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xuue8YQF44AotzjIrKZfrZpCSzmEw3WAuRbcW5imElfa3j7ElmyLGD7S/PxKkHs5v
         l0/NkuZVJMpxrpsqUF/Tj1fStcFknAJgCVzxC3AZnDV1yjheTXmBILJ5QZk/ZbK6ms
         f3lLMsD5KEYUxYN22iCf0/ObnZpUEFd7BSACxLIQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCG7Lt087786
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:07 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm58085323;
        Wed, 25 Mar 2020 07:16:05 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 09/19] media: ti-vpe: cal: remove useless CAL_GEN_* macros
Date:   Wed, 25 Mar 2020 14:15:00 +0200
Message-ID: <20200325121510.25923-10-tomi.valkeinen@ti.com>
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

These macros only obfuscate the code, so drop them.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 20 ++++++++------------
 drivers/media/platform/ti-vpe/cal_regs.h |  9 ---------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index df06ecfdfc6a..101efe3a1045 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -777,10 +777,8 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
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
@@ -789,8 +787,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
 	/* 4. Force FORCERXMODE */
 	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
-	set_field(&val, CAL_GEN_ENABLE,
-		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
+	set_field(&val, 1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		ctx->csi2_port,
@@ -849,8 +846,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 	for (i = 0; i < 10; i++) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_TIMING(ctx->csi2_port),
-				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) ==
-		    CAL_GEN_DISABLE)
+				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
 		usleep_range(1000, 1100);
 	}
@@ -944,13 +940,13 @@ static void csi2_ppi_enable(struct cal_ctx *ctx)
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
@@ -1025,7 +1021,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
-	set_field(&val, CAL_GEN_ENABLE, CAL_PIX_PROC_EN_MASK);
+	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
 	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
 		reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port)));
@@ -1045,7 +1041,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 		  CAL_WR_DMA_CTRL_MODE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		  CAL_WR_DMA_CTRL_PATTERN_MASK);
-	set_field(&val, CAL_GEN_ENABLE, CAL_WR_DMA_CTRL_STALL_RD_MASK);
+	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
 	reg_write(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
 		reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port)));
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 2d71f1e86e2a..3b3150aaf343 100644
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

