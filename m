Return-Path: <linux-media+bounces-58337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G8ZF5qx12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:03:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E173CBBA5
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A17D3023DE8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B41A3D9DAD;
	Thu,  9 Apr 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PlDuXPYh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C663D6487;
	Thu,  9 Apr 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742705; cv=none; b=CsTq6DMqg6S/rvEBvlGPXNtW2+EDE8KuTjOyhr1vkUCa4FMMtk6ZrqWjcobHxcb0LK3WCsOH28i95kAM8cNmB06syfcXQuvuIyu65SNx9MVBpmrSVhyfwyAVlISCAQ2fXac3qHa/rWhKM4+W2FBGDgMrMmjpSs5OkR5qYenPx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742705; c=relaxed/simple;
	bh=RSXqqXBeCA6gtCqM9bPU3XduJDdYCviviiS0NH06u4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGXGxlm1c/TDLulmq4l1dMCf4aYXFkuYAOO/NqdRll2btP2vW6Iln4ienHgiW1sNXXnvnWkF1yjxipqkPWjQcbNT9jyuXzm4m/K3Umk0u4v0LbeYImN8wzHocS6BaGLoTRSlgpNwGyLhx5rIrDWF8Z82oEU4qbYs75TPV3KEm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PlDuXPYh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742694;
	bh=RSXqqXBeCA6gtCqM9bPU3XduJDdYCviviiS0NH06u4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PlDuXPYh9iFHSE99Vm2uPMpq8YIeslosXFoEw/ERifLU7sIKFBhdYjMR67mIUTqcL
	 BKQAAsO8b1fxdJeTAo85USrPI1TTe92V+WqNZRCq8NoPzC1uwM3kvRGrcQbrreopWF
	 QxaPdeO+Cpm17dlxYy0krLms9pxmWDiCJdkXAOB1XPXwovFLeFdtk2DaO47ZNYM5SO
	 z/koExQNhwgkvqshVz41gSGcD+5XnVDMSjPJ5CzErljR4YFQvPrmPjdLDeViWKqtSK
	 cCCYj+L9zCS4YNAzxxEU3L1bmE3wzu/BqAlzI7Z7AdJ2OmRX/AnDncTt03DN+0LArf
	 HPohmFozY/C7Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D273817E1330;
	Thu,  9 Apr 2026 15:51:32 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:38 -0400
Subject: [PATCH 3/7] media: rkvdec: Keep RCB to the correct size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-3-62b316abf0f7@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-58337-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: A9E173CBBA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, if a video changes resolution, the RCB size might be too small
and the HW could try to write out of the allocated buffer.

To fix that, make sure that the RCB size is validated for each run and
increase the buffer size when needed.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 26 +++++++++++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  3 ++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 31 +++++++++++-----------
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f177379..191f78278c01 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -17,6 +17,8 @@
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
 	size_t rcb_count;
+	u32 width;
+	u32 height;
 };
 
 static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
@@ -40,6 +42,21 @@ int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
 	return ctx->rcb_config->rcb_count;
 }
 
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+
+	bool ret = cfg && cfg->height >= ctx->decoded_fmt.fmt.pix_mp.height &&
+		   cfg->width >= ctx->decoded_fmt.fmt.pix_mp.width;
+
+	if (!ret && cfg) {
+		dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cfg->height,
+			ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.height);
+	}
+
+	return ret;
+}
+
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *dev = ctx->dev;
@@ -77,14 +94,15 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 		devm_kfree(dev->dev, cfg->rcb_bufs);
 
 	devm_kfree(dev->dev, cfg);
+
+	ctx->rcb_config = NULL;
 }
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count)
 {
 	int ret, i;
-	u32 width, height;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_rcb_config *cfg;
 
@@ -105,8 +123,8 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 		goto err_alloc;
 	}
 
-	width = ctx->decoded_fmt.fmt.pix_mp.width;
-	height = ctx->decoded_fmt.fmt.pix_mp.height;
+	cfg->width = width;
+	cfg->height = height;
 
 	for (i = 0; i < rcb_count; i++) {
 		void *cpu = NULL;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
index 30e8002555c8..0662a4359bdf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -20,10 +20,11 @@ struct rcb_size_info {
 	enum rcb_axis axis;
 };
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count);
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..31ddfcc58894 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -978,8 +978,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
 	const struct rkvdec_coded_fmt_desc *desc;
-	const struct rkvdec_variant *variant = ctx->dev->variant;
-	int ret;
+	int ret = 0;
 
 	if (V4L2_TYPE_IS_CAPTURE(q->type))
 		return 0;
@@ -988,20 +987,8 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (WARN_ON(!desc))
 		return -EINVAL;
 
-	ret = rkvdec_allocate_rcb(ctx, variant->rcb_sizes, variant->num_rcb_sizes);
-	if (ret)
-		return ret;
-
-	if (desc->ops->start) {
+	if (desc->ops->start)
 		ret = desc->ops->start(ctx);
-		if (ret)
-			goto err_ops_start;
-	}
-
-	return 0;
-
-err_ops_start:
-	rkvdec_free_rcb(ctx);
 
 	return ret;
 }
@@ -1174,6 +1161,20 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	if (!rkvdec_rcb_buf_validate_size(ctx)) {
+		rkvdec_free_rcb(ctx);
+
+		ret = rkvdec_allocate_rcb(ctx,
+					  ctx->decoded_fmt.fmt.pix_mp.width,
+					  ctx->decoded_fmt.fmt.pix_mp.height,
+					  ctx->dev->variant->rcb_sizes,
+					  ctx->dev->variant->num_rcb_sizes);
+		if (ret) {
+			rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+			return;
+		}
+	}
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);

-- 
2.53.0


