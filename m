Return-Path: <linux-media+bounces-22822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC09E80EA
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 17:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DA48282003
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B95019F111;
	Sat,  7 Dec 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpUF//eA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A319CD13;
	Sat,  7 Dec 2024 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588291; cv=none; b=GFuyDyo41cLn8mM65KXxxCwhYJPYwGA4bNCEWbMIUP8j3rIxi+93dlYFPhuIM4bSBjx3d8Wb6yHhNd93m9Bj8Zv/dx1xd8xtE9yDcooOciiDdBdkXmcESCDirJNVj+t0OGtcdZmZszAYyMk3Z4pXWlAxL4TbIuAZ0yk4jAIiLkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588291; c=relaxed/simple;
	bh=zYMLqLkxUsuQekNDuGucfhHnSJa+PyNOZ/cspC82yEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pge/P04MFxIXMacaibDlijZKFs3k7+cpZdy1GsKeRPNmoizqf4KGoHkozaxc9tRMJQ8NAnF6KFi1pMGjXkkrzAxjST4weHmTJ/C0rDWnA6h+WhsoToQ/sMHUM1zQdV2gTFThZYrehZUvXLZKkWHWARA7uAVVP5QQo/ORKeTJ7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpUF//eA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72599fc764bso2371637b3a.1;
        Sat, 07 Dec 2024 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588288; x=1734193088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKCpI+52kVi4Rx1wcui054uYtvI87ujf/h7knQvNsG4=;
        b=lpUF//eATm9FjbcZxOQ4LnLz86e2yw1zPz/I0hGj2TrZCguWY9U6jeY/sXgxTtTqZN
         poEBdhAtC5Wfz5DDKxAFD0eD57J1WVxCLjjd1EsMXpn6NqakkXyBoa06adQZLkxRgI/L
         gTgcYSCndgQFdnuyXdjYHAyhVJ1V9+oczo4B0K1KKl1BnY7EYTaQGGb3k+dt/r1PeaE6
         2Jz6uz71JgCGYd1Ie5ESMAW7KcGM1ge6Hkht8IdsXoX1lzmlclRvGfA+gubT/JlZ9fVp
         9vrUUfHEv2ahc554owiXQ1HHV6jdSQ5wcZ5ZQ/2oEpNUqmyLJBK0BQxF48DlDFtfpQa1
         eA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588288; x=1734193088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKCpI+52kVi4Rx1wcui054uYtvI87ujf/h7knQvNsG4=;
        b=UO4xY3yH2Bspm2b+nO0r36zWGnLtc320Gos6Xbk+cEIw/T0HTMXg7TUxGMRxaUV3RM
         ri4Tfr2st//NgBjZMzauXb+pAKq5r9R408c4t7oZ1wLkRnNFbK+X5KllNRbJDPnu9TYU
         81bfGjFBVbDxFEIGshrR5FwpJ+x0CEdDVRjDh0B+d9+0YWqWqGPo5zG8eKeNL9kiFCIB
         eplb8O6HVTe0UNQLX6uAZBcF6nreOW0C7Cwbj2mXZsYya6sUXyijnxFk1IK/k1/Pu+fz
         HTsO5oYO7uTXZPwMZ92mEdoXdHtyQkPFULOw0+Yak97Cn0FEXwuqwp0mpEwxdYD8SwYY
         B/IA==
X-Forwarded-Encrypted: i=1; AJvYcCVTIMLHSAfepMA/JpBacAXOqautDVMS23f5CWeJh7ypbctTKxJGkBv5vldEv/kAO3bblm1bABq89hWh8ZcO@vger.kernel.org, AJvYcCW5hR/jpBo7oB/mCqV297PNQ3kJD4pS300XxmIaZg0C+r2Hpb3rSdNfoZMnmkGDJaCMITAhPJX6h6bRRFk=@vger.kernel.org, AJvYcCWOx3CA2qAvcRK/ZlF+nEjr+ZR8Q8BsQoiaEyKwcj/Iwj41V9LumDZQGdh2HJK6Bbmvn1JnZdKnIw3rUWDx@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnowMHCmhNUTf3eVJKT4ek4KRrFOPlJhNbCKkmafG13YHfBq9
	2iCe9SCDh9jnyrBvtl4H3AXdg1U4urcPLXA7s1a7sVFAC5i3Mci3
X-Gm-Gg: ASbGncsP4sEGCFQmInnj6KRugXKhkuxsSDuI5eXkQ/sJyJaZyLLrBlSEq349FTwzyfV
	/lnfyfURyazLFPUyAnw/ETjYYljjmtrwy0X42UXfVC1p6k1GKKx/bZNZbmlxq6sglsKdfzPVA+r
	iXX5Sa3hKJUfxKclhqYUPvb/yauCVLOKE6KwHZDMD3An1p9yc2e5jR+HeQuC6GD1cX/jftUanFS
	mdbdnr67+w4a/lTGEnKWkh53uo+2pPiRtOyc0Ohm7xVhVUtztMz9YR0QAbdO1h80HhZzKce7y1y
	/U1RarW5
X-Google-Smtp-Source: AGHT+IFVe7LT9zqghbghnI8xmGLxyzI7v2+qeT3zO0rAup288qgwevJ18oNOFIUBgkY19EHM1zPw1w==
X-Received: by 2002:a05:6a20:158b:b0:1e0:ea70:7494 with SMTP id adf61e73a8af0-1e186c0e6a6mr11887408637.9.1733588288406;
        Sat, 07 Dec 2024 08:18:08 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e0195143sm225224b3a.63.2024.12.07.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:07 -0800 (PST)
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
Subject: [RFC 17/24] drm/msm: Add VM_BIND submitqueue
Date: Sat,  7 Dec 2024 08:15:17 -0800
Message-ID: <20241207161651.410556-18-robdclark@gmail.com>
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

This submitqueue type isn't tied to a hw ringbuffer, but instead
executes on the CPU for performing async VM_BIND ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c         |   3 +-
 drivers/gpu/drm/msm/msm_gem.h         |  10 +++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 123 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gem_vma.c     | 100 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |   3 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  57 +++++++++---
 include/uapi/drm/msm_drm.h            |   9 +-
 7 files changed, 275 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 0bfc993571fc..66332481c4c3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -215,8 +215,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj,
-					      unsigned madv)
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8e29e36ca9c5..a2255fd269ca 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -53,6 +53,13 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+	/**
+	 * @sched: Scheduler used for asynchronous VM_BIND request.
+	 *
+	 * Unused for kernel managed VMs (where all operations are synchronous).
+	 */
+	struct drm_gpu_scheduler sched;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
@@ -106,6 +113,8 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
+void msm_gem_vm_close(struct drm_gpuvm *vm);
+
 struct msm_fence_context;
 
 /**
@@ -195,6 +204,7 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9ac74f9a139e..8295c21e4ca0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -115,6 +115,17 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	kfree(submit);
 }
 
+static bool invalid_bo_flags(bool vm_bind, uint32_t flags)
+{
+	if (vm_bind) {
+		return flags & ~(MSM_SUBMIT_BO_FLAGS | MSM_SUBMIT_BO_OP_MASK);
+	} else {
+		/* at least one of READ and/or WRITE flags should be set: */
+		return (flags & ~MSM_SUBMIT_BO_FLAGS) ||
+			!(flags & (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE));
+	}
+}
+
 static bool invalid_alignment(uint64_t addr)
 {
 	/*
@@ -129,9 +140,10 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
 	unsigned i, bo_stride = args->bos_stride;
+	bool vm_bind = !!(submit->queue->flags & MSM_SUBMITQUEUE_VM_BIND);
 	int ret = 0;
 
-	if (!bo_stride)
+	if (!bo_stride || !vm_bind)
 		bo_stride = sizeof(struct drm_msm_gem_submit_bo);
 
 	for (i = 0; i < args->nr_bos; i++) {
@@ -151,11 +163,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 			goto out;
 		}
 
-/* at least one of READ and/or WRITE flags should be set: */
-#define MANDATORY_FLAGS (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
-
-		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
-		    !(submit_bo.flags & MANDATORY_FLAGS))
+		if (invalid_bo_flags(vm_bind, submit_bo.flags))
 			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
 
 		if (invalid_alignment(submit_bo.address))
@@ -174,6 +182,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
+		submit->bos[i].iova = submit_bo.address;
 		submit->bos[i].bo_offset = submit_bo.bo_offset;
 		submit->bos[i].range = submit_bo.range;
 	}
@@ -183,6 +192,12 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 	for (i = 0; i < args->nr_bos; i++) {
 		struct drm_gem_object *obj;
 
+		if (vm_bind) {
+			unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
+			if (op != MSM_SUBMIT_BO_OP_MAP)
+				continue;
+		}
+
 		/* normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
 		 */
@@ -297,13 +312,21 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	int ret;
 
-	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
+	if (submit->queue->flags & MSM_SUBMITQUEUE_VM_BIND)
+		flags |= DRM_EXEC_IGNORE_DUPLICATES;
+
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
 	drm_exec_until_all_locked (&submit->exec) {
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
+
+			if (!obj)
+				continue;
+
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
@@ -372,6 +395,28 @@ static int submit_pin_vmas(struct msm_gem_submit *submit)
 	return ret;
 }
 
+static int submit_get_pages(struct msm_gem_submit *submit)
+{
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		struct page **pages;
+
+		if (!obj)
+			continue;
+
+		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
+		if (IS_ERR(pages))
+			return PTR_ERR(pages);
+	}
+
+	return 0;
+}
+
 static void submit_pin_objects(struct msm_gem_submit *submit)
 {
 	struct msm_drm_private *priv = submit->dev->dev_private;
@@ -385,7 +430,12 @@ static void submit_pin_objects(struct msm_gem_submit *submit)
 	 */
 	mutex_lock(&priv->lru.lock);
 	for (int i = 0; i < submit->nr_bos; i++) {
-		msm_gem_pin_obj_locked(submit->bos[i].obj);
+		struct drm_gem_object *obj = submit->bos[i].obj;
+
+		if (!obj)
+			continue;
+
+		msm_gem_pin_obj_locked(obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
@@ -400,6 +450,9 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		msm_gem_unpin_locked(obj);
 	}
 
@@ -413,6 +466,9 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_WRITE);
@@ -708,6 +764,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	unsigned cmds_to_parse;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -724,9 +781,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
 		return UERR(EINVAL, dev, "invalid pipe");
 
-	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS)
-		return UERR(EINVAL, dev, "invalid flags");
-
 	if (args->flags & MSM_SUBMIT_SUDO) {
 		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
 		    !capable(CAP_SYS_RAWIO))
@@ -737,6 +791,26 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		if (args->nr_cmds || args->cmds) {
+			ret = UERR(EINVAL, dev, "nr_cmds should be zero for VM_BIND queue");
+			goto out_post_unlock;
+		}
+		if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_VM_BIND_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid flags");
+			goto out_post_unlock;
+		}
+	} else {
+		if (msm_context_is_vmbind(ctx) && (args->nr_bos || args->bos)) {
+			ret = UERR(EINVAL, dev, "nr_bos should be zero for VM_BIND contexts");
+			goto out_post_unlock;
+		}
+		if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid flags");
+			goto out_post_unlock;
+		}
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -813,19 +887,38 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT)) {
+	if (msm_context_is_vmbind(ctx) && !(queue->flags & MSM_SUBMITQUEUE_VM_BIND)) {
+		/*
+		 * If we are not using VM_BIND, submit_pin_vmas() will validate
+		 * just the BOs attached to the submit.  In that case we don't
+		 * need to validate the _entire_ vm, because userspace tracked
+		 * what BOs are associated with the submit.
+		 */
+		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
+		if (ret)
+			goto out;
+	}
+
+	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT) &&
+	    !(queue->flags & MSM_SUBMITQUEUE_VM_BIND)) {
 		ret = submit_fence_sync(submit);
 		if (ret)
 			goto out;
 	}
 
-	ret = submit_pin_vmas(submit);
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		ret = submit_get_pages(submit);
+	} else {
+		ret = submit_pin_vmas(submit);
+	}
 	if (ret)
 		goto out;
 
 	submit_pin_objects(submit);
 
-	for (i = 0; i < args->nr_cmds; i++) {
+	cmds_to_parse = msm_context_is_vmbind(ctx) ? 0 : args->nr_cmds;
+
+	for (i = 0; i < cmds_to_parse; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
 
@@ -857,7 +950,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = i;
+	submit->nr_cmds = args->nr_cmds;
 
 	idr_preload(GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b37bfd80bca9..2160d492a999 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -162,6 +162,70 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static int
+run_bo_op(struct msm_gem_submit *submit, const struct msm_gem_submit_bo *bo)
+{
+	unsigned op = bo->flags & MSM_SUBMIT_BO_OP_MASK;
+
+	switch (op) {
+	case MSM_SUBMIT_BO_OP_MAP:
+	case MSM_SUBMIT_BO_OP_MAP_NULL:
+		return drm_gpuvm_sm_map(submit->vm, submit->vm, bo->iova,
+					bo->range, bo->obj, bo->bo_offset);
+		break;
+	case MSM_SUBMIT_BO_OP_UNMAP:
+		return drm_gpuvm_sm_unmap(submit->vm, submit->vm, bo->iova,
+					  bo->bo_offset);
+	}
+
+	return -EINVAL;
+}
+
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	for (unsigned i = 0; i < submit->nr_bos; i++) {
+		int ret = run_bo_op(submit, &submit->bos[i]);
+		if (ret) {
+			to_msm_vm(submit->vm)->unusable = true;
+			return ERR_PTR(ret);
+		}
+	}
+
+	/* VM_BIND ops run on CPU, so we are done now: */
+	msm_submit_retire(submit);
+
+	for (int i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+
+		if (!obj)
+			continue;
+
+		msm_gem_lock(obj);
+		msm_gem_unpin_locked(obj);
+		msm_gem_unlock(obj);
+	}
+
+	/* VM_BIND ops are synchronous, so no fence to wait on: */
+	return NULL;
+}
+
+static void
+msm_vma_job_free(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	drm_sched_job_cleanup(job);
+	msm_gem_submit_put(submit);
+}
+
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+	.run_job = msm_vma_job_run,
+	.free_job = msm_vma_job_free
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -197,6 +261,14 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		goto err_free_vm;
 	}
 
+	if (!managed) {
+		ret = drm_sched_init(&vm->sched, &msm_vm_bind_ops, NULL, 1, 1, 0,
+				     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
+				     "msm-vm-bind", drm->dev);
+		if (ret)
+			goto err_free_dummy;
+	}
+
 	drm_gpuvm_init(&vm->base, name, 0, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -211,8 +283,36 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	return &vm->base;
 
+err_free_dummy:
+	drm_gem_object_put(dummy_gem);
+
 err_free_vm:
 	kfree(vm);
 	return ERR_PTR(ret);
 
 }
+
+/**
+ * msm_gem_vm_close() - Close a VM
+ * @_vm: The VM to close
+ *
+ * Called when the drm device file is closed, to tear down VM related resources
+ * (which will drop refcounts to GEM objects that were still mapped into the
+ * VM at the time).
+ */
+void
+msm_gem_vm_close(struct drm_gpuvm *_vm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(_vm);
+
+	/*
+	 * For kernel managed VMs, the VMAs are torn down when the handle is
+	 * closed, so nothing more to do.
+	 */
+	if (vm->managed)
+		return;
+
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 70abbd93e11b..fe716f0004f2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -554,6 +554,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+
+	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
+	struct drm_sched_entity _vm_bind_entity[0];
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8ced49c7557b..99ab780d5d7b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -72,6 +72,9 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	if (queue->entity == &queue->_vm_bind_entity[0])
+		drm_sched_entity_destroy(queue->entity);
+
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -115,6 +118,11 @@ void msm_submitqueue_close(struct msm_context *ctx)
 		list_del(&entry->node);
 		msm_submitqueue_put(entry);
 	}
+
+	if (!ctx->vm)
+		return;
+
+	msm_gem_vm_close(ctx->vm);
 }
 
 static struct drm_sched_entity *
@@ -160,8 +168,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
-	extern int enable_preemption;
-	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -171,26 +177,53 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		unsigned sz;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
-		return -EINVAL;
+		/* Not allowed for kernel managed VMs (ie. kernel allocs VA) */
+		if (!msm_context_is_vmbind(ctx))
+			return -EINVAL;
 
-	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
-	if (ret)
-		return ret;
+		if (prio)
+			return -EINVAL;
+
+		sz = struct_size(queue, _vm_bind_entity, 1);
+		queue = kzalloc(sz, GFP_KERNEL);
+	} else {
+		extern int enable_preemption;
+		bool preemption_supported =
+			priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+		if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
+			return -EINVAL;
 
-	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+		ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+		if (ret)
+			return ret;
+
+		queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	}
 
 	if (!queue)
 		return -ENOMEM;
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->ring_nr = ring_nr;
 
-	queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-					 ring_nr, sched_prio);
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		struct drm_gpu_scheduler *sched = &to_msm_vm(msm_context_vm(drm, ctx))->sched;
+
+		queue->entity = &queue->_vm_bind_entity[0];
+
+		drm_sched_entity_init(queue->entity, DRM_SCHED_PRIORITY_KERNEL,
+				      &sched, 1, NULL);
+	} else {
+		queue->ring_nr = ring_nr;
+
+		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
+						 ring_nr, sched_prio);
+	}
+
 	if (IS_ERR(queue->entity)) {
 		ret = PTR_ERR(queue->entity);
 		kfree(queue);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 1a948d49c610..39b55c8d7413 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -404,12 +404,19 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
 		0)
 
 /*
-- 
2.47.1


