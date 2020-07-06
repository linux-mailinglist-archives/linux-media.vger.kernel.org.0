Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB869215EBE
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgGFSip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbgGFSio (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:44 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85087AC6;
        Mon,  6 Jul 2020 20:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060697;
        bh=2/j3B7hS8AmqSCrlfEkmIbqgTuW8kL3+Og/0Axpb8KU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qB2CXpD/A5LbrK0NBp4o85uf97rvpU4kckO5iYllTGAOBYLQUIcGYn5FcAny6QAVo
         FVzo0i48+Df5T9uoMQbnJBjaM57rh/PVJu7++mNtZQCoJwEib2/D+FoPHZahCmST4T
         3OBElFxY8RK+mbQ4r8V6vhV13gGJ0PHxHLg1buZc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 078/108] media: ti-vpe: cal: Refactor camerarx start and stop
Date:   Mon,  6 Jul 2020 21:36:39 +0300
Message-Id: <20200706183709.12238-79-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor the camerarx start and stop procedure to group all the
corresponding operations in two functions, cal_camerarx_start() and
cal_camerarx_stop() instead of splitting them in multiple steps called
from the vb2 stream start and stop functions. This reduces the coupling
between the camerarx and the contexts, and better models the camerarx
hardware.

The cal_camerarx_start() is a reworked version of cal_camerarx_init()
with the description of the start procedure updated to match the AM65x,
DRA7[124567]x and DRA80xM TRMs. The cal_camerarx_wait_ready() function
is inlined in cal_camerarx_start() to better describe the start
procedure.

No functional change is included in the camerarx start and stop
procedures themselves, but the interleaving of the start steps with the
context configuration has been changed in cal_start_streaming().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 170 +++++++++++++++-------------
 1 file changed, 94 insertions(+), 76 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 6b0ed2946eba..50fe6c19c417 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -664,54 +664,50 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 		phy_err(phy, "Timeout waiting for stop state\n");
 }
 
-static void cal_camerarx_wait_ready(struct cal_camerarx *phy)
-{
-	/* Steps
-	 *  2. Wait for completion of reset
-	 *          Note if the external sensor is not sending byte clock,
-	 *          the reset will timeout
-	 *  4.Force FORCERXMODE
-	 *      G. Wait for all enabled lane to reach stop state
-	 *      H. Disable pull down using pad control
-	 */
-
-	/* 2. Wait for reset completion */
-	cal_camerarx_wait_reset(phy);
-
-	/* 4. G. Wait for all enabled lane to reach stop state */
-	cal_camerarx_wait_stop_state(phy);
-
-	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
-		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
-}
-
-static void cal_camerarx_init(struct cal_camerarx *phy,
+static int cal_camerarx_start(struct cal_camerarx *phy,
 			      const struct cal_fmt *fmt)
 {
-	u32 val;
 	u32 sscounter;
+	u32 val;
+	int ret;
 
-	/* Steps
-	 *  1. Configure D-PHY mode and enable required lanes
-	 *  2. Reset complex IO - Wait for completion of reset
-	 *          Note if the external sensor is not sending byte clock,
-	 *          the reset will timeout
-	 *  3 Program Stop States
-	 *      A. Program THS_TERM, THS_SETTLE, etc... Timings parameters
-	 *              in terms of DDR clock periods
-	 *      B. Enable stop state transition timeouts
-	 *  4.Force FORCERXMODE
-	 *      D. Enable pull down using pad control
-	 *      E. Power up PHY
-	 *      F. Wait for power up completion
-	 *      G. Wait for all enabled lane to reach stop state
-	 *      H. Disable pull down using pad control
+	ret = cal_camerarx_get_external_info(phy);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
+		phy_err(phy, "power on failed in subdev\n");
+		return ret;
+	}
+
+	/*
+	 * CSI-2 PHY Link Initialization Sequence, according to the DRA74xP /
+	 * DRA75xP / DRA76xP / DRA77xP TRM. The DRA71x / DRA72x and the AM65x /
+	 * DRA80xM TRMs have a a slightly simplified sequence.
 	 */
 
-	/* 1. Configure D-PHY mode and enable required lanes */
+	/*
+	 * 1. Configure all CSI-2 low level protocol registers to be ready to
+	 *    receive signals/data from the CSI-2 PHY.
+	 *
+	 *    i.-v. Configure the lanes position and polarity.
+	 */
+	cal_camerarx_lane_config(phy);
+
+	/*
+	 *    vi.-vii. Configure D-PHY mode, enable the required lanes and
+	 *             enable the CAMERARX clock.
+	 */
 	cal_camerarx_enable(phy);
 
-	/* 2. Reset complex IO - Do not wait for reset completion */
+	/*
+	 * 2. CSI PHY and link initialization sequence.
+	 *
+	 *    a. Deassert the CSI-2 PHY reset. Do not wait for reset completion
+	 *       at this point, as it requires the external sensor to send the
+	 *       CSI-2 HS clock.
+	 */
 	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
@@ -719,19 +715,20 @@ static void cal_camerarx_init(struct cal_camerarx *phy,
 		phy->instance,
 		reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
 
-	/* Dummy read to allow SCP reset to complete */
+	/* Dummy read to allow SCP reset to complete. */
 	reg_read(phy, CAL_CSI2_PHY_REG0);
 
-	/* 3.A. Program Phy Timing Parameters */
+	/* Program the PHY timing parameters. */
 	cal_camerarx_config(phy, fmt);
 
-	/* 3.B. Program Stop States */
 	/*
+	 *    b. Assert the FORCERXMODE signal.
+	 *
 	 * The stop-state-counter is based on fclk cycles, and we always use
 	 * the x16 and x4 settings, so stop-state-timeout =
 	 * fclk-cycle * 16 * 4 * counter.
 	 *
-	 * Stop-state-timeout must be more than 100us as per CSI2 spec, so we
+	 * Stop-state-timeout must be more than 100us as per CSI-2 spec, so we
 	 * calculate a timeout that's 100us (rounding up).
 	 */
 	sscounter = DIV_ROUND_UP(clk_get_rate(phy->cal->fclk), 10000 *  16 * 4);
@@ -745,24 +742,63 @@ static void cal_camerarx_init(struct cal_camerarx *phy,
 		phy->instance,
 		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
-	/* 4. Force FORCERXMODE */
+	/* Assert the FORCERXMODE signal. */
 	reg_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
 			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		phy->instance,
 		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
-	/* E. Power up the PHY using the complex IO */
+	/*
+	 * c. Connect pull-down on CSI-2 PHY link (using pad control).
+	 *
+	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
+	 * implemented.
+	 */
+
+	/*
+	 * d. Power up the CSI-2 PHY.
+	 * e. Check whether the state status reaches the ON state.
+	 */
 	cal_camerarx_power(phy, true);
+
+	/*
+	 * Start the sensor to enable the CSI-2 HS clock. We can now wait for
+	 * CSI-2 PHY reset to complete.
+	 */
+	ret = v4l2_subdev_call(phy->sensor, video, s_stream, 1);
+	if (ret) {
+		v4l2_subdev_call(phy->sensor, core, s_power, 0);
+		phy_err(phy, "stream on failed in subdev\n");
+		return ret;
+	}
+
+	cal_camerarx_wait_reset(phy);
+
+	/* f. Wait for STOPSTATE=1 for all enabled lane modules. */
+	cal_camerarx_wait_stop_state(phy);
+
+	phy_dbg(1, phy, "CSI2_%u_REG1 = 0x%08x (bits 31-28 should be set)\n",
+		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
+
+	/*
+	 * g. Disable pull-down on CSI-2 PHY link (using pad control).
+	 *
+	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
+	 * implemented.
+	 */
+
+	return 0;
 }
 
-static void cal_camerarx_deinit(struct cal_camerarx *phy)
+static void cal_camerarx_stop(struct cal_camerarx *phy)
 {
 	unsigned int i;
+	int ret;
 
 	cal_camerarx_power(phy, false);
 
-	/* Assert Comple IO Reset */
+	/* Assert Complex IO Reset */
 	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
@@ -783,6 +819,13 @@ static void cal_camerarx_deinit(struct cal_camerarx *phy)
 
 	/* Disable the phy */
 	cal_camerarx_disable(phy);
+
+	if (v4l2_subdev_call(phy->sensor, video, s_stream, 0))
+		phy_err(phy, "stream off failed in subdev\n");
+
+	ret = v4l2_subdev_call(phy->sensor, core, s_power, 0);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
+		phy_err(phy, "power off failed in subdev\n");
 }
 
 /*
@@ -1809,36 +1852,19 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
 	ctx->sequence = 0;
 
-	ret = cal_camerarx_get_external_info(ctx->phy);
-	if (ret < 0)
-		goto err;
-
-	ret = v4l2_subdev_call(ctx->phy->sensor, core, s_power, 1);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
-		ctx_err(ctx, "power on failed in subdev\n");
-		goto err;
-	}
-
 	pm_runtime_get_sync(ctx->cal->dev);
 
 	cal_ctx_csi2_config(ctx);
 	cal_ctx_pix_proc_config(ctx);
 	cal_ctx_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
 			      ctx->v_fmt.fmt.pix.height);
-	cal_camerarx_lane_config(ctx->phy);
 
 	cal_camerarx_enable_irqs(ctx->phy);
-	cal_camerarx_init(ctx->phy, ctx->fmt);
 
-	ret = v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 1);
-	if (ret) {
-		v4l2_subdev_call(ctx->phy->sensor, core, s_power, 0);
-		ctx_err(ctx, "stream on failed in subdev\n");
-		pm_runtime_put_sync(ctx->cal->dev);
+	ret = cal_camerarx_start(ctx->phy, ctx->fmt);
+	if (ret)
 		goto err;
-	}
 
-	cal_camerarx_wait_ready(ctx->phy);
 	cal_ctx_wr_dma_addr(ctx, addr);
 	cal_camerarx_ppi_enable(ctx->phy);
 
@@ -1867,7 +1893,6 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_buffer *buf, *tmp;
 	unsigned long timeout;
 	unsigned long flags;
-	int ret;
 	bool dma_act;
 
 	cal_camerarx_ppi_disable(ctx->phy);
@@ -1887,14 +1912,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 		ctx_err(ctx, "failed to disable dma cleanly\n");
 
 	cal_camerarx_disable_irqs(ctx->phy);
-	cal_camerarx_deinit(ctx->phy);
-
-	if (v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 0))
-		ctx_err(ctx, "stream off failed in subdev\n");
-
-	ret = v4l2_subdev_call(ctx->phy->sensor, core, s_power, 0);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		ctx_err(ctx, "power off failed in subdev\n");
+	cal_camerarx_stop(ctx->phy);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&ctx->slock, flags);
-- 
Regards,

Laurent Pinchart

