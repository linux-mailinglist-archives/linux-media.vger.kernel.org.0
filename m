Return-Path: <linux-media+bounces-28496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E688A6926C
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B32B08A064B
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046F921506D;
	Wed, 19 Mar 2025 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCsiCuT8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AD1DED6B;
	Wed, 19 Mar 2025 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396146; cv=none; b=RBYI0q3eiThUeFWsFqOcljobhqQa3gc2aercpM+9/RCIboUV7hID8ZYCDAeJARfH6UUHVwwKm7aMnxf85MQFHxYhpxbAXqafuNjCxrB4zo2WCYXU8L9tkarf2b8Jo4KXZC6ZjQ5w18mUsN2WvgYLvgK8jZWz7BrKSjSSK2xA5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396146; c=relaxed/simple;
	bh=Wf8zd+5GgvnEbx72cIC0QKnNJVwGLKIpsyfv36Azr5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vC5q2hLDrd6nn56ES6LV3mohhaeTVMw9kUBcdJastBbOXjSOvA30p1QPdSfis6C50PPTFtT0x/EivTyUCQnB8I4vCST+dub0s2Uvui7SOFrwRaQvuHUwOaUVmk7nx6HeS65/1iDGJFPWKJcln57Z9rAHt0Rr4NpnevefxaiV/HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCsiCuT8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so1814206a91.1;
        Wed, 19 Mar 2025 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396144; x=1743000944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwhScULefMfboLX0liFkQPUFffcIJe/d8pWVK3z+O00=;
        b=jCsiCuT8y/tqssH6KM8GdOGJyn6CnacElejkLiewckQ9bSJIrnV1tXI+2f6Yjkc56+
         n2SyUCASg+tF/RfY/CebNTTvUs2dj3z4hqM3d57V0XonIvJJkFW5zWIXmmHecg/yHvNj
         qJzfiNgXBV0aIUHRDviudoTcNz5cuMgRRkr8asO6xoumvWQZKBxP0DtcTi2o3MqYwGk0
         o948dIDy9UdwGfpF1D2uy9oBymuCfkIrCJ57fCcSqIrlzo0/E5YJ3QaCxSP+EDE/r1A6
         njtKT29ReyhTIVSnW6MAsfpmqdRaIDE8HpoQrud3oD9K+mG8S0vQq4ZwzlDH5kP9SQC2
         dwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396144; x=1743000944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwhScULefMfboLX0liFkQPUFffcIJe/d8pWVK3z+O00=;
        b=o9QFqe1/56cwIrZppxaNWsFnfMtabozxqb3d4ghSmoluKk9m6bkXie9X6o1N+VZnZ6
         2t39BwpMlvRIRv4E4yDHJ7dsiysCI7iT19cxrtO7RRHlq3awfBkdgp/bf2Mq2qDM897U
         SRgjr4DMh5wuCtoQg6feWs87Z1+rO6liYG0ve2LxIpSh8TYLLGbriBHp6TfTa2fN40I0
         y7X8eJXws6rR/GebsulwsRPUNK70ptty4/ocSXMiX49co9bBu95Wp3olubkqTgiyvnnD
         aDfKoYHnre4f6NPLwpGm097n8mkyE4sJW8/vy+J1lB9edDG4uKR6b3hdqT+WwTP9mNY/
         7aHA==
X-Forwarded-Encrypted: i=1; AJvYcCVJE1KPXIMNa8xTL+GvMhAc1GEaKwqcOr2+P0/25L/UwUX9TqC79VJyLhvbR+O2LTeKcOj2SMVRCRantfc=@vger.kernel.org, AJvYcCW/1ymqLHt7g15fMEV3JGL63bpkGkOlOu9M7d90foKENHb955RHIJtNgwokyhehdVDnAKVmq3tkxpxvdFyc@vger.kernel.org, AJvYcCWAq5m1FtT9K9K+ynITDxYX1vNWI2oV0+PROy+PswKInbwcfziFd0ecXjwQgzg/yPM1DSl7OHkxnszqVXrS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+SVYr0xxZRD/CldYuV6iOM8oPBSLL77TRUhWdxhFXvcmTTbr6
	ffxWMsFm1clUgDibpXX2skbxMQ8jBGR+Lu88bG+FjasPTFglJHyU
X-Gm-Gg: ASbGncvpAaSVnlAgCO3WIvNYRipi8mAfVmrNVfXgPtP9CHMkgAqCxEj7XqJB3zwhJTT
	oe8VniAdimq9+iydKWYg9xVgQOUoFPgkafwrLQA50Q8qT/alBrhtHnhbU/43/1mFW0aMu9ZVwXT
	8ZWB0PhrvbLRH23HYVM7cDCjbV1xFpSQcexXXq3kr32M+nh6uwcmd6WOWiBdW4vjL/0mRi+4sKm
	9l5MzXkYFe9BrMEI+YNh0ooVqv2TjT7GDVZJnCEa14Dxx7PVNtTEk0gsWZYHReO/RmdAebK0tET
	tBrlERJFUcQMyZZy7BcT6POSDD1fUf2iapwcVv/TbvLGVV3BUWNDrOIa1ftaIBRLbegGuZYUFcG
	SaZCD0juCrX0+4PpqxQ5wnzAdMSSTlA==
X-Google-Smtp-Source: AGHT+IHCA/GqCE/f2P5dI0HamwPMEXDfsvX/N0jLiLWDfWHv3zNa6XPbkeXex6uF1RGR2mrPoY2f+w==
X-Received: by 2002:a05:6a00:8c4:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-7376d55d06emr5667798b3a.5.1742396143748;
        Wed, 19 Mar 2025 07:55:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695abbsm11691211b3a.150.2025.03.19.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 19/34] drm/msm: Add _NO_SHARE flag
Date: Wed, 19 Mar 2025 07:52:31 -0700
Message-ID: <20250319145425.51935-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b77fd2c531c3..b0add236cbb3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c68a3dd3fed..9d4f7b76471f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -522,6 +522,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1032,6 +1035,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		BUG_ON(obj->resv == &obj->_resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1064,6 +1077,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1096,6 +1118,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index ee267490c935..1a6d8099196a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 39b55c8d7413..a7e48ee1dd95 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -138,6 +138,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -147,6 +160,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.48.1


