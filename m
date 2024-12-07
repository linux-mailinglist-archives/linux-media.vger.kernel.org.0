Return-Path: <linux-media+bounces-22823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464CF9E80ED
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 17:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D7E282303
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 16:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88550156C63;
	Sat,  7 Dec 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLst9bBa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C21156661;
	Sat,  7 Dec 2024 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588292; cv=none; b=EulTlZNoAFdNaJVwN6YsDA6QhhOWJ4LwyJ2okcSQoHZEuQkF0v4XbYugW71U1qPuNJSRJpPP8pXEB1LgzhsBp8gNsz0ZNJhG5Jrs4TAO4DUmZwpOwPWuANR7LM7DPYXluzVKfFg5JeFBLhRUBV53061bSA45xn1BdmxXrhMYhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588292; c=relaxed/simple;
	bh=MthxseiiB1qweTv/ZsRRJcdWTkF+jsxsAi3/Ie+L3Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9cdvQ6zs+YB6Oqt1JwKvdte4PCZI4KMgH052WG+Iu2Ekz8Tw/Oa3M1jBVQqRiNRWpWiKtJJJOXtF/e8jga/X5sf0rw+fLWXraGS78EdATGf4EV0jZ96YhKu4kJiYbQvci/b2ExHIPiSu9HwuhS32d/2m1hi/Y5lSa4sRp9IwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLst9bBa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7256dc42176so3399351b3a.3;
        Sat, 07 Dec 2024 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588290; x=1734193090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyIQTPEzZRAeS1qQla708q/4zgKpLleeCQ9ko3M4emo=;
        b=mLst9bBaFEeZC1g1+ZYFj7sVJOWGBazByg55o2rH9v2UDuqI3Bl+LCo7QU3JA/XQRx
         ie48tUW1KZ9hY81WqzIQvIz3ECh09+fOCTd62oKoiL6nSdwyn+EBt2uY9Zy8naYEPswG
         K5WasLgIotfbGpDrkDyQFGDtVaeY3h31EVyNJbIPardvIMuTeSeyIj2CHQxHAgwsU15J
         iYF7kCd6avSrKwyb0Y4mcNVsCCnc1XW3lhKMOerpPyG/R7Yng1WeyjVeiqWMEUsYE7nX
         Yna4C66TF/jr8Lx8Lr+vHdh0rl42GnSDaacGQSp/a2J7a403KNoW4TF2/Cd/qzKJV0+W
         /dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588290; x=1734193090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyIQTPEzZRAeS1qQla708q/4zgKpLleeCQ9ko3M4emo=;
        b=WRwULVQcIKUMkMIVT4SoZbQvuXe06Iw9iCMjlOYAWkmwBnaqMNJa0i/wEz926AV/E4
         O5VxnvnG1CFehCApo7dTDSxttO0QhivqozT59zspHVFVvFh9uewC9iV0PrRav4spz/2y
         97XW5bO0puy0vP5W6yTJu5nej0DGro7BBLqoVuxKhxvA9rK2TgseJ+RL3QH9iSU6Aas3
         CAYvE9I+sh5rf3MbeYrkye5BNTYG2fr69361an7K5fTqege/lxTYzgeoeO6wqSXakYpA
         pYunpZCCsMyvyJxJ6ConBQ5+wuF77wjbIqDCLRM2HpGWrB1YsaaTlGnmOhNsFVcLvF2g
         gTJg==
X-Forwarded-Encrypted: i=1; AJvYcCUG7DMNshyEJBSr5JlT6hfSkOcNUkP6Hilw5XyAQ4upoR0tFRmNzKIo4CWVkxtMJrca0XDZd4kgWutDN2iA@vger.kernel.org, AJvYcCVOP/hxQerCrd4dyvUx5jnq6sdqnOwj5uNJc/UHnBKZ4mB2LnNKbzSgSNThIezQhxJXMq96w0hTa0RLlYjF@vger.kernel.org, AJvYcCXf9sA8z2M0Gvm9KaRzeVlggeuzKwRWXxEJMx9NVAxh6he2wjtUwKhWvvpDpHHfgW36oMHpaOmA4I2uqYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrGZd9+gGmv8aOaxAMj2PKhf3nGltLikYD8O0GYEQILDy/6xh
	8xXYiB/081Ei02flZgyLvTofYk7kxhemgg4MAk7khKNXBjvzLnwe
X-Gm-Gg: ASbGncutdaz35lzt6L7ve6MDG8QoXl9jAxRy581J1MfK04lRPMAVWTmL7/sUQFGElFi
	jbWcnxee7uCCTf+yVL1X7zFVmfKMgBPT1C8LdyOz0BoPHSzOEmkunYkp2Ig3uh8m0O4eq0HI9ed
	o+Fqye8ztiAFjeWLzv6FNanExDfg2m1y8PuNZ/XcKf/qG+KXPmwmvwE4dOv3XRdg954FEIrdaWX
	yg/zGxjWD9I8mqkKHEqlP12Ic9MbP1aIZrE/zWILXYZpMdziWQBL1N9g9vFGLADrD2gN249UcT1
	pjGgxM8i
X-Google-Smtp-Source: AGHT+IH4HL1U3hdxxpSBUgHr8euIo6pL350TQqGVjNEoKJJrUHlPQJvlC5hz1/gTOJO0CknwxlmDkg==
X-Received: by 2002:a05:6a20:6a07:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1e1870c78e5mr9414508637.23.1733588290215;
        Sat, 07 Dec 2024 08:18:10 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2ca671asm4650775b3a.153.2024.12.07.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Subject: [RFC 18/24] drm/msm: Add _NO_SHARE flag
Date: Sat,  7 Dec 2024 08:15:18 -0800
Message-ID: <20241207161651.410556-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
index 80582c0c2bf7..4c7ff83a0a20 100644
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
index 66332481c4c3..c21e1284f289 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -511,6 +511,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1026,6 +1029,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_iova_vmas(obj);
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
@@ -1058,6 +1071,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1090,6 +1112,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
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
2.47.1


