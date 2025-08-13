Return-Path: <linux-media+bounces-39733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB4B24110
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B240B189D8D5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8C72D0617;
	Wed, 13 Aug 2025 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAtWL6Tt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40B2C3277
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065044; cv=none; b=KeNo3DMH6jifUXV+a2XFRuQ632guhNneDYsuZbPfdQlIox4ylhkJ1gXUTZfyqUlcz4HYlj5n9NZr8WwBwD427FkC+Ys6qA/YDeAqmQLbou45SrnFQcUq9iR2o6516tip7xFZivATs9v/w9Jy3DXhrSaPkUBIPLYg15FdncGbS7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065044; c=relaxed/simple;
	bh=wVa/iG6CTwWJo3E4y1mtLKfadh/kv9eGIUdO1h5Hk9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2PDXiOGzr2GTvS/cEcv8BjgtVr7PTug6whG/iB9NZtqwHNFyPnIqraxm3KcVvPHJDn7uFwp1As/BuU9eWjIMkzxUMd4jQBJ1a31qxtH0SIEws001XlLnN+EtLAen1o2eIFUrvuTFOm6ecCaN9nRltk7cUHHZm+Ym+TzyyS0u4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAtWL6Tt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af66f444488so880341566b.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065041; x=1755669841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Twd7GfdaaubIhr0igmVjXFbwxXSCknyV61sXbYgmYh4=;
        b=TAtWL6TttgWP9AEEzvGQcCeT9gQR8jve9mLECcqUzRMDWgsMhZdABiXcuMFO8FQRba
         OWp3BPvH1Zv5ibbpLMmC4s35P/jAY82kdE3d8vd0muxBcGXshDdQ+nEyp29vZS5eJVh+
         mmHUCgOsosALOP11LJCYuvhk8K0ZtzC34UpjfhyqpZOfdTB7ONA/vP6G7EOE6JCu6qD5
         F9iCe/JhqacBy9eyYFgB6AtBad2YvtSAespELgLCpXIQ+57wdY4GU5HqWqBe1XllC4bc
         2+POnfStYgeYgDuW+1MAXR79wSxufV3J8c55+Zl6CltFJkY9h5ewBRS2HUXEWBdXkvbS
         MinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065041; x=1755669841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Twd7GfdaaubIhr0igmVjXFbwxXSCknyV61sXbYgmYh4=;
        b=qpaMj6dkw4VXpS2Qbbtf15T25MBO7yz3xU4oLG9fbP5c6O/SjcFccEVRZm/iUhhJ3U
         S2U83eaCB/J8YnLNlx7qronzBIFL1f7fCJHncaPaYwlFZqAVyg1Df0vYN27X0cmqsBwA
         3e8gF2p44pJ26ZOjXL2RJ0IeXezFX9fbgxNiQQiTMNnm7cr5iwGggi3PuetMohnzhLyY
         EddXha21tQ4+xH4b/6ngDY9qAzzdwE9uIAogAiAegimCJgwGQYJXCnQjNvHbUPFAuFDy
         alNPF8l0y6ia2/SNMKhzGpWFjj6zocI5s3w0py/d2pmKy2CbZBUKcIpGz8QF7sLQ2NiF
         5nbA==
X-Forwarded-Encrypted: i=1; AJvYcCWY31QjcKpXZkdp4Ix0Bz1nEqy6hJeW/iVDSg7L6+3YcDQHTS0h1bNVUCNINAACyctmTaEYDUwtKOQc8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FrK3CZ6OBV4ezAAel+KAJZKtxdDQEZb7vCKRWYUCH8f1VK0v
	xmzc89R0EKVuqvB+WcCWDro/jsG54VziN6/f3/oKKxqoPV7SRE++fOgw60sv7ct1qqo=
X-Gm-Gg: ASbGncuTJm08GhmQudrXgDTGFi/9FT8Kk781GL6qre7yTzxwv+f4ygwbLNxTQdbbLPZ
	fBK8U0/MEoeXzef//Me5B/TvWcWIsVnHRQUbmMq8mXXsyJgtwkR/o924VJ5wEUTCtqQW1Av4NSb
	X1Ogx4waAD0KOLJhHo5xLztOspzMkOM/sLNNl/AsAxlqQ4dTD1+piYDZx28+9VEjoig04hBVTpA
	tjtLZCCvD4yFFXDHcRyuPMpb7Kn9AWZN2+t+ZkWSpz8dMwsJhB4JW8E1dXF0WMEt1wPcxPC4kEh
	81bR/a+oJ6i2gki42e0YHGp06Si8yr7ZYjWaNE5w+kqHPI1Ao3itTAcGc6gmEelBBSRyd+/MyUz
	Ju9YQCt3LaIsC8/R1Yzy4Uqe631hXUJHMrKFZCV+mK54rIl1S37JEMkAl2bmuMtfw/ls/cYqNy/
	A=
X-Google-Smtp-Source: AGHT+IEgbRmeLzHygurQ8GrbNyHN6Kt0VXzSY9aLiaH8bdOGe6I40zVx+CJbKLm6X6f5LwY4hBf41g==
X-Received: by 2002:a17:907:9629:b0:ae3:c6a3:f855 with SMTP id a640c23a62f3a-afca4dff310mr182406266b.31.1755065041198;
        Tue, 12 Aug 2025 23:04:01 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:00 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v11 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Wed, 13 Aug 2025 08:02:55 +0200
Message-ID: <20250813060339.2977604-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
identify it as DMA memory. The allocated memory will later be lent to
the TEE to be used as protected memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_core.h |  5 +++
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 76195a398c89..e195c892431d 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -5,6 +5,8 @@
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,9 +15,14 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
+struct tee_shm_dma_mem {
+	struct tee_shm shm;
+	dma_addr_t dma_addr;
+	struct page *page;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -268,6 +284,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+/**
+ * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
+ * @ctx:	Context that allocates the shared memory
+ * @page_count:	Number of pages
+ *
+ * The allocated memory is expected to be lent (made inaccessible to the
+ * kernel) to the TEE while it's used and returned (accessible to the
+ * kernel again) before it's freed.
+ *
+ * This function should normally only be used internally in the TEE
+ * drivers.
+ *
+ * @returns a pointer to 'struct tee_shm'
+ */
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	struct tee_device *teedev = ctx->teedev;
+	struct tee_shm_dma_mem *dma_mem;
+	dma_addr_t dma_addr;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
+			       &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (!page)
+		goto err_put_teedev;
+
+	dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
+	if (!dma_mem)
+		goto err_free_pages;
+
+	refcount_set(&dma_mem->shm.refcount, 1);
+	dma_mem->shm.ctx = ctx;
+	dma_mem->shm.paddr = page_to_phys(page);
+	dma_mem->dma_addr = dma_addr;
+	dma_mem->page = page;
+	dma_mem->shm.size = page_count * PAGE_SIZE;
+	dma_mem->shm.flags = TEE_SHM_DMA_MEM;
+
+	teedev_ctx_get(ctx);
+
+	return &dma_mem->shm;
+
+err_free_pages:
+	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
+		       DMA_BIDIRECTIONAL);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#else
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#endif
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index b6c54b34a8b5..7b0c1da2ca6c 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,8 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_DMA_MEM		BIT(5)	/* Memory allocated with */
+					/* dma_alloc_pages() */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -298,6 +300,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0


