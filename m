Return-Path: <linux-media+bounces-38135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C7B0BFEF
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4D3169DBB
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A84428A40D;
	Mon, 21 Jul 2025 09:18:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3928A1D9;
	Mon, 21 Jul 2025 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089498; cv=none; b=JAN8Ms6CNUtys9c11dt8kYwnQ8Jk9uTA+IF8uoS8+6vJ1Gm21KkSmWKElBdE0vWDp/qDBXxWyEfKOChi6Hit8YysygcBt6MrCb8jctGeq+Atnf05UdeFsXszlCZFDiqka5pYqYFfy7ZAgQSbbpKwwwpLUZYJKjCKbQkfowArBLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089498; c=relaxed/simple;
	bh=M9eE2TyyBHBFLyIV9/wkpTKifuaxunFwpRLlG7h/PsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wfx8dtIpjGq+HW1vX/aJb96AtmbcX+m84HCe4kHM1Jvrj+20cJKE1ohFCqJDFC87nVEQaEDVJL8aC1uZxVG5aQ1PVvli6S54X079a/ASZqFlcqlvK21oX8R6jh0Yls1NG4zNoOmB8DcmYJ11CPwIwhbD+WfDz0UniQOs//P4dCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso6803158a12.0;
        Mon, 21 Jul 2025 02:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089495; x=1753694295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H72rn8ogX3KhM94X5uibatMEZGkDkzHDrTXRw3fgC8g=;
        b=uDnzqNu3g0MGRciJ40bBHreONjk4csju6XJdkso+e+/9r8WAfoIFqHBYFG6+BavqpP
         xhexl6vkHrG43srhxgdD3bGCFw2VPhJlV7VfaccS6rXmyaucaROAha8zkwGZDgCqeRyS
         5q0oED0Z8qwcWtqufbJY46TfcfTPMEVnqntC+yma1MgYmVLteNnsgV9oCY8TL2iAhlPI
         4uOLzZsp7evFtWh0FYOvGdc8V47JPWPTeTEXUZz5XBTeVIzalqoEeVk3+a4RhafekjIB
         V6liPpnX4kd7zv92pdAdnl/aMxjRBIK9ImbnzV/cEIfrXBFN2KuXwrFHBDEQfjXKMSqv
         TQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUEqITWx80PTLCNUNZYSEBgoJ1e+VU3k39bdHpaPoJG7kU99iZdh9o4bkJcNbvi+hGv6/syC3AwBRXggbM=@vger.kernel.org, AJvYcCUbqGUKYxTtt/vbjpMR/cPOejJeYt+pwUVs7HRXuF7hqZB88WqDwJtjkzkM7IW6H1rxoayvPUKnRzA=@vger.kernel.org, AJvYcCUxO0UyxLkoPcYvuFun+pm/PbRh+wCLHlrEKEHY9GETSSz1ADjhIqflMKmFyxj2yz85QJeJPTNQzMNgalZH@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeFsjYsemN00F/O4jx0CgNJ278WyUg6i3oWZZqw2LbwasVWYq
	V35bzPAaxyn/8KttaJ9dQrskbXbm6+SuokheWuS/mn3RoQg/zuXtKxcz
X-Gm-Gg: ASbGncv0qgaf7Rm5EV39JCbi3G1+SxHUpExgw5Ju5oXpSAcmBOKuwJVo/MQQjctHXHD
	82ACA2sCzDnTNGx/94eOB8SUl9PFezZEdhO4DNIf/PII77qvyXaevEAJPunnG923ygLtjkgN3CA
	zzAXM4Pz8HnpcneBpsSeSqj+Q9DtmH1/NJmuJ/Dq7Vy6iwP2FP9c0N6/l3c9qcInpdY9j8ViwUn
	qxGhZ22pexWimBsAVaVRemmUR5zrtmiDjb2RSOc+QNlh8NG439JwuCcLQubtawoa9+cGh9uzRbv
	d0KtPym/RLTUKOfEQ14qXcWiCdxNs5wr/ylJloJ7UU7/03TSUWSXbmrFxLnOQVh54KGNf6R5usQ
	kn5pYgOpG8qv4yo0G/YtCSSFlv7PWapKW7m1rA83brVZeUVYBcjjZTF36
X-Google-Smtp-Source: AGHT+IGo3DwC+0zvTvAmIYLz28EIx6yOrASpSp5JNWg89ZYrk4pHiToCTuaIip14TiXolC0UklqQVQ==
X-Received: by 2002:a17:907:7f0e:b0:ae6:859a:9e6c with SMTP id a640c23a62f3a-ae9cdda300dmr1844078966b.3.1753089495052;
        Mon, 21 Jul 2025 02:18:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:32 +0200
Subject: [PATCH v9 05/10] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-5-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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


