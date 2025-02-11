Return-Path: <linux-media+bounces-26016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA6A31171
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8F9C7A227D
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E651024E4C3;
	Tue, 11 Feb 2025 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpWIG6al"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0E253B77
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291481; cv=none; b=PRd66/DkRq0nbNDG63OAonCqs1vlfERmC6t2FS3jy8aH12qEbblsw/HyGpV6jZpFzTfDpAZ9mRL0uG4RNyJACPoMC2JBanqOrT6+gx7XTDqnPwCEnJjlmJ9UjpZSk/t8SL1uxpLner9JAZ7LruzApb9B/C1i6i4VhCquVsfrnYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291481; c=relaxed/simple;
	bh=BjZHtnbQDyB2OJIfdSvI61rykxRXqZT2cfmCzH8yYqo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSVYVZctdi91pMbEN/ugk1HffFU5OVOpBfhYi580bP5SBuy6CqrGNPkGtFJ3nSNaJLtymUY77EUUTHBwqSpEwLAp7l1Ph6WHK/pHadG7FfxCWqKU2UbtZHnjFbFIluvgF7gP7RYOnTk9x8SgkuGTgQ1xFzFTSuMoaRlIiKmLmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpWIG6al; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so5641390a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291478; x=1739896278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxattA3QjQC0bUvmIjtYp3+w3vcxByTR3qghr1+qO3E=;
        b=cpWIG6alpkIzzHOo1p/P1DvSgbUZD5IHuWCrujU1pw57rzuBiWPX1jqg1DwCQ0MXk+
         W/Zk+7SHBM/fx6eEXvXFWvXjqon4CdgvtvV8LrCFRFak96SEQgoSt0IFE1uN30QMWt3u
         lb0QAN5k9AE4UE+9dVG5qQJwC80oUp7Em8cL5XWJwL9HdjjylM/2v4uwsLucD+6Zr1GM
         96goW3yzf1J/rh/1DhQZehZcLoiWasjTCBpEB5XzBw4DTYxPYaeY7RDrW6D1bIi8PrZB
         41Cww7lrGsQfs55RV7j3bww/ZdPsqw84b3itR3icZzfWEMu6flWRr3ROhR/KAFW8L5Dv
         75lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291478; x=1739896278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxattA3QjQC0bUvmIjtYp3+w3vcxByTR3qghr1+qO3E=;
        b=RKMRzlY9sBqZRHv4fegtUI0O3k7h40DrmPCNa4K+Es1U7LU7XR8pgM2XVklxEkJM2V
         24MEz3IzzGB2OjG35xmE2rduvZWCXMivjmkCapCIeW1dTXUULpQEOCRqkmW6VINPXsnP
         1Tv+wD7Y2uyvDo1gNCL0lIy91djXUMwpZA2F0zhg3jrOYnybzyigdQShqsjDpzbngLFb
         Z9sdk/bN7DjNbhdgmsRMoEUdBSoTPjsg41SqEpLgw/DC1SO1ugOeiQKVX6qkniWwhOey
         0fdre51lzHBIfEadpjrIBGSnR8Sng0yRaBMUcTxCRHfkuM/hEavwrg1WdrMjvSDspOOn
         UTpA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6xzZe8RnL3fWS0uWRSs03XvK4BqrWvG4DBKYZ7vmbNuXxLhDQjT8ArXkqFjr+U4YpDI/uJ8V2HF+BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvm6nxR3PoPFZy+NPdNp4KnUDpn/4whNzQ6+lbga8G59/Xuoc5
	PWCiPJDMrRkCCFr+Afa4TXyfDJN23TRxwBaMrx3Giv1iqusIYI0v
X-Gm-Gg: ASbGncsqr6RxtNuhGO9B63fRBowEx0YKjV0Gf7p8BjUgXw6/uCkp6rYMrP8QkotFl+D
	rIXL8fwyHWZSsQwtlKbdHIXEFdGgdiNxXbNryCtXI8dk2rp3S1voQvQ7PETJ6icOdaLb/2y6TlB
	uVnTRkawQPHwCtWXh4G6zLuhPWTODKy7r7w985JCl8yScWAmfuXuY6xMZMtlBVZhUMNtS7qVwBJ
	I+55pEZKINAAqlgslKAI/nfmtmF+UvwRGqbIDARn9lsG7+HMObmhnPb6rwiTFvBk5nxuOc1pBru
	8cXVkWJBkn6cBnO84XQB1ovZrLxd
X-Google-Smtp-Source: AGHT+IE7lLBJbOd+ug9udhKeOc+JeGKaTO/5yCW136COcWGhRp26YaAZtFv890iY2cxKgMfZCaakVA==
X-Received: by 2002:a05:6402:42c8:b0:5dc:1289:7f1c with SMTP id 4fb4d7f45d1cf-5de450d6951mr20693170a12.29.1739291477157;
        Tue, 11 Feb 2025 08:31:17 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:31:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	dmitry.osipenko@collabora.com,
	tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/4] dma-buf: drop caching of sg_tables
Date: Tue, 11 Feb 2025 17:31:09 +0100
Message-Id: <20250211163109.12200-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

That was purely for the transition from static to dynamic dma-buf
handling and can be removed again now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c              | 34 --------------------------
 drivers/dma-buf/udmabuf.c              |  1 -
 drivers/gpu/drm/drm_prime.c            |  1 -
 drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
 include/linux/dma-buf.h                | 13 ----------
 5 files changed, 50 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 357b94a3dbaa..35221c4ddbf5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
-	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
-		    (exp_info->ops->pin || exp_info->ops->unpin)))
-		return ERR_PTR(-EINVAL);
-
 	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
 		return ERR_PTR(-EINVAL);
 
@@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		return;
 
 	dma_resv_lock(dmabuf->resv, NULL);
-
-	if (attach->sgt) {
-		mangle_sg_table(attach->sgt);
-		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
-						   attach->dir);
-
-		if (dma_buf_pin_on_map(attach))
-			dma_buf_unpin(attach);
-	}
 	list_del(&attach->node);
-
 	dma_resv_unlock(dmabuf->resv);
 
 	if (dmabuf->ops->detach)
@@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	if (attach->sgt) {
-		/*
-		 * Two mappings with different directions for the same
-		 * attachment are not allowed.
-		 */
-		if (attach->dir != direction &&
-		    attach->dir != DMA_BIDIRECTIONAL)
-			return ERR_PTR(-EBUSY);
-
-		return attach->sgt;
-	}
-
 	if (dma_buf_pin_on_map(attach)) {
 		ret = attach->dmabuf->ops->pin(attach);
 		if (ret)
@@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 	mangle_sg_table(sg_table);
 
-	if (attach->dmabuf->ops->cache_sgt_mapping) {
-		attach->sgt = sg_table;
-		attach->dir = direction;
-	}
-
 #ifdef CONFIG_DMA_API_DEBUG
 	{
 		struct scatterlist *sg;
@@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 
 	dma_resv_assert_held(attach->dmabuf->resv);
 
-	if (attach->sgt == sg_table)
-		return;
-
 	mangle_sg_table(sg_table);
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index cc7398cc17d6..2fa2c9135eac 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 }
 
 static const struct dma_buf_ops udmabuf_ops = {
-	.cache_sgt_mapping = true,
 	.map_dma_buf	   = map_udmabuf,
 	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..c284f306d597 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
-	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
 	.detach = drm_gem_map_detach,
 	.map_dma_buf = drm_gem_map_dma_buf,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index fe6a0b018571..c6f3be3cb914 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 
 static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.ops = {
-		.cache_sgt_mapping = true,
 		.attach = virtio_dma_buf_attach,
 		.detach = drm_gem_map_detach,
 		.map_dma_buf = virtgpu_gem_map_dma_buf,
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index c54ff2dda8cb..544f8f8c3f44 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -34,15 +34,6 @@ struct dma_buf_attachment;
  * @vunmap: [optional] unmaps a vmap from the buffer
  */
 struct dma_buf_ops {
-	/**
-	  * @cache_sgt_mapping:
-	  *
-	  * If true the framework will cache the first mapping made for each
-	  * attachment. This avoids creating mappings for attachments multiple
-	  * times.
-	  */
-	bool cache_sgt_mapping;
-
 	/**
 	 * @attach:
 	 *
@@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
  * @dmabuf: buffer for this attachment.
  * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
- * @sgt: cached mapping.
- * @dir: direction of cached mapping.
  * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
@@ -514,8 +503,6 @@ struct dma_buf_attachment {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	struct list_head node;
-	struct sg_table *sgt;
-	enum dma_data_direction dir;
 	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
-- 
2.34.1


