Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1B7DC8C4
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410723AbfJRPdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:33:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44798 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410637AbfJRPcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWEWh117080;
        Fri, 18 Oct 2019 10:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412734;
        bh=vQXelJibkXd5wKVqcEHkVbrn+8AeeTrkzg5vYTTtFQ4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dO1fOncvqyKu2UqiOAtditUNJ0CYuxQwdC0XrUipYeACWQC+PTnID2JtSoWI8Raou
         ifTBnyJ/FfkDfUoW8/Nnh5lGXSgfjAE+6wXmcwZXzQs6K/WBmk8TpxNPlsd/eG1DK2
         Jj5VYA430ZSDJc5Ks2voCFp/C+gfTYXk5n5h0arw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWExT105850;
        Fri, 18 Oct 2019 10:32:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:14 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15O080266;
        Fri, 18 Oct 2019 10:32:14 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 10/19] media: ti-vpe: cal: Align DPHY init sequence with docs
Date:   Fri, 18 Oct 2019 10:34:28 -0500
Message-ID: <20191018153437.20614-11-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current CSI2 DPHY initialization sequence although
functional does not match with the documented sequence
in the Technical Reference Manual.

This may affect capture re-startability in stop/start
situations.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 199 ++++++++++++++++++++++++----
 1 file changed, 172 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 3c293e263397..c912ea82b534 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -689,29 +689,76 @@ static void disable_irqs(struct cal_ctx *ctx)
 	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(1), 0);
 }
 
-static void csi2_init(struct cal_ctx *ctx)
+static void csi2_phy_config(struct cal_ctx *ctx);
+
+static void csi2_phy_init(struct cal_ctx *ctx)
 {
 	int i;
 	u32 val;
 
+	/* Steps
+	 *  1. Configure D-PHY mode and enable required lanes
+	 *  2. Reset complex IO - Wait for completion of reset
+	 *          Note if the external sensor is not sending byte clock,
+	 *          the reset will timeout
+	 *  3 Program Stop States
+	 *      A. Program THS_TERM, THS_SETTLE, etc... Timings parameters
+	 *              in terms of DDR clock periods
+	 *      B. Enable stop state transition timeouts
+	 *  4.Force FORCERXMODE
+	 *      D. Enable pull down using pad control
+	 *      E. Power up PHY
+	 *      F. Wait for power up completion
+	 *      G. Wait for all enabled lane to reach stop state
+	 *      H. Disable pull down using pad control
+	 */
+
+	/* 1. Configure D-PHY mode and enable required lanes */
+	camerarx_phy_enable(ctx);
+
+	/* 2. Reset complex IO - Do not wait for reset completion */
+	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
+		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
+
+	/* Dummy read to allow SCP to complete */
+	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+
+	/* 3.A. Program Phy Timing Parameters */
+	csi2_phy_config(ctx);
+
+	/* 3.B. Program Stop States */
 	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
-	set_field(&val, CAL_GEN_ENABLE,
-		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	set_field(&val, CAL_GEN_ENABLE,
 		  CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
 	set_field(&val, CAL_GEN_DISABLE,
 		  CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
 	set_field(&val, 407, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
 	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
-	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x\n", ctx->csi2_port,
+	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
+
+	/* 4. Force FORCERXMODE */
+	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
+	set_field(&val, CAL_GEN_ENABLE,
+		  CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
+	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
+	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
+		ctx->csi2_port,
 		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
 
+	/* E. Power up the PHY using the complex IO */
 	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
-	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
-		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON,
 		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+
+	/* F. Wait for power up completion */
 	for (i = 0; i < 10; i++) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
@@ -720,18 +767,104 @@ static void csi2_init(struct cal_ctx *ctx)
 			break;
 		usleep_range(1000, 1100);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered UP %s\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
+		(i >= 10) ? "(timeout)" : "");
+}
 
-	val = reg_read(ctx->dev, CAL_CTRL);
-	set_field(&val, CAL_CTRL_BURSTSIZE_BURST128, CAL_CTRL_BURSTSIZE_MASK);
-	set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
-	set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
-		  CAL_CTRL_POSTED_WRITES_MASK);
-	set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
-	set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
-	reg_write(ctx->dev, CAL_CTRL, val);
-	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->dev, CAL_CTRL));
+static void csi2_wait_for_phy(struct cal_ctx *ctx)
+{
+	int i;
+
+	/* Steps
+	 *  2. Wait for completion of reset
+	 *          Note if the external sensor is not sending byte clock,
+	 *          the reset will timeout
+	 *  4.Force FORCERXMODE
+	 *      G. Wait for all enabled lane to reach stop state
+	 *      H. Disable pull down using pad control
+	 */
+
+	/* 2. Wait for reset completion */
+	for (i = 0; i < 250; i++) {
+		if (reg_read_field(ctx->dev,
+				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+			break;
+		usleep_range(1000, 1100);
+	}
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
+		(i >= 250) ? "(timeout)" : "");
+
+	/* 4. G. Wait for all enabled lane to reach stop state */
+	for (i = 0; i < 10; i++) {
+		if (reg_read_field(ctx->dev,
+				   CAL_CSI2_TIMING(ctx->csi2_port),
+				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) ==
+		    CAL_GEN_DISABLE)
+			break;
+		usleep_range(1000, 1100);
+	}
+	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached %s\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
+		(i >= 10) ? "(timeout)" : "");
+
+	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
+		(ctx->csi2_port - 1), reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
+}
+
+static void csi2_phy_deinit(struct cal_ctx *ctx)
+{
+	int i;
+	u32 val;
+
+	/* Power down the PHY using the complex IO */
+	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF,
+		  CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+
+	/* Wait for power down completion */
+	for (i = 0; i < 10; i++) {
+		if (reg_read_field(ctx->dev,
+				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+				   CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_STATE_OFF)
+			break;
+		usleep_range(1000, 1100);
+	}
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Powered Down %s\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)),
+		(i >= 10) ? "(timeout)" : "");
+
+	/* Assert Comple IO Reset */
+	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+	set_field(&val, CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
+		  CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+
+	/* Wait for power down completion */
+	for (i = 0; i < 10; i++) {
+		if (reg_read_field(ctx->dev,
+				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
+			break;
+		usleep_range(1000, 1100);
+	}
+	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
+		ctx->csi2_port,
+		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
+		(i >= 10) ? "(timeout)" : "");
+
+	/* Disable the phy */
+	camerarx_phy_disable(ctx);
 }
 
 static void csi2_lane_config(struct cal_ctx *ctx)
@@ -894,6 +1027,16 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 	reg_write(ctx->dev, CAL_WR_DMA_XSIZE(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->csi2_port,
 		reg_read(ctx->dev, CAL_WR_DMA_XSIZE(ctx->csi2_port)));
+
+	val = reg_read(ctx->dev, CAL_CTRL);
+	set_field(&val, CAL_CTRL_BURSTSIZE_BURST128, CAL_CTRL_BURSTSIZE_MASK);
+	set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
+	set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
+		  CAL_CTRL_POSTED_WRITES_MASK);
+	set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
+	set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
+	reg_write(ctx->dev, CAL_CTRL, val);
+	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->dev, CAL_CTRL));
 }
 
 static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
@@ -1466,17 +1609,14 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	cal_runtime_get(ctx->dev);
 
-	enable_irqs(ctx);
-	camerarx_phy_enable(ctx);
-	csi2_init(ctx);
-	csi2_phy_config(ctx);
-	csi2_lane_config(ctx);
 	csi2_ctx_config(ctx);
 	pix_proc_config(ctx);
 	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
 			  ctx->v_fmt.fmt.pix.height);
-	cal_wr_dma_addr(ctx, addr);
-	csi2_ppi_enable(ctx);
+	csi2_lane_config(ctx);
+
+	enable_irqs(ctx);
+	csi2_phy_init(ctx);
 
 	ret = v4l2_subdev_call(ctx->sensor, video, s_stream, 1);
 	if (ret) {
@@ -1485,6 +1625,10 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 	}
 
+	csi2_wait_for_phy(ctx);
+	cal_wr_dma_addr(ctx, addr);
+	csi2_ppi_enable(ctx);
+
 	if (debug >= 4)
 		cal_quickdump_regs(ctx->dev);
 
@@ -1505,11 +1649,12 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_buffer *buf, *tmp;
 	unsigned long flags;
 
-	if (v4l2_subdev_call(ctx->sensor, video, s_stream, 0))
-		ctx_err(ctx, "stream off failed in subdev\n");
-
 	csi2_ppi_disable(ctx);
 	disable_irqs(ctx);
+	csi2_phy_deinit(ctx);
+
+	if (v4l2_subdev_call(ctx->sensor, video, s_stream, 0))
+		ctx_err(ctx, "stream off failed in subdev\n");
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&ctx->slock, flags);
-- 
2.17.1

