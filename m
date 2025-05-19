Return-Path: <linux-media+bounces-32788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B23ABBF86
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC6977A49BD
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4562027FB2F;
	Mon, 19 May 2025 13:44:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9E27AC4A;
	Mon, 19 May 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662252; cv=none; b=s0GN/mtJaOaAZLPZfBalxIAsNa0iIWgQE+5cOguKIGqMBEWtUC6/1iyQ31z6yroI9Ry1df7b7Y6A0klA9XOGzT2UjQHVREBHZaCavI477+siylZx7n48FWFAWp89z/j9vKoNpLQaJG2CvPXhHFzkSB9jqR0gP48JYZBq5G3BVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662252; c=relaxed/simple;
	bh=FulfFPepvHnQiRUn4Zl14qkkLJEHhgSwil7LgfRmBcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZuapMv/mOzrWzXGlP5UdYWoga/yvFtxfRWGKZ8aQCnVeCw8EB8XcXwUW3fwoumOU3ZEVUicpg72GmxajISHtxQFX4dAhKVUpsdJSnr9YBy3ZH1pz5HCiaGKvS9ghujfdUD8JX/PnRu5ePHDEYO+6wBg38pq+cs2cbPEZt7QiAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso47499255e9.0;
        Mon, 19 May 2025 06:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662249; x=1748267049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqFp+5l5a6yetpMAp12Y0zlKsa5LaUPkAqZpxuuNymI=;
        b=kdPZRFp4Jqlgv43JU2vsP0oAPXG3aiZ3g7LNCjfBkedwwluERez3TkE398OHMEbk2+
         LQov/C7U+PDwtpzK0VvkyBjb2tyz9rw9NGYcVtlNDBWFNQKLlCwboa32++z5dnJfM+Xs
         BpBeHqEQ4xtamxgIF63+XI8ZdKEA/DAA+EsaEncpeXsYNTsbCLb5L8sbviKuSZST+afa
         8U1kAkPEehQktZiD0WyKL3YkUWKOHrO0Q1Mu/rISVjs3/oKcnvMmH57p8D5nQx/qeC7K
         Do9P8PAIbjnjEPnzXOkv8hnlz/EaCHpR/OuF2lyH5xv8+1LZ0bIf0xZJRBJ2x1XQbsKv
         IyBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1KX/xSJRyL/v+HXcS+JVW0kJnsjDKegg/KgrlAGbFPrqp70KTp+gIeNUToZMyOdDmeCZU7Mw1mvEfQ1xS@vger.kernel.org, AJvYcCVXLdqrXO+qL9PJorpDM//9x3nPpfAW/qId6mSMr6dJgE49b9EaJrNK29pFQCP5Y2x7YwSFHoAGiVI=@vger.kernel.org, AJvYcCVYeWrC8T6iLKdj4IK3LFfZfhxXwVr+S+0iIS6g0kpOMQA+mDN0LYmbixMkmEsAEfDT44eYTdDAE93ph+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9PFHtLIdejFy1Ypd/jxh3pKXkCNSV+LHPp8xOgurcpodxSqKe
	7q58+wVG7HxwynprtOwL/IK3SSc9ysCu+TdZv/7V/PLwR7+nz1DfUtlv
X-Gm-Gg: ASbGnctz+Q7I8h6aKdmgBMDr8wtEcFrPQcccjEjqTIHZaLGGrA9F3phd7C+tkY+Ccsq
	qyRxJBZWCppKPJJQKZFayFkiIEtuZZn2/L1of6EeNfT42HuyIf6lsn4oDj397d8cEowujq/GF+H
	8XfDwnGw5RdSsh1bsTv7hKRQwhtDyCKKhco92nMAArt6bUF3OISBPaEguzfX1nmjlH79lPonZaJ
	O3cgLIyBKmAg8VbnIzQKD82yZ/6bNsBLk4jM2JnqZe5yG6J34Pve9gFsdqot6AqfGqViNSgtqtT
	yEme293Gal6975U7oIFR5WSdgDJ8OjBUD8KczscUQFb4rR2nPb7vJbrBafn+faYTaLwrWPAVBL8
	6AgjsT99YWA==
X-Google-Smtp-Source: AGHT+IHQmC+Ay1zv8tZrqEKjUhZpUslJQWcBjfxKCcOKTf/VrA1jjvwQurnZhpExDKNlOcoLWXENYQ==
X-Received: by 2002:a05:600c:4e4b:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-442fefd77f8mr113411725e9.4.1747662248684;
        Mon, 19 May 2025 06:44:08 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:08 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:38 +0200
Subject: [PATCH v4 06/10] accel/rocket: Add IOCTL for BO creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250519-6-10-rocket-v4-6-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
sides, as all buffers are expected to be accessed from both.

v2:
- Sync the IOMMUs for the other cores when mapping and unmapping.

v3:
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_device.c |   4 ++
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |   7 +-
 drivers/accel/rocket/rocket_gem.c    | 131 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h    |  26 +++++++
 include/uapi/drm/rocket_accel.h      |  44 ++++++++++++
 7 files changed, 215 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96..4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
 rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
-	rocket_drv.o
+	rocket_drv.o \
+	rocket_gem.o
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index bb469ac87d36249157f4ba9d9f7106ad558309e4..eb10bda13e695fb0c89c1e3464145cdc63748de1 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -3,6 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
+#include <linux/mutex.h>
 
 #include "rocket_device.h"
 
@@ -30,10 +31,13 @@ int rocket_device_init(struct rocket_device *rdev)
 	if (err)
 		return err;
 
+	mutex_init(&rdev->iommu_lock);
+
 	return 0;
 }
 
 void rocket_device_fini(struct rocket_device *rdev)
 {
+	mutex_destroy(&rdev->iommu_lock);
 	rocket_core_fini(&rdev->cores[0]);
 }
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ba2301e9302120ae338c07baa7d12dd99cb925a9..7381a5148f291ef217c3b256f03d5ab357291688 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -14,6 +14,8 @@ struct rocket_device {
 	struct clk *clk_npu;
 	struct clk *pclk;
 
+	struct mutex iommu_lock;
+
 	struct rocket_core *cores;
 	unsigned int num_cores;
 };
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 82f4cc374bfaa92678da791849537d51bb4c0ba8..4f346df06bcde5a24022bdb651c434d0c6e3c468 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -6,6 +6,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
+#include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
@@ -14,6 +15,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_drv.h"
+#include "rocket_gem.h"
 
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
@@ -42,6 +44,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -51,9 +55,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
  * - 1.0 - initial interface
  */
 static const struct drm_driver rocket_drm_driver = {
-	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
+	.gem_create_object	= rocket_gem_create_object,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..8a8a7185daac4740081293aae6945c9b2bbeb2dd
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_device.h>
+#include <drm/drm_utils.h>
+#include <drm/rocket_accel.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+
+#include "rocket_device.h"
+#include "rocket_gem.h"
+
+static void rocket_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct rocket_device *rdev = to_rocket_device(obj->dev);
+	struct rocket_gem_object *bo = to_rocket_bo(obj);
+	struct sg_table *sgt;
+
+	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
+
+	mutex_lock(&rdev->iommu_lock);
+
+	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+
+	/* Unmap this object from the IOMMUs for cores > 0 */
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		struct iommu_domain *domain = iommu_get_domain_for_dev(rdev->cores[core].dev);
+		size_t unmapped = iommu_unmap(domain, sgt->sgl->dma_address, bo->size);
+
+		drm_WARN_ON(obj->dev, unmapped != bo->size);
+	}
+
+	/* This will unmap the pages from the IOMMU linked to core 0 */
+	drm_gem_shmem_free(&bo->base);
+
+	mutex_unlock(&rdev->iommu_lock);
+}
+
+static const struct drm_gem_object_funcs rocket_gem_funcs = {
+	.free = rocket_gem_bo_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct rocket_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &rocket_gem_funcs;
+
+	return &obj->base.base;
+}
+
+int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_create_bo *args = data;
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_object *gem_obj;
+	struct sg_table *sgt;
+	int ret;
+
+	shmem_obj = drm_gem_shmem_create(dev, args->size);
+	if (IS_ERR(shmem_obj))
+		return PTR_ERR(shmem_obj);
+
+	gem_obj = &shmem_obj->base;
+	rkt_obj = to_rocket_bo(gem_obj);
+
+	rkt_obj->size = args->size;
+	rkt_obj->offset = 0;
+
+	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
+	drm_gem_object_put(gem_obj);
+	if (ret)
+		goto err;
+
+	mutex_lock(&rdev->iommu_lock);
+
+	/* This will map the pages to the IOMMU linked to core 0 */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_unlock;
+	}
+
+	/* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		ret = iommu_map_sgtable(iommu_get_domain_for_dev(rdev->cores[core].dev),
+					sgt->sgl->dma_address,
+					sgt,
+					IOMMU_READ | IOMMU_WRITE);
+		if (ret < 0 || ret < args->size) {
+			drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
+				ret, args->size);
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
+
+		/* iommu_map_sgtable might have aligned the size */
+		rkt_obj->size = ret;
+
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    DMA_BIDIRECTIONAL);
+	}
+
+	mutex_unlock(&rdev->iommu_lock);
+
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->dma_address = sg_dma_address(shmem_obj->sgt->sgl);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&rdev->iommu_lock);
+err:
+	drm_gem_shmem_object_free(gem_obj);
+
+	return ret;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..41497554366961cfe18cf6c7e93ab1e4e5dc1886
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_GEM_H__
+#define __ROCKET_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+
+struct rocket_gem_object {
+	struct drm_gem_shmem_object base;
+
+	size_t size;
+	u32 offset;
+};
+
+struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
+
+int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+static inline
+struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_object, base);
+}
+
+#endif
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
new file mode 100644
index 0000000000000000000000000000000000000000..95720702b7c4413d72b89c1f0f59abb22dc8c6b3
--- /dev/null
+++ b/include/uapi/drm/rocket_accel.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Tomeu Vizoso
+ */
+#ifndef __DRM_UAPI_ROCKET_ACCEL_H__
+#define __DRM_UAPI_ROCKET_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_ROCKET_CREATE_BO			0x00
+
+#define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
+
+/**
+ * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
+ *
+ */
+struct drm_rocket_create_bo {
+	/** Input: Size of the requested BO. */
+	__u32 size;
+
+	/** Output: GEM handle for the BO. */
+	__u32 handle;
+
+	/**
+	 * Output: DMA address for the BO in the NPU address space.  This address
+	 * is private to the DRM fd and is valid for the lifetime of the GEM
+	 * handle.
+	 */
+	__u64 dma_address;
+
+	/** Output: Offset into the drm node to use for subsequent mmap call. */
+	__u64 offset;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __DRM_UAPI_ROCKET_ACCEL_H__ */

-- 
2.49.0


