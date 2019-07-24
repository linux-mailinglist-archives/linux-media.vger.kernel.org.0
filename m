Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6DE7355B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 19:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfGXRZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 13:25:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34640 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGXRZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 13:25:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3DCAD28B605
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 4/7] media: hantro: Add hantro_get_{src,dst}_buf() helpers
Date:   Wed, 24 Jul 2019 14:16:59 -0300
Message-Id: <20190724171702.9449-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724171702.9449-1-ezequiel@collabora.com>
References: <20190724171702.9449-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

And replace all calls to v4l2_m2m_next_{src,dst}_buf() by
hantro_get_{src,dst}_buf() one.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h               | 13 +++++++++++++
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c  |  4 ++--
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c    |  8 ++++----
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c   |  4 ++--
 .../staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c   |  4 ++--
 .../staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c  |  4 ++--
 6 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 81e25dfc98b7..c4c86c32ea2d 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -20,6 +20,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -373,4 +374,16 @@ bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx);
 void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
 dma_addr_t hantro_get_ref(struct vb2_queue *q, u64 ts);
 
+static inline struct vb2_v4l2_buffer *
+hantro_get_src_buf(struct hantro_ctx *ctx)
+{
+	return v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+}
+
+static inline struct vb2_v4l2_buffer *
+hantro_get_dst_buf(struct hantro_ctx *ctx)
+{
+	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+}
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index e592c1b66375..55f861e96108 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -167,8 +167,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	const struct v4l2_mpeg2_picture *picture;
 	u32 reg;
 
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
 
 	/* Apply request controls if any */
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 72d983a11ca1..6032cbbecb06 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -260,7 +260,7 @@ static void cfg_parts(struct hantro_ctx *ctx,
 	u32 count = 0;
 	unsigned int i;
 
-	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	vb2_src = hantro_get_src_buf(ctx);
 	src_dma = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
 
 	/*
@@ -391,7 +391,7 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	struct vb2_v4l2_buffer *vb2_dst;
 	dma_addr_t ref;
 
-	vb2_dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(cap_q, hdr->last_frame_ts);
 	if (!ref)
@@ -424,7 +424,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	dma_addr_t dst_dma;
 	u32 reg;
 
-	vb2_dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	vb2_dst = hantro_get_dst_buf(ctx);
 
 	/* Set probability table buffer address */
 	vdpu_write_relaxed(vpu, ctx->vp8_dec.prob_tbl.dma,
@@ -453,7 +453,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	u32 mb_width, mb_height;
 	u32 reg;
 
-	vb2_src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	vb2_src = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_setup(vb2_src->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index 0c1e3043dc7e..f5adb5cbde50 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -84,8 +84,8 @@ void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct hantro_jpeg_ctx jpeg_ctx;
 	u32 reg;
 
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
 
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
 	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
index ae66354d2d93..82c5af822766 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
@@ -116,8 +116,8 @@ void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx)
 	struct media_request *src_req;
 	u32 reg;
 
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
 
 	src_req = src_buf->vb2_buf.req_obj.req;
 	v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 8685bddfbcab..451bfcceadba 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -169,8 +169,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	const struct v4l2_mpeg2_picture *picture;
 	u32 reg;
 
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
 
 	/* Apply request controls if any */
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
-- 
2.22.0

