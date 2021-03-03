Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD71932BB26
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443517AbhCCMOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbhCCLqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 06:46:17 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04C3C06121F;
        Wed,  3 Mar 2021 03:45:19 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:2035:1dcd:21c7:b3af])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 463131F45C2B;
        Wed,  3 Mar 2021 11:40:19 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 03/11] media: hantro: change hantro_codec_ops run prototype to return errors
Date:   Wed,  3 Mar 2021 12:39:44 +0100
Message-Id: <20210303113952.178519-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
References: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
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
 drivers/staging/media/hantro/hantro_drv.c     |  4 +++-
 .../staging/media/hantro/hantro_g1_h264_dec.c |  6 ++++--
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  4 +++-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  6 ++++--
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |  4 +++-
 drivers/staging/media/hantro/hantro_hw.h      | 19 ++++++++++---------
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  4 +++-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  4 +++-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  6 ++++--
 9 files changed, 37 insertions(+), 20 deletions(-)

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
index 845bef73d218..fcd4db13c9fe 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -273,13 +273,13 @@ static void set_buffers(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);
 }
 
-void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
+int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 
 	/* Prepare the H264 decoder context. */
 	if (hantro_h264_dec_prepare_run(ctx))
-		return;
+		return -EINVAL;
 
 	/* Configure hardware registers. */
 	set_params(ctx);
@@ -301,4 +301,6 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
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

