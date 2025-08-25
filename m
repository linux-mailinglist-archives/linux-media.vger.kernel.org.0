Return-Path: <linux-media+bounces-41043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43FB345F6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928661B24010
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0763002A5;
	Mon, 25 Aug 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UwB8iZ5c"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB920CCCA;
	Mon, 25 Aug 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136102; cv=none; b=VcJOxjLH9lD9qL8396wVBtrL+Uqb0dwKa9K0SKJ7m1+w2UuHNoz/LXy14kjFRP7nkq7bg8U1wM0E2GQLPoi9opZgCqHXVvucmlva6J6SIxprqKCwE7SQtGc4VMv1U21prXmSmeimKLqqeinuPhIoRBYnICRb73m/NbA6lh8+sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136102; c=relaxed/simple;
	bh=elE7GQGxSNzaBPXUtBixgyQszkWHYaNv4E7aSCh1hn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPto6c2tH0MbhEdD8W5EsTRqTsg7iwXLqxxN+LkxcKl+ATWCCYU/wGAuHMJXIB3urgecomR0TTFaO3BnWQloaMmsoq4EjvrI+9L1y31Eh406+HUMMbC6t3g5R+lZ4oIYvP6mCbzvljnuhyssdb0Eg4fbsjcuggQioaiuqSNMKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UwB8iZ5c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756136098;
	bh=elE7GQGxSNzaBPXUtBixgyQszkWHYaNv4E7aSCh1hn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwB8iZ5czK+PdAkSKzMEv7hFNlF29ySQTmJ4/2qxfkd27VJX2JJD57bupTIOtJ4fz
	 I9x7KAdC1lom6GIVKX6KJX3QMNBOm9eD88m+83TGBz9NAJhbWgWtjzOJtQ2WFBXCO/
	 K1QPWarh/O9IHRyPiTNB3+i2F8HP6FwrAVYL3zdvF7UgcCOsZOVRAvCMtqoTd/Dr1g
	 7r/W8wNEq6dQSqQC3nmF2kLuOOpgu+5FDtEi+6yoCRJsTadQZm6bDpO0Ognal92YPY
	 rR2Z/9GA+SqXN9jnCgKCqwc6f2z7DhD1FLQ71U3/eScncAGacD/XYbnJS8UA45v5if
	 R8AfJQAfesAHA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f39:d9a9:8ef1:f69a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53CE817E0963;
	Mon, 25 Aug 2025 17:34:58 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
Date: Mon, 25 Aug 2025 17:34:43 +0200
Message-ID: <20250825153450.150071-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AV1 is a stateless decoder and multiple AV1 bitstreams could be decoded
at the same time. Each decoding context got it own iommu domain which
need to be restored before each frame. To be sure that iommu context is
correctly set AV1 driver detach and attach before decoding the frame.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 7:
- add a patch in AV1 video decoder to manage per context iommu domain.

 drivers/media/platform/verisilicon/hantro.h           |  5 +++++
 drivers/media/platform/verisilicon/hantro_drv.c       | 11 +++++++++++
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 10 ++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 81328c63b796..a28a181013b9 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -12,6 +12,9 @@
 #ifndef HANTRO_H_
 #define HANTRO_H_
 
+#include <linux/dma-map-ops.h>
+#include <linux/iommu.h>
+#include <linux/iommu-dma.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
@@ -266,6 +269,8 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	struct iommu_domain *iommu_domain;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8542238e0fb1..feec8e6fb504 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -675,6 +675,13 @@ static int hantro_open(struct file *filp)
 	}
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
 
+	if (use_dma_iommu(ctx->dev->v4l2_dev.dev)) {
+		ctx->iommu_domain = iommu_paging_domain_alloc(ctx->dev->v4l2_dev.dev);
+
+		if (!ctx->iommu_domain)
+			vpu_err("cannot alloc new empty domain\n");
+	}
+
 	return 0;
 
 err_fh_free:
@@ -698,6 +705,10 @@ static int hantro_release(struct file *filp)
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	if (ctx->iommu_domain)
+		iommu_domain_free(ctx->iommu_domain);
+
 	kfree(ctx);
 
 	return 0;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c..b3e52387234f 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2095,12 +2095,22 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
 }
 
+static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
+{
+	if (ctx->iommu_domain) {
+		iommu_attach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
+		iommu_detach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
+	}
+}
+
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_src;
 	int ret;
 
+	rockchip_vpu981_av1_restore_iommu(ctx);
+
 	hantro_start_prepare_run(ctx);
 
 	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
-- 
2.43.0


