Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14F37A05CA
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239230AbjINNeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239214AbjINNdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:33:53 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B691FEB;
        Thu, 14 Sep 2023 06:33:40 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E3ED4660736C;
        Thu, 14 Sep 2023 14:33:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694698419;
        bh=G1d7K+QU+qOmdvGntI5BZm0vkE40HwEf9qtRlxyqy2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MjJN8QGkFKCFBxID7yfEh5Tj8KR6qdmdF3h0uWLO8YELpklzLNmPLzk7wcHuAqhSb
         oUgJMl/9OyrtS6mX2T3xx+4csZt3eq2ifoRw7eN3gxmj2SG2LMDqH4L51b8x4wIHJY
         /QLgFyNB8nAh8LvernTRnqWrDT3Tl1ajAlyNUCqgPP4uEWEjpNYi8zehya5Dsl/Vwl
         kpJjsGRc+AwdwHSaqssEiuG7K7mela9ADGew6VqRLY/XMmxxOb/oT/Z3G919mh+3be
         B0m8zGYy4DOdXKm9rCgEN9jrkmHwFqwBv81fG/cbcEe+YsFGMN1J+rnhinZxwa2Lrb
         FtEDubDtgJaqQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 15/49] media: verisilicon: g2: Use common helpers to compute chroma and mv offsets
Date:   Thu, 14 Sep 2023 15:32:49 +0200
Message-Id: <20230914133323.198857-16-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC and VP9 are running on the same hardware and share the same
chroma and motion vectors offset constraint.
Create common helpers functions for these computation.
Source and destination buffer height may not be the same because
alignment constraint are different so use destination height to
compute chroma offset because we target this buffer as hardware
output.
To be able to use the helpers in both VP9 HEVC code remove dec_params
and use context->bit_depth instead.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_g2.c    | 14 ++++++++++
 .../platform/verisilicon/hantro_g2_hevc_dec.c | 18 ++-----------
 .../platform/verisilicon/hantro_g2_vp9_dec.c  | 26 +++----------------
 .../media/platform/verisilicon/hantro_hw.h    |  3 +++
 4 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
index ee5f14c5f8f2..b880a6849d58 100644
--- a/drivers/media/platform/verisilicon/hantro_g2.c
+++ b/drivers/media/platform/verisilicon/hantro_g2.c
@@ -8,6 +8,8 @@
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
+#define G2_ALIGN	16
+
 void hantro_g2_check_idle(struct hantro_dev *vpu)
 {
 	int i;
@@ -42,3 +44,15 @@ irqreturn_t hantro_g2_irq(int irq, void *dev_id)
 
 	return IRQ_HANDLED;
 }
+
+size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
+{
+	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+}
+
+size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
+{
+	size_t cr_offset = hantro_g2_chroma_offset(ctx);
+
+	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
+}
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index a9d4ac84a8d8..d3f8c33eb16c 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -8,20 +8,6 @@
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
-#define G2_ALIGN	16
-
-static size_t hantro_hevc_chroma_offset(struct hantro_ctx *ctx)
-{
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
-}
-
-static size_t hantro_hevc_motion_vectors_offset(struct hantro_ctx *ctx)
-{
-	size_t cr_offset = hantro_hevc_chroma_offset(ctx);
-
-	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
-}
-
 static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -384,8 +370,8 @@ static int set_ref(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_dst;
 	struct hantro_decoded_buffer *dst;
-	size_t cr_offset = hantro_hevc_chroma_offset(ctx);
-	size_t mv_offset = hantro_hevc_motion_vectors_offset(ctx);
+	size_t cr_offset = hantro_g2_chroma_offset(ctx);
+	size_t mv_offset = hantro_g2_motion_vectors_offset(ctx);
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 6db1c32fce4d..342e543dee4c 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -16,8 +16,6 @@
 #include "hantro_vp9.h"
 #include "hantro_g2_regs.h"
 
-#define G2_ALIGN 16
-
 enum hantro_ref_frames {
 	INTRA_FRAME = 0,
 	LAST_FRAME = 1,
@@ -90,22 +88,6 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 	return 0;
 }
 
-static size_t chroma_offset(const struct hantro_ctx *ctx,
-			    const struct v4l2_ctrl_vp9_frame *dec_params)
-{
-	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
-
-	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
-}
-
-static size_t mv_offset(const struct hantro_ctx *ctx,
-			const struct v4l2_ctrl_vp9_frame *dec_params)
-{
-	size_t cr_offset = chroma_offset(ctx, dec_params);
-
-	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
-}
-
 static struct hantro_decoded_buffer *
 get_ref_buf(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
 {
@@ -156,13 +138,13 @@ static void config_output(struct hantro_ctx *ctx,
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	hantro_write_addr(ctx->dev, G2_OUT_LUMA_ADDR, luma_addr);
 
-	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
+	chroma_addr = luma_addr + hantro_g2_chroma_offset(ctx);
 	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
-	dst->vp9.chroma_offset = chroma_offset(ctx, dec_params);
+	dst->vp9.chroma_offset = hantro_g2_chroma_offset(ctx);
 
-	mv_addr = luma_addr + mv_offset(ctx, dec_params);
+	mv_addr = luma_addr + hantro_g2_motion_vectors_offset(ctx);
 	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
-	dst->vp9.mv_offset = mv_offset(ctx, dec_params);
+	dst->vp9.mv_offset = hantro_g2_motion_vectors_offset(ctx);
 }
 
 struct hantro_vp9_ref_reg {
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 292a76ef643e..9aec8a79acdc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -521,6 +521,9 @@ hantro_av1_mv_size(unsigned int width, unsigned int height)
 	return ALIGN(num_sbs * 384, 16) * 2 + 512;
 }
 
+size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
+size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx);
+
 int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-- 
2.39.2

