Return-Path: <linux-media+bounces-29405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D2A7BF75
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DB5517AE23
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470251F8681;
	Fri,  4 Apr 2025 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2KKHIJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AD1F7545
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777164; cv=none; b=vDUuhIfH6OXJ331WBRy8Jnp8hu1lSlYbjXel2zC0ZBpiE4uMqpcN+GXGssgfGN4zUFJaoS1DbYsjuZMBDLY3hmBy7Ir6V8gSTdwWHrjMaFjiPeU3DHTX7PBmmOAUmqojurPvOnLAnk66f03k84Yrli9jmCbwyz9LCR911ZWg0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777164; c=relaxed/simple;
	bh=xG7dDLH1e0rQUKhUFoCzwJryvj15+cMd+PzwYNxveo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/SaXFG/hE17TIWalfwsXPkVMtNzaqFojb94dkcDY74c25cmhugxos9/aobvTBHGr2o4Kp0JCJJ13Vwn5tR9orhdvzU13LWyFR5r0QA3xBrpWeoaSFItOOF1IjJZbY57awdlDsupvWLxDOzstpMFO6k5GLiVqFMKhl+373QN8zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2KKHIJ8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4352491a12.3
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777160; x=1744381960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
        b=H2KKHIJ8GZ4lIK7F4o0fYlnnmuc5jCTkCIRY3H7+iGwmo0IA+C3vmobn2jhDgu3e/d
         s8b9gJ5wDkYppcb0CUF6EmkE2ReNDHdLOqwTfZ2aprjwf6cNA5Y6R+U1Ce/IxFbe7Kba
         8ivG8jICKerIhFOegus6Ir0tqlclCxic/YxXklRFZeXNvfIa2tx92yKZ5yEDzG605dB7
         fgUINLRvfitf2uln9fZMK2KI10YjEMGfHSbiRjTNGqfDrxu1rxfqu0gklw0zBsY9Aiti
         YBcNGjW0YfF1sWFfGhU4OLkGaGTQ4RDBWE4Dr2lcGEDCLWSiQSTDG/Jdhl5JrTBusDOM
         54ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777160; x=1744381960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
        b=JoBDJkRm+Drbl+mBZHLxvrbd9Zvzm5rH0o1rSgLJhdZ1zogw1KuZ+kCuxAb2gedU2V
         q7v2GirqJINd/eLHta5Cxaga/YwBYkiVjmU8119jP28t8xbZSBMXsxtgWAicZ98qcPIp
         ddD6APCIfZcY4/ujFpnv+IsW50Tz+Rg64rVPfyjtBsnprejwZmq9ydE9StOv4ln1rJwS
         2llvrcEsEginP75Cr0cDONCyCYL1Z1EBPXhJkMT6rYw2EY8Bc4c8twIlouf76aTDwWUy
         1NxAL28EkD2esZlNK9IEy6maKaxEGV1Xxb0euAnzCd/aMQN8pzpws0WIvU8Lq+Q2txZH
         KeHw==
X-Forwarded-Encrypted: i=1; AJvYcCWP5LM/GN3qBczU2oWzIkhPDV5AmNecyFLZaFsj4xn44foKW93HuGUU+nv0goZ56GMz2Kc4+VGs9fxBSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLkl/PWOUywKD2seAu/GF4Biqp9QSIFqIfcL7XdZfumpDjMvk1
	Dl8IBwgExSKk24xXNcY4fVw/I9fNXgh+Yzi+3VXcSQ/0VsootOZe1i5cgBfTzbI=
X-Gm-Gg: ASbGncue9/ZWo1tE76t8wQnaIkrAh916tBo6wiKlEVnkPatcP6m3Cl9Q/EY/9TDQO1q
	eUgk9v1hPUqGBUWzwcMiMSlKvq9fPCNj6tuAj+UuTXXvjGhDmaqGMc0VzTMz0SSOg0LCR0jarAt
	3QWIlyGbD0gxJcOJgthjEpwO915RK8pS9mEgM47EEDic5Q/ohFaKKCZNjZLfP8ve1ODlqpgW2W1
	tPY8Ypo361T093hx19PQrDH6YFrmL1X74V2TzpKRUtWzKBzk+dQOKdgnWjxeN2FOwliKzhcXnZU
	Kpi9PnILWmFaSA5tNSOwfr9+Zlwp1dDKd5IMedY2zNEwykbBQIpQj/AHNDF3DI0f7hveXE8/X4I
	+4qNqd75f7iSmPIu8ALVV1w==
X-Google-Smtp-Source: AGHT+IEM2hKGK5BPtUOQZ2C93jlWGXwVhi6Jdx1BijC2kUctXxlRef+Ez6JQ6wrB5PbeK6VU5VkWDQ==
X-Received: by 2002:a05:6402:2347:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f0b3b658ecmr2441621a12.1.1743777159861;
        Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 08/11] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  4 Apr 2025 16:31:31 +0200
Message-ID: <20250404143215.2281034-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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
 drivers/tee/Kconfig      |  5 ++++
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 084bd794374d..53514cccd1c9 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -16,6 +16,11 @@ config TEE_DMABUF_HEAP
 	depends on TEE = y && DMABUF_HEAPS
 	default y
 
+config TEE_CMA
+	bool
+	depends on TEE = y && CMA
+	default y
+
 if TEE
 
 source "drivers/tee/optee/Kconfig"
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..d6b310b4a5fc 100644
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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


