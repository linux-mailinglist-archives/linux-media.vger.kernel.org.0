Return-Path: <linux-media+bounces-31572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCBAA6ECB
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128491BC7D9A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4528022688C;
	Fri,  2 May 2025 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xudrqNaX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A136B2522A8
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180079; cv=none; b=LOh88kEkPiWQiTLvWmqedi6QCa8+MIS7l6UrVfzY7daYszpMP1V1+knIK8czMHQpu2ihqIncoj/uURi0mpYGfcsW/cWjMfZuDBhV8+Krr3y6nrqJzt5LyzKUs/0cMrvb3iTXCxdI48pRKgxsCvSotOFrA/ENlu4HPfwTeEV3k3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180079; c=relaxed/simple;
	bh=adYscF/VWtjspVg2TPKRQL4Dl/ZaZON4Rv7qOq3mBNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8N0mQtC1QaSrGYpqeYVwlkHrZYQaoz77WgScVFq/6DjpEZ8aVgkDqNtXYfh0lkkKiz2fslXP/z2R5NYEpGsfuphj95la55b7mRhPkok3e0hhBdJpXEtF6SBufaQgKguLPe65Y1MnMwN5iSGid412wkM/L1I6BAU7yjQqdkrHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xudrqNaX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ace98258d4dso256860566b.2
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180074; x=1746784874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
        b=xudrqNaXtcfxR/lRb3bfNxnwxp4L/LtO+GkhuhWn0t5Lp1Pyq2foM0RTSqf9Cyi5wl
         11Gn7wj1fiDqvpgAGvJy51lL4Sg6RtSSGvsPPkFccSQ1pa6KOe3AjlLLCWi397zBGY4Q
         9ykOrpwk4d+/naGRBypT1X8FXMNxn4WfsCWxSZANrorxpD+biAK9CjX12AswGW86jPSj
         U+hUW88QXZSVfb7HbzNANLemuIV79/AS6TLqGaXRfivgO7mXmbCdCnM9r0Hf5A7pTx6i
         Vo+Mr/LdNzY5JMxOa/9ky1Qy2MR8OyrwOMy87P8NmFb/pTucfgtWKCNFIbfGV/iC+EZU
         9zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180074; x=1746784874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
        b=ionpCKyO34dzolhdKa5b7hia9JI3TcyWVYPoV2Vf+3enysJ+qWB5FNwqYaA6lY88Mm
         SoduzXCppLbOgUjYTgX9h3JzXRzgdy7S7P5q5XqxDaxwGhgUDf5Hc8xc2bDbhCA10Adw
         d+qVkIaecIswZg6szXq/7BhmBdqXAmSd3mZyBiw2sN67CSHDRhb3moBY/PghV/zEHLTu
         McU87m9Z5rpof16BVBD7zA93Yhi1Dbcccos47bCDhdVDtInDyWcmPAbrgiD1KXX6mpwF
         UxEjF3rf0n+B2nukYHfe/zmSWRznkz1rh06KHtpBi/ey5x4HhIfxfgZ6PcEPJIo9rNFE
         HCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0kCaMtdBap8EWjigwALOT6n0tkbCkWt20rF+VgliCvzwPvSkD0R4qqQY4pe9d6WBsExWAJT7MVKQCzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSiKIgApV8HjHD+8R9K87oRk/JIwHVPm2ZN97Z1Ac9IZ++3vA
	2GE+KKr6yMo2PAK5dcOk1qXOs5PZvZj7JE/f3S+SpxDwCDOQGtr6QvUSQLoVxc4=
X-Gm-Gg: ASbGncsEwKQiJvSOIAsd0d51Arkk2FHdj6xoG2RnP1EidstffuES9yvJjcOvec7Chqn
	bVEsAjGypAw+v8LnCI1LnynyFCh4KSaq3hmlMBngmMG+XgDeHAcUr/5Hx47dgfH+Link5sETSuH
	fsPlfpm9QoV+7u1RcRpCaZJqgxZ3wCor3ZPBXJmJBsRswtXh9wlAYesw/BFSYkGy/9WBuAOCLAw
	zsKY70hCm2Zo7AYbRLHJh3i9T1+GDvv9fDQfNcJoGjx7MLslsl1rOwEy0D1h8O6pErnVTdC1zaF
	M18edPf7uqc2NvzF4zYpad1nJRk9FuoPdjS159YlQPOOr8LNq9Esbm/s+kdxJkcZWJZk73aqwDn
	Ll6gArA1bWCMc3q8KdA==
X-Google-Smtp-Source: AGHT+IFOsgLF6Acl3Dnu+kY+8WzAAhOB09Jk1srS30TZnn+BAtVaux5M4/L7RxPQOkhdypP2FHq2bw==
X-Received: by 2002:a17:907:da7:b0:abf:749f:f719 with SMTP id a640c23a62f3a-ad17ad17aa7mr211271466b.7.1746180073795;
        Fri, 02 May 2025 03:01:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:13 -0700 (PDT)
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
Subject: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  2 May 2025 11:59:25 +0200
Message-ID: <20250502100049.1746335-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
from the default CMA pool. The memory is represented by a tee_shm object
using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
from CMA.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..faaa0a87bb18 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
  */
 #include <linux/anon_inodes.h>
+#include <linux/cma.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,7 +16,6 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
@@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if IS_ENABLED(CONFIG_CMA)
+	struct tee_device *teedev = ctx->teedev;
+	struct cma *cma = dev_get_cma_area(&teedev->dev);
+	struct tee_shm *shm;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = cma_alloc(cma, page_count, align, true/*no_warn*/);
+	if (!page)
+		goto err_put_teedev;
+
+	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
+	if (!shm)
+		goto err_cma_crelease;
+
+	refcount_set(&shm->refcount, 1);
+	shm->ctx = ctx;
+	shm->paddr = page_to_phys(page);
+	shm->size = page_count * PAGE_SIZE;
+	shm->flags = TEE_SHM_CMA_BUF;
+
+	teedev_ctx_get(ctx);
+
+	return shm;
+
+err_cma_crelease:
+	cma_release(cma, page, page_count);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 02c07f661349..3a4e1b00fcc7 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0


