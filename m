Return-Path: <linux-media+bounces-34043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D29ACD900
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAAE01773AF
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FD8242D80;
	Wed,  4 Jun 2025 07:57:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55687242923;
	Wed,  4 Jun 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023858; cv=none; b=XQ/Dhsf1nUd5F5WJ3p1umDV/UkuOajniLPqAfNuJeVuxx2sE9i7LzG9vfS91SWkCYZRX1wQ84zyPm5KIg+DX6NS5h0recdTJcHEzGPQQJl5O/36fGkjmT9C/kUgQXJyi0/7DqXUqAAVY8Q77Kfe37+N5Y2JoossF7KEQAZalJ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023858; c=relaxed/simple;
	bh=WUfv6KWQ7Ltt1YQ66jpR/MyHxCuyjWv35CUrdK9g9rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM0Jr1UoOO/9TpccWvgaVTEZDTQPrDFJt76szE+YzjeCUuzQVK99OtK/lYl0L6J5u1wdkigmPBivtb5NbWH2z2jTxn/nhUWQccdh5fPnr4pDFmIJAKaFl5XNDgZmXoO+DIwvkorI5TMhFtqhJ3ytvue1qUcvL9Dn2P3I0siyDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad572ba1347so943542166b.1;
        Wed, 04 Jun 2025 00:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023854; x=1749628654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hu7IpcUJbruDu+7ppPXdTLi77oC8RRtjq0/4QEYRwsI=;
        b=BjPVjCGQkvMJaTaRMiDDy6cYUge1/dnFxNIsabJpGMZqEMSWEP5aX5KLQOfX5BfglB
         yvfC8LbL73ellKD7ASQ/x+GzKeLDj9wB2/Jr/Lrmk8P+mePkUK58hWjzO1mNJ3LOt3ih
         SYI8n49wjwmJ/HYMcSREHTHnT+S6aH2j/jlGdCCZXPzIOj59qUDOrziaTgrZt/zIWnpD
         yNI+oO2D4696/Q+VunH19ChOHp9nK0aqTN1aTNu9m6CdkV7+6t8+t4St8sW00UKKCgpz
         fPk7SZ7aIfpWra+JGELWCa+OevLO0HiWT8vltd6Dt5Us+5w+gjXkpDVPXxSsnXmgKAub
         ZC+A==
X-Forwarded-Encrypted: i=1; AJvYcCWenLZyKz1TpHMEFjMpoe6y36tBmvHg4MFNERql3Qb1ZsA+giVJVO3MbB19qIgk6k9JFUxTvOUBVAQ=@vger.kernel.org, AJvYcCX7iQhCK1YWiNkMTUe+pf3QnzN/hFxwIaC/PysX1TIs4xLiV1elUN8LmvFyb3i+myq8QgZkLdnfAVxD+is=@vger.kernel.org, AJvYcCXA79TtKSvGkEpUd29jZlzqrWJdDdyf8WbKbtFdA8c4YRiHNl560z8XWyO6Mw1KySdKuWXe6LtVQ6/7jBjK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55hgLP5+2qrLnFxjocVlNdbL1fAuPFC+BMbOSdOYQPb2Eh12/
	GHAajFqW7ZcmAcHKAOLzZijZcRWkXpJo80rcmJxPJttnBp9JGV4sXAyX
X-Gm-Gg: ASbGnctmPy0c7j9tIJ+oPrNRJYQiyN9tV78wYeBdY+YFtrM7BFSNEjUwCa2bIBfoBXy
	HZUZ/Yow5V0unzoisRoYQsppgVfVxUFlk338DkrFk4AdKO1vnrJ6L+vlmfu2yLfxmrf+zX7wKSb
	UF/vRj9JQfnExfCnatZUWLbgOgioLfjqd4T1y9KHXSMO35Bu/wGburgcQ/lQ19pkwN8ksbEvSgt
	ChynG5feCZo1DrfRugYII0Cp0eZmYgnHmOb7RkgLiGvRSsdm5Pxv0Jse54reY4whbk/5XauBJzv
	LDiFh+HJRXVeJRG+CxKd3yDfow/NdVAgCJCgCjaA1Mw/A1E6tKrztftj38A2F1k1h6jHxlK2E5L
	JmLs5onXUvAXLTjtfyUmu
X-Google-Smtp-Source: AGHT+IFJ6sXD6JythNyf+B3icwerayV1/z1w4Ywb7Hekwi5X6Ab8yekG4kX8cDB6lfIRcIwkDir+eA==
X-Received: by 2002:a17:906:a2d5:b0:add:fe17:e970 with SMTP id a640c23a62f3a-addfe17ebe6mr52678366b.14.1749023853556;
        Wed, 04 Jun 2025 00:57:33 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:33 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:19 +0200
Subject: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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

v6:
- Use mutexes guard (Markus Elfring)

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_device.c |   4 ++
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |   7 +-
 drivers/accel/rocket/rocket_gem.c    | 126 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h    |  26 ++++++++
 include/uapi/drm/rocket_accel.h      |  44 ++++++++++++
 7 files changed, 210 insertions(+), 2 deletions(-)

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
index a05c103e117e3eaa6439884b7acb6e3483296edb..5e559104741af22c528914c96e44558323ab6c89 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -4,6 +4,7 @@
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
+#include <linux/mutex.h>
 
 #include "rocket_device.h"
 
@@ -16,10 +17,13 @@ int rocket_device_init(struct rocket_device *rdev)
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
index b5d5f1479d56e2fde59bbcad9de2b58cef9a9a4d..10acfe8534f00a7985d40a93f4b2f7f69d43caee 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -13,6 +13,8 @@
 struct rocket_device {
 	struct drm_device ddev;
 
+	struct mutex iommu_lock;
+
 	struct rocket_core *cores;
 	unsigned int num_cores;
 };
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index f1996ef1ed3e9c99e968add7b4ee983a8139295d..209ef342bfa4993db793a2745dcd353b4ef84eb1 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
+#include <drm/rocket_accel.h>
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -17,6 +18,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_drv.h"
+#include "rocket_gem.h"
 
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
@@ -45,6 +47,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -54,9 +58,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
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
index 0000000000000000000000000000000000000000..fa07c494fd845f98ac759407677a649ed2c97727
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,126 @@
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
+	guard(mutex)(&rdev->iommu_lock);
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
+
+	guard(mutex)(&rdev->iommu_lock);
+
+	if (ret)
+		goto err;
+
+	/* This will map the pages to the IOMMU linked to core 0 */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err;
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
+			goto err;
+		}
+
+		/* iommu_map_sgtable might have aligned the size */
+		rkt_obj->size = ret;
+
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    DMA_BIDIRECTIONAL);
+	}
+
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->dma_address = sg_dma_address(shmem_obj->sgt->sgl);
+
+	return 0;
+
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


