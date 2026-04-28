Return-Path: <linux-media+bounces-59801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLRsIJB58GnMTwEAu9opvQ
	(envelope-from <linux-media+bounces-59801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:10:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A15480FDF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55FEA305389B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEABB3ED12A;
	Tue, 28 Apr 2026 09:01:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55613E556C
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366870; cv=none; b=nTMO/AlxaJTU3TVQ6pO+jtN+WqrDt7iVJhw91XXaIp/4FWWeX9yPCmFR51whZruTg45LuLGdysGeMmXOrKopXmUUVzvXmPMFxDoQYVEVYzP8DL3atL5zh/7JSjFD5wDd88F0SVunvqWpoPNbLM80KW8Uc0yiyLkmCKZSTl7f+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366870; c=relaxed/simple;
	bh=rcVGQNpvVb11V8IiuFUDMjCOvBwh/do9BUef7J57mAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMu9jjqCFW3BVcP/N+PKezFf33ZrPnAxzlhvU7D1LzJptwr8tDL/iygYtLkuxrmTcPKfCGHosm+Ce/ri2eWzIRCqVpTwAAZes3HMDqomPgrytaVhtL40r6e5LF5jpcLr7es2JREWUT+9rGw+frLN+NBXkdGcsWTP5mjuE6GyZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJF-0004Lz-96; Tue, 28 Apr 2026 11:00:49 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:49 +0200
Subject: [PATCH v5 14/29] media: rockchip: rga: move cmdbuf to rga_ctx
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-14-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: E6A15480FDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59801-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]

Move the command buffer to the rga_ctx struct in preparation to reuse
an already prepared command buffer. This allows to split the command
buffer setup in a further commit to setup a template for the command
buffer at streamon and only update the buffer addresses in device_run
and trigger the command stream. No sync point is added, as one command
buffer should only be used for one conversion at a time.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 28 +++++++---------
 drivers/media/platform/rockchip/rga/rga.c    | 48 ++++++++++++++++------------
 drivers/media/platform/rockchip/rga/rga.h    |  5 +--
 3 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 17f7a67c0b4bb..9881c14f908d5 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -122,8 +122,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
 
 static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
@@ -135,8 +134,7 @@ static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 
 static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
@@ -148,8 +146,7 @@ static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 
 static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
@@ -162,7 +159,7 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 {
 	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int scale_dst_w, scale_dst_h;
 	unsigned int src_h, src_w, dst_h, dst_w;
 	union rga_src_info src_info;
@@ -322,8 +319,7 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
 				 struct rga_addr_offset *offset)
 {
 	struct rga_corners_addr_offset src_offsets;
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int src_h, src_w, src_x, src_y;
 
 	src_h = ctx->in.crop.height;
@@ -350,8 +346,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 {
 	struct rga_addr_offset *dst_offset;
 	struct rga_corners_addr_offset offsets;
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int dst_h, dst_w, dst_x, dst_y;
 	unsigned int mir_mode = 0;
 	unsigned int rot_mode = 0;
@@ -397,8 +392,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 
 static void rga_cmd_set_mode(struct rga_ctx *ctx)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	union rga_mode_ctrl mode;
 	union rga_alpha_ctrl0 alpha_ctrl0;
 	union rga_alpha_ctrl1 alpha_ctrl1;
@@ -423,7 +417,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 {
 	struct rockchip_rga *rga = ctx->rga;
 
-	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
+	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
 
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
@@ -439,11 +433,11 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_dst_info(ctx, &dst->offset);
 	rga_cmd_set_trans_info(ctx);
 
-	rga_write(rga, RGA_CMD_BASE, rga->cmdbuf_phy);
+	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
 	/* sync CMD buf for RGA */
-	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
-		PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
+				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
 static void rga_hw_start(struct rockchip_rga *rga,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 77b8c7ab74274..bf6bbcbfc869b 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -219,6 +219,16 @@ static int rga_open(struct file *file)
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
+
+	/* Create CMD buffer */
+	ctx->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
+					   &ctx->cmdbuf_phy, GFP_KERNEL,
+					   DMA_ATTR_WRITE_COMBINE);
+	if (!ctx->cmdbuf_virt) {
+		ret = -ENOMEM;
+		goto rel_ctx;
+	}
+
 	ctx->rga = rga;
 	/* Set default formats */
 	ctx->in = def_frame;
@@ -230,15 +240,13 @@ static int rga_open(struct file *file)
 			    ctx->out.fmt->fourcc, def_width, def_height);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
-		kfree(ctx);
-		return -ERESTARTSYS;
+		ret = -ERESTARTSYS;
+		goto rel_cmdbuf;
 	}
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rga->m2m_dev, ctx, &queue_init);
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-		mutex_unlock(&rga->mutex);
-		kfree(ctx);
-		return ret;
+		goto unlock_mutex;
 	}
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	v4l2_fh_add(&ctx->fh, file);
@@ -252,6 +260,15 @@ static int rga_open(struct file *file)
 	mutex_unlock(&rga->mutex);
 
 	return 0;
+
+unlock_mutex:
+	mutex_unlock(&rga->mutex);
+rel_cmdbuf:
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
+		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
+rel_ctx:
+	kfree(ctx);
+	return ret;
 }
 
 static int rga_release(struct file *file)
@@ -266,6 +283,10 @@ static int rga_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
+
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
+		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
+
 	kfree(ctx);
 
 	mutex_unlock(&rga->mutex);
@@ -720,19 +741,10 @@ static int rga_probe(struct platform_device *pdev)
 
 	pm_runtime_put(rga->dev);
 
-	/* Create CMD buffer */
-	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
-					   &rga->cmdbuf_phy, GFP_KERNEL,
-					   DMA_ATTR_WRITE_COMBINE);
-	if (!rga->cmdbuf_virt) {
-		ret = -ENOMEM;
-		goto rel_m2m;
-	}
-
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto free_dma;
+		goto rel_m2m;
 	}
 
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
@@ -740,9 +752,6 @@ static int rga_probe(struct platform_device *pdev)
 
 	return 0;
 
-free_dma:
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
-		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_m2m:
 	v4l2_m2m_release(rga->m2m_dev);
 rel_vdev:
@@ -759,9 +768,6 @@ static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
-		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
-
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
 
 	v4l2_m2m_release(rga->m2m_dev);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 27b3c9b4f220c..04aeb7b429523 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -53,6 +53,9 @@ struct rga_ctx {
 	struct rga_frame out;
 	struct v4l2_ctrl_handler ctrl_handler;
 
+	void *cmdbuf_virt;
+	dma_addr_t cmdbuf_phy;
+
 	int osequence;
 	int csequence;
 
@@ -89,8 +92,6 @@ struct rockchip_rga {
 	spinlock_t ctrl_lock;
 
 	struct rga_ctx *curr;
-	dma_addr_t cmdbuf_phy;
-	void *cmdbuf_virt;
 
 	const struct rga_hw *hw;
 };

-- 
2.54.0


