Return-Path: <linux-media+bounces-47863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81406C923EC
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 15:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D3774E66F3
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 14:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6143732E736;
	Fri, 28 Nov 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cijZIQ5h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B5132E6B8
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339274; cv=none; b=SqKt5DiPvANua//ggOuMDsueNB01ohjh/FTpja43/IIJ1hA8gH/gz7TAZ6d09fY92B8covxSANSTipfz+QHB0+Jc8KsG9KaHQaVACERhjqe0KRUlR4/mgiXndhb7IAvVVU9QZZOYwaGymyb1zXNPzTZQ5iHajIRa96MF4srt14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339274; c=relaxed/simple;
	bh=3qvzej8awCpbn9e07sU237IHBhwftYDUmtyhlWlTDvE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PA67Xg2pnyFPZa+rbStrI8hevgw4xcxOKpWcXCx/BA8kbQV/867Gv2WHB49tXf260p6Og+rG6GJLLFwKg1eHgPCGIY6wDCicGMOGbf1+ytdkm4Qz7J4/xHLM4nWG5Pom7Kq/pVrW8hyxaz/X3F911AhDqlUXXI+ni+TEzOQIbR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cijZIQ5h; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429c76c8a1bso1309874f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 06:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764339271; x=1764944071; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dErkMdrhZYAl7lh2HrMoD3XpeYIOhuhSS3s5eqeFFf4=;
        b=cijZIQ5h10jlgCYIhUiphD8ZVdFwgOZd3FlNADwSf8YBUw5YbUycBz8G9yY1hbhcm5
         JhteJhDr0nPZhrWdAl/1+xsznMRlRPTatpEnWstN7qubjspBCNWBEypaMdVpjPfQU57E
         cWgTCwC0Uh+f4bK9/R2Cf0AcksA5Re1IC9oxlvNBdNCP5E/7LSyLwVHQk6c2e/+Pe9h6
         xMUTSAGuDE0DSAk5BzRPkqFAO25JVR/aMkbRNwc71B/wn7kh6mez5QW9W+3qsQq3bdTS
         NZ/zXLiq0YqAwaAqf2HjWB23V6zveltJmMCQ/E4z0dUfwWuTg31zzuoGpFoTNv/3vWMf
         CXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339271; x=1764944071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dErkMdrhZYAl7lh2HrMoD3XpeYIOhuhSS3s5eqeFFf4=;
        b=CWr46BFku2oIBpeUMN4NfnmSqMXsIeG31Qrft4nBYUgBpT09NL0OBhk2ZBCKfO0G6W
         yu470q/FJuAYopNu665GSbnxgIYWjAO3mKyFf/hVKbTCFNV0EjiPhXRTmDkLEvs/i15n
         h8+fbxehlCG622ev2wm8yDUP1L8KxfPhUSmAWYKv/f2yEbrLUbn1+Pmj3ra9Hdyoy5Pe
         553alwq4zr/U6DsKdHVkuFnFJ3cwuhJM4R4EvX9fhoeuZWkLurVRWlbx12CKAAscQBeQ
         zT54t1jPYwPdNHHLrX1xKG0cGIOHH03K/b1i1ELQVQ2HX/HxoemJdkns0uvXwLLRL+p4
         eJtA==
X-Forwarded-Encrypted: i=1; AJvYcCVneiILzAO6DlohPgqeVQ1LUyFBHmbXLKmYKh5bJ4UaeUxE+rTG+b0mG8OeVHBUjABoCe3ZJunHNY+4lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKpwKQfWgiyu7UA3oLBMjPfMSI0BqjC2ZK6U0/c3N929f8qYx
	/E+f8HghdT9kf0E39BTl7bZZP22wTAvAMv0XtOHY60fcLuf3WkrEvExIjusC7Bb0rn7/do034Af
	rXCD0faeOCCa6LkKplg==
X-Google-Smtp-Source: AGHT+IFcjXie0ZOm1V1x3Sn30UIkvG9lKVYfaz50zhx+L1MWdnE45he0tSnMQ5dDSmjDf3qlQcYbMUPAeDz381I=
X-Received: from wrrx5.prod.google.com ([2002:a5d:4445:0:b0:428:5675:7d68])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:b307:0:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42cc1cd8f8fmr20206132f8f.10.1764339270969;
 Fri, 28 Nov 2025 06:14:30 -0800 (PST)
Date: Fri, 28 Nov 2025 14:14:16 +0000
In-Reply-To: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6779; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3qvzej8awCpbn9e07sU237IHBhwftYDUmtyhlWlTDvE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpKa5CDlG2X706aMWo3D+1YjSXr9gGcULvZXzIO
 bxH54LG946JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSmuQgAKCRAEWL7uWMY5
 RlxdD/9Yh+2z63fz2BwB+Oz13nuOAvp3W+klPBdj9p5TvUKtBNk++69CU76sDEi2CGGnPjpCDl/
 T/EpX8KTRxxPwAB2iSDidiF3qT0jsqpLh9ZiNUWIPkVpnfLd9bd+ol7ae5dLK6m8o8PfelWXKBo
 izgUe+OvwowH6DHFB7LUW5n1OG/CBZXJyom9szEfAr3kkTs3NX0QoWy3uNhRiLJ54FE55G0U9au
 hsUPd5/wnU+KCBUZB1l2R3iep1EnRYiLHP9vlTvlbjh9+aLU87IAtDJjhIiWnCg3yZ1OydQGQDe
 b0BLFhZ7hwFuqNfTX7f4z2mgj7r/jffqA7j0smRZ+zGd6HqGtPCnkHoEZpZvyzyYz/D+lTjY43g
 3rH2VSYCVU6ZjaZWWCafJXsmYKTRQ4UeEiKB3+/lXhJnQc6VlITjiN6r1saX/abXPe0nrieNitz
 wEslHZba53e3Pfy7lveKkWRxCcg7DOEIDQpKh2MTQ7N0ApniMtEpAEhn8PPeBS9B5bciEd52ma1
 P3U9cr0Y/+EKc8ueTcuF6Y8snFJBvFyLedjXOdQIU0eY1P4nR0sHZhGiLblK4VTg4tn/eenqb5G
 Ax706bZF4ozYMylFXxL+RPWsW6sy6QS4FgYlcdaJsjYHW1XZnYq3CN51VgL9PI7gvHJ6CQ3gY9N kTh8t0qfuepdzJw==
X-Mailer: b4 0.14.2
Message-ID: <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
Subject: [PATCH 2/4] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
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

In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
locks internally, which means that it's only usable in immediate mode.
In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
staged mode. This means that we now have one variant of obtain for each
mode you might use gpuvm in.

To reflect this information, we add a warning about using it in
immediate mode, and to make the distinction clearer we rename the method
with a _locked() suffix so that it's clear that it requires the caller
to take the locks.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 16 +++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++--
 include/drm/drm_gpuvm.h                |  4 ++--
 7 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f08a5cc1d611f971862c1272987e5ecd6d97c163..9cd06c7600dc32ceee0f0beb5e3daf31698a66b3 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1832,16 +1832,26 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
  * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
  * &drm_gpuvm_bo.
  *
+ * Requires the lock for the GEMs gpuva list.
+ *
  * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
  *
  * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
  */
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj)
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
+	/*
+	 * In immediate mode this would require the caller to hold the GEMs
+	 * gpuva mutex, but it's not okay to allocate while holding that lock,
+	 * and this method allocates. Immediate mode drivers should use
+	 * drm_gpuvm_bo_obtain_prealloc() instead.
+	 */
+	drm_WARN_ON(gpuvm->drm, drm_gpuvm_immediate_mode(gpuvm));
+
 	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
 	if (vm_bo)
 		return vm_bo;
@@ -1855,7 +1865,7 @@ drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
 
 	return vm_bo;
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_locked);
 
 /**
  * drm_gpuvm_bo_obtain_prealloc() - obtains an instance of the &drm_gpuvm_bo
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3d97990170bf6b1341116c5c8b9d01421944eda4..30ff9b84eb14f2455003e76108de6d489a13f61a 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -255,7 +255,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
 	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain(&vm_ctx->gpuvm_mgr, obj);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
 	dma_resv_unlock(obj->resv);
 	if (IS_ERR(bind_op->gpuvm_bo))
 		return PTR_ERR(bind_op->gpuvm_bo);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c5008e171c3ad72cde1004c60fe5212..26dfe3d22e3e847f7e63174481d03f72878a8ced 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,7 +60,7 @@ struct msm_gem_vm_log_entry {
  * embedded in any larger driver structure.  The GEM object holds a list of
  * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
  * holds a reference to the vm_bo, and drops it when the vma is unlinked.
- * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * So we just need to call drm_gpuvm_bo_obtain_locked() to return a ref to an
  * existing vm_bo, or create a new one.  Once the vma is linked, the ref
  * to the vm_bo can be dropped (since the vma is holding one).
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8316af1723c227f919594446c3721e1a948cbc9e..239b6168a26e636b511187b4993945d1565d149f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -413,7 +413,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (!obj)
 		return &vma->base;
 
-	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	vm_bo = drm_gpuvm_bo_obtain_locked(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
 		goto err_va_remove;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 79eefdfd08a2678fedf69503ddf7e9e17ed14c6f..d8888bd29cccef4b8dad9eff2bf6e2b1fd1a7e4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1207,7 +1207,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 				return -ENOENT;
 
 			dma_resv_lock(obj->resv, NULL);
-			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			op->vm_bo = drm_gpuvm_bo_obtain_locked(&uvmm->base, obj);
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f602b874e0547591d9008333c18f3de0634c48c7..de52d01b0921cc8ac619deeed47b578e0ae69257 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1004,7 +1004,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 		xe_bo_assert_held(bo);
 
-		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
 		if (IS_ERR(vm_bo)) {
 			xe_vma_free(vma);
 			return ERR_CAST(vm_bo);
@@ -2249,7 +2249,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (err)
 			return ERR_PTR(err);
 
-		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
+		vm_bo = drm_gpuvm_bo_obtain_locked(&vm->gpuvm, obj);
 		if (IS_ERR(vm_bo)) {
 			xe_bo_unlock(bo);
 			return ERR_CAST(vm_bo);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index fdfc575b260360611ff8ce16c327acede787929f..0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -736,8 +736,8 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj);
 
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj);
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj);
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
 

-- 
2.52.0.487.g5c8c507ade-goog


