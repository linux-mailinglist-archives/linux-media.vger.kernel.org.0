Return-Path: <linux-media+bounces-32934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A950ABDEED
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FAFB1BA76CA
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEFF27B4F7;
	Tue, 20 May 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="up+bVyvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE7262FC1
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754695; cv=none; b=VD6ZRY6q1nzhiK30s49/NFRxHz7aq10RDpjmGyPjAmcmpzgGeWBtigb9OmqDeZDWxx7Lu3S1/nMDetoOckchqOdI87b1jEvOALa+jf6iX1sxYbecAqBUz74NRsColzXq3SRZZ0OoWTykiG47GEpxpMVmk7A558jvWhRaRfTHp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754695; c=relaxed/simple;
	bh=NZatuuSxbnZUHgGIMGZOJq8V9+yqNEp8U+xIdIVIi2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIvn8V959JXqT5Wzy2Dy4yd9y9BpaE72zfxbU5KNnKYzkwnu6l1aBJBhLh7c3Z83g6IWfFlVmgXrVw8rweoPn5Pjp/iH4Z6tUph0yQ8gYfX/gw/JmidlCts7pvJdybVNUsYACmCTJaB9IHkYlpXOjpI2uxzuxJoi8Bt4MADLjsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=up+bVyvQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so1118644666b.0
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754692; x=1748359492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9bqG9+FY1UYb3Wsp/cT6aYcX71LorBFFGZU3csZ2OI=;
        b=up+bVyvQ+Sr6L/Fmc2sqTHqXFfQ9FDHIyVCafJe7nnH/W0PGJPhdXuaNj7ilapkLgb
         E8dvfefoEAMiwzMACqd3nxuJjGUa1HthZgtq8KA8Qvuy52PuhtZK8ei422ZpAEXGQSVm
         JULDuW/41hRQcSK8GIxkTQBHWHeyViLY1L8kcL7K3xuSpAIozaUEXZIIqKDMmlCLQlrv
         uGpkk1dz7j/jZ9pXbJ5VjgRwMdBwjrzxRmQe0lUDPHg15G63wSSs5r0kXAehWrnY1xEH
         UXx2tNPpj7hshB3O3LU0aRE9muh/AoC8/9IXjq1gC13vZCb/j5oHg3t7nZcVI/17E0ST
         caPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754692; x=1748359492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9bqG9+FY1UYb3Wsp/cT6aYcX71LorBFFGZU3csZ2OI=;
        b=JBiNkOaxe+xbyxDzGZBIxSBe0EGXZG2A7zkAwKp8iSqgRtHSDrHl/x7bmfmLh1rXpS
         OZDKvqrD0Mr6eqPovDuHH22dUKBhCCNWSuddUiWTntwYzQW1AO37VYCJP5pFLyRtKh0x
         WRIfdUFZnqtZS9+LP4bTqzrsErQ2bqmIoJEMlkE4DAfWcLtrrEgoOYApk5DaJ0dUuunH
         WBpBJx+zqwFqB19/C+mx35267ApNrwM1lBmtzsCt+TSg0Nx8DgGXbYnnCESqEIbdMBAl
         uo5LOOmv3rMva/M+eW76ec7EHgmvLX8EA940CTy5EIqUgiMZeSJlJ8+hYXOLXd0ROjBx
         ngtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUOvn/++NYOGq1PDtl7by4ezyEG9ipEpPD1lPIu752JrvAa2H7huhnk/Ls8IWzp1JNw/XQWQqTYQfViA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/X9Y03apejtdBbMewXca7hHp8dTvQXDdCcB6aEbyt5wBHLAOl
	6f275ldTSP+ZXBVhKaBkFYAgm3b38PFEMOmN4G2KtHnZkqXgCykI9Y9i+cYC29069vyEjliLgXv
	K5zTP6pI=
X-Gm-Gg: ASbGncthLO6lc2kdKJPzbDWAh3zdrikGzJvYbQNAHFca5vx4sKJNXEjxte43xs2RgBE
	bT16afeSBLvv5nuKC/lUSw5dorhFOtGGq3UktrtMpLcq42vLDqPEUMa+q24hG0g7YyGVosyjfAv
	6hk5+CICjHdllSc6sPgeS1bgfbcXgI1NrPhB3JDwYRCmvz11+8pRVhU4wwFNe7bEm54l3r3OjFD
	YDHlrvf0lRITqvqj95tKNnZ+1GZ9c1Uicj5KQvxPKogK7R0HE5UMfNHAgOmXJ514JLIxuToDq6L
	YDUha68lp+X+0uoSRZO29mxh9EoTJLFnviGAGOG7z5CWcUL4QaFR99cYvDHfr/qgiaAhFgYOTNu
	CgFXyMkw85VHDrn9kqa/1/nDEK+kB
X-Google-Smtp-Source: AGHT+IEay0lpNaMna8ydFORY0Ydz8qe2TYsU808eSaVF10SOGUbOLj9dQy57Mjj/FmGfKZnazPsAlQ==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr1326687566b.25.1747754691997;
        Tue, 20 May 2025 08:24:51 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:51 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Tue, 20 May 2025 17:16:49 +0200
Message-ID: <20250520152436.474778-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
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
 drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  5 +++
 2 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..92a6a35e1a1e 100644
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
@@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -306,6 +320,62 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
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
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 02c07f661349..925690e1020b 100644
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
@@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
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


