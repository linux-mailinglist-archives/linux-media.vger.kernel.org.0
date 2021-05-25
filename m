Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8201639064A
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhEYQOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 12:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbhEYQOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 12:14:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD2FC061756;
        Tue, 25 May 2021 09:12:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id C1E231F4282E
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v11 3/9] media: hantro: change hantro_codec_ops run prototype to return errors
Date:   Tue, 25 May 2021 18:12:32 +0200
Message-Id: <20210525161238.1191168-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
References: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change hantro_codec_ops run prototype from 'void' to 'int'.
This allows the driver to cancel the job if an error occurs while configuring
the hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c     |  4 +++-
 .../staging/media/hantro/hantro_g1_h264_dec.c | 10 +++++++---
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  4 +++-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  6 ++++--
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |  4 +++-
 drivers/staging/media/hantro/hantro_hw.h      | 19 ++++++++++---------
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  4 +++-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  4 +++-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  6 ++++--
 9 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 2f6b01c7a6a0..1f28cd2607d2 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -170,7 +170,9 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-	ctx->codec_ops->run(ctx);
+	if (ctx->codec_ops->run(ctx))
+		goto err_cancel_job;
+
 	return;
 
 err_cancel_job:
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 845bef73d218..5c792b7bcb79 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -273,13 +273,15 @@ static void set_buffers(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);
 }
 
-void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
+	int ret;
 
 	/* Prepare the H264 decoder context. */
-	if (hantro_h264_dec_prepare_run(ctx))
-		return;
+	ret = hantro_h264_dec_prepare_run(ctx);
+	if (ret)
+		return ret;
 
 	/* Configure hardware registers. */
 	set_params(ctx);
@@ -301,4 +303,6 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 			   G1_REG_CONFIG_DEC_CLK_GATE_E,
 			   G1_REG_CONFIG);
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6ee1a19d189b..9aea331e1a3c 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -145,7 +145,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER3_BASE);
 }
 
-void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -235,4 +235,6 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	hantro_end_prepare_run(ctx);
 
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 57002ba70176..96622a7f8279 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -425,7 +425,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 }
 
-void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame *hdr;
 	struct hantro_dev *vpu = ctx->dev;
@@ -438,7 +438,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
 	if (WARN_ON(!hdr))
-		return;
+		return -EINVAL;
 
 	/* Reset segment_map buffer in keyframe */
 	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
@@ -498,4 +498,6 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	hantro_end_prepare_run(ctx);
 
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index b88dc4ed06db..56cf261a8e95 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -88,7 +88,7 @@ hantro_h1_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 	}
 }
 
-void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
+int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -136,6 +136,8 @@ void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	hantro_end_prepare_run(ctx);
 
 	vepu_write(vpu, reg, H1_REG_ENC_CTRL);
+
+	return 0;
 }
 
 void hantro_jpeg_enc_done(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 3d8b53567f16..4b73c8011b25 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -133,14 +133,15 @@ struct hantro_postproc_ctx {
  *		Optional and called from process context.
  * @run:	Start single {en,de)coding job. Called from atomic context
  *		to indicate that a pair of buffers is ready and the hardware
- *		should be programmed and started.
+ *		should be programmed and started. Returns zero if OK, a
+ *		negative value in error cases.
  * @done:	Read back processing results and additional data from hardware.
  * @reset:	Reset the hardware in case of a timeout.
  */
 struct hantro_codec_ops {
 	int (*init)(struct hantro_ctx *ctx);
 	void (*exit)(struct hantro_ctx *ctx);
-	void (*run)(struct hantro_ctx *ctx);
+	int (*run)(struct hantro_ctx *ctx);
 	void (*done)(struct hantro_ctx *ctx);
 	void (*reset)(struct hantro_ctx *ctx);
 };
@@ -180,8 +181,8 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx);
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);
 void hantro_g1_reset(struct hantro_ctx *ctx);
 
-void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
-void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
+int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
+int rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
@@ -189,7 +190,7 @@ void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
 dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
-void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
+int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
@@ -220,15 +221,15 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
 }
 
-void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
+int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
+int rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 				  const struct v4l2_ctrl_mpeg2_quantisation *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
-void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx);
-void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx);
+int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx);
+int rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx);
 int hantro_vp8_dec_init(struct hantro_ctx *ctx);
 void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
 void hantro_vp8_prob_update(struct hantro_ctx *ctx,
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
index 3498e6124acd..3a27ebef4f38 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
@@ -118,7 +118,7 @@ rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
 	}
 }
 
-void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
+int rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -168,4 +168,6 @@ void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 	/* Kick the watchdog and start encoding */
 	hantro_end_prepare_run(ctx);
 	vepu_write(vpu, reg, VEPU_REG_ENCODE_START);
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 2527dce7eb18..683982c24c2d 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -148,7 +148,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
 }
 
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
+int rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -244,4 +244,6 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = vdpu_read(vpu, VDPU_SWREG(57)) | VDPU_REG_DEC_E(1);
 	vdpu_write(vpu, reg, VDPU_SWREG(57));
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index 8661a3cc1e6b..e5d20fe5b007 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -503,7 +503,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, dst_dma, VDPU_REG_ADDR_DST);
 }
 
-void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
+int rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame *hdr;
 	struct hantro_dev *vpu = ctx->dev;
@@ -516,7 +516,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
 	if (WARN_ON(!hdr))
-		return;
+		return -EINVAL;
 
 	/* Reset segment_map buffer in keyframe */
 	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
@@ -589,4 +589,6 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 	hantro_end_prepare_run(ctx);
 
 	hantro_reg_write(vpu, &vp8_dec_start_dec, 1);
+
+	return 0;
 }
-- 
2.25.1

