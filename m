Return-Path: <linux-media+bounces-34448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F7AD38F8
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CBE16F19B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FCE2C0323;
	Tue, 10 Jun 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixr3gHCi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3412BE7D9
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561384; cv=none; b=gLlm+j54CdH6RE6GgEFtdyVeKH9xIReJy3tU9e9BSWXJOZNbBW7Q0U1+gw3nUjrZxxQBrs+egkMUsDWpFcPCeXSE9w2TzT+cRSuqQZhZJSR1Hx+1FtDkG3QvWPIdbKc31P4uVEVfqvL1M0P3376k2HetxN8YplGIHq5c2RG8fhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561384; c=relaxed/simple;
	bh=xFLKe3DGDZE+MtUUiJT9DrXOdykiAsxL3IMpaXC3w8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZSg8oyWzewV+uUpILFCMPZUgOblpCCsJuE5kgjmfr4StYCM7D1BCIi9VR5VB5DNKnWQzuGAleUXl/GisMwhadoZGFri0MrTpj7iE5a2YK2/mKv29vSxCW6W9NFlEaveFT3OmgQMEg7kCuYSBf9F4qzsw1g63fkhjq3JY9s3LRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixr3gHCi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade5a0442dfso377424266b.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561381; x=1750166181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
        b=Ixr3gHCiuYHUMs+1PJXBwoxs0pNceFPRzX4A4+mRXQIAdLoMBz7j6LAVIGfDxS5/pp
         A3KPOcr+PYJYqB+WdLCowe3zkD4DrC77puxKIA7dzs0Yr5fmoGE/Y5cJUUeTVSOPY5Hy
         WQHtcQOO37RSDn3hFvhI7zB6JcjOEfjuf3qyiA9cjX3q7O5pSoLL3v7S6r8Q5R5uCJ5G
         x5QSkme+vKdkp3In+Rc6iuCDUnq09cMHS+32zCCt2WkVmodBYjPKhTb9bhU0zJF3Mzpy
         hVdTTJUHzYOpuhdFxJTy+hkeatx2g4k6sISt6HebjO2T7zTkapk0TZtHHzNEagQ7Y/Dk
         8Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561381; x=1750166181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/zrQKrz1ZdcacJlKYkPsE2jrLvANF9CRh8hMHgIKxo=;
        b=Uom+vxhyf5hSHSF0wqepvVUavYz7Mzh6xwvKCyY8dgzEsSyZ5q+z2NShlhpVfbRW0c
         UDL2uOWv/85YxxJVVbWoszDDmAYPHRoPisn3TJ2vgU/02grxG5KlGHFTt5xz6SOKq8Dc
         Fr3IdHlswjvZIBDQOc5aouwtCOF+ZqrTuLS2YfHgwgC5Njo/QL3PuWk7A0wxGkbnt9Kd
         /m0N2ZJ8AxwnlWmphiCVKPy2abuygewWpZgVQoSYxoCD/a93OB7YupL/LwtX9dz/ssfR
         69xnyR3C3SpTSEzlIjxcw5yObOq+xhrH7W7l/1yBj7Ja4PhdU9Meqc2O58jIKRWnqYcI
         Oy7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJD0bnz55JnsnAt2eaN7rzBrEhS5IEN1so68lapq/ur6OIHav+1wIzPGJ+euyY1gnIakCLIBoKDMSdNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLFqEsjiC0MHSookMz99gxMIurFrMfhB1k0gS3UtEFrK2htGn
	6p03TE9xOmFStTfgOlTNZlbjCqzJtsvfb6ES21EcZfZOdYimcOIrK0cc0hkA2rvG4l4=
X-Gm-Gg: ASbGnctV14qPRDkeafKkrv6useWnoH0A4SwBeLq5VV3jx6rcIMjRNQrbwUcE0albQXb
	7W0n1KJwY3+BhpDLoHC24o3St1DtlMtppKatOtN/hFyBxtO8Ky+PutvU2oZMMgLI8BdekjkJwuQ
	/mGjF1BdLUxKQcKWmTt98BVR0NeNmqSEfia8GuarMMdjaA1jdBZ7PHRn7vDFBD2PG5ttwCZtk3E
	d2CcjKv6NwCFc0RDAal9l0/TCDzxgEwh9EYLslFxfEXY/jmmYqWKtypmgrHTh/0xcM4kod3iVNt
	GzASRnjPU/aqxT+7I41O3y0W0VycGHOPp2Jv5NdpzQJg58pITYJMGBaiGRatIx4EZhaB5K6KEh2
	Ejj+qBIkP/GKaamZ/8x54lp2ffwFYt1EJWmfDnv8=
X-Google-Smtp-Source: AGHT+IGBftzOQtLPgzGHNeXG6c2zhp6CTLR8q3dJgPSZSp1EfRa2hlxKgikylIdO9cmYC3sLXz6TCQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-ade1aa0fbdbmr1346254066b.9.1749561380962;
        Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:20 -0700 (PDT)
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
Subject: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Tue, 10 Jun 2025 15:13:50 +0200
Message-ID: <20250610131600.2972232-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
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
index e63095e84644..60b0f3932cee 100644
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
@@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
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
index f17710196c4c..e46a53e753af 100644
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


