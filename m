Return-Path: <linux-media+bounces-61745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM5jL2Q+B2oCuwIAu9opvQ
	(envelope-from <linux-media+bounces-61745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:40:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8DD5524E7
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B283130C4948
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE494DA541;
	Fri, 15 May 2026 15:33:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C134B8DD9
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859189; cv=none; b=Q20UNaRX/VQdqx6+ndw70HqkXkJeMpC8mW9kYs8JU9A9iXkrcriCzPmB4/yM1uQgtUZsXWfOWGIqufIlUOUqgJALNFjn6iOcoYaY0vvFRRAPmH5IM8iAmxb5igHZNTeoc0JVEDIkKyb5F0JyL/QIx9k8+TP/Dy80qf1f9/uLDzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859189; c=relaxed/simple;
	bh=7E5iF4VOVFurtU5B5fBqYOhPZxLkB2Dt1zlH0Eo71S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsEDJ+PaG9StHQRLQAhJN1heiLliZKXG6+/R6qGUIT0XjyUyKrxBPplQ4kxOO2YUYvwlDHF/oUnUsV/a3wRY+7VVm95aeCJNZdYk9iwLlXjjEecaPcW2IItcOkkorIJxGPsGqt2oT2UwFiN3F9QPxaQsLgaUAfSAQNPbnHSfEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuX8-0005OF-24; Fri, 15 May 2026 17:33:02 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:42 +0200
Subject: [PATCH v6 16/28] media: rockchip: rga: reuse cmdbuf contents
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-16-e547152eb9c9@pengutronix.de>
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
X-Rspamd-Queue-Id: 1F8DD5524E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61745-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,pengutronix.de:email,pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Action: no action

Reuse the command buffer contents instead of completely writing it
for every frame. Therefore we only need to replace the source and
destination addresses for each frame. This reduces the amount of CPU
and memory operations done in each frame. A new cmdbuf_dirty flag notes
if the cmdbuf has to be rewritten on the next frame.

The initial idea of initializing the cmdbuf on streamon broke the
ability to update controls while streaming (e.g. mirroring).

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Reworked the commit to not setup the cmdbuf on streamon but rather
  re-initialize it on the next frame when something changed.
- Sasahiko flagged the cmdbuf setup at streamon:
  https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=17
- Dropped Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
  due to the reworked patch and commit message contents

Changes in v5:
- Don't set the flipping and rotation values at streamon and preventing
  the userspace from chainging them at runtime
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
 drivers/media/platform/rockchip/rga/rga.c    | 11 +++++++++--
 drivers/media/platform/rockchip/rga/rga.h    |  2 ++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dac3cb6aa17d3..567d39e58d33f 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -417,8 +417,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 {
 	struct rockchip_rga *rga = ctx->rga;
 
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
 	 * Due to hardware bug,
@@ -427,11 +425,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
 
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
-	rga_cmd_set_mode(ctx);
 
 	rga_cmd_set_src_info(ctx, &src->offset);
 	rga_cmd_set_dst_info(ctx, &dst->offset);
-	rga_cmd_set_trans_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
@@ -440,6 +436,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
+static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
+{
+	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
+
+	rga_cmd_set_mode(ctx);
+	rga_cmd_set_trans_info(ctx);
+}
+
 static void rga_hw_start(struct rockchip_rga *rga,
 			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
@@ -582,6 +586,7 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.stride_alignment = 4,
 
+	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index d080cb672740b..394b14b9469df 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -38,6 +38,11 @@ static void device_run(void *prv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
+	if (ctx->cmdbuf_dirty) {
+		ctx->cmdbuf_dirty = false;
+		rga->hw->setup_cmdbuf(ctx);
+	}
+	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 
 	rga->curr = ctx;
 
@@ -47,8 +52,6 @@ static void device_run(void *prv)
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
 	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
-
-	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 }
 
 static irqreturn_t rga_isr(int irq, void *prv)
@@ -141,6 +144,7 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->fill_color = ctrl->val;
 		break;
 	}
+	ctx->cmdbuf_dirty = true;
 	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
 	return 0;
 }
@@ -228,6 +232,7 @@ static int rga_open(struct file *file)
 		ret = -ENOMEM;
 		goto rel_ctx;
 	}
+	ctx->cmdbuf_dirty = true;
 
 	ctx->rga = rga;
 	/* Set default formats */
@@ -448,6 +453,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->crop.height = pix_fmt->height;
 
 	frm->pix = *pix_fmt;
+	ctx->cmdbuf_dirty = true;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
@@ -564,6 +570,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	}
 
 	f->crop = s->r;
+	ctx->cmdbuf_dirty = true;
 
 	return ret;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 38518146910a6..5360f092fecf0 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -55,6 +55,7 @@ struct rga_ctx {
 
 	void *cmdbuf_virt;
 	dma_addr_t cmdbuf_phy;
+	bool cmdbuf_dirty;
 
 	int osequence;
 	int csequence;
@@ -152,6 +153,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 stride_alignment;
 
+	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);

-- 
2.54.0


