Return-Path: <linux-media+bounces-44070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D95BC8B80
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12B944E2DEB
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E628D2DFF33;
	Thu,  9 Oct 2025 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pyv/kJxz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDDA25A659
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008315; cv=none; b=Xoa7zld9e0v/UqC6lzYMCKY1Wxfvt8iFS6jeJIBPd9cQkmU0ClUj2GBUYyNjLi1odGxiab6Clxed0j3xSSoALnzzGrTxNJGF6EMB7SsA1e+bIHYhy+ZyqCnnLpCtFAVBcRgiInIM/d+Qz1TxLGQUV0Gc2M2GKJmdG6itYP7YmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008315; c=relaxed/simple;
	bh=hHz8YdtHioPSOVwHRJYVN90dGjplXI5Vmj7Mglb6IE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLTnQrAZeG/+kbU10fdIEI5MuzTwpAkWZ5Xl9vr+b8mTPaH8Ruj6Ew57qPu74mrhRKcT+x+7UebE5nRUTaH3K2mHZs7Pi4jSdmjfmGf5ZLKChzZh1QvbzRtSfQ4JLnckC5n9SXgtOLGcM7Yb1UpAPB2BsDEY9XwLl3nsGnoSP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pyv/kJxz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 84018965;
	Thu,  9 Oct 2025 13:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760008215;
	bh=hHz8YdtHioPSOVwHRJYVN90dGjplXI5Vmj7Mglb6IE8=;
	h=From:To:Cc:Subject:Date:From;
	b=Pyv/kJxz95Ui53C0pDU9sxoFjf0lXr36X+jpVrdRnVmSfnPYQ8mf0E0TIyJV+asyy
	 ViTKOlbKiqc6JELvOZGMspBZH6b9tDA6c1El3DncWGcXlFPkxa74Wtl7fIGKjfUI2r
	 G8W3cga/15Td3/GqHNkAkIF7JVNtktCe9D7DMPcU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH] media: v4l2-mem2mem: Don't copy frame flags for frame-based devices
Date: Thu,  9 Oct 2025 14:11:43 +0300
Message-ID: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_buf_copy_metadata() function takes a boolean
copy_frame_flags argument. When true, it causes the function to copy the
V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
flags from the output buffer to the capture buffer.

Many frame-based M2M drivers (e.g. for JPEG encoders, scalers,
dewarpers, 2D blenders, ...) set the argument to true, while the frame
flags are not applicable to those drivers as they have no concept of
key, B or P frames. Set the argument to false to avoid further
cargo-cult mistakes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c     | 4 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c   | 4 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c   | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c      | 2 +-
 drivers/media/platform/nxp/dw100/dw100.c                 | 2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c           | 2 +-
 drivers/media/platform/rockchip/rga/rga.c                | 2 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c            | 2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c         | 2 +-
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
 drivers/media/test-drivers/vim2m.c                       | 2 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c         | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 35c70ec3ad2c..6bd5036430dc 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1619,7 +1619,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	if (!dst_buf)
 		goto getbuf_fail;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
@@ -1715,7 +1715,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	if (!dst_buf)
 		goto getbuf_fail;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index e78e1d11093c..556865100872 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -530,7 +530,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
@@ -560,7 +560,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 9ab27aee302a..4c8427b3c384 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -261,7 +261,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
@@ -289,7 +289,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 59ce5cce0698..dba46a69c6be 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -51,7 +51,7 @@ static void mdp_m2m_process_done(void *priv, int vb_state)
 	ctx->curr_param.frame_no = ctx->frame_count[MDP_M2M_SRC];
 	src_vbuf->sequence = ctx->frame_count[MDP_M2M_SRC]++;
 	dst_vbuf->sequence = ctx->frame_count[MDP_M2M_DST]++;
-	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
+	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
 
 	v4l2_m2m_buf_done(src_vbuf, vb_state);
 	v4l2_m2m_buf_done(dst_vbuf, vb_state);
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 7a0ee44d9e1f..b73302d54635 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1483,7 +1483,7 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
 		in_vb->sequence, out_vb->sequence);
 
-	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
+	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
 
 	/* Now, let's deal with hardware ... */
 	dw100_hw_master_bus_disable(dw_dev);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 37e0670f98c5..e1dda1e834e4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1537,7 +1537,7 @@ static void mxc_jpeg_device_run(void *priv)
 	src_buf->sequence = q_data_out->sequence++;
 	dst_buf->sequence = q_data_cap->sequence++;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
 	if (q_data_cap->fmt->mem_planes != dst_buf->vb2_buf.num_planes) {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 48b88da59da0..075b684fb178 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -75,7 +75,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		WARN_ON(!src);
 		WARN_ON(!dst);
 
-		v4l2_m2m_buf_copy_metadata(src, dst, true);
+		v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 		dst->sequence = ctx->csequence++;
 
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 643913adc1f3..4184bdb96e6d 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -483,7 +483,7 @@ static void device_run(void *prv)
 
 	src->sequence = frm_out->sequence++;
 	dst->sequence = frm_cap->sequence++;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	if (clk_enable(dev->gate))
 		goto end;
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 3e7f2df70408..11a6c7f5212e 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -71,7 +71,7 @@ static void deinterlace_device_run(void *priv)
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	deinterlace_write(dev, DEINTERLACE_MOD_ENABLE,
 			  DEINTERLACE_MOD_ENABLE_EN);
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index abd10b218aa1..f6e2f11a20dd 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -70,7 +70,7 @@ static void rotate_device_run(void *priv)
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	val = ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
 	if (ctx->hflip)
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index dc82830a35a5..3e8476165721 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -482,7 +482,7 @@ static int device_process(struct vim2m_ctx *ctx,
 
 	out_vb->sequence = q_data_out->sequence++;
 	in_vb->sequence = q_data_in->sequence++;
-	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
+	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
 
 	if (ctx->mode & MEM2MEM_VFLIP) {
 		start = height - 1;
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 19fd31cb9bb0..770ba3fbaba2 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -96,7 +96,7 @@ static void ipu_ic_pp_complete(struct ipu_image_convert_run *run, void *_ctx)
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	src_buf->sequence = ctx->sequence++;
 	dst_buf->sequence = src_buf->sequence;

base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart


