Return-Path: <linux-media+bounces-34046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B27ACD909
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1AB172498
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8424C2459D0;
	Wed,  4 Jun 2025 07:57:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094223AE60;
	Wed,  4 Jun 2025 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023861; cv=none; b=H5lTJUkrDVgGs35iyOyt7FpDRgH1vAjBK3kYKEetINRHKYy2KO48DPbVFQ+LgCw8Ah/+tl43ep5WjRcgjGU73WwYY/byAFKo84MMCrpTlroPigL6ieeYf4sTbK+Rzc7nZ1xRRfrRUQMZBYLx52bqIumKR36g/AP/BsPNQyvYNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023861; c=relaxed/simple;
	bh=2M2Dz/941hvm2rsYtROV1qhN6KxEFyx9Quzd4lqPv18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIo6nW+OTGARQ2N/X9Sba7KzrRwJ+H6LzreMqV3YfePxtXQwfKqINv+H4mHTwqxMyn1rQG+JLf3MgVaAXMrwPt5AGGzF7m4DwlX19YsMLzVHuBX4kXzlPRL1ZPLpXMgVRl0XSUckEHybJxrIEpPCbYb0rVDY4cHU/PF2faQpTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso2640753a12.2;
        Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023857; x=1749628657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjGAp4K6EAFuzCeA2yYheVwlWI/pfTpiZgviUJcgmaI=;
        b=rIN743tzvwExrgQ1FeQXLWngP2TkDfehF2LebjZOrZB4Tdca4c2muNXkUeE7DzOXBy
         4oqskfZA75fRsfW4lHunKgoMjN2kiqUcCFgebOmKn50hhdssPhXx2ISKssRpKavOY3B4
         kUGioQ0AkfA+GRS1LYOWb4KhOb9yCntQdMV8Bnt8BWPP3iSqTkqFoxQAi0xis13BBW4I
         dBFiuxSEdPJ8nKp5Kk58/pJLW0zzG/jOgd2wsDVPKYKk6ylKmiuaneEn6r9ePjUxV6FT
         e7tM1iu21WdICKmswEB6gtt4boLXFgOdq0+2toHtivfcD49bAhjRcw9sHpBQ0bpd8F78
         XVIg==
X-Forwarded-Encrypted: i=1; AJvYcCVG6/a5rKT7cZdZNsnPqzwOZ6h2EHAW89HFhv322KgogjZ0trK4Zw7ZydSWti5jxl4yTp+GK3FargDahp8=@vger.kernel.org, AJvYcCWkM9RtNBynRwWiObICMkRDW1G0CRs+s7ZYdyjUM292m4BQwyQLqq24+BRqsB3+AeLRGCFtoYJKKaE=@vger.kernel.org, AJvYcCXZ2F9+mlTWIChq+/tu3x6ZQ3x+ax5r2Pa7SmOMxPt+Brueu8R2ez6EGex7QRwVZejiG/k4eHmxCVEbp2Lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4OfJkiaveeJGRBdenuN0La5SpJ1i7Ak/+T6tDXYti6evard22
	oXHyH6hoc0b7xg/4n6DhW8G2hO9P+xLBjUK3l0Zwhq6+ob0jt3Gh//tp
X-Gm-Gg: ASbGncvCJdLbHSbqoEJD4wBGf5gNrct99wFkoULqSOPgdDUJOZGOE4C6CkxPLokK44A
	8or6D9GGNK8zQ4mcRGLsPMymDIe0k/m41qJLVzyE711V0QJRc+C1HCBiqEepbKds7hP6DBeNy3Q
	YGgSp/cSvRCU5vvT9orvBDxJobH2TwmaXUzwpL2QiBFgc8Df8XO/DBE8/NQPGegTtwfeaoZe2yH
	mZBvsyxIQTpIdmUIN5/W/khniQSYUbs2yCB8CPAZBjO7wvs15foX0OqFZJpqGjm0RJrJeBFMSXR
	8/b8mey7cHXpQSdW830dXMJMjAFEyjkMc6VJAHNyM/d99CQUx5RfMDasYG6CZAAIASb2gC4R+D5
	wtIx28WCm7g==
X-Google-Smtp-Source: AGHT+IE18LKhlLWixP/vDAIIlTQKQ2PwLrw4DCdir4yOt3MyS5X2KyT0nc1LL4Ay3oR9i8+0GcyvGw==
X-Received: by 2002:a05:6402:5202:b0:602:cef9:a63e with SMTP id 4fb4d7f45d1cf-606ea3a7ad5mr1897117a12.30.1749023857162;
        Wed, 04 Jun 2025 00:57:37 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:36 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:21 +0200
Subject: [PATCH v6 08/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-8-237ac75ddb5e@tomeuvizoso.net>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/rocket/rocket_drv.c |  2 +
 drivers/accel/rocket/rocket_gem.c | 82 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index e6e257e01cd83a18abc2817135ffd97abe3104b3..adc142facdb357c461f29b16aef77e401d87c9f6 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -61,6 +61,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index fa07c494fd845f98ac759407677a649ed2c97727..4325e6c39d5df35601d4820cd0a5c829ade585d5 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -124,3 +124,85 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	op &= ROCKET_PREP_READ | ROCKET_PREP_WRITE;
+
+	if (op == ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op == ROCKET_PREP_WRITE)
+		return DMA_TO_DEVICE;
+	else
+		return DMA_BIDIRECTIONAL;
+}
+
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_prep_bo *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	bool write = !!(args->op & ROCKET_PREP_WRITE);
+	long ret = 0;
+
+	if (args->op & ~(ROCKET_PREP_READ | ROCKET_PREP_WRITE))
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, dma_resv_usage_rw(write),
+				    true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_rocket_bo(gem_obj)->base;
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_cpu(rdev->cores[core].dev, shmem_obj->sgt,
+					 rocket_op_to_dma_dir(args->op));
+	}
+
+	to_rocket_bo(gem_obj)->last_cpu_prep_op = args->op;
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
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
+	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
+
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
+	}
+
+	rkt_obj->last_cpu_prep_op = 0;
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
index 41497554366961cfe18cf6c7e93ab1e4e5dc1886..2caa268f7f496f782996c6ad2c4eb851a225a86f 100644
--- a/drivers/accel/rocket/rocket_gem.h
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -11,12 +11,17 @@ struct rocket_gem_object {
 
 	size_t size;
 	u32 offset;
+	u32 last_cpu_prep_op;
 };
 
 struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
 
 int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
 
+int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
 static inline
 struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
 {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index cb1b5934c201160e7650aabd1b3a2b1c77b1fd7b..b5c80dd767be56e9720b51e4a82617a425a881a1 100644
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
@@ -39,6 +43,39 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+#define ROCKET_PREP_READ        0x01
+#define ROCKET_PREP_WRITE       0x02
+
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
+	/** Input: mask of ROCKET_PREP_x, direction of the access. */
+	__u32 op;
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
2.49.0


