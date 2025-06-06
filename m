Return-Path: <linux-media+bounces-34189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD05ACFCA5
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93043B0C06
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1034B253355;
	Fri,  6 Jun 2025 06:29:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9A81E5B6D;
	Fri,  6 Jun 2025 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191345; cv=none; b=cJuRtC6FgKse4AzeKBVo6EhgjGwJ9AXqsf3yqKEIe2SE6bbxbwfCi9/pTs47L4shtZ/7gox4dCnnRPozNI2+gSL+jPwa0qNnF/fgFd5D0GsHEwMo+ybdv4kG/MILoXYe5WXeitWKsOPTz8PsRVdLAX8BV+jUQjgL/xmKH2mwWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191345; c=relaxed/simple;
	bh=E73u1NSY8pbVRZ/ODpZdFFHkKfJ4IZ/H/iqXsrbpgrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MIR8Z6/FpRfd3HApGwz2PbffEPvP5RF3okTM0y76YswNJUQXrvDbO85M7Y6ybcvMnMy2R4OG0iAgdWlZdHwPM9fQZWGeWnuy0dwmo61QIi6Cy+lcD4GaSS03rKbIQJt03HP2Aw1vwegLfTH0AeDMtk6Skpisjct/OKf7Vzhvr8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb5ec407b1so308179066b.1;
        Thu, 05 Jun 2025 23:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191342; x=1749796142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wejapT2fKznTK0McIi+49A/WgN3DZyCsX8EyVTryheM=;
        b=iaOay6ydg2/7EhVSSMwCwnjhFTZ5StJjJG7mexmQc1gkTQc7yu0BnlbZ3aq5Wr3D2g
         HvJjO1MtFYl00E30sH+yfGokA83VXY58N1ft9LcBRzUdt3R9iyk6qR3UXf+2CLRvsNS9
         8t283WdRlZTAry6w/uL98kbUHBFiWZhJPxC1KjiMcU9K78UymEguPp8cfrdequ7DOtlJ
         QW5wfifo9237YCdTP36YS52MXpfegmv2KZmCQhFfmPblr8xF/A8meX1n5PRGy8uK13pi
         3w0yenxxxgAGHK/5+A6Okwe94ciiHFFmk3Kj4FROka6Xeyg4BzZzRacDOhOMpHVve7ly
         P8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdTS7PIDZ2UJTtDVBGNVw3Ra9Wv6UMOg1l89bxRcZcm2+Dvk0mL8UGwewyloBjm10CEq7xnXEsKJttV1E=@vger.kernel.org, AJvYcCWhwrdA7QW36A4XIVSuFqHtldeKTi0GRy1lXeifPDNS6SNfmdkY+0xy+K7aRNMIGlwpgLejg9wfI47n5uZo@vger.kernel.org, AJvYcCXRWkzh+ROhDFhUxVlIAuuNa/1OqOGXvzScQ/7VOmQ/fWiweINnHPjNxD6lUSn6hwWQJH0aDeV+XB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRKDHfEpjRGCGmJzd/RWXwcVphK/DMI8H9NjBD5LXJYqtO74so
	49xs5AVuyCm8RRQl9fm0AGJ4cS3EvzT0hPXPoshlbYzt4n2Z4Kma7PVl
X-Gm-Gg: ASbGnct7OMX+O9oKTSycL+NVO3b9ij0oENEQ+etuzitko3tdwDqP2gfzCNj7Q8A55l1
	vJTI+lsxqDyh2UpXb8uK7JIpJZpj47hcBo6I8NkpZy4Wua59P+6B/J/J+euc+4COWDC/4OYdNDX
	YnUGgu7FhTNeZCJZKcvql5SQkGja2UDFAtUtRt4jCGDIzDXysY1leWrnCqtDwMEA8PE7T/JezRb
	44VcmFBbkM9nVTr4MdLG+io1370sFU9s2Kfr1MVtf0LhtPkS/Bbgc5fYrL3uqhsENJBwI4WjUHO
	XbS4u0doG8l21a/A3yV7xcgZqJHiIrc6bXn9ZFuevcyObjpT0X20QMtUVkgn5FvzZmAp4m62cb4
	Pin2/bBJSHg==
X-Google-Smtp-Source: AGHT+IFNE67nGFY4Qy46QBFU3ZJhHED3KcKqC5prhrd1i19DoYUZ9iaoE5I3PN6tA10wVhZKWykPLw==
X-Received: by 2002:a17:907:c25:b0:ad8:8c52:d61f with SMTP id a640c23a62f3a-ade1aab9f4dmr154973266b.35.1749191341492;
        Thu, 05 Jun 2025 23:29:01 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:01 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:23 +0200
Subject: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
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

v7:
- Assign its own IOMMU domain to each client, for isolation (Daniel
  Stone and Robin Murphy)

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_device.c |   4 ++
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |   7 ++-
 drivers/accel/rocket/rocket_gem.c    | 115 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h    |  27 ++++++++
 include/uapi/drm/rocket_accel.h      |  44 ++++++++++++++
 7 files changed, 200 insertions(+), 2 deletions(-)

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
index b38a5c6264cb4e74d5e381adaeba1426e576fa56..2b8a88db20c408f313f4f4fe36b051c9d5e4829b 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -6,6 +6,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
+#include <drm/rocket_accel.h>
 #include <linux/array_size.h>
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -16,6 +17,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_drv.h"
+#include "rocket_gem.h"
 
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
@@ -46,6 +48,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -55,9 +59,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
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
index 0000000000000000000000000000000000000000..61b7f970a6885aa13784daa1222611a02aa10dee
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,115 @@
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
+#include "rocket_drv.h"
+#include "rocket_gem.h"
+
+static void rocket_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct rocket_device *rdev = to_rocket_device(obj->dev);
+	struct rocket_gem_object *bo = to_rocket_bo(obj);
+	size_t unmapped;
+
+	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
+
+	guard(mutex)(&rdev->iommu_lock);
+
+	unmapped = iommu_unmap(bo->domain, bo->base.sgt->sgl->dma_address, bo->size);
+	drm_WARN_ON(obj->dev, unmapped != bo->size);
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
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
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
+	rkt_obj->domain = rocket_priv->domain;
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
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err;
+	}
+
+	ret = iommu_map_sgtable(rocket_priv->domain,
+				shmem_obj->sgt->sgl->dma_address,
+				shmem_obj->sgt,
+				IOMMU_READ | IOMMU_WRITE);
+	if (ret < 0 || ret < args->size) {
+		drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
+			ret, args->size);
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	/* iommu_map_sgtable might have aligned the size */
+	rkt_obj->size = ret;
+	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
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
index 0000000000000000000000000000000000000000..e8a4d6213fd80419be2ec8af04583a67fb1a4b75
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -0,0 +1,27 @@
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
+	struct iommu_domain *domain;
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


