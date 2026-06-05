Return-Path: <linux-media+bounces-63970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NiaDK2dKI2oKoAEAu9opvQ
	(envelope-from <linux-media+bounces-63970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239A64B95D
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63970-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63970-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D71A930C5FAE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468B443E49B;
	Fri,  5 Jun 2026 22:08:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF340BCBB
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697316; cv=none; b=JSFzhOPZr4adjUE57Yb2dWgZ4XiPCGSoLirqclRsFFtqej0AimB/sdtwa9Ml9GUw2zFM3olitlejbPzGOhQqZEm7n+dh4OZ0CcP8V8A59BlwAiBAVUHtpqbrCksbv9lKENG6xreBP2VHIXVZP3P50V32LU4GOg1Km+olQwGcNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697316; c=relaxed/simple;
	bh=SU32LXQJz34n3BITcLFHwxiZbCPnWU2v3CskJfNsuvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j83CgNVr1DqxpbJ5IhGz1g93k40TT3656w7CYfYINXs8kEfe2OFFPNZGyWbYgxzq6dZqz9yZ+RpLElmo5886wFq9tlNewWu10B3KWKgazi18GUYv4MrlyxQXUgsmWFPNgj7QBFACYFnBV0aTa8ijwz+cP2JYA6RfwlPT8UQGnIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci7-0000LW-Cu; Sat, 06 Jun 2026 00:08:15 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:54 +0200
Subject: [PATCH 08/17] media: rockchip: rga: add rga_core structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-8-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,m:s.pueschel@pengutronix.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63970-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:from_mime,pengutronix.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2239A64B95D

Add a rga_core structure to separate the core specific data from the
m2m device. This is done in preparation for multi-core support, where
multiple identical cores are exposed as a single m2m device to the
user-space.

Allocation related calls are explicitly done on the first core, as the
scheduling decisions will be made on demand after the buffers have been
allocated and filled.

In preparation of storing the rockchip_rga struct on a dedicated master
platform device, the rga_core struct is allocated on it's own and only a
pointer is saved in the rockchip_rga struct.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |   4 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  |  32 ++++----
 drivers/media/platform/rockchip/rga/rga.c     | 104 ++++++++++++++------------
 drivers/media/platform/rockchip/rga/rga.h     |  39 +++++-----
 drivers/media/platform/rockchip/rga/rga3-hw.c |  24 +++---
 5 files changed, 108 insertions(+), 95 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 3f7c3c68e0cb8..47a8d5a4500a3 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -93,7 +93,7 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	n_desc = DIV_ROUND_UP(size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
-	rbuf->dma_desc = dma_alloc_coherent(rga->dev,
+	rbuf->dma_desc = dma_alloc_coherent(rga->cores[0]->dev,
 					    rbuf->n_desc * sizeof(*rbuf->dma_desc),
 					    &rbuf->dma_desc_pa, GFP_KERNEL);
 	if (!rbuf->dma_desc)
@@ -191,7 +191,7 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
 	if (!rga_has_internal_iommu(rga))
 		return;
 
-	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
+	dma_free_coherent(rga->cores[0]->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
 			  rbuf->dma_desc, rbuf->dma_desc_pa);
 }
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 190104f3b2954..9a5da4e1716ca 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -417,10 +417,10 @@ static void rga_cmd_set_mode(struct rga_ctx *ctx)
 	dest[(RGA_MODE_CTRL - RGA_MODE_BASE_REG) >> 2] = mode.val;
 }
 
-static void rga_cmd_set(struct rga_ctx *ctx,
+static void rga_cmd_set(struct rga_core *core,
 			struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
 {
-	struct rockchip_rga *rga = ctx->rga;
+	struct rga_ctx *ctx = core->curr;
 
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
@@ -434,10 +434,10 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_src_info(ctx, &src->dma_addrs);
 	rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
 
-	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
+	rga_write(core, RGA_CMD_BASE, ctx->cmdbuf_phy);
 
 	/* sync CMD buf for RGA */
-	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
+	dma_sync_single_for_device(core->rga->cores[0]->dev, ctx->cmdbuf_phy,
 				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
@@ -447,36 +447,34 @@ static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
 	rga_cmd_set_trans_info(ctx);
 }
 
-static void rga_hw_start(struct rockchip_rga *rga,
+static void rga_hw_start(struct rga_core *core,
 			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
-	struct rga_ctx *ctx = rga->curr;
-
-	rga_cmd_set(ctx, src, dst);
+	rga_cmd_set(core, src, dst);
 
-	rga_write(rga, RGA_SYS_CTRL, 0x00);
+	rga_write(core, RGA_SYS_CTRL, 0x00);
 
-	rga_write(rga, RGA_SYS_CTRL, 0x22);
+	rga_write(core, RGA_SYS_CTRL, 0x22);
 
-	rga_write(rga, RGA_INT, 0x600);
+	rga_write(core, RGA_INT, 0x600);
 
-	rga_write(rga, RGA_CMD_CTRL, 0x1);
+	rga_write(core, RGA_CMD_CTRL, 0x1);
 }
 
-static bool rga_handle_irq(struct rockchip_rga *rga)
+static bool rga_handle_irq(struct rga_core *core)
 {
 	int intr;
 
-	intr = rga_read(rga, RGA_INT) & 0xf;
+	intr = rga_read(core, RGA_INT) & 0xf;
 
-	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
+	rga_mod(core, RGA_INT, intr << 4, 0xf << 4);
 
 	return intr & RGA_INT_COMMAND_FINISHED;
 }
 
-static struct rockchip_rga_version rga_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga_get_version(struct rga_core *core)
 {
-	u32 version = rga_read(rga, RGA_VERSION_INFO);
+	u32 version = rga_read(core, RGA_VERSION_INFO);
 
 	return (struct rockchip_rga_version) {
 		.major = (version >> 24) & 0xFF,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b8edd3596c919..15d095a1d1973 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sched.h>
@@ -35,11 +36,12 @@ static void device_run(void *prv)
 {
 	struct rga_ctx *ctx = prv;
 	struct rockchip_rga *rga = ctx->rga;
+	struct rga_core *core = rga->cores[0];
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(rga->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0) {
 		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
 						 VB2_BUF_STATE_ERROR);
@@ -54,27 +56,28 @@ static void device_run(void *prv)
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 
-	rga->curr = ctx;
+	core->curr = ctx;
 
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	src->sequence = ctx->osequence++;
 
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
+	rga->hw->start(core, vb_to_rga(src), vb_to_rga(dst));
 }
 
 static irqreturn_t rga_isr(int irq, void *prv)
 {
-	struct rockchip_rga *rga = prv;
+	struct rga_core *core = prv;
+	struct rockchip_rga *rga = core->rga;
 
-	if (rga->hw->handle_irq(rga)) {
+	if (rga->hw->handle_irq(core)) {
 		struct vb2_v4l2_buffer *src, *dst;
-		struct rga_ctx *ctx = rga->curr;
+		struct rga_ctx *ctx = core->curr;
 
 		WARN_ON(!ctx);
 
-		rga->curr = NULL;
+		core->curr = NULL;
 
 		src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 		dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
@@ -90,7 +93,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
 		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
 
-		pm_runtime_put_autosuspend(rga->dev);
+		pm_runtime_put_autosuspend(core->dev);
 	}
 
 	return IRQ_HANDLED;
@@ -118,7 +121,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->rga->mutex;
-	src_vq->dev = ctx->rga->v4l2_dev.dev;
+	src_vq->dev = ctx->rga->cores[0]->dev;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -136,7 +139,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->rga->mutex;
-	dst_vq->dev = ctx->rga->v4l2_dev.dev;
+	dst_vq->dev = ctx->rga->cores[0]->dev;
 
 	return vb2_queue_init(dst_vq);
 }
@@ -275,7 +278,7 @@ static int rga_open(struct file *file)
 		return -ENOMEM;
 
 	/* Create CMD buffer */
-	ctx->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
+	ctx->cmdbuf_virt = dma_alloc_attrs(rga->cores[0]->dev, rga->hw->cmdbuf_size,
 					   &ctx->cmdbuf_phy, GFP_KERNEL,
 					   DMA_ATTR_WRITE_COMBINE);
 	if (!ctx->cmdbuf_virt) {
@@ -322,7 +325,7 @@ static int rga_open(struct file *file)
 unlock_mutex:
 	mutex_unlock(&rga->mutex);
 rel_cmdbuf:
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
+	dma_free_attrs(rga->cores[0]->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
 		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_ctx:
 	kfree(ctx);
@@ -342,7 +345,7 @@ static int rga_release(struct file *file)
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
-	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
+	dma_free_attrs(rga->cores[0]->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
 		       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 
 	kfree(ctx);
@@ -689,26 +692,26 @@ static const struct video_device rga_videodev = {
 	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
 };
 
-static int rga_parse_dt(struct rockchip_rga *rga)
+static int rga_parse_dt(struct rga_core *core)
 {
 	struct reset_control *core_rst, *axi_rst, *ahb_rst;
 	int ret;
 
-	core_rst = devm_reset_control_get(rga->dev, "core");
+	core_rst = devm_reset_control_get(core->dev, "core");
 	if (IS_ERR(core_rst)) {
-		dev_err(rga->dev, "failed to get core reset controller\n");
+		dev_err(core->dev, "failed to get core reset controller\n");
 		return PTR_ERR(core_rst);
 	}
 
-	axi_rst = devm_reset_control_get(rga->dev, "axi");
+	axi_rst = devm_reset_control_get(core->dev, "axi");
 	if (IS_ERR(axi_rst)) {
-		dev_err(rga->dev, "failed to get axi reset controller\n");
+		dev_err(core->dev, "failed to get axi reset controller\n");
 		return PTR_ERR(axi_rst);
 	}
 
-	ahb_rst = devm_reset_control_get(rga->dev, "ahb");
+	ahb_rst = devm_reset_control_get(core->dev, "ahb");
 	if (IS_ERR(ahb_rst)) {
-		dev_err(rga->dev, "failed to get ahb reset controller\n");
+		dev_err(core->dev, "failed to get ahb reset controller\n");
 		return PTR_ERR(ahb_rst);
 	}
 
@@ -724,12 +727,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
 	udelay(1);
 	reset_control_deassert(ahb_rst);
 
-	ret = devm_clk_bulk_get_all(rga->dev, &rga->clks);
+	ret = devm_clk_bulk_get_all(core->dev, &core->clks);
 	if (ret < 0) {
-		dev_err(rga->dev, "failed to get clocks\n");
+		dev_err(core->dev, "failed to get clocks\n");
 		return ret;
 	}
-	rga->num_clks = ret;
+	core->num_clks = ret;
 
 	return 0;
 }
@@ -780,6 +783,7 @@ static int rga_disable_multicore(struct device *dev)
 static int rga_probe(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga;
+	struct rga_core *core;
 	struct video_device *vfd;
 	int ret = 0;
 	int irq;
@@ -791,7 +795,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rga = devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
+	rga = devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->cores), GFP_KERNEL);
 	if (!rga)
 		return -ENOMEM;
 
@@ -799,20 +803,25 @@ static int rga_probe(struct platform_device *pdev)
 	if (!rga->hw)
 		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
 
-	rga->dev = &pdev->dev;
 	spin_lock_init(&rga->ctrl_lock);
 	mutex_init(&rga->mutex);
 
-	ret = rga_parse_dt(rga);
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	core->rga = rga;
+	core->dev = &pdev->dev;
+
+	rga->cores[0] = core;
+
+	ret = rga_parse_dt(core);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
 
-	pm_runtime_set_autosuspend_delay(rga->dev, 50);
-	pm_runtime_enable(rga->dev);
+	pm_runtime_set_autosuspend_delay(core->dev, 50);
+	pm_runtime_enable(core->dev);
 
-	rga->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rga->regs)) {
-		ret = PTR_ERR(rga->regs);
+	core->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->regs)) {
+		ret = PTR_ERR(core->regs);
 		goto err_put_clk;
 	}
 
@@ -822,17 +831,17 @@ static int rga_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
-	ret = devm_request_irq(rga->dev, irq, rga_isr,
+	ret = devm_request_irq(core->dev, irq, rga_isr,
 			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
-			       dev_name(rga->dev), rga);
+			       dev_name(core->dev), core);
 	if (ret < 0) {
-		dev_err(rga->dev, "failed to request irq\n");
+		dev_err(core->dev, "failed to request irq\n");
 		goto err_put_clk;
 	}
 
-	ret = dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
 	if (ret) {
-		dev_err(rga->dev, "32-bit DMA not supported");
+		dev_err(core->dev, "32-bit DMA not supported");
 		goto err_put_clk;
 	}
 
@@ -852,7 +861,7 @@ static int rga_probe(struct platform_device *pdev)
 	video_set_drvdata(vfd, rga);
 	rga->vfd = vfd;
 
-	platform_set_drvdata(pdev, rga);
+	platform_set_drvdata(pdev, core);
 	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
 	if (IS_ERR(rga->m2m_dev)) {
 		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
@@ -860,16 +869,16 @@ static int rga_probe(struct platform_device *pdev)
 		goto rel_vdev;
 	}
 
-	ret = pm_runtime_resume_and_get(rga->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
 		goto rel_m2m;
 
-	rga->version = rga->hw->get_version(rga);
+	rga->version = rga->hw->get_version(core);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
 
-	pm_runtime_put(rga->dev);
+	pm_runtime_put(core->dev);
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -889,14 +898,15 @@ static int rga_probe(struct platform_device *pdev)
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
-	pm_runtime_disable(rga->dev);
+	pm_runtime_disable(core->dev);
 
 	return ret;
 }
 
 static void rga_remove(struct platform_device *pdev)
 {
-	struct rockchip_rga *rga = platform_get_drvdata(pdev);
+	struct rga_core *core = platform_get_drvdata(pdev);
+	struct rockchip_rga *rga = core->rga;
 
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
 
@@ -904,23 +914,23 @@ static void rga_remove(struct platform_device *pdev)
 	video_unregister_device(rga->vfd);
 	v4l2_device_unregister(&rga->v4l2_dev);
 
-	pm_runtime_disable(rga->dev);
+	pm_runtime_disable(core->dev);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)
 {
-	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct rga_core *core = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
+	clk_bulk_disable_unprepare(core->num_clks, core->clks);
 
 	return 0;
 }
 
 static int __maybe_unused rga_runtime_resume(struct device *dev)
 {
-	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct rga_core *core = dev_get_drvdata(dev);
 
-	return clk_bulk_prepare_enable(rga->num_clks, rga->clks);
+	return clk_bulk_prepare_enable(core->num_clks, core->clks);
 }
 
 static const struct dev_pm_ops rga_pm = {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 0e854cdf739f4..fcf1ef7d2029f 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -14,7 +14,6 @@
 #include <media/v4l2-device.h>
 
 #define RGA_NAME "rockchip-rga"
-
 #define DEFAULT_WIDTH 100
 #define DEFAULT_HEIGHT 100
 
@@ -36,6 +35,16 @@ struct rockchip_rga_version {
 	u32 minor;
 };
 
+struct rga_core {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	struct rockchip_rga *rga;
+	struct rga_ctx *curr;
+};
+
 struct rga_ctx {
 	struct v4l2_fh fh;
 	struct rockchip_rga *rga;
@@ -70,10 +79,6 @@ struct rockchip_rga {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct video_device *vfd;
 
-	struct device *dev;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	int num_clks;
 	struct rockchip_rga_version version;
 
 	/* vfd lock */
@@ -81,9 +86,9 @@ struct rockchip_rga {
 	/* ctrl parm lock */
 	spinlock_t ctrl_lock;
 
-	struct rga_ctx *curr;
-
 	const struct rga_hw *hw;
+
+	struct rga_core *cores[];
 };
 
 struct rga_addrs {
@@ -119,22 +124,22 @@ int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *crop_in,
 extern const struct vb2_ops rga_qops;
 
 /* RGA Hardware */
-static inline void rga_write(struct rockchip_rga *rga, u32 reg, u32 value)
+static inline void rga_write(struct rga_core *core, u32 reg, u32 value)
 {
-	writel(value, rga->regs + reg);
+	writel(value, core->regs + reg);
 };
 
-static inline u32 rga_read(struct rockchip_rga *rga, u32 reg)
+static inline u32 rga_read(struct rga_core *core, u32 reg)
 {
-	return readl(rga->regs + reg);
+	return readl(core->regs + reg);
 };
 
-static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
+static inline void rga_mod(struct rga_core *core, u32 reg, u32 val, u32 mask)
 {
-	u32 temp = rga_read(rga, reg) & ~(mask);
+	u32 temp = rga_read(core, reg) & ~(mask);
 
 	temp |= val & mask;
-	rga_write(rga, reg, temp);
+	rga_write(core, reg, temp);
 };
 
 #define RGA_FEATURE_FLIP	BIT(0)
@@ -155,10 +160,10 @@ struct rga_hw {
 	 * Requires that the cmdbuf is already zeroed.
 	 */
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
-	void (*start)(struct rockchip_rga *rga,
+	void (*start)(struct rga_core *core,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
-	bool (*handle_irq)(struct rockchip_rga *rga);
-	struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
+	bool (*handle_irq)(struct rga_core *core);
+	struct rockchip_rga_version (*get_version)(struct rga_core *core);
 	void *(*adjust_and_map_format)(struct rga_ctx *ctx,
 				       struct v4l2_pix_format_mplane *format,
 				       bool is_output);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index 3469523a5ecad..f7e4bc8c6ff21 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -266,42 +266,42 @@ static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
 	rga3_cmd_set_wr_format(ctx);
 }
 
-static void rga3_hw_start(struct rockchip_rga *rga,
+static void rga3_hw_start(struct rga_core *core,
 			  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
 {
-	struct rga_ctx *ctx = rga->curr;
+	struct rga_ctx *ctx = core->curr;
 
 	rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
 	rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
 
-	rga_write(rga, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
+	rga_write(core, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
 
 	/* sync CMD buf for RGA */
-	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
+	dma_sync_single_for_device(core->rga->cores[0]->dev, ctx->cmdbuf_phy,
 				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 
 	/* set to master mode and start the conversion */
-	rga_write(rga, RGA3_SYS_CTRL,
+	rga_write(core, RGA3_SYS_CTRL,
 		  FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
-	rga_write(rga, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));
-	rga_write(rga, RGA3_CMD_CTRL,
+	rga_write(core, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));
+	rga_write(core, RGA3_CMD_CTRL,
 		  FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
 }
 
-static bool rga3_handle_irq(struct rockchip_rga *rga)
+static bool rga3_handle_irq(struct rga_core *core)
 {
 	u32 intr;
 
-	intr = rga_read(rga, RGA3_INT_RAW);
+	intr = rga_read(core, RGA3_INT_RAW);
 	/* clear all interrupts */
-	rga_write(rga, RGA3_INT_CLR, intr);
+	rga_write(core, RGA3_INT_CLR, intr);
 
 	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
 }
 
-static struct rockchip_rga_version rga3_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga3_get_version(struct rga_core *core)
 {
-	u32 version = rga_read(rga, RGA3_VERSION_NUM);
+	u32 version = rga_read(core, RGA3_VERSION_NUM);
 
 	return (struct rockchip_rga_version) {
 		.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),

-- 
2.54.0


