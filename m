Return-Path: <linux-media+bounces-57064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBt8I0ADxGnOvQQAu9opvQ
	(envelope-from <linux-media+bounces-57064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:46:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 265B9328580
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A11B2321502C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A63401A3B;
	Wed, 25 Mar 2026 14:51:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC93EF67C
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450273; cv=none; b=BOzhiXGEkXiJ+6SaRfzX9RdYLiAcc4Jd8TJ0UY9hJzmQCyqL3lzLMupIhKaK36QSGuZtzC7heCm2dXRZb/l1z1PFBpSZ6ytN4nyAstCiBHgAkVBGBrI0vkDWnucpNXAALx4Ia5pOa41BztlG9QoEUz5332OMdqyZm+hjw1XWvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450273; c=relaxed/simple;
	bh=hNcTpRt/FQbmSZcQNG2DzOZRJMw4sTdscvT2GCayC4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjrJ+CywOCNOmRuzLkjieq/mpRUDAe3t3lQgrq4s5uZCH4BxLVjL/CJGWuApKmsHTLBdG6tKi3iSIS33MtzimRl4nnv/WwLJi91pxn/yvVs7gzkU7lFgy1236TLnGZ+oVX/G3h6+4j/XeTW4DGJE0xg5ZobIIdWU/rlBtU7inG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZU-00050C-Vw; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:47 +0100
Subject: [PATCH v4 16/27] media: rockchip: rga: check scaling factor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-16-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57064-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 265B9328580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check the scaling factor to avoid potential problems. This is relevant
for the upcoming RGA3 support, as it can hang when the scaling factor
is exceeded.

There are two relevant scenarios that have to be considered to protect
against invalid scaling values:

When the output or capture is already streaming, setting the format on
the other side should consider the max scaling factor and clamp it
accordingly. This is only done in the streaming case, as it otherwise
may unintentionally clamp the value when the application sets the first
format (due to a default format on the other side).

When the format is set on both sides first, then the format won't be
corrected by above means. Therefore the second streamon call has to
check the scaling factor and fail otherwise.

As try functions should only be state aware if specified, the scaling
limitation is only done in s_fmt.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
 drivers/media/platform/rockchip/rga/rga-hw.h |  1 +
 drivers/media/platform/rockchip/rga/rga.c    | 47 ++++++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga.h    |  1 +
 4 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dcd540ed3fd5b..7a4070665fed7 100644
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
index f4752aa823051..fffcab0131225 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -14,6 +14,7 @@
 
 #define MIN_WIDTH 34
 #define MIN_HEIGHT 34
+#define MAX_SCALING_FACTOR 16
 
 #define RGA_TIMEOUT 500
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index d111b348255e2..75d05c86b1c00 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
+	const struct rga_hw *hw = rga->hw;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
 	int ret = 0;
 	int i;
+	struct rga_frame *limit_frm = NULL;
+
+	/* Limit before try_fmt to avoid recalculating the stride */
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
+		limit_frm = &ctx->out;
+	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+	    v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
+		limit_frm = &ctx->in;
+	if (limit_frm) {
+		const struct v4l2_frmsize_stepwise frmsize = {
+			.min_width = DIV_ROUND_UP(limit_frm->pix.width,
+						  hw->max_scaling_factor),
+			.max_width =
+				limit_frm->pix.width * hw->max_scaling_factor,
+			.min_height = DIV_ROUND_UP(limit_frm->pix.height,
+						   hw->max_scaling_factor),
+			.max_height =
+				limit_frm->pix.height * hw->max_scaling_factor,
+			.step_width = 1,
+			.step_height = 1,
+		};
+		v4l2_apply_frmsize_constraints(&pix_fmt->width,
+					       &pix_fmt->height, &frmsize);
+	}
 
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
@@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return ret;
 }
 
+static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst_size)
+{
+	if (src_size < dst_size)
+		return src_size * hw->max_scaling_factor >= dst_size;
+	else
+		return dst_size * hw->max_scaling_factor >= src_size;
+}
+
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	const struct rga_hw *hw = ctx->rga->hw;
 
+	if ((V4L2_TYPE_IS_OUTPUT(type) &&
+	     v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) ||
+	    (V4L2_TYPE_IS_CAPTURE(type) &&
+	     v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)) {
+		/*
+		 * As the other side is already streaming,
+		 * check that the max scaling factor isn't exceeded.
+		 */
+		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
+		    !check_scaling(hw, ctx->in.pix.height, ctx->out.pix.height))
+			return -EINVAL;
+	}
+
 	hw->setup_cmdbuf(ctx);
 
 	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index c741213710b32..454af283b1694 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -150,6 +150,7 @@ struct rga_hw {
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
+	u8 max_scaling_factor;
 	u8 stride_alignment;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);

-- 
2.53.0


