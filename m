Return-Path: <linux-media+bounces-42346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1AB53484
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD465845C1
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4155C338F29;
	Thu, 11 Sep 2025 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oi8nvu2G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A3341ACA
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598650; cv=none; b=kUCU7uPJdDdidln7z6/H9z7D0j7jwfr1ny8AtJ+hZ4XBiUOAWuOqQyoQzGvm8UA3eVlS8USQkqCQR4Z9eE9FkkrohZmO9KyWJtdOpKoeg6MCX3SK7G0//6B8n4aaiUZcP3eV/9DOM1391fWfDl3sSh/efCi9JjrsVkPRoiGqOgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598650; c=relaxed/simple;
	bh=ljVsBiUSoqP9nQ6E/AbsEzgi5WJ+mPSnwPoiSvNWF84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R39fYp5CUcTAF6NrHGGE2GSlnw0ml1QwblXUtkFLmeGLqDQJreZMVvchApIz4XvUGuZpvSfZfnG72K5julS37dz4tietK2elOOkMZJIWjAX/rxhCJk+LHyjvbEN0VQIDsvanW8thuCo2ucwBmwom2KLmShToMeQyAr6FzLCtkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oi8nvu2G; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72e565bf2f0so5925487b3.3
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598648; x=1758203448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7AlbrbWF01PAGMb+n5yznNoBl+a3KG2eoPDEibc0TE=;
        b=Oi8nvu2GhqmYk3tturpJWEuSTV1rgaqOVoiOyNFmxxGtwMguvhTjYTRpjkLEzyjFk6
         Bxb+dxYTN4gOgUyIj1y1KWDi9uBvSR6V7BnZGCAuIT8CDjOuzxtMIuRpJmoErsqEssQ1
         gedDTUzS6zD6Rmh9gW3bjc7bkdZjoVcAyPodfmqwmvrnf8eTzmqv8jmxwi15WNqo6uBV
         2g+Q2zSQARWr/Qt01Rtyi/OopVLolo1PBOv6YH+8RrRRNHebGr6WJHq/syQyUBtRnX1K
         zmE7k7N1uOy1I5ZCz7OPAteHOG4t/xP3Sym0+KrhyniALmJbi9xt5G6DRdvpnXIXj+6G
         TtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598648; x=1758203448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7AlbrbWF01PAGMb+n5yznNoBl+a3KG2eoPDEibc0TE=;
        b=pirioEK3oYBfV7xBcOItmqF3NaB7l1h8KZuZF5fQR7PYTQm8XAXCrnddxlwxVlgR+3
         /LcFt52ELm3kHoPqrodCbio8eAWVHeHGxxYSqw4M8hZ1iPZzI5ow5wiyP4sckEqbK01M
         lXxC5bvUf7FCZ0TYJJH1loNhnSmGlBiIGyUphAmF//MBRyV4VW0BSD2U3tIZRLmaeJRB
         Z4S1asXYUs8/epp63e0/eHgj67LyklIFNi8BAEtYhZmc3xAet+8yjtLMPWh340bOKUr5
         wg3uxVhUQnTHT9dClyXwlojf6gVTfnC5/GZeLloXhkyYlxunlvxH51QRLUd7ZTDH9PE9
         TFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoJ1w2oD2YpZhjxRIlyZi5iGvdmE2N3WP8DAMDblwgs2eXgBNbk7fDHiPgNklpVR/aHdEAzCnJ9z3s3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJXXN+J3IaPfLDfDxQMEwG2/j6EfSlTN6mfyS1UxSyF3d9EwAl
	r9LTlq5cZcW/MD5vs2I3l9Wa/GBtcPFFKWy9yq1bsj57QYtLzzlvjKPTadvPAuI3JLY=
X-Gm-Gg: ASbGncsU+FzhC1PHaTjovirCVV3lAWciZox/6eA0va1trAOTy6ug1k3x2+K3zz8OOLq
	ym2qpS0whxmfWmSrfrnLTVcUjg0em422wCiyx6lKELDgjpWbmCtiwtD1HT+QQqElh7GUxQqn+Vd
	POusJE9v6CAcrIk2Xmqk8877z4UNDw8UlpJL9UzkneHaZ6v6AJbCdbj6Y6V9M2dR1r2hIG4RmbZ
	ok4luSBtxBvDYQVZaeo2q/LWMQ0CEhXDSOMD84zI0GR0q7YnzrLb7OzzisoKki0zFG4cLBLta0i
	brraKSGLm55JqluO2l2hRdCixEh8tchRELBZ9lcGrMyoOhtpJZZAzBfr2d+ym658ZRwlsN2UJFc
	ly8jUsJ+ibIYo0De8CDTQbAaiLxndAIU+QlwgJCSUDC2kw+VwXXS4MypzpdZXuTFbR0UsOcUfex
	hO0JrLleh9zA==
X-Google-Smtp-Source: AGHT+IENGIldq5JqNWVYj879nv5c12Hu2gAcLXkQcT4am7WHRztg/K9ENUf9gRzRFcua+CJvdep3gQ==
X-Received: by 2002:a05:690c:4d88:b0:724:2cad:8df6 with SMTP id 00721157ae682-727f2ebd695mr176268437b3.16.1757598647587;
        Thu, 11 Sep 2025 06:50:47 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:45 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v12 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Thu, 11 Sep 2025 15:49:47 +0200
Message-ID: <20250911135007.1275833-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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


