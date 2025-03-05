Return-Path: <linux-media+bounces-27628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBAA4FFFA
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5693B664C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E9F24BBF8;
	Wed,  5 Mar 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keg2ctqU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381924BBF3
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180023; cv=none; b=ovE/oHG5yAaoKB09F53PXuSnqrXrRp3iQNn8IPrQpJuViBt71dz6kQcKTAqAwr8CApLo/YPGHYe7THpc7Jufl1UK0e/LQiqRu8SDfeg0l5mxS/4C8e5Rlt1WZfeLOAfbidkTe3F6futn58eDmCdjD2sktZpEqpmYKlAVRkZ99ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180023; c=relaxed/simple;
	bh=M7ELt2/bqUBtQfSHUosFiW+IHomsZKrTJudyA0W+Gbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovb4zZanthv4QiRfXTwAIThs95NbhclgqZdYROecUNsUTZ1FNMi4y1t46522fOMlnO+PTErDyp9dAqPfOGxCoZZKJ+H5dVmW5guCsXFmvjCnr55lT1KqOrjM8zZzQXRII9M7Cm6cXK9hm/x43hsDUZ3bxqX7F9/RU4eIVTS5H+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keg2ctqU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1813448a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180019; x=1741784819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
        b=keg2ctqUTnf0M2AATzG9Jh8ZWU6kBfhvMppX6u7ea3LGQJkct/xzMyaPzfDmSfUKTA
         ulfNx5o0Mh40BZ7lhgXatozqMuwxModkl366NSUGnfluZSnDou0Ql6hhgYA2r8FIJW7p
         TNDBIoT5KZY+CdWBOi677cEWkH27Lhd0bz2yz0anJJ4a3bl2/DnPA5+oIngmJlFc97hq
         gGY+PMAf9jjYs3THgax/qw6ssU6YxOtB/2Olhz1aNOeDbX0kszgQsWUU9/gYapc8NYh+
         Nt1Vc4Fk1UU+RK8MVzd2ZenL65Yiwnvb5jFBZqCZ0d1qebwxNp0VNaahWgf3/+XeujBo
         4Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180019; x=1741784819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
        b=aqK/cioDGoUxGSpnDBx1DM06F6pLKP1SYangLUx1FgL1KG5SBNtK0rPRdKhgJGurXy
         h7VUrbX5B7n5y/9my5KZ1e0yoYalWHtQ42y6c0nMbUt2fS3unOnRzS8Aaix8qQ98tKfe
         OSeEWWWLmz6eFt92XK8p//X/JfARwfpkkKpfKMSqmQ0s/iNYkmhv7A/gE0Ouj+x7HxEB
         SJreEK10v4f+4xwtPsNqdwTEvpKuNDUnKeIwlqFPiWltu4DyUp4mZArQxxqh/B+/a7ec
         17UvPML306VbYjy2uuz6EB98kFpBB4gB4A9ElvkSyNn6eVZhVJGQ9AD1uDpRw7MMmQ2E
         /5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPkYrvhIinFQwf55wTrt0s49sXlJNPw0OpY1ndO8oULuIWZG/JUCntAHaU/VdWwup1M3bFq3Xq2QYgXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSETbqWoUJE/R+FwslFJy7DmZ24NWF14vtXAy/k627Tj3Y30T
	iCkFk/QQuTflXIBxH120l2rEx4hyUtBb5RgAVIwxJxvx8eeTycBpTRmFSC2oFFU=
X-Gm-Gg: ASbGnctCzFHwIVPzHFKkDv5yJ2VmYca86Aj481vVeMN7yhvSQ+T4V2fHH00sSdXhTpK
	wVZsthVIDSJ52ZIHDKGZjF4kPEr66EVd6tJnXwnnt64P88PLbWihxQMyZqEymSsu0Fa359BuOJh
	AwPPbzc6PPW4lkybibymVznMrff7+bJHf1FgiTdVkNfo25xttbNEdcYJQeY8CwHCej34oReil+7
	P86fL9CxdfEZvNS4ggSkN8ayfLjUXju1UjsgP57shm6JAtKFCZk5Jwmcbuin4Kf3kVfpImQXGqW
	OgaXJI+DQb7Bc9faArYp0vLgUrwsGZbWURBuDcKVYoBMmEJzJr42nvSIDUXh4p9bK2vW2bCOgJ0
	rnSSEPZTnO0GIH/6pPhWUoA==
X-Google-Smtp-Source: AGHT+IEAmgkcE8RyjO1pJJHrKqdAmUGw9vFkZJI7+m0/4SoKqcFz7yQm/3SS6AjKMMHXW07x446SxQ==
X-Received: by 2002:a05:6402:4309:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5e584f51077mr7080244a12.15.1741180019316;
        Wed, 05 Mar 2025 05:06:59 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:57 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 07/10] tee: add tee_shm_alloc_cma_phys_mem()
Date: Wed,  5 Mar 2025 14:04:13 +0100
Message-ID: <20250305130634.1850178-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
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
index 8b79918468b5..8d8341f8ebd7 100644
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
 
 /* extra references appended to shm object for registered shared memory */
@@ -59,7 +61,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -341,6 +350,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
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
index 6bd833b6d0e1..b6727d9a3556 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -307,6 +308,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
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


