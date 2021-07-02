Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92F43B9AA3
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 04:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbhGBCER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 22:04:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44272 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234596AbhGBCEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 22:04:15 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14d:72b1:a2ff:e85c:7833:5d85:73d6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7B7F91F447DD;
        Fri,  2 Jul 2021 03:01:41 +0100 (BST)
From:   daniel.almeida@collabora.com
To:     hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        mripard@kernel.org
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [RFC,WIP PATCH 2/2] Cedrus: add support for dynamic arrays in H264
Date:   Thu,  1 Jul 2021 23:01:29 -0300
Message-Id: <20210702020129.470720-3-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702020129.470720-1-daniel.almeida@collabora.com>
References: <20210702020129.470720-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Almeida <daniel.almeida@collabora.com>

So far the Cedrus driver is able to decode a slice at a time in slice
mode.

Use the new flag "V4L2_CTRL_FLAG_DYNAMIC_ARRAY" and the new h264 slice
decode mode to support passing an array with all the slices at once from
userspace.

The device will process all slices in this array before calling
v4l2_m2m_buf_done_and_job_finish, significantly reducing the
amount of back and forth of data.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 34 ++++++++++++--
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 18 ++++++++
 .../staging/media/sunxi/cedrus/cedrus_dec.c   | 33 +++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 35 +++++++++++++-
 include/uapi/linux/v4l2-controls.h            |  7 +++
 7 files changed, 162 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index b6344bbf1e00..5c7fe69d7097 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -367,6 +367,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 	static const char * const h264_decode_mode[] = {
 		"Slice-Based",
 		"Frame-Based",
+		"Slice Array Based",
 		NULL,
 	};
 	static const char * const h264_start_code[] = {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index e72810ace40f..3b55c1e5a288 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -56,6 +56,11 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_SLICE_PARAMS,
+			.flags  = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+			.dims	= {32},
+			/* FIXME: I suppose these last two will not be necessary */
+			.type	= V4L2_CTRL_TYPE_H264_SLICE_PARAMS,
+			.name	= "H264 Slice Parameters",
 		},
 		.codec		= CEDRUS_CODEC_H264,
 	},
@@ -86,7 +91,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_DECODE_MODE,
-			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
 			.def	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		= CEDRUS_CODEC_H264,
@@ -167,17 +172,40 @@ static const struct cedrus_control cedrus_controls[] = {
 
 #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
 
-void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id)
+struct v4l2_ctrl *cedrus_find_control(struct cedrus_ctx *ctx, u32 id)
 {
 	unsigned int i;
 
 	for (i = 0; ctx->ctrls[i]; i++)
 		if (ctx->ctrls[i]->id == id)
-			return ctx->ctrls[i]->p_cur.p;
+			return ctx->ctrls[i];
+
+	return NULL;
+}
+
+void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = cedrus_find_control(ctx, id);
+	if (ctrl)
+		return ctrl->p_cur.p;
 
 	return NULL;
 }
 
+u32 cedrus_control_num_elems(struct cedrus_ctx *ctx, u32 id)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = cedrus_find_control(ctx, id);
+	if (ctrl) {
+		return ctrl->elems;
+	}
+
+	return 0;
+}
+
 static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 88afba17b78b..b445c1dc2a29 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -58,6 +58,18 @@ struct cedrus_control {
 	enum cedrus_codec	codec;
 };
 
+struct cedrus_h264_slice_ctx {
+	u32 num_slices;
+	u32 cur_slice;
+};
+
+struct cedrus_slice_ctx {
+	void *priv;
+	union {
+		struct cedrus_h264_slice_ctx h264;
+	};
+};
+
 struct cedrus_h264_run {
 	const struct v4l2_ctrl_h264_decode_params	*decode_params;
 	const struct v4l2_ctrl_h264_pps			*pps;
@@ -118,6 +130,9 @@ struct cedrus_ctx {
 	struct v4l2_ctrl_handler	hdl;
 	struct v4l2_ctrl		**ctrls;
 
+	struct cedrus_slice_ctx		slice_ctx;
+	bool 				slice_array_decode_mode;
+
 	union {
 		struct {
 			void		*mv_col_buf;
@@ -160,6 +175,7 @@ struct cedrus_dec_ops {
 	void (*irq_disable)(struct cedrus_ctx *ctx);
 	enum cedrus_irq_status (*irq_status)(struct cedrus_ctx *ctx);
 	void (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
+	void (*setup_next_slice)(struct cedrus_ctx *ctx);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
 	void (*trigger)(struct cedrus_ctx *ctx);
@@ -256,5 +272,7 @@ vb2_to_cedrus_buffer(const struct vb2_buffer *p)
 }
 
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
+u32 cedrus_control_num_elems(struct cedrus_ctx *ctx, u32 id);
+struct v4l2_ctrl *cedrus_find_control(struct cedrus_ctx *ctx, u32 id);
 
 #endif
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 40e8c4123f76..9b9034044aa4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -22,6 +22,37 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+static void fill_slice_ctx(struct cedrus_ctx *ctx, struct cedrus_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = cedrus_find_control(ctx, V4L2_CID_STATELESS_H264_DECODE_MODE);
+	if (!ctrl)
+		return;
+
+	switch (ctx->current_codec) {
+	case CEDRUS_CODEC_H264:
+		ctx->slice_array_decode_mode =
+			ctrl->cur.val == V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED;
+
+		if (!ctx->slice_array_decode_mode)
+			return;
+
+		ctx->slice_ctx.h264.num_slices =
+			cedrus_control_num_elems(ctx, V4L2_CID_STATELESS_H264_SLICE_PARAMS);
+		ctx->slice_ctx.priv = kmalloc(sizeof(struct v4l2_ctrl_h264_slice_params) *
+			ctx->slice_ctx.h264.num_slices, GFP_KERNEL);
+
+		memcpy(ctx->slice_ctx.priv,
+		       run->h264.slice_params, sizeof(struct v4l2_ctrl_h264_slice_params) *
+		       ctx->slice_ctx.h264.num_slices);
+		break;
+
+	default:
+		break;
+	}
+}
+
 void cedrus_device_run(void *priv)
 {
 	struct cedrus_ctx *ctx = priv;
@@ -83,6 +114,8 @@ void cedrus_device_run(void *priv)
 		break;
 	}
 
+	fill_slice_ctx(ctx, &run);
+
 	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
 
 	cedrus_dst_format_set(dev, &ctx->dst_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index de7442d4834d..bada2bf04f24 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -15,6 +15,8 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
+static void cedrus_h264_trigger(struct cedrus_ctx *ctx);
+
 enum cedrus_h264_sram_off {
 	CEDRUS_SRAM_H264_PRED_WEIGHT_TABLE	= 0x000,
 	CEDRUS_SRAM_H264_FRAMEBUFFER_LIST	= 0x100,
@@ -318,6 +320,31 @@ static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
 	}
 }
 
+static void cedrus_h264_setup_next_slice(struct cedrus_ctx *ctx)
+{
+	struct v4l2_ctrl_h264_slice_params *sp;
+	struct cedrus_h264_slice_ctx *sctx;
+	u32 offset;
+
+	sp = ctx->slice_ctx.priv;
+	sctx = &ctx->slice_ctx.h264;
+	offset = sp[sctx->cur_slice++].header_bit_size;
+
+	/* skip to the next slice */
+	cedrus_skip_bits(ctx->dev, offset);
+
+	/* clear status flags */
+	cedrus_write(ctx->dev, VE_H264_STATUS, cedrus_read(ctx->dev, VE_H264_STATUS));
+
+	/* enable int */
+	cedrus_write(ctx->dev, VE_H264_CTRL,
+		     VE_H264_CTRL_SLICE_DECODE_INT |
+		     VE_H264_CTRL_DECODE_ERR_INT |
+		     VE_H264_CTRL_VLD_DATA_REQ_INT);
+
+	cedrus_h264_trigger(ctx);
+}
+
 static void cedrus_set_params(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
@@ -510,6 +537,10 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
 	cedrus_write_frame_list(ctx, run);
 
 	cedrus_set_params(ctx, run);
+
+	if (ctx->slice_array_decode_mode)
+		ctx->slice_ctx.h264.cur_slice++;
+
 }
 
 static int cedrus_h264_start(struct cedrus_ctx *ctx)
@@ -682,11 +713,12 @@ static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
 }
 
 struct cedrus_dec_ops cedrus_dec_ops_h264 = {
-	.irq_clear	= cedrus_h264_irq_clear,
-	.irq_disable	= cedrus_h264_irq_disable,
-	.irq_status	= cedrus_h264_irq_status,
-	.setup		= cedrus_h264_setup,
-	.start		= cedrus_h264_start,
-	.stop		= cedrus_h264_stop,
-	.trigger	= cedrus_h264_trigger,
+	.irq_clear	  = cedrus_h264_irq_clear,
+	.irq_disable	  = cedrus_h264_irq_disable,
+	.irq_status	  = cedrus_h264_irq_status,
+	.setup		  = cedrus_h264_setup,
+	.setup_next_slice = cedrus_h264_setup_next_slice,
+	.start		  = cedrus_h264_start,
+	.stop		  = cedrus_h264_stop,
+	.trigger	  = cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index e2f2ff609c7e..4ff3da210e50 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -111,12 +111,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	}
 }
 
+static void clear_slice_ctx(struct cedrus_ctx *ctx)
+{
+	switch (ctx->current_codec) {
+	case CEDRUS_CODEC_H264:
+		kfree(ctx->slice_ctx.priv);
+		memset(&ctx->slice_ctx, 0, sizeof(ctx->slice_ctx));
+		break;
+	default:
+		break;
+	}
+}
+
 static irqreturn_t cedrus_irq(int irq, void *data)
 {
 	struct cedrus_dev *dev = data;
 	struct cedrus_ctx *ctx;
 	enum vb2_buffer_state state;
 	enum cedrus_irq_status status;
+	struct cedrus_h264_slice_ctx *h264sctx;
 
 	ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
 	if (!ctx) {
@@ -132,10 +145,28 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
 	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
 
-	if (status == CEDRUS_IRQ_ERROR)
+	if (status == CEDRUS_IRQ_OK && ctx->slice_array_decode_mode) {
+		switch (ctx->current_codec) {
+		case CEDRUS_CODEC_H264:
+			h264sctx = &ctx->slice_ctx.h264;
+			if (h264sctx->cur_slice < h264sctx->num_slices - 1) {
+				dev->dec_ops[ctx->current_codec]->setup_next_slice(ctx);
+				return IRQ_HANDLED;
+			}
+		default:
+			break;
+		}
+
+		clear_slice_ctx(ctx);
+	}
+
+	if (status == CEDRUS_IRQ_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
-	else
+		if (ctx->slice_array_decode_mode)
+			clear_slice_ctx(ctx);
+	} else {
 		state = VB2_BUF_STATE_DONE;
+	}
 
 	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
 					 state);
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index fdf97a6d7d18..8907076d0ddf 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1231,10 +1231,17 @@ enum v4l2_detect_md_mode {
  * by device drivers that are able to parse the slice(s) header(s)
  * in hardware. When this mode is selected,
  * V4L2_CID_STATELESS_H264_SLICE_PARAMS is not used.
+ * @V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED: indicates that
+ * decoding is performed for the entire frame using a slice array.
+ * When this mode is selected, a pointer to a contiguous memory region
+ * of v4l2_ctrl_h264_slice elements is expected.
+
  */
 enum v4l2_stateless_h264_decode_mode {
 	V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 	V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+	V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
+
 };
 
 #define V4L2_CID_STATELESS_H264_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 1)
-- 
2.32.0

