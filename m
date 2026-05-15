Return-Path: <linux-media+bounces-61747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKWoA5U+B2oCuwIAu9opvQ
	(envelope-from <linux-media+bounces-61747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:41:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CD55250E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61D1D30CE0FB
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6B24DB55E;
	Fri, 15 May 2026 15:33:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1124BCACA
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859192; cv=none; b=VND9JVC0czLSdyi+umgHQwkUEXgb3L/flvPIulFf4dnVu4m9qff9l0FV/2SJ90mW349D3hQowQ8iNvd3i5erwnw846HGVZ8287qFNngS3p300KOaE6yX02XHxrAtnIPnmXp9EH06kwYMTMOAsH51lUyDPmuYepGkwXGBPZSRA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859192; c=relaxed/simple;
	bh=BSV6OseY3HINQEBpTu/vF4+NDlgWrbTO9U93LHWRneI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2rmVaQqQaPw7towp3+brQhG2JExlvpKCimAC44sauAK3qv+/Enu/RM0JDIL//MiCUoOQkwLcp5nVWDBNpwnPyXH/V0eOiQspLu+jn4b/i8U6+i8c0Dzj0gprVAp7LYWYVod2ma962r31rdEyi80Ptsd3mbin4v0AM2m5fvpemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuX9-0005OF-CN; Fri, 15 May 2026 17:33:03 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:43 +0200
Subject: [PATCH v6 17/28] media: rockchip: rga: check scaling factor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-17-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 684CD55250E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61747-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Action: no action

Check the scaling factor to avoid potential problems. This is relevant
for the upcoming RGA3 support, as it can hang when the scaling factor
is exceeded.

The check is done at streamon when the other side is already streaming
to avoid incorrectly failing if the application configures the other
side after calling streamon. As try_fmt shouldn't be state aware,
it cannot be used to limit the format based on the scaling factor.
Therefore the check is done just before the actual streaming would be
started.

As the driver allows changing the rotation and selection while
streaming, add additional checks to ensure these changes
don't exceed the scaling factor.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Dropped scaling adjustment in s_fmt, as this didn't match the try_fmt
  result (which shouldn't have it to avoid making it stateful)
- Moved scaling check to the prepare_streaming callback instead of
  overwriting the ioctl directly
- Consider rotation when checking the scaling
- Check scaling factor when adjusting rotation and selection while
  streaming
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 28 ++++++++++++
 drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
 drivers/media/platform/rockchip/rga/rga-hw.h  |  1 +
 drivers/media/platform/rockchip/rga/rga.c     | 63 +++++++++++++++++++++++++--
 drivers/media/platform/rockchip/rga/rga.h     |  4 ++
 5 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index ffc6162b2e681..dcaba66f5c1fc 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -197,6 +197,33 @@ static void rga_buf_return_buffers(struct vb2_queue *q,
 	}
 }
 
+static int rga_buf_prepare_streaming(struct vb2_queue *q)
+{
+	struct rga_ctx *ctx = vb2_get_drv_priv(q);
+	const struct rga_hw *hw = ctx->rga->hw;
+	int ret;
+
+	/* It's safe to check the streaming state of the other queue,
+	 * as the streamon ioctl's can't race due to the lock set in
+	 * the queue_init function.
+	 */
+	if ((V4L2_TYPE_IS_OUTPUT(q->type) &&
+	     vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) ||
+	    (V4L2_TYPE_IS_CAPTURE(q->type) &&
+	     vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))) {
+		/*
+		 * As the other side is already streaming,
+		 * check that the max scaling factor isn't exceeded.
+		 */
+		ret = rga_check_scaling(hw, &ctx->in.crop, &ctx->out.crop,
+					ctx->rotate);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(q);
@@ -232,6 +259,7 @@ const struct vb2_ops rga_qops = {
 	.buf_prepare = rga_buf_prepare,
 	.buf_queue = rga_buf_queue,
 	.buf_cleanup = rga_buf_cleanup,
+	.prepare_streaming = rga_buf_prepare_streaming,
 	.start_streaming = rga_buf_start_streaming,
 	.stop_streaming = rga_buf_stop_streaming,
 };
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 567d39e58d33f..f2900812ba76f 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -584,6 +584,7 @@ const struct rga_hw rga2_hw = {
 	.max_width = MAX_WIDTH,
 	.min_height = MIN_HEIGHT,
 	.max_height = MAX_HEIGHT,
+	.max_scaling_factor = MAX_SCALING_FACTOR,
 	.stride_alignment = 4,
 
 	.setup_cmdbuf = rga_hw_setup_cmdbuf,
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index c2e34be751939..805ec23e5e3f4 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -14,6 +14,7 @@
 
 #define MIN_WIDTH 34
 #define MIN_HEIGHT 34
+#define MAX_SCALING_FACTOR 16
 
 #define RGA_TIMEOUT 500
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 394b14b9469df..22954bbae55fc 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -127,7 +127,9 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rga_ctx *ctx = container_of(ctrl->handler, struct rga_ctx,
 					   ctrl_handler);
+	const struct rga_hw *hw = ctx->rga->hw;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&ctx->rga->ctrl_lock, flags);
 	switch (ctrl->id) {
@@ -138,6 +140,13 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->vflip = ctrl->val;
 		break;
 	case V4L2_CID_ROTATE:
+		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
+		    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
+			ret = rga_check_scaling(hw, &ctx->in.crop,
+						&ctx->out.crop, ctrl->val);
+			if (ret < 0)
+				goto s_ctrl_done;
+		}
 		ctx->rotate = ctrl->val;
 		break;
 	case V4L2_CID_BG_COLOR:
@@ -145,8 +154,10 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 	ctx->cmdbuf_dirty = true;
+
+s_ctrl_done:
 	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
-	return 0;
+	return ret;
 }
 
 static const struct v4l2_ctrl_ops rga_ctrl_ops = {
@@ -182,6 +193,38 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 	return 0;
 }
 
+static bool check_scaling_factor(const struct rga_hw *hw, u32 src_size,
+				 u32 dst_size)
+{
+	if (src_size < dst_size)
+		return src_size * hw->max_scaling_factor >= dst_size;
+	else
+		return dst_size * hw->max_scaling_factor >= src_size;
+}
+
+int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *crop_in,
+		      const struct v4l2_rect *crop_out, u32 rotate)
+{
+	u32 scaled_width;
+	u32 scaled_height;
+
+	if (rotate == 90 || rotate == 270) {
+		scaled_width = crop_out->height;
+		scaled_height = crop_out->width;
+	} else {
+		scaled_width = crop_out->width;
+		scaled_height = crop_out->height;
+	}
+
+	if (!check_scaling_factor(hw, crop_in->width, scaled_width))
+		return -EINVAL;
+
+	if (!check_scaling_factor(hw, crop_in->height, scaled_height))
+		return -EINVAL;
+
+	return 0;
+}
+
 static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
 {
 	unsigned int i;
@@ -525,7 +568,6 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f;
-	int ret = 0;
 
 	f = rga_get_frame(ctx, s->type);
 	if (IS_ERR(f))
@@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
+	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
+	    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
+		int ret = 0;
+
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			ret = rga_check_scaling(rga->hw, &s->r, &ctx->out.crop,
+						ctx->rotate);
+		else
+			ret = rga_check_scaling(rga->hw, &ctx->in.crop, &s->r,
+						ctx->rotate);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	f->crop = s->r;
 	ctx->cmdbuf_dirty = true;
 
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_ioctl_ops rga_ioctl_ops = {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 5360f092fecf0..df525c6aea8b6 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -123,6 +123,9 @@ static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)
 
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
 
+int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *crop_in,
+		      const struct v4l2_rect *crop_out, u32 rotate);
+
 /* RGA Buffers Manage */
 extern const struct vb2_ops rga_qops;
 
@@ -151,6 +154,7 @@ struct rga_hw {
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
+	u8 max_scaling_factor;
 	u8 stride_alignment;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);

-- 
2.54.0


