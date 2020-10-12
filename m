Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7541D28C385
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbgJLU7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49968 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731738AbgJLU7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 25FF71F44C53
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] media: hantro: make PP enablement logic a bit smarter
Date:   Mon, 12 Oct 2020 23:59:53 +0300
Message-Id: <20201012205957.889185-15-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we support two cores with different PP operations we need
to make the condition to enable PP a bit smarter based on what is
actually supported by each core.

While doing this also move the needs_postproc() test inside the
postproc .c file instead of cluttering the header.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro.h         | 10 ++-----
 .../staging/media/hantro/hantro_postproc.c    | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 2d507f8d3a1d..05e59bc83b71 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -393,6 +393,9 @@ static inline void hantro_reg_write_s(struct hantro_dev *vpu,
 	vdpu_write(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
 }
 
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt);
+
 void *hantro_get_ctrl(struct hantro_ctx *ctx, u32 id);
 dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts);
 
@@ -408,13 +411,6 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
-static inline bool
-hantro_needs_postproc(const struct hantro_ctx *ctx,
-		      const struct hantro_fmt *fmt)
-{
-	return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
-}
-
 static inline dma_addr_t
 hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
 {
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index a6b3e243dc39..653bae37eed9 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -22,6 +22,35 @@
 
 #define VC8000D_PP_OUT_NV12		0x0
 
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt)
+{
+	bool ret = false;
+
+	/* postproc is only available for decoders */
+	if (ctx->is_encoder)
+		return false;
+
+	switch (ctx->dev->core_hw_dec_rev) {
+	case HANTRO_G1_REV:
+		/*
+		 * for now the G1 PP is only used for NV12 -> YUYV conversion
+		 * so if the dst format is already NV12 we don't need it
+		 */
+		ret = fmt->fourcc != V4L2_PIX_FMT_NV12;
+		break;
+	case HANTRO_VC8000_REV:
+		/*
+		 * for now the VC8000D PP is only used to de-tile 4x4 NV12, so
+		 * enabling it for something else doesn't make sense.
+		 */
+		ret = fmt->fourcc == V4L2_PIX_FMT_NV12;
+		break;
+	}
+
+	return ret;
+}
+
 void hantro_postproc_enable(struct hantro_ctx *ctx)
 {
 	struct hantro_regmap_fields_dec *fields = ctx->dev->reg_fields_dec;
-- 
2.28.0

