Return-Path: <linux-media+bounces-58339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJdWKsCv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:55:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D913CB9F7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA134302E83B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6088C37F756;
	Thu,  9 Apr 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AkAW4qi0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A8136494C;
	Thu,  9 Apr 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742709; cv=none; b=nRna39a1qJjmOmuf+72AchyC7rfxS9MWEF/f3nqphAIqdIm16u7e4J2p55v9DxAHmR3F9+Ov+QypyEE3mCdyG7dHw7sL3uoiFgOpNg4lHv39VJUlRdDsLBEfhatwu/H97E4kbmXtSnA/q6wffTDCd103xQaisyfdFDTC8nXtm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742709; c=relaxed/simple;
	bh=MF7T/Jpkt7WSkcB4j1vMJJa1MuRvCoF8Hv7YRWQJ6sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKCT13/Gx+OQP8/zBUjlho4XAWAjG/yIdJebaxTlsl6vO8IVygyFiOZVepe3dqQctJaVVyIRYLY4hBOD/qQQBvg6T1aVo+9fS/4GZPzRTe4Vu6zO1d+MXOJXKwjyIUCLV5tlkBNhrGO4rHt8WORbn4kXZmUBd14kMNjekWM4TQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AkAW4qi0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742702;
	bh=MF7T/Jpkt7WSkcB4j1vMJJa1MuRvCoF8Hv7YRWQJ6sY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkAW4qi0+/to1+Q3rWnzbjE1xvSl8XY/WbKSEGQIk7Up3CO6+JgEQ6phLN4ETzu1T
	 1vLM9B8MXBL7QYKQdu4JFvtVZ6b2SKdnzIPigiVxmYovseOlYrFaSlSqk4AyRpKvDo
	 fzY7+L3QyJBMtd6MC0hvdyOCL9WXg7qIaiYDooQjia9013fgAmysoOkPtrHewvoTCX
	 vPjdoLak+KNatg8/pkjzPgZ5t2Ynmc/YpM7uE7QIhTdOcuyS5ttRmPlH24CmAQtjTn
	 UAtJlmpKewlEa1sK6DYgh5Znpuc9jQZgRJWtXZlbnS8QxzVrTxZHz+i/5tiNWW/dzY
	 4j9QcoaBhX//Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A5FD17E138B;
	Thu,  9 Apr 2026 15:51:40 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:42 -0400
Subject: [PATCH 7/7] media: rkvdec: Add multicore IOMMU support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-7-62b316abf0f7@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58339-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61D913CB9F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As each core has its own IOMMU core, buffers must be mapped in each
core's IOMMU so that any run() call can use any core without having to
remap everything.

To do that, we use rockchip iommu domain's iommu devices list.
With that, one IOMMU domain can be mapped on multiple devices, meaning
that each call to iommu_map() will flush the new mapping on all devices
in the list.

The IOMMU domain that will have all devices in its list is the first
core's default domain.

Another domain cannot be used because VB2 allocates buffers through the
DMA engine, which uses iommu_get_dma_domain() to find the domain to map
buffers through.

The IOMMU restore function can still work as before, but needs to be more
explicit in what domain to attach the device to.
That is because detaching the empty domain will reattach the core's default
domain, which is wrong (except for the first "main" core).

The RCB temporary buffers are allocated in a dedicated SRAM, each
core has its own SRAM, so the mapping for each core's SRAM is added in the
global domain.

Everything else is mapped through the first core's default domain, making
the driver write the mappings on both IOMMU cores.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  6 ++--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 35 +++++++++++++++++-----
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  2 +-
 4 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index 190fb7438e8c..977e37cf209b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -57,7 +57,7 @@ bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
 	return ret;
 }
 
-void rkvdec_free_rcb(struct rkvdec_core *core)
+void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core)
 {
 	struct rkvdec_rcb_config *cfg = core->rcb_config;
 	unsigned long virt_addr;
@@ -76,12 +76,12 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
 		case RKVDEC_ALLOC_SRAM:
 			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
 
-			if (core->iommu_domain)
-				iommu_unmap(core->iommu_domain, virt_addr, rcb_size);
+			if (rkvdec->iommu_global_domain)
+				iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size);
 			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(core->dev,
+			dma_free_coherent(rkvdec->main_core->dev,
 					  rcb_size,
 					  cfg->rcb_bufs[i].cpu,
 					  cfg->rcb_bufs[i].dma);
@@ -97,7 +97,8 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
 	core->rcb_config = NULL;
 }
 
-int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
+int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
+			u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count)
 {
@@ -132,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 
 		/* Try allocating an SRAM buffer */
 		if (core->sram_pool) {
-			if (core->iommu_domain)
+			if (rkvdec->iommu_global_domain)
 				rcb_size = ALIGN(rcb_size, SZ_4K);
 
 			cpu = gen_pool_dma_zalloc_align(core->sram_pool,
@@ -142,11 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 		}
 
 		/* If an IOMMU is used, map the SRAM address through it */
-		if (cpu && core->iommu_domain) {
+		if (cpu && rkvdec->iommu_global_domain) {
 			unsigned long virt_addr = (unsigned long)cpu;
 			phys_addr_t phys_addr = dma;
 
-			ret = iommu_map(core->iommu_domain, virt_addr, phys_addr,
+			ret = iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_addr,
 					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
 			if (ret) {
 				gen_pool_free(core->sram_pool,
@@ -166,7 +167,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(core->dev,
+			cpu = dma_alloc_coherent(rkvdec->main_core->dev,
 						 rcb_size,
 						 &dma,
 						 GFP_KERNEL);
@@ -189,7 +190,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
 	return 0;
 
 err_alloc:
-	rkvdec_free_rcb(core);
+	rkvdec_free_rcb(rkvdec, core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
index a12af9b7dc2b..d1149afe7fda 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct rkvdec_dev;
 struct rkvdec_ctx;
 struct rkvdec_core;
 
@@ -21,11 +22,12 @@ struct rcb_size_info {
 	enum rcb_axis axis;
 };
 
-int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
+int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
+			u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count);
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
 bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
-void rkvdec_free_rcb(struct rkvdec_core *core);
+void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index c2818f1575ef..2930e9b64906 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1204,9 +1204,9 @@ static void rkvdec_device_run(void *priv)
 	}
 
 	if (!rkvdec_rcb_buf_validate_size(ctx)) {
-		rkvdec_free_rcb(ctx->core);
+		rkvdec_free_rcb(ctx->dev, ctx->core);
 
-		ret = rkvdec_allocate_rcb(ctx->core,
+		ret = rkvdec_allocate_rcb(ctx->dev, ctx->core,
 					  ctx->decoded_fmt.fmt.pix_mp.width,
 					  ctx->decoded_fmt.fmt.pix_mp.height,
 					  ctx->dev->variant->rcb_sizes,
@@ -1486,6 +1486,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
 
 static void rkvdec_iommu_restore(struct rkvdec_core *core)
 {
+	int ret;
 	if (core->empty_domain) {
 		/*
 		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
@@ -1494,8 +1495,14 @@ static void rkvdec_iommu_restore(struct rkvdec_core *core)
 		 * This is safely done in this interrupt handler to make sure no memory get mapped
 		 * through the IOMMU while the empty domain is attached.
 		 */
-		iommu_attach_device(core->empty_domain, core->dev);
+		iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
+		ret = iommu_attach_device(core->empty_domain, core->dev);
+		if (ret)
+			dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
 		iommu_detach_device(core->empty_domain, core->dev);
+		ret = iommu_attach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
+		if (ret)
+			dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);
 	}
 }
 
@@ -1858,6 +1865,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 
 	core = &rkvdec->cores[rkvdec->core_count++];
 
+	core->id = rkvdec->core_count - 1;
+
 	platform_set_drvdata(pdev, rkvdec);
 	core->dev = &pdev->dev;
 	INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_func);
@@ -1883,12 +1892,24 @@ static int rkvdec_probe(struct platform_device *pdev)
 			return PTR_ERR(core->link);
 	}
 
-	core->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
-	if (core->iommu_domain) {
+	if (iommu_get_domain_for_dev(&pdev->dev)) {
 		core->empty_domain = iommu_paging_domain_alloc(core->dev);
 
-		if (!core->empty_domain)
+		if (IS_ERR(core->empty_domain))
 			dev_warn(core->dev, "cannot alloc new empty domain\n");
+
+		if (!rkvdec->iommu_global_domain) {
+			rkvdec->iommu_global_domain = iommu_get_domain_for_dev(core->dev);
+
+			if (IS_ERR(rkvdec->iommu_global_domain)) {
+				rkvdec->iommu_global_domain = NULL;
+				dev_warn_once(core->dev, "cannot alloc new global domain\n");
+			}
+		}
+
+		ret = iommu_attach_device(rkvdec->iommu_global_domain, core->dev);
+		if (ret)
+			dev_warn(core->dev, "cannot attach global domain to core %d\n", core->id);
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -1961,7 +1982,7 @@ static void rkvdec_remove(struct platform_device *pdev)
 		if (rkvdec->cores[i].empty_domain)
 			iommu_domain_free(rkvdec->cores[i].empty_domain);
 
-		rkvdec_free_rcb(&rkvdec->cores[i]);
+		rkvdec_free_rcb(rkvdec, &rkvdec->cores[i]);
 	}
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 4f042a367dc0..ccd766b220c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -135,7 +135,6 @@ struct rkvdec_core {
 	void __iomem *link;
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
-	struct iommu_domain *iommu_domain;
 	struct iommu_domain *empty_domain;
 	struct rkvdec_rcb_config *rcb_config;
 	struct rkvdec_ctx *curr_ctx;
@@ -155,6 +154,7 @@ struct rkvdec_dev {
 	unsigned int available_core_count;
 	spinlock_t cores_lock; /* serializes core list access */
 	struct rkvdec_core *main_core;
+	struct iommu_domain *iommu_global_domain;
 };
 
 struct rkvdec_ctx {

-- 
2.53.0


