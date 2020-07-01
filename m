Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43041210BF4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730936AbgGANQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730919AbgGANQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:16:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFECC03E979;
        Wed,  1 Jul 2020 06:16:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0D1C22A56A6
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 5/6] hantro: Remove unused bytesused argument
Date:   Wed,  1 Jul 2020 10:16:06 -0300
Message-Id: <20200701131607.121988-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200701131607.121988-1-ezequiel@collabora.com>
References: <20200701131607.121988-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver doesn't need the bytesused argument.

For decoders, the plane bytesused is known and therefore,
buf_prepare is used to set it. For encoders, it's
handled by the codec_ops.done hook.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c    | 9 ++++-----
 drivers/staging/media/hantro/hantro_hw.h     | 2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c  | 2 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 7 +++----
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 7 +++----
 5 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 88b5c5989d83..34367b169011 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -58,7 +58,6 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 
 static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
-			      unsigned int bytesused,
 			      enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
@@ -82,7 +81,7 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 					 result);
 }
 
-void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
+void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result)
 {
 	struct hantro_ctx *ctx =
@@ -96,7 +95,7 @@ void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
 	if (cancel_delayed_work(&vpu->watchdog_work)) {
 		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
 			ctx->codec_ops->done(ctx);
-		hantro_job_finish(vpu, ctx, bytesused, result);
+		hantro_job_finish(vpu, ctx, result);
 	}
 }
 
@@ -111,7 +110,7 @@ void hantro_watchdog(struct work_struct *work)
 	if (ctx) {
 		vpu_err("frame processing timed out!\n");
 		ctx->codec_ops->reset(ctx);
-		hantro_job_finish(vpu, ctx, 0, VB2_BUF_STATE_ERROR);
+		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
 	}
 }
 
@@ -164,7 +163,7 @@ static void device_run(void *priv)
 	return;
 
 err_cancel_job:
-	hantro_job_finish(ctx->dev, ctx, 0, VB2_BUF_STATE_ERROR);
+	hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static struct v4l2_m2m_ops vpu_m2m_ops = {
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2d6323cd6732..f066de6b592d 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -163,7 +163,7 @@ extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
 void hantro_run(struct hantro_ctx *ctx);
-void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
+void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb2420c5526e..c222de075ef4 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -143,7 +143,7 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
 	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
 
-	hantro_irq_done(vpu, 0, state);
+	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index b1cf2abb972f..7b299ee3e93d 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -113,17 +113,16 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
-	u32 status, bytesused;
+	u32 status;
 
 	status = vepu_read(vpu, H1_REG_INTERRUPT);
-	bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
 	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
 	vepu_write(vpu, 0, H1_REG_INTERRUPT);
 	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
 
-	hantro_irq_done(vpu, bytesused, state);
+	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;
 }
@@ -141,7 +140,7 @@ static irqreturn_t rk3288_vdpu_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
 	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
 
-	hantro_irq_done(vpu, 0, state);
+	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 9ac1f2cb6a16..7a7962cf771e 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -92,17 +92,16 @@ static irqreturn_t rk3399_vepu_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
-	u32 status, bytesused;
+	u32 status;
 
 	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
-	bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
 	state = (status & VEPU_REG_INTERRUPT_FRAME_READY) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
 	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
 	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
 
-	hantro_irq_done(vpu, bytesused, state);
+	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;
 }
@@ -120,7 +119,7 @@ static irqreturn_t rk3399_vdpu_irq(int irq, void *dev_id)
 	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
 
-	hantro_irq_done(vpu, 0, state);
+	hantro_irq_done(vpu, state);
 
 	return IRQ_HANDLED;
 }
-- 
2.26.0.rc2

