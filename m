Return-Path: <linux-media+bounces-28495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A4A69266
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833C08840CD
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A1F21517E;
	Wed, 19 Mar 2025 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFvJppNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7204214A60;
	Wed, 19 Mar 2025 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396144; cv=none; b=uDbhKTn2YP89DKRrUyAN1wYk8x2iToqrWrMXpDw9VXXVaL4/En0Lgg2SqlF72WzIJnevfWjtKPCdEI7CMkIt1WU9zQ+rhxN/jc3NsuHcl9HZiHgtFdHMThP8knPBPqigOoYW58hcUou8LOq7ywRBljcMr4gmtERw+sgr37F2KUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396144; c=relaxed/simple;
	bh=Pk8qrg8XbQ3vqlzNp8run9pseTLdpNaZRm01OhGQn4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjChv/71P9bEuT6CKyc3bYJt+c0GneUmYDJPLnj3vtt3eYPEIIeiifop92T30sQKdbHLhxEa4r09uTqpWYnic/GrLJmq3fCrw6l91etOD1nZd7r1hsmRfi0jnGheBWh5W47zo614xk3n9EBGEHfEkAhstuH+6x4YoL5swGAu/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFvJppNQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223f4c06e9fso14544065ad.1;
        Wed, 19 Mar 2025 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396142; x=1743000942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XT8DN3ZleGCofMlQ1mMQjy7k/r/T2YXHUe97y9PZGo=;
        b=iFvJppNQA0rW5yrdsrzz+mHhNfRbnJ86UPYU/SG4/Le4ZzzibGBFVCpW7UV7ZwFHO8
         yVk+N2WwTL2XwFg6UjDbo0rZl7xn7R0kIiLS+fLb6VkK8IckcChvilFwIXdQVzbRrqDW
         UusBxmzn5Z7ESCEL6H3Qqopfq5wzeAayqy1XWJmaVKAclBENNO4l81688/khaEkrCK7i
         OeN5mtQ0kD+HXLNLp+7uram/8nJkGYMyMZcGcLqLJNZZxxHfM5M2lsZfa2hc4ossBpHE
         W28fcX+AMn05uFo8CYBfF5osl6SbqGFsTOF8FALfGkOmTaEHsKb/OSk7DMfXNkdgb4Eu
         yzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396142; x=1743000942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XT8DN3ZleGCofMlQ1mMQjy7k/r/T2YXHUe97y9PZGo=;
        b=L71R1eOM89l2DKV0ZSt99l/UrryLkWY6GvRPDxJra/14tuCBYfIsclAFzSMwsJ8lxT
         OhuR59fIKPypxDTPqFB1HNbg4tq8tJr7ZvcmR9hRRyIObyccVZbZpj43V/FtFm6SwWBk
         qKVW4OImsP3vWE/WEEv/ANKEtZBnSdeIs+k4GGSl90yHozwmVDbhxnEiclzD5d1MU3EL
         ZcV51mWasH9X1mTNmnaCW3AJYQJosgSMykyks5FzMFs6eGnviYZ6RsTcWoB6229WhpHP
         WourFbFcJUZg/JVjA2ohD43ttqZL8iX2mo9eV37mEi92HCkzgFFFqTqVgdxAvHZzJHGG
         I5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUL6Zxtigd9HQvagMeE1Gd4xyJOrmUHME1FRMq5/yRjZ9I/PPhjBVgHKIBkeKOq+25/g0d/Lll1XPuDc5Y=@vger.kernel.org, AJvYcCWuZXIWajfhz+Foj85D8A7z+AwXHgJk2HryYA9J1EJsBOX6pkl0AZJux+wCcjt48reDL1ct1Wj4+mJMFY4Z@vger.kernel.org, AJvYcCXY6XQUo4izBMWyOHZjlgm9dRKML2HAv21+rOYhrhBFFGMQIlt6lPj25uR+KtaPgIg/u/4ThB0IYzivJla4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvx9wNnNtBfRRrdv9lkXzmBwJCKPGBBO+YcX9fMJ+vWHeq5IBX
	ga08+HElZFJGKrl+mz4Tm8LyXkILbXHmX2Kjx+CJxsQOplPhWxjj
X-Gm-Gg: ASbGncsUk2rA5kaCZEwzo5daOJgFw4gQGxRPSStSJP0MqFh6U8mi9AQJKLKt8pC2aFD
	hg58G9zpNQCbsH5wdbdPyb8Qhm3RGak/OH8WyNLEYAI5+zr8hLR55evu0rG6qLbzH+6V1psrC4m
	/U0d7pMqIEvgSbDxiY019PyxuAx9zOm96EFJ9f4GzKDBJJLtLaxfFqNzvYyLXY0E0SKf8ECegcQ
	Z55nR0vJ6qO5b3bVAldwfsxlDkLbMK8CLXR/7xwK6pEEfhAGreOtw/4iWEjUIqHVoENsN55CMYh
	gFOGzKUif4MFV71Qb4TfzycnV6edm7amIK1QBDXiEg9epXajIIt2N3pFvY0qk5UtzjnOgD7b2kJ
	kjvEoS8/nT5xW68HKoZk=
X-Google-Smtp-Source: AGHT+IGKKoZeugIMzJo9Kl0W+rcTmXvkdvQFEcCdjrL7jzz+9e7IC2DNU5xrIm+Wn0RuPWMuOADobQ==
X-Received: by 2002:a17:902:e803:b0:21f:6f33:f96 with SMTP id d9443c01a7336-2262c99c631mr107794785ad.6.1742396141855;
        Wed, 19 Mar 2025 07:55:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7260sm114891055ad.110.2025.03.19.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:40 -0700 (PDT)
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
Subject: [PATCH v2 18/34] drm/msm: Add VM_BIND submitqueue
Date: Wed, 19 Mar 2025 07:52:30 -0700
Message-ID: <20250319145425.51935-19-robdclark@gmail.com>
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

This submitqueue type isn't tied to a hw ringbuffer, but instead
executes on the CPU for performing async VM_BIND ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c         |   3 +-
 drivers/gpu/drm/msm/msm_gem.h         |  10 ++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 128 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_vma.c     | 107 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |   3 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  57 +++++++++---
 include/uapi/drm/msm_drm.h            |   9 +-
 7 files changed, 287 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a5220b6f21d..4c68a3dd3fed 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -232,8 +232,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj,
-					      unsigned madv)
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8e29e36ca9c5..d427ead2dce0 100644
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
 
+void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
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
index bb61231ab8ba..39a6e0418bdf 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -23,6 +23,11 @@
 #define SUBMIT_ERROR(err, submit, fmt, ...) \
 	UERR(err, (submit)->dev, fmt, ##__VA_ARGS__)
 
+static bool submit_is_vmbind(struct msm_gem_submit *submit)
+{
+	return !!(submit->queue->flags & MSM_SUBMITQUEUE_VM_BIND);
+}
+
 /*
  * Cmdstream submission:
  */
@@ -115,6 +120,17 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	kfree(submit);
 }
 
+static bool invalid_bo_flags(bool vm_bind, uint32_t flags)
+{
+	if (vm_bind) {
+		return flags & ~(MSM_SUBMIT_BO_DUMP | MSM_SUBMIT_BO_OP_MASK);
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
@@ -129,9 +145,10 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
 	unsigned i, bo_stride = args->bos_stride;
+	bool vm_bind = submit_is_vmbind(submit);
 	int ret = 0;
 
-	if (!bo_stride)
+	if (!bo_stride || !vm_bind)
 		bo_stride = sizeof(struct drm_msm_gem_submit_bo);
 
 	for (i = 0; i < args->nr_bos; i++) {
@@ -151,11 +168,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
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
@@ -174,6 +187,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
+		submit->bos[i].iova = submit_bo.address;
 		submit->bos[i].bo_offset = submit_bo.bo_offset;
 		submit->bos[i].range = submit_bo.range;
 	}
@@ -183,6 +197,12 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
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
@@ -297,13 +317,22 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
+	bool vm_bind = submit_is_vmbind(submit);
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	int ret;
 
-	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
+	if (vm_bind)
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
@@ -372,6 +401,28 @@ static int submit_pin_vmas(struct msm_gem_submit *submit)
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
@@ -385,7 +436,12 @@ static void submit_pin_objects(struct msm_gem_submit *submit)
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
 
@@ -400,6 +456,9 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		msm_gem_unpin_locked(obj);
 	}
 
@@ -413,6 +472,9 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_WRITE);
@@ -708,6 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	unsigned cmds_to_parse;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -724,9 +787,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
 		return UERR(EINVAL, dev, "invalid pipe");
 
-	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS)
-		return UERR(EINVAL, dev, "invalid flags");
-
 	if (args->flags & MSM_SUBMIT_SUDO) {
 		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
 		    !capable(CAP_SYS_RAWIO))
@@ -737,6 +797,26 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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
@@ -813,19 +893,37 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT)) {
+	if (msm_context_is_vmbind(ctx) && !submit_is_vmbind(submit)) {
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
+	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT) && !submit_is_vmbind(submit)) {
 		ret = submit_fence_sync(submit);
 		if (ret)
 			goto out;
 	}
 
-	ret = submit_pin_vmas(submit);
+	if (submit_is_vmbind(submit)) {
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
 
@@ -856,7 +954,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = i;
+	submit->nr_cmds = args->nr_cmds;
 
 	idr_preload(GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0bc22618e9f0..8c780dd6a936 100644
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
@@ -198,6 +262,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		goto err_free_vm;
 	}
 
+	if (!managed) {
+		struct drm_sched_init_args args = {
+			.ops = &msm_vm_bind_ops,
+			.num_rqs = 1,
+			.credit_limit = 1,
+			.timeout = MAX_SCHEDULE_TIMEOUT,
+			.name = "msm-vm-bind",
+			.dev = drm->dev,
+		};
+
+		ret = drm_sched_init(&vm->sched, &args);
+		if (ret)
+			goto err_free_dummy;
+	}
+
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -212,8 +291,36 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
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
+ * @gpuvm: The VM to close
+ *
+ * Called when the drm device file is closed, to tear down VM related resources
+ * (which will drop refcounts to GEM objects that were still mapped into the
+ * VM at the time).
+ */
+void
+msm_gem_vm_close(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
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
index 20f52d9636b0..49c8862ada13 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -562,6 +562,9 @@ struct msm_gpu_submitqueue {
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
2.48.1


