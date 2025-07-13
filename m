Return-Path: <linux-media+bounces-37562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C4B03023
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834B41A60E44
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1171F3B8A;
	Sun, 13 Jul 2025 08:39:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369711F2382;
	Sun, 13 Jul 2025 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395954; cv=none; b=nrH0jXmSRf0HXf2IbhX+6EFRQ2sHcaLrfxyCM/Gt4AGteUtNAXCZfgrpFoNbjvhqcrJinTTkEZe7tyNRyYTK8+AuQjLOOowyuLPE7wsphtFpNQjXiSyhXVTQKpxrBeOhUdd//k+fSDXHwVlbDet3sA63hu822FsmaiqkrxP0hak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395954; c=relaxed/simple;
	bh=M9eE2TyyBHBFLyIV9/wkpTKifuaxunFwpRLlG7h/PsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqIVJn37kIiXKTyM329m95/lPe6XQHioglb1a3kA44DaYzZTaUtB7Dlz/OeFOFzDw/u29TbDsT7ioqlFHIL1/m5B5X/A5GYZkdTE68UXlVO83Aqtbo1QYCnrfpDk1qRoYfP0oCyn9DBNWHkIFrUgtHyF0eemLRnudZJBzlKCpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so484071666b.3;
        Sun, 13 Jul 2025 01:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395950; x=1753000750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H72rn8ogX3KhM94X5uibatMEZGkDkzHDrTXRw3fgC8g=;
        b=coEKorNC8QNCtwJBK1H+/nPKbsO/TzEWOerL7xehAZNOqIYIs7lU8+ObzVZYfkJAmb
         cye9N1uqUEPCOf7XzeFnqL9T4sx22fHkD145cpDV5ZtJUbaN2HjtF7LimwAOwFqiKjrO
         osJy7akmNBDc6tV+2N0VEBX92DqVgI0UdY0zTUtewPOUrCxZ8k7sDg5d3D1J1XjO3xuw
         kMjTjXW444krjy2koUEsKL/ePweOW2z55a9nYKBKmTJBILnhIzZEOyRF6Duwx0mrRPso
         s8OAdLQPi8KcjJRBynLXo82z7Y7ZEM9eY49eWCCyCj8L0Q/d5VmmZUC+2286ZBvEiarm
         kKEg==
X-Forwarded-Encrypted: i=1; AJvYcCU6RrMlNHtu4MI2p0+6s96xHSzM6V/wFwmd0Tex0770DJ7UeeG7qE9k/WZvaS4btBITpPnqyj67W8E=@vger.kernel.org, AJvYcCU77O/afndFo63rux0Ae7sBRD8XuXLlKS70K8/NCgHDKe5rkyEyxTlBSUwLH2F660LyNXqcWMzRc+KJfBE=@vger.kernel.org, AJvYcCW0FckGn2S7g/KaXyEKbrbFHE6uVXBv4PQS+Gitrt8iqksDG7PHzZrFpybAqUgkSPi9sFxW1dwtB/Fj+jLa@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6ppMYsISWZMmwtuFsHxhgN7TthNkz7qPUbYlBN878jPpEM2o
	Gcew1yBjSb/VkPmE3r0sBSMg12mm2/bRCJvErh1vIouYJ+cFyMEDwqoa
X-Gm-Gg: ASbGnctr9cdI+l8ZTfnrU5vx+ghMD6Afx9ipglZ6I1J+MWLxZC48J1Y3VVdw69JURQW
	dhdORtro5ezKLOBTMdeXn7bW8JxXsZpyzyEQXQ4NowUg8+V3sQqy8hx8G2eK7KlkJRiLXdkrrYo
	TISxN0ca0Xq1VGzVEQ3KX2NMQ1YiaA/m+pDiNemi0efK2CZa0MiiB+i6I+rItNPsPubkoJ8wZUW
	0w8s5eIPvkqVSyHpuQdTLkKGpFLA4d/q3Px6aG10hs3+KVFJFRFfHqeXADRoryH4Jprlt2bqltt
	BRaXAj38KjdaQNsnYn4nE1d+g8ZYoY+BxbJy3gpxi3m8oJtc+gseQYcjpga/8GBn8H7jZSLpX3Q
	zxbOzUacDEQRN/7GtjrxdU6Gl1OOPUmSIQVpkluTYPAG25tPyRlUrkM4A
X-Google-Smtp-Source: AGHT+IEnUEEowUGfSdqp7ZjyLw6vDg0ImHNsDuzMVOpeAmqIoh/s37dukeUPYiyw3AirsdVVG4tMDw==
X-Received: by 2002:a17:907:962a:b0:ad8:50c3:3359 with SMTP id a640c23a62f3a-ae6fc6a360emr904292866b.9.1752395950161;
        Sun, 13 Jul 2025 01:39:10 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:09 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:55 +0200
Subject: [PATCH v8 05/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-5-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2

The NPU cores have their own access to the memory bus, and this isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)

v3:
- Check that padding fields in IOCTLs are zero (Jeff Hugo)

v6:
- Fix conversion logic to make sure we use DMA_BIDIRECTIONAL when needed
  (Lucas Stach)

v8:
- Always sync BOs in both directions (Robin Murphy)

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 ++
 drivers/accel/rocket/rocket_gem.c | 56 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  4 +++
 include/uapi/drm/rocket_accel.h   | 34 ++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index a21aa9aa189ba585c70fbf57d2a41fb578357efd..5c0b63f0a8f00dc71060e7177d0ed1ca15755ec4 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -134,6 +134,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 05cf46040865c01fe14a169c865227780f2db679..0551e11cc184143a582d1718a621e22086217ad9 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -123,3 +123,59 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	long ret = 0;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_prep_bo struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_fini_bo *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_fini_bo struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	rkt_obj = to_rocket_bo(gem_obj);
+	shmem_obj = &rkt_obj->base;
+
+	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 91a1fc09c56ce483ebe80959e1a7ff934867bedc..24043033450941cb866a21378875810c6e8b9323 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -21,6 +21,10 @@ struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t s
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 374f8370ac9df6944fdb6ef06e56f15226e072ba..14b2e12b7c49288a84e645570cdeb815cd632d96 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -13,9 +13,13 @@ extern "C" {
 
 #define DRM_ROCKET_CREATE_BO			0x00
 #define DRM_ROCKET_SUBMIT			0x01
+#define DRM_ROCKET_PREP_BO			0x02
+#define DRM_ROCKET_FINI_BO			0x03
 
 #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
 #define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
+#define DRM_IOCTL_ROCKET_PREP_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_PREP_BO, struct drm_rocket_prep_bo)
+#define DRM_IOCTL_ROCKET_FINI_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_FINI_BO, struct drm_rocket_fini_bo)
 
 /**
  * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
@@ -39,6 +43,36 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+/**
+ * struct drm_rocket_prep_bo - ioctl argument for starting CPU ownership of the BO.
+ *
+ * Takes care of waiting for any NPU jobs that might still use the NPU and performs cache
+ * synchronization.
+ */
+struct drm_rocket_prep_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Reserved, must be zero. */
+	__u32 reserved;
+
+	/** Input: Amount of time to wait for NPU jobs. */
+	__s64 timeout_ns;
+};
+
+/**
+ * struct drm_rocket_fini_bo - ioctl argument for finishing CPU ownership of the BO.
+ *
+ * Synchronize caches for NPU access.
+ */
+struct drm_rocket_fini_bo {
+	/** Input: GEM handle of the buffer object. */
+	__u32 handle;
+
+	/** Reserved, must be zero. */
+	__u32 reserved;
+};
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *

-- 
2.50.0


