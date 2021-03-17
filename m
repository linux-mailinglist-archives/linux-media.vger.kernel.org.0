Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6609733F6FE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 18:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhCQRdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 13:33:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58696 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbhCQRcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 13:32:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 124E31F45457
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 06/13] media: hantro: change hantro_codec_ops run prototype to return errors
Date:   Wed, 17 Mar 2021 18:31:55 +0100
Message-Id: <20210317173202.107519-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317173202.107519-1-benjamin.gaignard@collabora.com>
References: <20210317173202.107519-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change hantro_codec_ops run prototype from 'void' to 'int'.
This allow to cancel the job if an error occur while configuring
the hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 5:
 - forward hantro_h264_dec_prepare_run() return value in case
   of error
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
index e5f200e64993..ac1429f00b33 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -161,7 +161,9 @@ static void device_run(void *priv)
 
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
index 6386a3989bfe..5e8943d31dc5 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -155,7 +155,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER3_BASE);
 }
 
-void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -248,4 +248,6 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = G1_REG_DEC_E(1);
 	vdpu_write(vpu, reg, G1_SWREG(1));
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index a5cdf150cd16..d665df026546 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -426,7 +426,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 }
 
-void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame_header *hdr;
 	struct hantro_dev *vpu = ctx->dev;
@@ -439,7 +439,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
 	if (WARN_ON(!hdr))
-		return;
+		return -EINVAL;
 
 	/* Reset segment_map buffer in keyframe */
 	if (VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
@@ -499,4 +499,6 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
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
index 34c9e4649a25..4e2e7a5ed283 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -126,14 +126,15 @@ struct hantro_postproc_ctx {
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
@@ -164,8 +165,8 @@ void hantro_irq_done(struct hantro_dev *vpu,
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
 
-void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
-void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
+int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
+int rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
@@ -173,7 +174,7 @@ void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
 dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
-void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
+int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
@@ -204,15 +205,15 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
 }
 
-void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
+int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
+int rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
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
index f610fa5b4335..4bd3080abbc1 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -157,7 +157,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 	vdpu_write_relaxed(vpu, backward_addr, VDPU_REG_REFER3_BASE);
 }
 
-void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
+int rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
@@ -254,4 +254,6 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = vdpu_read(vpu, VDPU_SWREG(57)) | VDPU_REG_DEC_E(1);
 	vdpu_write(vpu, reg, VDPU_SWREG(57));
+
+	return 0;
 }
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index a4a792f00b11..755571e16fcd 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -504,7 +504,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, dst_dma, VDPU_REG_ADDR_DST);
 }
 
-void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
+int rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_vp8_frame_header *hdr;
 	struct hantro_dev *vpu = ctx->dev;
@@ -517,7 +517,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
 	if (WARN_ON(!hdr))
-		return;
+		return -EINVAL;
 
 	/* Reset segment_map buffer in keyframe */
 	if (VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
@@ -590,4 +590,6 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 	hantro_end_prepare_run(ctx);
 
 	hantro_reg_write(vpu, &vp8_dec_start_dec, 1);
+
+	return 0;
 }
-- 
2.25.1

