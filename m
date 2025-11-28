Return-Path: <linux-media+bounces-47862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A549EC923E6
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 15:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1B1D4E05CB
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 14:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A48B32ED47;
	Fri, 28 Nov 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvhaLQFd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B2932ABEC
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339273; cv=none; b=K81BxjrASHyMQXvSHZfWeWOtcTt1AVex8nqgMRn81BYrccSkRKD3tAcq38WUAIQc2EbWLaKfCTobUAvYMM78PsTOrBq84StsH1x1769ILic9cAWjvuaYBL7d17K6sAScfZ4I1BOxT3zErJXrWrRGsCy7cWdbkfSXEqxO1KP/tmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339273; c=relaxed/simple;
	bh=/qKUIi+SwxvR/KkB19A6xZJZbmkfrsHAi66WdDyKSDI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VUMZCGH2OJw6S5s3lHLQgZjSMLYG0yiu5/XWrFwmBSwVK3F1wrXdRhXzREmShV9/VR9tp5vapS3gqU36pIJvZDjrxLE0vRMtSI+W17W8bZlkBuraUPzNBbanjm0NPCPxBwasna5ePNIgYdE31ya3gWMWHJB4Wwm8IeAHuFNISJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xvhaLQFd; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b72a8546d73so218929866b.2
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764339270; x=1764944070; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWtS0oeZw0euolNA6rQ3aMYIpi9puV6Ez/UA7Z1Lta8=;
        b=xvhaLQFdE3/YD+ita5keY8uMuAPAUvjLm1FGn/4gftgVs/aKjnjjzYyNkNULetNumD
         dP03koFswaD7wp4R4y2nsfaP7VtdJEvvmRS6LEX0xiKyBhPiB91wQ9FhVqXlWTMpJPlj
         zofSnPOMAk4InT/81HEh4xWRl5ZFd0N40EsQf5vz1lcXCrujVTXF/w47b+WzCtdy5kK5
         TQjjI5ESI++9LoPUqS9JV/ad0RCQXDUUl5aLnFOLE6QF89EIlDEP68HTDHJJx3PyqpQA
         YjO95i+7kK0xSlyC62fH1P7g0EvzwLb+ED4vmJJNJrF9PkOlcxb8E1gjiP6NPPcTheJN
         tR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339270; x=1764944070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWtS0oeZw0euolNA6rQ3aMYIpi9puV6Ez/UA7Z1Lta8=;
        b=EQ9GTWCwGaiR6OlLpbf4NtSW2Rot7tS1P3pqG+PUXD2DEGOSm3fC09v66pmTvWfvXa
         MT5IebS28TgnFyr9lVeAsT4lkC+ms2TmM68K+qu+AvLFd+tKaHkbg9b2/ONuB9Ss2yMn
         sdX/QCUpWeeM9XYO7k7ODs+Jho01TAt4659R/+XTIy5loUb5WdamBsw5qGdq+RbpwXYX
         JVNExnEokBGvE/GDX3BVPmWNrCdcA3DTi/NqOAimxKSffWudUCurnjMG9PjpjFTJO9xf
         /45pTpSpYPjnzVeWmEX3O8YemvAA6FUCoePAEDSUfcXLH+gU2ZQGpEcIrBFUDSmzJyks
         RLbw==
X-Forwarded-Encrypted: i=1; AJvYcCUPF3wF08kJ8RPSbVeCgGGVDCxTei+kINHMAZHBSIrOYvdPvNNHgrxFQcKu/tsK7tUNI7QWKBYmcXEKAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuds/MM6hkqYrKL3soh16wKG1oSviBgVrLm5hP7o20i83d5wkf
	FvPmhltccbKqefAy97L09iYC59ZJSO7XsuvMM7v8LcNsGBckYk4rSPHNQAAVtSqX0e6qeMikBv2
	3KG7eamju60VKhOh/hQ==
X-Google-Smtp-Source: AGHT+IGQaJ2kOmy5nOC4YD7a97BtA5EiRqES+TvuM8s7S+WqX8zQuzMJ2k3tkR7bnBDkFNa0dTcDwtixlZ7umdo=
X-Received: from ejcvx12.prod.google.com ([2002:a17:907:a78c:b0:b73:8115:9bc0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e86:b0:b73:926e:ddc6 with SMTP id a640c23a62f3a-b76716844c4mr3146435366b.10.1764339269785;
 Fri, 28 Nov 2025 06:14:29 -0800 (PST)
Date: Fri, 28 Nov 2025 14:14:15 +0000
In-Reply-To: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5831; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/qKUIi+SwxvR/KkB19A6xZJZbmkfrsHAi66WdDyKSDI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpKa5C3uoY59uKQmVsr8tyT1tCEHUEqwTTsBb9S
 b5vlFkI0SGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSmuQgAKCRAEWL7uWMY5
 RjwLD/9ShES7XKjmh35DZrFV+Fc0z4KMMPJ1JI0Xlzpm9qtAoEKOXw7zgph3m7PfAHtwS5AHPQ5
 3r8W+kUOxuw+CD0lhpbFLA8Fx/msauv85WyPkF+YZ+9HR1XAAE5GkAzLyfP0i5kMGVdjOCCe1AI
 bPuG9iA7pke+Bsfmp6vG7pUpnXbhFzvAQK30KyowCPBdFVrNcVXw0k+t56KpR4rKJRmNFU6F3f9
 +ZXane3mLzMGMKIVyR8oRq0QxM2ddQ0BPJLnsobQv1HTyyqR2g/5pOLiDDnvwS+z2i0s6KOSXGh
 WSusVN9/vKUQkyC9m5+jb7aNRhGclk6KVrM5/445UugiLuD2XpIGDPqjHF2VsIKYqmWOd6PBTX3
 V0eAWXixt1Wkgs+jIvSbfftAwV/PD6NdaTlJ1wX2Z6bCMvobI9qw0uxWiUNn2ccJrYE3Y3N839N
 492nTEJubXIjfvs7pdcP+XwZANY3nCLLLufUGYVBlJy3wPeSK8p2SrOji0/Ds+VNQkjBZYmbzmK
 se/FxIy2Kzo8qYRIQ2m5aYl+VKOwVRWGKTUwNZsZyuSpT8bn0eHaK7r1iLSxejhw6BXdscHUkEC
 WSv0lEHS4sqcRY3gsKZCczzW/gAmw6rYvqvYSzNuPNZx1aDNJ7VHaTnNwvbeNsmn03XTo4bmbEG qZF5uHItgA1JDLg==
X-Mailer: b4 0.14.2
Message-ID: <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
Subject: [PATCH 1/4] drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When calling drm_gpuvm_bo_obtain_prealloc() and using immediate mode,
this may result in a call to ops->vm_bo_free(vm_bo) while holding the
GEMs gpuva mutex. This is a problem if ops->vm_bo_free(vm_bo) performs
any operations that are not safe in the fence signalling critical path,
and it turns out that Panthor (the only current user of the method)
calls drm_gem_shmem_unpin() which takes a resv lock internally.

This constitutes both a violation of signalling safety and lock
inversion. To fix this, we modify the method to internally take the GEMs
gpuva mutex so that the mutex can be unlocked before freeing the
preallocated vm_bo.

Note that this modification introduces a requirement that the driver
uses immediate mode to call drm_gpuvm_bo_obtain_prealloc() as it would
otherwise take the wrong lock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c           | 58 ++++++++++++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 ------
 2 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 936e6c1a60c16ed5a6898546bf99e23a74f6b58b..f08a5cc1d611f971862c1272987e5ecd6d97c163 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1601,14 +1601,37 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
 
+static void
+drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
+{
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gem_object *obj = vm_bo->obj;
+
+	if (ops && ops->vm_bo_free)
+		ops->vm_bo_free(vm_bo);
+	else
+		kfree(vm_bo);
+
+	drm_gpuvm_put(gpuvm);
+	drm_gem_object_put(obj);
+}
+
+static void
+drm_gpuvm_bo_destroy_not_in_lists_kref(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+
+	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
+}
+
 static void
 drm_gpuvm_bo_destroy(struct kref *kref)
 {
 	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
 						  kref);
 	struct drm_gpuvm *gpuvm = vm_bo->vm;
-	const struct drm_gpuvm_ops *ops = gpuvm->ops;
-	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
 	if (!lock)
@@ -1617,16 +1640,10 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
+	drm_gem_gpuva_assert_lock_held(gpuvm, vm_bo->obj);
 	list_del(&vm_bo->list.entry.gem);
 
-	if (ops && ops->vm_bo_free)
-		ops->vm_bo_free(vm_bo);
-	else
-		kfree(vm_bo);
-
-	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
 }
 
 /**
@@ -1744,9 +1761,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put_deferred);
 void
 drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
 {
-	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gpuvm_bo *vm_bo;
-	struct drm_gem_object *obj;
 	struct llist_node *bo_defer;
 
 	bo_defer = llist_del_all(&gpuvm->bo_defer);
@@ -1765,14 +1780,7 @@ drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
 	while (bo_defer) {
 		vm_bo = llist_entry(bo_defer, struct drm_gpuvm_bo, list.entry.bo_defer);
 		bo_defer = bo_defer->next;
-		obj = vm_bo->obj;
-		if (ops && ops->vm_bo_free)
-			ops->vm_bo_free(vm_bo);
-		else
-			kfree(vm_bo);
-
-		drm_gpuvm_put(gpuvm);
-		drm_gem_object_put(obj);
+		drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_deferred_cleanup);
@@ -1860,6 +1868,9 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
  * count is decreased. If not found @__vm_bo is returned without further
  * increase of the reference count.
  *
+ * The provided @__vm_bo must not already be in the gpuva, evict, or extobj
+ * lists prior to calling this method.
+ *
  * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
  *
  * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
@@ -1872,14 +1883,19 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
 	struct drm_gem_object *obj = __vm_bo->obj;
 	struct drm_gpuvm_bo *vm_bo;
 
+	drm_WARN_ON(gpuvm->drm, !drm_gpuvm_immediate_mode(gpuvm));
+
+	mutex_lock(&obj->gpuva.lock);
 	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
 	if (vm_bo) {
-		drm_gpuvm_bo_put(__vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
+		kref_put(&__vm_bo->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);
 		return vm_bo;
 	}
 
 	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
 	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
+	mutex_unlock(&obj->gpuva.lock);
 
 	return __vm_bo;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 9f5f4ddf291024121f3fd5644f2fdeba354fa67c..be8811a70e1a3adec87ca4a85cad7c838f54bebf 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1224,17 +1224,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		goto err_cleanup;
 	}
 
-	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
-	 * pre-allocated BO if the <BO,VM> association exists. Given we
-	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
-	 * be called immediately, and we have to hold the VM resv lock when
-	 * calling this function.
-	 */
-	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	mutex_lock(&bo->base.base.gpuva.lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
-	mutex_unlock(&bo->base.base.gpuva.lock);
-	dma_resv_unlock(panthor_vm_resv(vm));
 
 	op_ctx->map.bo_offset = offset;
 

-- 
2.52.0.487.g5c8c507ade-goog


