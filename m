Return-Path: <linux-media+bounces-13046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA5905459
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 282171C222A6
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6C21802A4;
	Wed, 12 Jun 2024 13:53:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB317F39F;
	Wed, 12 Jun 2024 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200400; cv=none; b=a+UPGOp+i7Ug+t0gJJUGlFnAdYpmQG8ogHB1h+E+jgrnUaKykbya8G3z12Yu1pYAJh1GNioHyWv3a0mM0WjXrB3f7h8Ekm+RALK4x+qUKLthl+vYeuMAOygmh8S14RqHppXhTxw8FRddb8qwvIFzFxNg8Gl0db/+iqBGlp9oi9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200400; c=relaxed/simple;
	bh=fKTM0ttA1uymEDhSl+EKrSTK36fDxBDqjcoAt+gjwK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogTmu/hh1nrj3WGwShQWTWdLu23nJd8qko9IQFPnhqhCO+pQxHD2fxDiTVZPhsST/NaLTKuc0ECxEWnqXBxbt8Nr+9Y5VFMxPu1GMzKInfaP3+dczhY+418OiCypo0eQQGsTey6X07vZw9YGfEucN+euLVHVoiU0Tv5CkOZnItQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f1c209842so3379290f8f.3;
        Wed, 12 Jun 2024 06:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200397; x=1718805197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7r3kSvbbTjgJVEwctFCbvRTGPSHV3jcoNvncpcvHqY=;
        b=Q61YjMzxgUFKO9SoKvl3ldt4r4IFyMY64JVzjtnpzl6XMhYGSJmux2mpkQN+Uga5H5
         LW8nO2jksdyyzS10/uDuFD9/SeEawJAxHVasfw9ikb1OyQv2Hz7XRBe41SaIGUKBHdlR
         sHZd/xhuCrVioR3s0z+9hcQkJu8IoRNPtcl10XHZ6LLHHFjAggXa0Bu8ZhHwsSfLxYMh
         onnw5JaG8kTrzA67502Tf114ciaB8GOFMHC/57gSF7S0aIyxi0WzgIcRYGwJxTzen5LM
         AK+WtkD3IqNr16Ln7g9LCpr4958rMwlQat9Aquu63pwj4UlC6bT6HdE/OUuRwq7VxRWN
         hDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8buofN6kamJfJZgiwfzuMZMO6hg1pLZDf66auABIeffu3HjS5ZE4Jr9V/z2RCfPOy+UROIYWuwplk6yW/dzgbNho8qnlt6m3b6shPq4fRiE7ZBFcRfSaOyon5SY1ztX+hXMSDPDZ3Qb4ingtooHHLVSwoqJi2eGQC3cL+vULLgR+zuNc3
X-Gm-Message-State: AOJu0YyoQ8uDvvGa05TeBgZdz9HRDEX0rodFcQufvlxyvH4Js5iVGShP
	3CIL3uoondQz5VdcNkhn6SMqvE5Cz8RJHusEmo4jgWUbTTjpiorA
X-Google-Smtp-Source: AGHT+IGUBVZP2NwuY2tIGmEPKUE7vkawNnEjSQW1ugPVM6t6UrOumHBZsDMeIXzxIvdwgzeSUxgDrQ==
X-Received: by 2002:a05:600c:4ecf:b0:421:7aad:370a with SMTP id 5b1f17b1804b1-422863adb55mr15148235e9.9.1718200396853;
        Wed, 12 Jun 2024 06:53:16 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 06:53:16 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:53:00 +0200
Subject: [PATCH 7/9] accel/rocket: Add IOCTL for BO creation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-7-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0

This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
sides, as all buffers are expected to be accessed from both.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile     |  3 +-
 drivers/accel/rocket/rocket_drv.c |  7 +++-
 drivers/accel/rocket/rocket_gem.c | 68 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h | 28 ++++++++++++++++
 include/uapi/drm/rocket_accel.h   | 24 ++++++++++++++
 5 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index 73a7280d260c..875cac2243d9 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
 rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
-	rocket_drv.o
+	rocket_drv.o \
+	rocket_gem.o
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index e339c337fcf9..42196417030e 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -11,9 +11,11 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_accel.h>
 #include <drm/drm_gem.h>
+#include <drm/rocket_accel.h>
 
 #include "rocket_drv.h"
 #include "rocket_device.h"
+#include "rocket_gem.h"
 
 static const char * const rk3588_pm_domains[] = { "npu0", "npu1", "npu2" };
 static const char * const rk3588_resets_a[] = { "srst_a0", "srst_a1", "srst_a2" };
@@ -58,6 +60,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 static const struct file_operations rocket_drm_driver_fops = {
@@ -70,9 +74,10 @@ static const struct file_operations rocket_drm_driver_fops = {
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
 	.fops			= &rocket_drm_driver_fops,
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
new file mode 100644
index 000000000000..e10eb886f150
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_device.h>
+#include <drm/rocket_accel.h>
+
+#include "rocket_gem.h"
+
+/**
+ * rocket_gem_create_object - Implementation of driver->gem_create_object.
+ * @dev: DRM device
+ * @size: Size in bytes of the memory the object will reference
+ *
+ * This lets the GEM helpers allocate object structs for us, and keep
+ * our BO stats correct.
+ */
+struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct rocket_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	return &obj->base.base;
+}
+
+int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_create_bo *args = data;
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
+	mutex_init(&rkt_obj->mutex);
+
+	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
+	drm_gem_object_put(gem_obj);
+	if (ret)
+		goto err;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err;
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
index 000000000000..2cb294f25c19
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_GEM_H__
+#define __ROCKET_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_mm.h>
+
+struct rocket_gem_object {
+	struct drm_gem_shmem_object base;
+
+	struct mutex mutex;
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
\ No newline at end of file
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 7a179731ffe4..8338726a83c3 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -11,6 +11,30 @@
 extern "C" {
 #endif
 
+#define DRM_ROCKET_CREATE_BO			0x00
+
+#define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
+
+/**
+ * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
+ *
+ */
+struct drm_rocket_create_bo {
+	__u32 size;
+
+	/** Returned GEM handle for the BO. */
+	__u32 handle;
+
+	/**
+	 * Returned DMA address for the BO in the NPU address space.  This address
+	 * is private to the DRM fd and is valid for the lifetime of the GEM
+	 * handle.
+	 */
+	__u64 dma_address;
+
+	/** Offset into the drm node to use for subsequent mmap call. */
+	__u64 offset;
+};
 
 #if defined(__cplusplus)
 }

-- 
2.45.2


