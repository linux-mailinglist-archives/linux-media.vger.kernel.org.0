Return-Path: <linux-media+bounces-31235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA8A9FB5D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 23:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C745C3B5B64
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 21:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D84C219A7E;
	Mon, 28 Apr 2025 20:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILhFHC7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DE218EAB;
	Mon, 28 Apr 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873857; cv=none; b=WOPbo+FXlI1+j8rmHQ3afMwCBDjfbe5G1PxXNiCBmUotCzYoA68S+nY7WNJOwFsOyLP1blYWTjD0hLAnVfLXRhIvnM3OPqfdq+B+alp4wb9TXRIyuLbUKjCuzIi1Z+tCOzmyRWpgDVHFvEV4zNM08zAOMLKGpuBLNltvyLmqCcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873857; c=relaxed/simple;
	bh=4stStijgmkQgLj7QgL0DPvTpEywkInJvNZan+1AlHwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBiYhWcPZ/28kuHDS7H+qL405MrbxpLyV4FwsYSpftyxAvr8xz1Ha3i1LYemp/DQlEG67+L/7OvmgdV3Xqle6Duo6OFn82LMDfXveNh4HhqV7j7HalF0qIckc1m1Au67bP+gSXiCsUrYXZ48pQXE+aZWgZqk7Ko5gcbZFYAJBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILhFHC7G; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so55821085ad.2;
        Mon, 28 Apr 2025 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873854; x=1746478654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtDpB0PTtkYXhtnhSwYfqz5Rac+7v9V6aZ5T1mp1bHo=;
        b=ILhFHC7Goxd46e92KN1IJRNjFvsRLf7OsoSka2cExtwi94UP0ddx70FJLbxiH2b2st
         8v+ZF/HktXE9UdmUAt/taThdVasa0pZk5jqN2MsJIqkr5muET34sXjy9ELKd7x/HjEks
         YrrM8nyHuWC8gdv1cgVz3234dM4stOZH6URrDO67Qzj4tjIP5T+RpvdQ4cxUggy7bz1A
         dxHCvLdZ8Ts9/B/rzJjHDzFx8BFyMFXt3YlRawip3fcrZw+lqUirAU2cfH4vgykhVqaS
         oYWvwt0FOBmYgU9THmhsEB1WTiTOQ9hwMq6qn9U3SrGjC+g9khBn7QKm0ILvHpxo35dQ
         C8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873854; x=1746478654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtDpB0PTtkYXhtnhSwYfqz5Rac+7v9V6aZ5T1mp1bHo=;
        b=dfRgPu7gBdabRAco7T62YNk8fQVo38iBR6Qy9b6vzYSEU5oq4nwVxIMEmDZ46OSXOk
         MSRIsetcR39P60+iwWxntAXLAxrWi+/Rk3AF+/z9+S5W0H9Oo9hCNYRtON3Ogy7UhH9R
         YtWWO2KKtxWdX1u8+7eZYec/we0f1cX4eXSo6cNjO+X9anir45ZhbMgyGe0gqeUHT2SF
         pLBQhQaUvRu/byOUG1EI0XC+5FpwRe5O+dwHe4tYfc21HLsj0EbdxwDwMafJDFzE5jEg
         eOFWZh6DqfHC/BJD5DLWJDOMwaJCywNv85/P/Q70vBLe+GoGBF3wHY7OwnRZiNcA80YO
         G7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7S8RDRlQaGLSUUguAUVVAQeWZfhHYTjVBDryLBr/WG/bob9/k1YcGXqwY1AbwIatOPjLakB51onWdJHs=@vger.kernel.org, AJvYcCUN7ux1pYzUbxH6nYMgzKSh9SSsTC/7oVzjqi+34mZ1wRKx0AwG79yWG6kdHnJQjYwFapAIGUw91GAMorlR@vger.kernel.org, AJvYcCX6WVIYqNJ43IWLgtvwoUcQiX4wdmHqTIui8yZCx8qE+crujvQt7Zn5gviTfceouOaEu0M5GAFgE8bPBmf9@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbBcB1uMYWKvLddNvf+vuZyQet6/RzOehxMVNyIUtUvdbmRui
	HFc/cV/O5tchEAFD5G+IuQRl8xr/U7JlXwpPUXbYwbJwtPKYu7rB
X-Gm-Gg: ASbGncsCL23DGJEL33W74DA/hQejc/lrdF+gxhmC0ScXEZyX1fVYkhlZag3kdrj7Kxk
	AfvxqZ2DDp24t6Uiw5lGblhc4ukNykC94RFZ+dnthGc8KWFcwP6SOKCwEkmSkxzck0unkxcsowr
	ygYJoNhkK3S3D0x5glT7sl6vf3Z8IBy9C6El57n1BsveiwhINU4DsLDIiZHeAU9snce2hXRfNb2
	lrL7bPmE5cbQJj6GKOs1Exy5nSfr5VUbM+7bLfgWHZe7mGMwfMu01O3CQURDl9hnnK0sckzYxRl
	BiQfMn8VMyd+KNdLTjWzyfDXMQyuwZedzK1G05rvrvb3+fuTo9FIBi2elHFvSueb8BIB65K5rXy
	SaigBn3BmzKjjC7A=
X-Google-Smtp-Source: AGHT+IH5mu7QN8e0nlxn6rTjFQ1K8STZk6kOUL+RElAi//El94Lcf9CPFofahvw3WU13JQrjxnuoEA==
X-Received: by 2002:a17:903:2b0f:b0:220:ca08:8986 with SMTP id d9443c01a7336-22dc6a04510mr170014745ad.22.1745873854316;
        Mon, 28 Apr 2025 13:57:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b50sm88075925ad.130.2025.04.28.13.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
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
Subject: [PATCH v3 21/33] drm/msm: Add _NO_SHARE flag
Date: Mon, 28 Apr 2025 13:54:28 -0700
Message-ID: <20250428205619.227835-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index 3708d4579203..d0f44c981351 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -532,6 +532,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1060,6 +1063,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
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
@@ -1092,6 +1105,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1124,6 +1146,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
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
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
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
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.49.0


