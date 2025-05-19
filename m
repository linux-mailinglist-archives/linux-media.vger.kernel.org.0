Return-Path: <linux-media+bounces-32838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F1ABC6BE
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 20:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C8E67A16CF
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA628C000;
	Mon, 19 May 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENRYY6Cc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3328BABE;
	Mon, 19 May 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677510; cv=none; b=nVmwE6FXHtJiN+980tBorLkVDW9zmwHZSNewaRgBUAmoFJZMbqo4nZczhEhsUg/KtKL7N7aWonjkopO5nrO6DlHcZY+RO2dGwFOoR14KPCD1zcx8txL/e1FIAKqu9ZaMKbsDGY++0fa9aAnYYtVTUsAKDAwBOFoqWWRvEkSUgXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677510; c=relaxed/simple;
	bh=3/FKOZ2fW3WRSCgp2omB41mHKjLEIN8851T8UHvaH14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyWiviOlIUD56VJztFThJV47qHXieAQY/ytYFoYrrMRVzsAittLyJAd/4GUZeNekBkpoRvPW5C3UwyqmN1pO0Ik6QszV1y2DrMK6JZ66kDPfs+SlXNta9HG54jixHGiec8JuRd7Ts7MeyOfxkKQp3Lezavz9mTjLToheRHdbt5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENRYY6Cc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so4937234b3a.3;
        Mon, 19 May 2025 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677508; x=1748282308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYI2zRJOtd0DrZN4qncIv20rYHQymHOcIiawR317nWQ=;
        b=ENRYY6Cc32tzw/dJEguW3DYPmbBBFOwF7mz43lvHhLoXMRNXeuB5To18qiKyB2/HLJ
         S5bOgyTvnsF2vSsvfqf4a3cL/ZbZUj2Phf/rhhRyCRlzFFhol9tfjfhcbTAf6kLBBbBs
         0M28RbUztWISFdqZp62dD4QppUsdinwYpo3zw+jz97kLk+2/TLknrjiPoaNLRRbFCu33
         TIiuGA2rVMRfQ6ftM0WGcTpoIhR15zmdRB+qO4F2M5HkuBAFQJyIu+mx48MQqpiDVGYv
         zZemOdnF/+UF2C4Mc/ZIe+Orb/EKHqUtasE6Kes0e3Kp9rU+dJ0YCuDBWiPuTHrGim9M
         ubrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677508; x=1748282308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYI2zRJOtd0DrZN4qncIv20rYHQymHOcIiawR317nWQ=;
        b=NbbPXkWT5BmI3lHsoIR/EtLsB+02P7UX2qsPwcOcC2KBCXMzopgpk5raE4VxQck+dH
         vy79QF5wcbHt9lMuV08coXWr0gZXGxwNDVZ0tK/QlfYa00fao7P4pCJvQc6Bv5N0jVXz
         zzjNUrNeCbl2GSqO6MqO2ryuOES6622ydkzMlEmKeHoSQIkX3kFbNT62QhfDuoZJKfgG
         73cEqeRCzAjC8c0rrRO1yqOQ8eYbtCgHGbBey+FEWku5FoZkpdUbD/qEGoZL1ZKxhEmv
         fipCA+oXvjTCh70ELRPTeEX/TEa9gaW97Uapt+jmyHH9XUGTQ10kzV+pB04pYJj5dDDm
         AKog==
X-Forwarded-Encrypted: i=1; AJvYcCU+MsfHA2xlERpXQW2UYTg4J3Lvbr/PJ9y0sXCEK7yF99mvHOJ74nuqtId9SR14nsxZs8ghlBpTYglcCcg=@vger.kernel.org, AJvYcCWXUmxzwEr4OJamXb8r2gVCq4I6D+f2X9HV7Gv4I6nobPuU3M+YDoLYoJDvxisYpiQaB+nan/aMWrwKs/qn@vger.kernel.org, AJvYcCWxTBUCW3PVxkrukG9dyDBs/4TZhDvMmp1RfQzYZaJIuRS+VSdOihPgjr1cRZ4Hul+ogaNGN7VLmJX7qlZ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1flYiW1OgNSsYqvvE+x/DfTakhh2sQ/M4yk7dFGpD074Oa2MR
	6AvZv9aXK726muCqgIM1djd0esZvQZet/FLnwnrZmIuMNewm+lMbqCKB
X-Gm-Gg: ASbGncvIx9WVw2F0gY/qH0rt3wNgYpQ8dCxDkbXSYy+wVaE5iq5L8z48NSgfEaQIrCP
	whQpjCGZOWf1OwNjRCTCCnjGd4CfSZLx7V3+yu9ZVf2G58THIvvP7Yvmx96UwQa7LYOhFUTBOaX
	aJC67qpn0NwYk5HCdqSgw/OKB9nV1a2Zs49tb5+4DFSmZ+2bd80xsSr2alK9wVzviRd04248gyv
	xhEryNsr1qRjegrqDAs1cCbPkLQUDDOTmOdD1v43TorFSoY0xp2xxy+q/hAMKxewbQk9ksGYtcs
	m6MxxfRAXhqcES9tUiPeSaN7R0qncM/VR0i8OYgvuu1iN3Na+a7Qjsl5fxspPRv8v0INOm416hO
	MdyR+TouULfW2GcqX5C7vf9UAkw==
X-Google-Smtp-Source: AGHT+IFzBCS9nXCRFLRNGKyzZg3GWPK2vE74D3SoO9nls63JyJkY7kSswkhFeCAR1kOXNf3TDeRLZA==
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr18354925637.29.1747677508122;
        Mon, 19 May 2025 10:58:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5c6b0sm6598482a12.7.2025.05.19.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:27 -0700 (PDT)
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
Subject: [PATCH v5 24/40] drm/msm: Add _NO_SHARE flag
Date: Mon, 19 May 2025 10:57:21 -0700
Message-ID: <20250519175755.13037-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 36b9e9eefc3c..65ec99526f82 100644
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


