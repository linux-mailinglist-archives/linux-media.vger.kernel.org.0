Return-Path: <linux-media+bounces-58338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GoGGayx12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:03:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316A3CBBC3
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 043C73029AD8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942893D3339;
	Thu,  9 Apr 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PqDDXwpf"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BA73B9DA8;
	Thu,  9 Apr 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742707; cv=none; b=Ie5aMF4Al3UzUp/RQp8zrvJicJl149ALpQYYzAbbbwVCIuyOJUbcdlhukipVraolWQVm73vaOU5YBWCHIIMdvuFeYTkW/xzfmwsMkW4zhw1+QrIYf7aYL+B3MIPjwFReIOkMp5H5VDWqQnFS1kW69+MvoNk8hE92oNkANyYPZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742707; c=relaxed/simple;
	bh=Liu/oRggu1n9YjyIDxPUgj+IUuHY6Obi1pOPsEJ6gq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BytCbAGEDJOUVI9wNdCyH5WmFKLwKn2OXtPDznc5Moff/q2vW6YJ5GbBHaJQPo/skatF8jHiCmgiokMx+KBt6NuvLFb0mUJb4j+j5Ck0YOaARGEKvX1QkjzU4Xjb1YEopr51C16hKPSSdb3HvRIra3WO2oq1vdV4iSj4P96ubx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PqDDXwpf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742698;
	bh=Liu/oRggu1n9YjyIDxPUgj+IUuHY6Obi1pOPsEJ6gq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PqDDXwpf3OCFUw6zWnGNQ7t7IUPTTb36HznjfzMtUmm832uE1rTiuePm52yYbgo66
	 KcywMNwOosSyNaoD8H3l6buJrsSFT1xOdr0er3K7502Th5A6gqX9cXrDmp5EtDR9f9
	 C23LfArMCJYYjnjZD/G9QaJ0tXkSZQWW26wFeJMQCmsUtLyuRATmgtJMTUjEpkmOTA
	 LWLNDWkvOpQpTsXAfjaUcN5Zg+iUDZoSMHQSy+q9FSaHEl+2cH73x23tfJg6Cesry8
	 gci8mXv5m28BhIROsxHbaP46eCxiBjXSPuBmHbH43WH0YuIEdi+yJv/MrxVD+0rs9t
	 9a218DwYCJXug==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E70817E12B9;
	Thu,  9 Apr 2026 15:51:36 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:40 -0400
Subject: [PATCH 5/7] media: rkvdec: Add multicore support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-5-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58338-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9316A3CBBC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rockchip SoCs like the RK3588 have multiple independent decoder cores
They are defined in the device tree as separate DT nodes sharing the same
compatible.
Rework the driver to discover and drive all of them from the same v4l2
device.

During probe, rkvdec_probe_get_first() finds the first available DT
node with a matching compatible. If the probing device is that node, a
new rkvdec_dev is allocated and a rkvdec_core is added to it to become
the main core.
Otherwise the existing rkvdec_dev is retrieved via platform_get_drvdata()
and the new core is appended to the list.
V4L2/m2m registration happens only once, on the main core.

Per-core hardware resources (MMIO, clocks, SRAM pool, IOMMU domain,
watchdog, RCB buffers) are moved into a new struct rkvdec_core.
A spinlock-protected pool of available cores tracks which cores are
idle and acquire_core() is used to pop a core before each decode, with
release_core() returning it after completion.

The m2m job_ready callback is implemented to prevent scheduling a
context that is already actively decoding on a core, allowing the
framework to move on to the next queued context instead.

Buffer completion is split from job completion:
v4l2_m2m_buf_done_manual() marks buffers done and release_core()
returns the core, then v4l2_m2m_try_schedule() is called to wake
waiters. v4l2_m2m_job_finish() is called unconditionally at the end
of device_run() so the m2m framework can immediately schedule the next
job for enother core, while this one is still running.

This mechanism allows jobs from multiple contexts to run simultaneously,
but does not allow parallele decoding within a single context.
Scheduling such jobs would need more analyses on reference frames
availability for each job to run, and could not yield impressive
performance gain if frames depend on the previous one being fully
decoded.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  17 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  16 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  58 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   5 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  26 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  27 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 430 +++++++++++++--------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  29 +-
 11 files changed, 401 insertions(+), 279 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index d3202cecb988..215676c55069 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -248,6 +248,7 @@ static void set_poc_reg(struct rkvdec_regs *regs, uint32_t poc, int id, bool bot
 static void config_registers(struct rkvdec_ctx *ctx,
 			     struct rkvdec_h264_run *run)
 {
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->sps;
@@ -354,7 +355,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	offset = offsetof(struct rkvdec_h264_priv_tbl, err_info);
 	regs->h26x.errorinfo_base = priv_start_addr + offset;
 
-	rkvdec_memcpy_toio(rkvdec->regs, regs,
+	rkvdec_memcpy_toio(core->regs, regs,
 			   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs));
 }
 
@@ -379,7 +380,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -404,7 +405,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, h264_ctx->priv_tbl.size,
 			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
 	kfree(h264_ctx);
 }
@@ -412,7 +413,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_h264_reflist_builder reflist_builder;
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_run run;
 	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
@@ -434,15 +435,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_run_postamble(ctx, &run.base);
 
-	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
+	schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
 
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
-	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
+	       core->regs + RKVDEC_REG_INTERRUPT);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a..fd664ac63698 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -402,6 +402,7 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
 static void config_registers(struct rkvdec_ctx *ctx,
 			     struct rkvdec_hevc_run *run)
 {
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
 	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
@@ -498,7 +499,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	offset = offsetof(struct rkvdec_hevc_priv_tbl, rps);
 	regs->h26x.rps_base = priv_start_addr + offset;
 
-	rkvdec_memcpy_toio(rkvdec->regs, regs,
+	rkvdec_memcpy_toio(core->regs, regs,
 			   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs));
 }
 
@@ -532,7 +533,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		kfree(hevc_ctx);
@@ -553,13 +554,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
 			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
 	kfree(hevc_ctx);
 }
 
 static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_hevc_run run;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
@@ -576,10 +578,10 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_run_postamble(ctx, &run.base);
 
-	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
+	schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
 
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
 		rkvdec_quirks_disable_qos(ctx);
@@ -589,7 +591,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 		0 : RKVDEC_WR_DDR_ALIGN_EN;
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E | reg,
-	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
+	       core->regs + RKVDEC_REG_INTERRUPT);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index 191f78278c01..190fb7438e8c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -29,38 +29,37 @@ static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
 
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id)
 {
-	return ctx->rcb_config->rcb_bufs[id].dma;
+	return ctx->core->rcb_config->rcb_bufs[id].dma;
 }
 
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id)
 {
-	return ctx->rcb_config->rcb_bufs[id].size;
+	return ctx->core->rcb_config->rcb_bufs[id].size;
 }
 
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
 {
-	return ctx->rcb_config->rcb_count;
+	return ctx->core->rcb_config->rcb_count;
 }
 
 bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+	struct rkvdec_rcb_config *cfg = ctx->core->rcb_config;
 
 	bool ret = cfg && cfg->height >= ctx->decoded_fmt.fmt.pix_mp.height &&
 		   cfg->width >= ctx->decoded_fmt.fmt.pix_mp.width;
 
 	if (!ret && cfg) {
-		dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cfg->height,
+		dev_dbg(ctx->core->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cfg->height,
 			ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.height);
 	}
 
 	return ret;
 }
 
-void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
+void rkvdec_free_rcb(struct rkvdec_core *core)
 {
-	struct rkvdec_dev *dev = ctx->dev;
-	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+	struct rkvdec_rcb_config *cfg = core->rcb_config;
 	unsigned long virt_addr;
 	int i;
 
@@ -77,12 +76,12 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 		case RKVDEC_ALLOC_SRAM:
 			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
 
-			if (dev->iommu_domain)
-				iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
-			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
+			if (core->iommu_domain)
+				iommu_unmap(core->iommu_domain, virt_addr, rcb_size);
+			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(dev->dev,
+			dma_free_coherent(core->dev,
 					  rcb_size,
 					  cfg->rcb_bufs[i].cpu,
 					  cfg->rcb_bufs[i].dma);
@@ -91,33 +90,32 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 	}
 
 	if (cfg->rcb_bufs)
-		devm_kfree(dev->dev, cfg->rcb_bufs);
+		devm_kfree(core->dev, cfg->rcb_bufs);
 
-	devm_kfree(dev->dev, cfg);
+	devm_kfree(core->dev, cfg);
 
-	ctx->rcb_config = NULL;
+	core->rcb_config = NULL;
 }
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
+int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count)
 {
 	int ret, i;
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_rcb_config *cfg;
 
 	if (!size_info || !rcb_count) {
-		ctx->rcb_config = NULL;
+		core->rcb_config = NULL;
 		return 0;
 	}
 
-	ctx->rcb_config = devm_kzalloc(rkvdec->dev, sizeof(*ctx->rcb_config), GFP_KERNEL);
-	if (!ctx->rcb_config)
+	core->rcb_config = devm_kzalloc(core->dev, sizeof(*core->rcb_config), GFP_KERNEL);
+	if (!core->rcb_config)
 		return -ENOMEM;
 
-	cfg = ctx->rcb_config;
+	cfg = core->rcb_config;
 
-	cfg->rcb_bufs = devm_kzalloc(rkvdec->dev, sizeof(*cfg->rcb_bufs) * rcb_count, GFP_KERNEL);
+	cfg->rcb_bufs = devm_kzalloc(core->dev, sizeof(*cfg->rcb_bufs) * rcb_count, GFP_KERNEL);
 	if (!cfg->rcb_bufs) {
 		ret = -ENOMEM;
 		goto err_alloc;
@@ -133,25 +131,25 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 		enum rkvdec_alloc_type alloc_type = RKVDEC_ALLOC_SRAM;
 
 		/* Try allocating an SRAM buffer */
-		if (ctx->dev->sram_pool) {
-			if (rkvdec->iommu_domain)
+		if (core->sram_pool) {
+			if (core->iommu_domain)
 				rcb_size = ALIGN(rcb_size, SZ_4K);
 
-			cpu = gen_pool_dma_zalloc_align(ctx->dev->sram_pool,
+			cpu = gen_pool_dma_zalloc_align(core->sram_pool,
 							rcb_size,
 							&dma,
 							SZ_4K);
 		}
 
 		/* If an IOMMU is used, map the SRAM address through it */
-		if (cpu && rkvdec->iommu_domain) {
+		if (cpu && core->iommu_domain) {
 			unsigned long virt_addr = (unsigned long)cpu;
 			phys_addr_t phys_addr = dma;
 
-			ret = iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
+			ret = iommu_map(core->iommu_domain, virt_addr, phys_addr,
 					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
 			if (ret) {
-				gen_pool_free(ctx->dev->sram_pool,
+				gen_pool_free(core->sram_pool,
 					      (unsigned long)cpu,
 					      rcb_size);
 				cpu = NULL;
@@ -168,7 +166,7 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(ctx->dev->dev,
+			cpu = dma_alloc_coherent(core->dev,
 						 rcb_size,
 						 &dma,
 						 GFP_KERNEL);
@@ -191,7 +189,7 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 	return 0;
 
 err_alloc:
-	rkvdec_free_rcb(ctx);
+	rkvdec_free_rcb(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
index 0662a4359bdf..a12af9b7dc2b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct rkvdec_ctx;
+struct rkvdec_core;
 
 enum rcb_axis {
 	PIC_WIDTH = 0,
@@ -20,11 +21,11 @@ struct rcb_size_info {
 	enum rcb_axis axis;
 };
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
+int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count);
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
 bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
-void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
+void rkvdec_free_rcb(struct rkvdec_core *core);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..667c5d36f3ea 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -185,22 +185,22 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_REGS,
 			   &h264_ctx->regs.common,
 			   sizeof(h264_ctx->regs.common));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_PARAMS_REGS,
 			   &h264_ctx->regs.h264_param,
 			   sizeof(h264_ctx->regs.h264_param));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_ADDR_REGS,
 			   &h264_ctx->regs.common_addr,
 			   sizeof(h264_ctx->regs.common_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_ADDR_REGS,
 			   &h264_ctx->regs.h264_addr,
 			   sizeof(h264_ctx->regs.h264_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_POC_HIGHBIT_REGS,
 			   &h264_ctx->regs.h264_highpoc,
 			   sizeof(h264_ctx->regs.h264_highpoc));
 }
@@ -368,7 +368,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_h264_priv_tbl *priv_tbl;
 	struct rkvdec_h264_ctx *h264_ctx;
 	struct v4l2_ctrl *ctrl;
@@ -387,7 +386,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(ctx->dev->main_core->dev, sizeof(*priv_tbl),
 				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -410,9 +409,8 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
-	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
+	dma_free_coherent(ctx->dev->main_core->dev, h264_ctx->priv_tbl.size,
 			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
 	kfree(h264_ctx);
 }
@@ -420,7 +418,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_h264_reflist_builder reflist_builder;
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
 	struct rkvdec_h264_run run;
@@ -443,10 +441,10 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_run_postamble(ctx, &run.base);
 
-	rkvdec_schedule_watchdog(rkvdec, h264_ctx->regs.common.reg032_timeout_threshold);
+	rkvdec_schedule_watchdog(core, h264_ctx->regs.common.reg032_timeout_threshold);
 
 	/* Start decoding! */
-	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
+	writel(VDPU381_DEC_E_BIT, core->regs + VDPU381_REG_DEC_E);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a17551..bd68120b74c6 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -356,22 +356,22 @@ static void set_ref_valid(struct rkvdec_vdpu381_regs_hevc *regs, int id, u32 val
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_REGS,
 			   &hevc_ctx->regs.common,
 			   sizeof(hevc_ctx->regs.common));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_PARAMS_REGS,
 			   &hevc_ctx->regs.hevc_param,
 			   sizeof(hevc_ctx->regs.hevc_param));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_COMMON_ADDR_REGS,
 			   &hevc_ctx->regs.common_addr,
 			   sizeof(hevc_ctx->regs.common_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_CODEC_ADDR_REGS,
 			   &hevc_ctx->regs.hevc_addr,
 			   sizeof(hevc_ctx->regs.hevc_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
+	rkvdec_memcpy_toio(core->regs + OFFSET_POC_HIGHBIT_REGS,
 			   &hevc_ctx->regs.hevc_highpoc,
 			   sizeof(hevc_ctx->regs.hevc_highpoc));
 }
@@ -555,7 +555,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -580,14 +580,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
 			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
 	kfree(hevc_ctx);
 }
 
 static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_hevc_run run;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
@@ -604,7 +604,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 */
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
-		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		dev_warn_ratelimited(core->dev, "Long and short term RPS not set\n");
 	} else {
 		rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
 	}
@@ -613,10 +613,10 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_run_postamble(ctx, &run.base);
 
-	rkvdec_schedule_watchdog(rkvdec, hevc_ctx->regs.common.reg032_timeout_threshold);
+	rkvdec_schedule_watchdog(core, hevc_ctx->regs.common.reg032_timeout_threshold);
 
 	/* Start decoding! */
-	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
+	writel(VDPU381_DEC_E_BIT, ctx->core->regs + VDPU381_REG_DEC_E);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index fb4f849d7366..f3a1c31d84d3 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -291,19 +291,19 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_REGS,
 			   &h264_ctx->regs.common,
 			   sizeof(h264_ctx->regs.common));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
 			   &h264_ctx->regs.common_addr,
 			   sizeof(h264_ctx->regs.common_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
 			   &h264_ctx->regs.h26x_params,
 			   sizeof(h264_ctx->regs.h26x_params));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
 			   &h264_ctx->regs.h26x_addr,
 			   sizeof(h264_ctx->regs.h26x_addr));
 }
@@ -455,7 +455,7 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -481,7 +481,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, h264_ctx->priv_tbl.size,
 			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
 	kfree(h264_ctx);
 }
@@ -489,7 +489,7 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_h264_reflist_builder reflist_builder;
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_run run;
 	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
@@ -514,12 +514,12 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	rkvdec_run_postamble(ctx, &run.base);
 
 	timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
-	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
+	rkvdec_schedule_watchdog(core, timeout_threshold);
 
 	/* Start decoding! */
-	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
-	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
-	writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
+	writel(timeout_threshold, core->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
+	writel(0, core->link + VDPU383_LINK_IP_ENABLE);
+	writel(VDPU383_DEC_E_BIT, core->link + VDPU383_LINK_DEC_ENABLE);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 96d938ee70b0..5170ca35fd90 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -381,19 +381,19 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_hevc_ctx *h265_ctx = ctx->priv;
 
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_REGS,
 			   &h265_ctx->regs.common,
 			   sizeof(h265_ctx->regs.common));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
 			   &h265_ctx->regs.common_addr,
 			   sizeof(h265_ctx->regs.common_addr));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
 			   &h265_ctx->regs.h26x_params,
 			   sizeof(h265_ctx->regs.h26x_params));
-	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
+	rkvdec_memcpy_toio(core->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
 			   &h265_ctx->regs.h26x_addr,
 			   sizeof(h265_ctx->regs.h26x_addr));
 }
@@ -563,7 +563,7 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -588,14 +588,14 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, hevc_ctx->priv_tbl.size,
 			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
 	kfree(hevc_ctx);
 }
 
 static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_hevc_run run;
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
@@ -610,7 +610,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	 */
 	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
 	    (!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
-		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
+		dev_err_ratelimited(core->dev, "Long and short term RPS not set\n");
 		return -EINVAL;
 	}
 
@@ -624,12 +624,12 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	rkvdec_run_postamble(ctx, &run.base);
 
 	timeout_threshold = hevc_ctx->regs.common.reg013_core_timeout_threshold;
-	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
+	rkvdec_schedule_watchdog(core, timeout_threshold);
 
 	/* Start decoding! */
-	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
-	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
-	writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
+	writel(timeout_threshold, core->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
+	writel(VDPU383_IP_CRU_MODE, core->link + VDPU383_LINK_IP_ENABLE);
+	writel(VDPU383_DEC_E_BIT, core->link + VDPU383_LINK_DEC_ENABLE);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..0b7d6b29bcfa 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -482,6 +482,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_regs *regs = &vp9_ctx->regs;
 	const struct v4l2_vp9_segmentation *seg;
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	dma_addr_t addr;
 	bool intra_only;
@@ -657,18 +658,19 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	regs->vp9.reg44.strmd_error_e = 0xe;
 
-	rkvdec_memcpy_toio(rkvdec->regs, regs,
+	rkvdec_memcpy_toio(core->regs, regs,
 			   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs));
 }
 
 static int validate_dec_params(struct rkvdec_ctx *ctx,
 			       const struct v4l2_ctrl_vp9_frame *dec_params)
 {
+	struct rkvdec_core *core = ctx->core;
 	unsigned int aligned_width, aligned_height;
 
 	/* We only support profile 0. */
 	if (dec_params->profile != 0) {
-		dev_err(ctx->dev->dev, "unsupported profile %d\n",
+		dev_err(core->dev, "unsupported profile %d\n",
 			dec_params->profile);
 		return -EINVAL;
 	}
@@ -682,7 +684,7 @@ static int validate_dec_params(struct rkvdec_ctx *ctx,
 	 */
 	if (aligned_width != ctx->decoded_fmt.fmt.pix_mp.width ||
 	    aligned_height != ctx->decoded_fmt.fmt.pix_mp.height) {
-		dev_err(ctx->dev->dev,
+		dev_err(core->dev,
 			"unexpected bitstream resolution %dx%d\n",
 			dec_params->frame_width_minus_1 + 1,
 			dec_params->frame_height_minus_1 + 1);
@@ -768,6 +770,7 @@ static int rkvdec_vp9_run_preamble(struct rkvdec_ctx *ctx,
 
 static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_core *core = ctx->core;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_vp9_run run = { };
 	int ret;
@@ -786,10 +789,10 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_run_postamble(ctx, &run.base);
 
-	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
+	schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(2000));
 
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
-	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
+	writel(1, core->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
 		rkvdec_quirks_disable_qos(ctx);
@@ -797,7 +800,7 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
-	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
+	       core->regs + RKVDEC_REG_INTERRUPT);
 
 	return 0;
 }
@@ -979,7 +982,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	ctx->priv = vp9_ctx;
 
 	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+	priv_tbl = dma_alloc_coherent(rkvdec->main_core->dev, sizeof(*priv_tbl),
 				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
 		ret = -ENOMEM;
@@ -989,7 +992,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
 
-	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
+	count_tbl = dma_alloc_coherent(rkvdec->main_core->dev, RKVDEC_VP9_COUNT_SIZE,
 				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
 	if (!count_tbl) {
 		ret = -ENOMEM;
@@ -1003,7 +1006,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	return 0;
 
 err_free_priv_tbl:
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->priv_tbl.size,
 			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
 
 err_free_ctx:
@@ -1016,9 +1019,9 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->count_tbl.size,
 			  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
+	dma_free_coherent(rkvdec->main_core->dev, vp9_ctx->priv_tbl.size,
 			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
 	kfree(vp9_ctx);
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index db2731af06cf..5667d625f016 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -655,11 +656,11 @@ static int rkvdec_querycap(struct file *file, void *priv,
 	struct rkvdec_dev *rkvdec = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
 
-	strscpy(cap->driver, rkvdec->dev->driver->name,
+	strscpy(cap->driver, rkvdec->main_core->dev->driver->name,
 		sizeof(cap->driver));
 	strscpy(cap->card, vdev->name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 rkvdec->dev->driver->name);
+		 rkvdec->main_core->dev->driver->name);
 	return 0;
 }
 
@@ -1026,8 +1027,6 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 
 		if (desc->ops->stop)
 			desc->ops->stop(ctx);
-
-		rkvdec_free_rcb(ctx);
 	}
 
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
@@ -1061,28 +1060,66 @@ static const struct media_device_ops rkvdec_media_ops = {
 	.req_queue = v4l2_m2m_request_queue,
 };
 
-static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
-				    enum vb2_buffer_state result)
+/**
+ * Return a core that is available for decoding or null if no core is found.
+ * The caller should make sure to call release_core() when the core is no longer needed.
+ */
+static struct rkvdec_core *acquire_core(struct rkvdec_dev *rkvdec, struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_core *core = NULL;
+
+	guard(spinlock_irqsave)(&rkvdec->cores_lock);
+
+	if (rkvdec->available_core_count) {
+		core = rkvdec->available_cores[--rkvdec->available_core_count];
+
+		// Set the current core's ctx to this ctx
+		core->curr_ctx = ctx;
+	}
+
+	return core;
+}
+
+/**
+ * Release the core to make it available for a next job.
+ */
+static void release_core(struct rkvdec_dev *rkvdec, struct rkvdec_core *core)
+{
+	guard(spinlock_irqsave)(&rkvdec->cores_lock);
+
+	core->curr_ctx = NULL;
+	rkvdec->available_cores[rkvdec->available_core_count++] = core;
+}
+
+static void rkvdec_buf_done_no_pm(struct rkvdec_ctx *ctx,
+				  enum vb2_buffer_state result)
 {
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct v4l2_m2m_dev *m2m_dev = m2m_ctx->m2m_dev;
+
 	if (ctx->coded_fmt_desc->ops->done) {
 		struct vb2_v4l2_buffer *src_buf, *dst_buf;
 
-		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-		dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+		src_buf = v4l2_m2m_next_src_buf(m2m_ctx);
+		dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
 	}
 
-	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
-					 result);
+	v4l2_m2m_buf_done_manual(m2m_dev, m2m_ctx, result);
+
+	if (ctx->core) {
+		release_core(ctx->dev, ctx->core);
+		v4l2_m2m_try_schedule(m2m_ctx);
+	}
 }
 
-static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
-			      enum vb2_buffer_state result)
+static void rkvdec_buf_done(struct rkvdec_ctx *ctx,
+			    enum vb2_buffer_state result)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	pm_runtime_mark_last_busy(ctx->core->dev);
+	pm_runtime_put_autosuspend(ctx->core->dev);
 
-	pm_runtime_put_autosuspend(rkvdec->dev);
-	rkvdec_job_finish_no_pm(ctx, result);
+	rkvdec_buf_done_no_pm(ctx, result);
 }
 
 void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
@@ -1112,14 +1149,14 @@ void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	u32 reg;
 
 	/* Set undocumented swreg_block_gating_e field */
-	reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	reg = readl(core->regs + RKVDEC_REG_QOS_CTRL);
 	reg &= GENMASK(31, 16);
 	reg |= 0xEFFF;
-	writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	writel(reg, core->regs + RKVDEC_REG_QOS_CTRL);
 }
 
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len)
@@ -1131,57 +1168,81 @@ void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len)
 #endif
 }
 
-void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
+void rkvdec_schedule_watchdog(struct rkvdec_core *core, u32 timeout_threshold)
 {
 	/* Set watchdog at 2 times the hardware timeout threshold */
 	u32 watchdog_time;
-	unsigned long axi_rate = clk_get_rate(rkvdec->axi_clk);
+	unsigned long axi_rate = clk_get_rate(core->axi_clk);
 
 	if (axi_rate)
 		watchdog_time = 2 * div_u64(1000 * (u64)timeout_threshold, axi_rate);
 	else
 		watchdog_time = 2000;
 
-	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
+	schedule_delayed_work(&core->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
 	int ret;
 
 	if (WARN_ON(!desc))
-		return;
+		goto finish;
 
-	ret = pm_runtime_resume_and_get(rkvdec->dev);
+	ctx->core = acquire_core(ctx->dev, ctx);
+	if (!ctx->core)
+		goto finish;
+
+	ret = pm_runtime_resume_and_get(ctx->core->dev);
 	if (ret < 0) {
-		rkvdec_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
-		return;
+		rkvdec_buf_done_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		goto finish;
 	}
 
 	if (!rkvdec_rcb_buf_validate_size(ctx)) {
-		rkvdec_free_rcb(ctx);
+		rkvdec_free_rcb(ctx->core);
 
-		ret = rkvdec_allocate_rcb(ctx,
+		ret = rkvdec_allocate_rcb(ctx->core,
 					  ctx->decoded_fmt.fmt.pix_mp.width,
 					  ctx->decoded_fmt.fmt.pix_mp.height,
 					  ctx->dev->variant->rcb_sizes,
 					  ctx->dev->variant->num_rcb_sizes);
 		if (ret) {
-			rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
-			return;
+			rkvdec_buf_done(ctx, VB2_BUF_STATE_ERROR);
+			goto finish;
 		}
 	}
 
 	ret = desc->ops->run(ctx);
-	if (ret)
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	if (ret) {
+		rkvdec_buf_done(ctx, VB2_BUF_STATE_ERROR);
+		goto finish;
+	}
+
+finish:
+	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static int rkvdec_job_ready(void *priv)
+{
+	struct rkvdec_ctx *ctx = priv;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	guard(spinlock_irqsave)(&rkvdec->cores_lock);
+
+	for (int i = 0; i < rkvdec->core_count; i++) {
+		if (rkvdec->cores[i].curr_ctx == ctx)
+			return 0;
+	}
+
+	return 1;
 }
 
 static const struct v4l2_m2m_ops rkvdec_m2m_ops = {
 	.device_run = rkvdec_device_run,
+	.job_ready = rkvdec_job_ready,
 };
 
 static int rkvdec_queue_init(void *priv,
@@ -1340,10 +1401,11 @@ static const struct v4l2_file_operations rkvdec_fops = {
 static int rkvdec_v4l2_init(struct rkvdec_dev *rkvdec)
 {
 	int ret;
+	struct device *dev = rkvdec->main_core->dev;
 
-	ret = v4l2_device_register(rkvdec->dev, &rkvdec->v4l2_dev);
+	ret = v4l2_device_register(dev, &rkvdec->v4l2_dev);
 	if (ret) {
-		dev_err(rkvdec->dev, "Failed to register V4L2 device\n");
+		dev_err(dev, "Failed to register V4L2 device\n");
 		return ret;
 	}
 
@@ -1354,7 +1416,7 @@ static int rkvdec_v4l2_init(struct rkvdec_dev *rkvdec)
 		goto err_unregister_v4l2;
 	}
 
-	rkvdec->mdev.dev = rkvdec->dev;
+	rkvdec->mdev.dev = dev;
 	strscpy(rkvdec->mdev.model, "rkvdec", sizeof(rkvdec->mdev.model));
 	strscpy(rkvdec->mdev.bus_info, "platform:rkvdec",
 		sizeof(rkvdec->mdev.bus_info));
@@ -1420,9 +1482,9 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
 	v4l2_device_unregister(&rkvdec->v4l2_dev);
 }
 
-static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
+static void rkvdec_iommu_restore(struct rkvdec_core *core)
 {
-	if (rkvdec->empty_domain) {
+	if (core->empty_domain) {
 		/*
 		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
 		 * will program an empty table, then detach it to restore the default domain and
@@ -1430,42 +1492,42 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 		 * This is safely done in this interrupt handler to make sure no memory get mapped
 		 * through the IOMMU while the empty domain is attached.
 		 */
-		iommu_attach_device(rkvdec->empty_domain, rkvdec->dev);
-		iommu_detach_device(rkvdec->empty_domain, rkvdec->dev);
+		iommu_attach_device(core->empty_domain, core->dev);
+		iommu_detach_device(core->empty_domain, core->dev);
 	}
 }
 
 static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	enum vb2_buffer_state state;
 	u32 status;
 
-	status = readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
-	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
+	status = readl(core->regs + RKVDEC_REG_INTERRUPT);
+	writel(0, core->regs + RKVDEC_REG_INTERRUPT);
 
 	if (status & RKVDEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
 	} else {
 		state = VB2_BUF_STATE_ERROR;
 		if (status & RKVDEC_SOFTRESET_RDY)
-			rkvdec_iommu_restore(rkvdec);
+			rkvdec_iommu_restore(core);
 	}
 
-	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+	if (cancel_delayed_work(&core->watchdog_work))
+		rkvdec_buf_done(ctx, state);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	enum vb2_buffer_state state;
 	u32 status;
 
-	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
-	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
+	status = readl(core->regs + VDPU381_REG_STA_INT);
+	writel(0, core->regs + VDPU381_REG_STA_INT);
 
 	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
@@ -1474,47 +1536,50 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 		if (status & (VDPU381_STA_INT_SOFTRESET_RDY |
 			      VDPU381_STA_INT_TIMEOUT |
 			      VDPU381_STA_INT_ERROR))
-			rkvdec_iommu_restore(rkvdec);
+			rkvdec_iommu_restore(core);
 	}
 
-	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+	if (cancel_delayed_work(&core->watchdog_work))
+		rkvdec_buf_done(ctx, state);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_core *core = ctx->core;
 	enum vb2_buffer_state state;
 	u32 status;
 
-	status = readl(rkvdec->link + VDPU383_LINK_STA_INT);
-	writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), rkvdec->link + VDPU383_LINK_STA_INT);
+	status = readl(core->link + VDPU383_LINK_STA_INT);
+	writel(FIELD_PREP_WM16(VDPU383_STA_INT_ALL, 0), core->link + VDPU383_LINK_STA_INT);
 	/* On vdpu383, the interrupts must be disabled */
 	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, 0),
-	       rkvdec->link + VDPU383_LINK_INT_EN);
+	       core->link + VDPU383_LINK_INT_EN);
 
 	if (status & VDPU383_STA_INT_DEC_RDY_STA) {
 		state = VB2_BUF_STATE_DONE;
 	} else {
 		state = VB2_BUF_STATE_ERROR;
-		rkvdec_iommu_restore(rkvdec);
+		rkvdec_iommu_restore(core);
 	}
 
-	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+	if (cancel_delayed_work(&core->watchdog_work))
+		rkvdec_buf_done(ctx, state);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 {
-	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
-	const struct rkvdec_variant *variant = rkvdec->variant;
+	irqreturn_t ret;
+	struct rkvdec_core *core = priv;
+	struct rkvdec_ctx *ctx = core->curr_ctx;
+	const struct rkvdec_variant *variant = ctx->dev->variant;
+
+	ret = variant->ops->irq_handler(ctx);
 
-	return variant->ops->irq_handler(ctx);
+	return ret;
 }
 
 /*
@@ -1591,62 +1656,19 @@ static void vdpu383_flatten_matrices(u8 *output, const u8 *input, int matrices,
 
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
-	struct rkvdec_dev *rkvdec;
+	struct rkvdec_core *core;
 	struct rkvdec_ctx *ctx;
 
-	rkvdec = container_of(to_delayed_work(work), struct rkvdec_dev,
+	core = container_of(to_delayed_work(work), struct rkvdec_core,
 			      watchdog_work);
-	ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	ctx = core->curr_ctx;
 	if (ctx) {
-		dev_err(rkvdec->dev, "Frame processing timed out!\n");
-		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		dev_err(core->dev, "Frame processing timed out!\n");
+		writel(RKVDEC_IRQ_DIS, core->regs + RKVDEC_REG_INTERRUPT);
+		rkvdec_buf_done(ctx, VB2_BUF_STATE_ERROR);
 	}
 }
 
-/*
- * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
- * kernel is currently missing support for multi-core handling. Exposing
- * separate devices for each core to userspace is bad, since that does
- * not allow scheduling tasks properly (and creates ABI). With this workaround
- * the driver will only probe for the first core and early exit for the other
- * cores. Once the driver gains multi-core support, the same technique
- * for detecting the first core can be used to cluster all cores together.
- */
-static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
-{
-	struct device_node *node = NULL;
-	const char *compatible;
-	bool is_first_core;
-	int ret;
-
-	/* Intentionally ignores the fallback strings */
-	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
-	if (ret)
-		return ret;
-
-	/* The first compatible and available node found is considered the main core */
-	do {
-		node = of_find_compatible_node(node, NULL, compatible);
-		if (of_device_is_available(node))
-			break;
-	} while (node);
-
-	if (!node)
-		return -EINVAL;
-
-	is_first_core = (rkvdec->dev->of_node == node);
-
-	of_node_put(node);
-
-	if (!is_first_core) {
-		dev_info(rkvdec->dev, "missing multi-core support, ignoring this instance\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
 static const struct rkvdec_variant_ops rk3399_variant_ops = {
 	.irq_handler = rk3399_irq_handler,
 	.colmv_size = rkvdec_colmv_size,
@@ -1757,49 +1779,114 @@ static const struct of_device_id of_rkvdec_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
 
+static struct rkvdec_dev *device_node_to_rkvdec(struct device_node *node)
+{
+	struct platform_device *pdev = of_find_device_by_node(node);
+	struct rkvdec_dev *rkvdec = NULL;
+
+	if (!pdev)
+		return NULL;
+
+	rkvdec = platform_get_drvdata(pdev);
+
+	platform_device_put(pdev);
+
+	return rkvdec;
+}
+
+/*
+ * Probe a new core based on the given device.
+ * If it is the first probed core of the same compatible, a new rkvdec instance is
+ * created and the core is added to it.
+ * If not, the core is added to the existing rkvdec instance.
+ */
+static struct rkvdec_dev *rkvdec_probe_get_first(struct device *dev)
+{
+	struct device_node *first_node = NULL;
+	struct rkvdec_dev *rkvdec = NULL;
+	const char *compatible;
+	bool is_first_core;
+	int ret = 0;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+
+	/* The first compatible and available node found is considered the main core */
+	do {
+		first_node = of_find_compatible_node(first_node, NULL, compatible);
+		if (of_device_is_available(first_node))
+			break;
+	} while (first_node);
+
+	if (!first_node)
+		return ERR_PTR(-EINVAL);
+
+	is_first_core = (dev->of_node == first_node);
+
+	if (is_first_core) {
+		of_node_put(first_node);
+
+		rkvdec = devm_kzalloc(dev, sizeof(*rkvdec), GFP_KERNEL);
+		if (!rkvdec)
+			return ERR_PTR(-ENOMEM);
+
+		rkvdec->variant = of_device_get_match_data(dev);
+
+		mutex_init(&rkvdec->vdev_lock);
+		spin_lock_init(&rkvdec->cores_lock);
+	} else {
+		rkvdec = device_node_to_rkvdec(first_node);
+		of_node_put(first_node);
+	}
+
+	return rkvdec;
+}
+
 static int rkvdec_probe(struct platform_device *pdev)
 {
-	const struct rkvdec_variant *variant;
 	struct rkvdec_dev *rkvdec;
+	struct rkvdec_core *core;
 	int ret, irq;
 
-	variant = of_device_get_match_data(&pdev->dev);
-	if (!variant)
-		return -EINVAL;
+	rkvdec = rkvdec_probe_get_first(&pdev->dev);
+	if (IS_ERR(rkvdec))
+		return PTR_ERR(rkvdec);
 
-	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
-	if (!rkvdec)
-		return -ENOMEM;
+	core = &rkvdec->cores[rkvdec->core_count++];
 
 	platform_set_drvdata(pdev, rkvdec);
-	rkvdec->dev = &pdev->dev;
-	rkvdec->variant = variant;
-	mutex_init(&rkvdec->vdev_lock);
-	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
-
-	ret = rkvdec_disable_multicore(rkvdec);
-	if (ret)
-		return ret;
+	core->dev = &pdev->dev;
+	INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_func);
 
-	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &core->clocks);
 	if (ret < 0)
 		return ret;
 
-	rkvdec->num_clocks = ret;
-	rkvdec->axi_clk = devm_clk_get(&pdev->dev, "axi");
+	core->num_clocks = ret;
+	core->axi_clk = devm_clk_get(&pdev->dev, "axi");
 
 	if (rkvdec->variant->has_single_reg_region) {
-		rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(rkvdec->regs))
-			return PTR_ERR(rkvdec->regs);
+		core->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(core->regs))
+			return PTR_ERR(core->regs);
 	} else {
-		rkvdec->regs = devm_platform_ioremap_resource_byname(pdev, "function");
-		if (IS_ERR(rkvdec->regs))
-			return PTR_ERR(rkvdec->regs);
+		core->regs = devm_platform_ioremap_resource_byname(pdev, "function");
+		if (IS_ERR(core->regs))
+			return PTR_ERR(core->regs);
+
+		core->link = devm_platform_ioremap_resource_byname(pdev, "link");
+		if (IS_ERR(core->link))
+			return PTR_ERR(core->link);
+	}
 
-		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
-		if (IS_ERR(rkvdec->link))
-			return PTR_ERR(rkvdec->link);
+	core->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
+	if (core->iommu_domain) {
+		core->empty_domain = iommu_paging_domain_alloc(core->dev);
+
+		if (!core->empty_domain)
+			dev_warn(core->dev, "cannot alloc new empty domain\n");
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -1816,42 +1903,41 @@ static int rkvdec_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
-					dev_name(&pdev->dev), rkvdec);
+					dev_name(&pdev->dev), core);
 	if (ret) {
-		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
+		dev_err(&pdev->dev, "Could not request core IRQ\n");
 		return ret;
 	}
 
-	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
-	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)
+	core->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (!core->sram_pool && rkvdec->variant->num_rcb_sizes > 0)
 		dev_info(&pdev->dev, "No sram node, RCB will be stored in RAM\n");
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	ret = rkvdec_v4l2_init(rkvdec);
-	if (ret)
-		goto err_disable_runtime_pm;
-
-	rkvdec->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
-	if (rkvdec->iommu_domain) {
-		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
+	/* Only init v4l2 for the first (main) core. */
+	if (rkvdec->core_count == 1) {
+		rkvdec->main_core = core;
 
-		if (IS_ERR(rkvdec->empty_domain)) {
-			rkvdec->empty_domain = NULL;
-			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
-		}
+		ret = rkvdec_v4l2_init(rkvdec);
+		if (ret)
+			goto err_disable_runtime_pm;
 	}
 
+	release_core(rkvdec, core);
+
+	dev_info(core->dev, "Registered core %d\n", core->id);
+
 	return 0;
 
 err_disable_runtime_pm:
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	if (rkvdec->sram_pool)
-		gen_pool_destroy(rkvdec->sram_pool);
+	if (core->sram_pool)
+		gen_pool_destroy(core->sram_pool);
 
 	return ret;
 }
@@ -1859,30 +1945,50 @@ static int rkvdec_probe(struct platform_device *pdev)
 static void rkvdec_remove(struct platform_device *pdev)
 {
 	struct rkvdec_dev *rkvdec = platform_get_drvdata(pdev);
+	int i;
 
-	cancel_delayed_work_sync(&rkvdec->watchdog_work);
+	for (i = 0; i < rkvdec->core_count; i++)
+		cancel_delayed_work_sync(&rkvdec->cores[i].watchdog_work);
 
 	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
-	if (rkvdec->empty_domain)
-		iommu_domain_free(rkvdec->empty_domain);
+	for (i = 0; i < rkvdec->core_count; i++) {
+		pm_runtime_disable(rkvdec->cores[i].dev);
+		pm_runtime_dont_use_autosuspend(rkvdec->cores[i].dev);
+
+		if (rkvdec->cores[i].empty_domain)
+			iommu_domain_free(rkvdec->cores[i].empty_domain);
+
+		rkvdec_free_rcb(&rkvdec->cores[i]);
+	}
 }
 
 #ifdef CONFIG_PM
 static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+	int i, ret;
 
-	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
+	for (i = 0; i < rkvdec->core_count; i++) {
+		ret = clk_bulk_prepare_enable(rkvdec->cores[i].num_clocks,
+					      rkvdec->cores[i].clocks);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int rkvdec_runtime_suspend(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < rkvdec->core_count; i++) {
+		clk_bulk_disable_unprepare(rkvdec->cores[i].num_clocks,
+					   rkvdec->cores[i].clocks);
+	}
 
-	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
 	return 0;
 }
 #endif
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..4f042a367dc0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -15,6 +15,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/spinlock.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -125,23 +126,35 @@ struct rkvdec_coded_fmt_desc {
 	u32 subsystem_flags;
 };
 
-struct rkvdec_dev {
-	struct v4l2_device v4l2_dev;
-	struct media_device mdev;
-	struct video_device vdev;
-	struct v4l2_m2m_dev *m2m_dev;
+struct rkvdec_core {
 	struct device *dev;
 	struct clk_bulk_data *clocks;
 	unsigned int num_clocks;
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
-	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
 	struct iommu_domain *iommu_domain;
 	struct iommu_domain *empty_domain;
+	struct rkvdec_rcb_config *rcb_config;
+	struct rkvdec_ctx *curr_ctx;
+	int id;
+};
+
+struct rkvdec_dev {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct mutex vdev_lock; /* serializes ioctls */
 	const struct rkvdec_variant *variant;
+	struct rkvdec_core cores[2];
+	int core_count;
+	struct rkvdec_core *available_cores[2];
+	unsigned int available_core_count;
+	spinlock_t cores_lock; /* serializes core list access */
+	struct rkvdec_core *main_core;
 };
 
 struct rkvdec_ctx {
@@ -152,8 +165,8 @@ struct rkvdec_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct rkvdec_dev *dev;
 	enum rkvdec_image_fmt image_fmt;
-	struct rkvdec_rcb_config *rcb_config;
 	u32 colmv_offset;
+	struct rkvdec_core *core;
 	void *priv;
 	u8 has_sps_st_rps: 1;
 	u8 has_sps_lt_rps: 1;
@@ -179,7 +192,7 @@ struct rkvdec_aux_buf {
 void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
-void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_schedule_watchdog(struct rkvdec_core *core, u32 timeout_threshold);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 

-- 
2.53.0


