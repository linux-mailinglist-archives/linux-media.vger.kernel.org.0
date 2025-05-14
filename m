Return-Path: <linux-media+bounces-32527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CAAB73DC
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 20:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE84189D4AE
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 18:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D1C2920B9;
	Wed, 14 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsIVq2Hr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E428FA89;
	Wed, 14 May 2025 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245429; cv=none; b=f3AMIlBh3YE5NV5QdEcE/lw5cebkbwVn24tCAzTV2VIuq7Af32hbdxYKLr/98tUpjj3lh2xKn1Bv8k5EF9tDXVsy96fAMXxcmnlrUkHKKSc2/jls9NBsvDgwR7ODTc9V58f7ht2Nz/5NBpG+ea44jKC1G9e7q9IHbgOhMS3KHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245429; c=relaxed/simple;
	bh=W87tXld29sGws4beDR0JIb8oovcmBV9cbhnFRVMQC6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMV7t0ql6gyxGPW7TncC3cEVsiet76dfkH64pddo3Z4SFOMvjGLOuaa1cRhsoUcVeAIJRyWxJQAi6+rM1N/92NTY6EtJqjOMzMJH6J2lnmX4ztvjzKyWBeYM7m8rVRlKCwLHZRdVk9M09IyjrLnjCkuPmv7a15F0SCINyH7ufP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsIVq2Hr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e7e5bce38so1073365ad.1;
        Wed, 14 May 2025 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245427; x=1747850227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isDSYPypZ/rda8+sVa5AtR9z1JlGlKbU1A7fir435g8=;
        b=jsIVq2Hrqjm6WOf1THBwPWSMUZDa+0FA8rzjAEC3+SiKdcrOAEe/ZPsAM5HIEYgtq5
         0f4D00Onvfs6oQobpvdpvTYLDrprjkMsz4jUGZbJyHQ/8+RWEE37unZUwUOi1LMCQr7H
         VSQZXdk4MjCgSfooACaz7vhVPczshr5+OxZqT1Uf45RKc+2gcxmS+rh6Dgy6N0umK/4C
         D3pWVuMiQLZpJvD7nWX624L0cwrYs5SuQfo/ub+LyXUF92dzqb9x3uqC5meUHTUjdKHZ
         +Oo7YJvtwpbgWlEw26TUmI8d/UaKQ7fd8T4QZ42G1n2x70s5MjnGlw0WfhOyJLTd6P7B
         F/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245427; x=1747850227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isDSYPypZ/rda8+sVa5AtR9z1JlGlKbU1A7fir435g8=;
        b=uiJlv/BYUW6ks2BmInuuakkuJ1pQgz3xZeIhTpbebnnVfQLHY335U6yCAvzTQ6w4BW
         q7Txuf2QTgASMuj7nGEVxwbISgYgSbpjQE8rzekZ1tLQtUhQ+2EsmMnDy+1AJ9y3j9i6
         0CSYhsvybX79FsDnKP2567MwSaXC3T+e3RC6C9D9Y8BRHo24RGWjvGxS3mbXc1uuyrgl
         kbdfUtUd3e5d5ySa/IK7lemzIzxi5jaNY0cCzt3pX5SaTrPTRMRZ56pTEz/k700kvwqW
         hod4bZM73qy/GWS17C+l7+9dPdKRqE8wf3UFDzhX1Ok/8eXO4eTSjarvGZB057ukrhfa
         Dsog==
X-Forwarded-Encrypted: i=1; AJvYcCV9FZGPq4GYZvrKnYPnzB9/trRkZSdJmzckrkBAf9TxdhPOEpgpFCJMBQypBC9JChUSfG8S7WHPDsB/cvRD@vger.kernel.org, AJvYcCVCHBpUXpC9ExK3abzqG4ICFmugRRqoTdOZUatJTgb8r6tIBgO0jMcWa5BHf58gT1wFdepAaiYsH/XchiI=@vger.kernel.org, AJvYcCWZtTtRAduKwuM+co0ns3R0yNielgjusEPQvsJ2kQRczjb3emJqVGZBH7fRGH5s9HnAgcQhD29gu7G/k6N3@vger.kernel.org
X-Gm-Message-State: AOJu0YwJOpcP6J9nAuT9yK0IhE9aMO9PxcoASoY2AwE4yYxL4pivf7Vu
	rX2orbdbUlSzE2WLR31Xh8UjBB6FHxW2VtR2JAKzbXD3og0S0SQ8
X-Gm-Gg: ASbGncvU14jVv8Spr+ifpYcWhf0BbXjU7NfV+yBQNdsMGiFPGx5NFtdRvFrcoyMAy+Z
	4sutapGC44O9zzL6xZ7fZjvAqwIW9uoVGUz73we5yVIh2+lThObhZFeyMekuDRZ/3PuIpyYjffs
	CkOEyrHr3cxqNmVZw06Xtz9+dSjesaIC1Pc829gK/0DihdjUpGzQmmDmgwtBNDmWs7n8yKmeNgd
	PxJPD1JcEkWv5GSzrxknCcUgaXQIBkRfEx2efVqhCyViJscxDbYmebdFbWE2NXdf9t2DCTeEEZN
	n9jiG7GjHgzbkNNmhYODT2X8tACVI36/lyVrYeIn9p0cfN1X+lzzrS91K1/KcZpwQUDAasVttm/
	EYiPF8Ef08kRtGVimN6SbdlQSyw==
X-Google-Smtp-Source: AGHT+IHNZhJHI7DAu+HvazsWD553AheCMfdE2cs0DA4hIUXTJBA/MPIyJlnvgl9HumvtySZehX8m/w==
X-Received: by 2002:a17:903:1109:b0:223:635d:3e38 with SMTP id d9443c01a7336-231980cf7c1mr62097835ad.15.1747245427213;
        Wed, 14 May 2025 10:57:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm103088725ad.128.2025.05.14.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:06 -0700 (PDT)
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
Subject: [PATCH v4 24/40] drm/msm: Add _NO_SHARE flag
Date: Wed, 14 May 2025 10:53:38 -0700
Message-ID: <20250514175527.42488-25-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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
index 3708d4579203..cf152a31d836 100644
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
 
+	if (obj->resv != &obj->_resv) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		BUG_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
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


