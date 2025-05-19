Return-Path: <linux-media+bounces-32790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8346ABBF92
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719577A342F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA22E280326;
	Mon, 19 May 2025 13:44:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016327FD44;
	Mon, 19 May 2025 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662256; cv=none; b=ihpsOSYTxTQzDo1hBzJPPWadofuF1PFuIPGeSCZVnCtjYLfUmKrFbQ+yflarw3ZXFIcjlCvnYHkYsPoFOQrcS2p9EcvE4QwxFdcb3xWya/33Ph6o8gd+hh+ukVQ8usf1qIM63ANKr0sduxG9rnZMe2YFj/SXrNwzn7uXlAn0xzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662256; c=relaxed/simple;
	bh=q/Cq8Ko0xIVDfVyvCtxXclzryhAsQiJ6NK8PK5J4bdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2m8R8umJXU+RzlkI68MIiYcdXhRulY8rM5OTR35U0xLXx99dDVWMyciBsd2UhVZmQkafza4XMSD0Nkm4WmmfihjtKT5BUOsiryAKaWCOPm36klVsMcNjH8/hG3uJstPb8fJG7wfRxiIBdaQ5rWrar9N1khBLI/J3Wft5QgEcn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34970045e9.1;
        Mon, 19 May 2025 06:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662252; x=1748267052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkJKBkDUJRJ7bEb2VzWEqCdNMs8+V5XyH/wwMnfIh5o=;
        b=Wljy4lEdt/zULFYsxk/KOVDagQSORBFqPAHBBJzptNMQl+mi73a67D1C9t3SmFdTB/
         k9P0SSNOvRkq+DyG6gIeXxI629dcLnc2MI9zhG+H2gX0HzTX0EtKWDHD6mNKsrycK7+6
         9aheGR1SqNg7eM56tGq0ZD8KMtnmJeGI2CRHrLKdbNGet4HL9iAcQ5C5S7yhtaY0FJL7
         UOBq7RMlIjiqa5BY/3evYh7Q3PO5L08U19Yo3l3Rt2NnV9FnAUDrwIXNKv+lITblRPam
         6BKKudMnGVrWBkDv1RRH/74jFqv/fvHarDD+dRRISXe33Fej0WnDGmKxTpp8H+wkF6E3
         aGoA==
X-Forwarded-Encrypted: i=1; AJvYcCUVHh5nHi68h2GYkOA9DkFevlohkn8C6HhwxP1fWSV15l6fVX9zvSLzC4ZAII25zdXAbyDzrrKmOFs1YZvm@vger.kernel.org, AJvYcCWFtFU2cgayPC9bcJUkMAKXuQ+De05kKSxii1fwAXB2ZmD7FSV1L+mYpQASSZNrjJonq4SUoNEv/pY=@vger.kernel.org, AJvYcCX5e9ygR0FjlvRIifqwKjR+ygbnS8Nvbx0utHHXYGqq4GJp2IYptAjKUpaxjVG64EijnRO8+h8FlTSrn5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvU/lJNtabDlmFB8xUzIRRoyur4pmoxwx1dAm3L/NV8u6jLFJZ
	PgBTl7mFfzPUXlV9GTj5Xmt4eBvVi/DNfU5nfjdHwPyNU0gWRzVSZ5cn
X-Gm-Gg: ASbGnctNB01m0YZsdl/Eyp1GS7jDicgpeYNLUxfrMPXsbUadmFZaHcSwVJag8lkC58P
	OFwIY6PDMl3WtLhbf5lAjVbIug13WTVFuK1zIRYVJQEKS3yFYOzIZ/+Mh70HpKt98mOH2YqpItP
	ysyR5hBaUrsxiNarR9LJuG4JpcOXSKcmIzF7JEVdVZyNTh7U+AEw8j1r1naLK7/Si7antKEYNOL
	rBjwIV+D8y05E1GGmuF4ueNN1QxUlASiThR6e9QfF+D4dG//eljIlQQKU+b4EUASAXjeHgsrdF3
	RTikY1Paq4VEbzW6DRioX57LJ427mqoiKw2ophLlUEMyvg/aT6EFQfls5O2tntVGBmDibyKMDSt
	hAtRfv91LjQ==
X-Google-Smtp-Source: AGHT+IELkMq6rdXipZwLHJTiuo31IxxOx4Yev6sLyRXLyaXquJFaLDQkgnzTlaDZETz1xRFuG4Dd5g==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-442fd64dfccmr122197995e9.19.1747662251980;
        Mon, 19 May 2025 06:44:11 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:11 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:40 +0200
Subject: [PATCH v4 08/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-8-d6dff6b4c0ae@tomeuvizoso.net>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/rocket_drv.c |  2 +
 drivers/accel/rocket/rocket_gem.c | 80 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  5 +++
 include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 18ff051c336a14b7dda72d235faffb7a55a0a8ee..75ccf6e14b2bed80005a70b8cc06925b7c3ac405 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -58,6 +58,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
 	ROCKET_IOCTL(SUBMIT, submit),
+	ROCKET_IOCTL(PREP_BO, prep_bo),
+	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 8a8a7185daac4740081293aae6945c9b2bbeb2dd..cdc5238a93fa5978129dc1ac8ec8de955160dc18 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -129,3 +129,83 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 
 	return ret;
 }
+
+static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
+{
+	if (op & ROCKET_PREP_READ)
+		return DMA_FROM_DEVICE;
+	else if (op & ROCKET_PREP_WRITE)
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


