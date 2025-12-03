Return-Path: <linux-media+bounces-48172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073FC9FC6E
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 17:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A105F30399AD
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 15:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A6F33A6F5;
	Wed,  3 Dec 2025 15:54:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C89338935
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777239; cv=none; b=kn0o3k61zhThC1dcKyeeMEEDOuuJ3Nq8xNhBNeDoQroADGNTDjTi8KZz+a0dLMu7Nb62mu5aL7F1c3/c2zWuZ0r59br76SxrHzRSy61SGuCECbasCqzj0AwKqeBVKqgD+0lRXrKNmiXKgi0dL+y2dNh3R8YpQutlpfl6kNEjeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777239; c=relaxed/simple;
	bh=L2iLaXrXDgV/SzCQxLDBonc8cVclGsWi8P33ttvy9/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zn/0E/p5ipSdvHQgAhUP9Ei/b60JnCAkMm05pV6ST6ujTzBYMWy7xKRKOC8Sf2hJQ68sJk/+XL2trrLz7xJRiRU4TPr+e04IFAwPfVhVLRcObGfe3BQmpjm1CxXzO/CrcaPQ0mvCDo/zgy+lCKNY3r43vL1EZjTXqwWd9EccDyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAd-0007dW-9C; Wed, 03 Dec 2025 16:53:35 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:30 +0100
Subject: [PATCH v2 08/22] media: rockchip: rga: move cmdbuf to rga_ctx
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-8-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Move the command buffer to the rga_ctx struct in preparation to reuse
an already prepared command buffer. Having a command buffer per context
allows to reuse the command buffer for other frames even when
multiple applications are using the RGA in at the same time.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 28 +++++++---------
 drivers/media/platform/rockchip/rga/rga.c    | 48 ++++++++++++++++------------
 drivers/media/platform/rockchip/rga/rga.h    |  5 +--
 3 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 7419784efc693..79bf911e74779 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -113,8 +113,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
 
 static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
@@ -126,8 +125,7 @@ static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 
 static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
@@ -139,8 +137,7 @@ static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 
 static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int reg;
 
 	reg = RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
@@ -153,7 +150,7 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 {
 	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int scale_dst_w, scale_dst_h;
 	unsigned int src_h, src_w, dst_h, dst_w;
 	union rga_src_info src_info;
@@ -313,8 +310,7 @@ static void rga_cmd_set_src_info(struct rga_ctx *ctx,
 				 struct rga_addr_offset *offset)
 {
 	struct rga_corners_addr_offset src_offsets;
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int src_h, src_w, src_x, src_y;
 
 	src_h = ctx->in.crop.height;
@@ -341,8 +337,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 {
 	struct rga_addr_offset *dst_offset;
 	struct rga_corners_addr_offset offsets;
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int dst_h, dst_w, dst_x, dst_y;
 	unsigned int mir_mode = 0;
 	unsigned int rot_mode = 0;
@@ -388,8 +383,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 
 static void rga_cmd_set_mode(struct rga_ctx *ctx)
 {
-	struct rockchip_rga *rga = ctx->rga;
-	u32 *dest = rga->cmdbuf_virt;
+	u32 *dest = ctx->cmdbuf_virt;
 	union rga_mode_ctrl mode;
 	union rga_alpha_ctrl0 alpha_ctrl0;
 	union rga_alpha_ctrl1 alpha_ctrl1;
@@ -414,7 +408,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 {
 	struct rockchip_rga *rga = ctx->rga;
 
-	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
+	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
 
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
@@ -430,11 +424,11 @@ static void rga_cmd_set(struct rga_ctx *ctx,
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
index d8b14c2d9f6a4..74d94c7fe31ff 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -219,6 +219,16 @@ static int rga_open(struct file *file)
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
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
@@ -674,19 +695,10 @@ static int rga_probe(struct platform_device *pdev)
 
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
@@ -694,9 +706,6 @@ static int rga_probe(struct platform_device *pdev)
 
 	return 0;
 
-free_dma:
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
-		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_m2m:
 	v4l2_m2m_release(rga->m2m_dev);
 rel_vdev:
@@ -713,9 +722,6 @@ static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
-		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
-
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
 
 	v4l2_m2m_release(rga->m2m_dev);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 98635ddd50d7c..f8c932fdec21a 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -56,6 +56,9 @@ struct rga_ctx {
 	struct rga_frame out;
 	struct v4l2_ctrl_handler ctrl_handler;
 
+	void *cmdbuf_virt;
+	dma_addr_t cmdbuf_phy;
+
 	int osequence;
 	int csequence;
 
@@ -91,8 +94,6 @@ struct rockchip_rga {
 	spinlock_t ctrl_lock;
 
 	struct rga_ctx *curr;
-	dma_addr_t cmdbuf_phy;
-	void *cmdbuf_virt;
 
 	const struct rga_hw *hw;
 };

-- 
2.52.0


