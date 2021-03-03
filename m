Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF26432C7D1
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346413AbhCDAcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39040 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388029AbhCCU2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 15:28:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 06BA31F46026
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 7/8] media: vp8: Rename V4L2 VP8 specific macro to V4L2_VP8_
Date:   Wed,  3 Mar 2021 17:27:13 -0300
Message-Id: <20210303202714.212394-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210303202714.212394-1-ezequiel@collabora.com>
References: <20210303202714.212394-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before we move the VP8 controls to a stable public header,
rename this macro so it's clearly V4L2-specific.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c     |  6 +++---
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c |  6 +++---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c      | 12 ++++++------
 include/media/vp8-ctrls.h                            |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 2de80fef07f4..03360fdb9341 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -234,7 +234,7 @@ static void cfg_parts(struct hantro_ctx *ctx,
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_src;
-	u32 first_part_offset = VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
+	u32 first_part_offset = V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
 	u32 mb_size, mb_offset_bytes, mb_offset_bits, mb_start_bits;
 	u32 dct_size_part_size, dct_part_offset;
 	struct hantro_reg reg;
@@ -442,7 +442,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 		return;
 
 	/* Reset segment_map buffer in keyframe */
-	if (VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
+	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
 		memset(ctx->vp8_dec.segment_map.cpu, 0,
 		       ctx->vp8_dec.segment_map.size);
 
@@ -460,7 +460,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
 
 	reg = G1_REG_DEC_CTRL0_DEC_MODE(10);
-	if (!VP8_FRAME_IS_KEY_FRAME(hdr))
+	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(hdr))
 		reg |= G1_REG_DEC_CTRL0_PIC_INTER_E;
 	if (!(hdr->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF))
 		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index cbca123db746..bb9f5d3c63c7 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -347,7 +347,7 @@ static void cfg_parts(struct hantro_ctx *ctx,
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_src;
-	u32 first_part_offset = VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
+	u32 first_part_offset = V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) ? 10 : 3;
 	u32 mb_size, mb_offset_bytes, mb_offset_bits, mb_start_bits;
 	u32 dct_size_part_size, dct_part_offset;
 	dma_addr_t src_dma;
@@ -520,7 +520,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 		return;
 
 	/* Reset segment_map buffer in keyframe */
-	if (VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
+	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
 		memset(ctx->vp8_dec.segment_map.cpu, 0,
 		       ctx->vp8_dec.segment_map.size);
 
@@ -537,7 +537,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 
 	reg = VDPU_REG_CONFIG_DEC_TIMEOUT_E
 		| VDPU_REG_CONFIG_DEC_CLK_GATE_E;
-	if (!VP8_FRAME_IS_KEY_FRAME(hdr))
+	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(hdr))
 		reg |= VDPU_REG_DEC_CTRL0_PIC_INTER_E;
 	vdpu_write_relaxed(vpu, reg, VDPU_REG_EN_FLAGS);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index cab0770515c5..1e6f3086e400 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -526,7 +526,7 @@ static void cedrus_read_header(struct cedrus_dev *dev,
 {
 	int i, j;
 
-	if (VP8_FRAME_IS_KEY_FRAME(slice)) {
+	if (V4L2_VP8_FRAME_IS_KEY_FRAME(slice)) {
 		read_bits(dev, 1, VP8_PROB_HALF);
 		read_bits(dev, 1, VP8_PROB_HALF);
 	}
@@ -550,12 +550,12 @@ static void cedrus_read_header(struct cedrus_dev *dev,
 	for (i = 0; i < QUANT_DELTA_COUNT; i++)
 		get_delta_q(dev);
 
-	if (!VP8_FRAME_IS_KEY_FRAME(slice))
+	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(slice))
 		process_ref_frame_info(dev);
 
 	read_bits(dev, 1, VP8_PROB_HALF);
 
-	if (!VP8_FRAME_IS_KEY_FRAME(slice))
+	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(slice))
 		read_bits(dev, 1, VP8_PROB_HALF);
 
 	cedrus_write(dev, VE_H264_TRIGGER_TYPE, VE_H264_TRIGGER_TYPE_VP8_UPDATE_COEF);
@@ -565,7 +565,7 @@ static void cedrus_read_header(struct cedrus_dev *dev,
 	if (read_bits(dev, 1, VP8_PROB_HALF))
 		read_bits(dev, 8, VP8_PROB_HALF);
 
-	if (!VP8_FRAME_IS_KEY_FRAME(slice)) {
+	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(slice)) {
 		read_bits(dev, 8, VP8_PROB_HALF);
 		read_bits(dev, 8, VP8_PROB_HALF);
 		read_bits(dev, 8, VP8_PROB_HALF);
@@ -672,7 +672,7 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
 	reg = slice->first_part_size * 8;
 	cedrus_write(dev, VE_VP8_FIRST_DATA_PART_LEN, reg);
 
-	header_size = VP8_FRAME_IS_KEY_FRAME(slice) ? 10 : 3;
+	header_size = V4L2_VP8_FRAME_IS_KEY_FRAME(slice) ? 10 : 3;
 
 	reg = slice->first_part_size + header_size;
 	cedrus_write(dev, VE_VP8_PART_SIZE_OFFSET, reg);
@@ -850,7 +850,7 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
 		ctx->codec.vp8.last_filter_type =
 			!!(slice->lf.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE);
 		ctx->codec.vp8.last_frame_p_type =
-			!VP8_FRAME_IS_KEY_FRAME(slice);
+			!V4L2_VP8_FRAME_IS_KEY_FRAME(slice);
 		ctx->codec.vp8.last_sharpness_level =
 			slice->lf.sharpness_level;
 	}
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 051700f33863..2599f5fd38e6 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -146,7 +146,7 @@ struct v4l2_vp8_entropy_coder_state {
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
 
-#define VP8_FRAME_IS_KEY_FRAME(hdr) \
+#define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
 	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
 
 /**
-- 
2.30.0

