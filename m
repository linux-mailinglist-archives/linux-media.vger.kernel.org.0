Return-Path: <linux-media+bounces-50678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9BD1E0FB
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8357D3035055
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0253C38A9CE;
	Wed, 14 Jan 2026 10:30:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615393570D6
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386657; cv=none; b=R5WJZP8gfynLQ2fNv2kEZ4GfvRD8vLAhYGyzOYfuZPNZyqLwR/rHKLV+Ofri+kvgiDho1ZemoQM7oXT8wNrxFzBNc15f1x+VQUWtZBKybtr5kKreTA/4HcKyx3lzBA6zWRI8l5F+ap5WMuH/j9Hr8S9R2VUn5MIR5BP4qll2SIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386657; c=relaxed/simple;
	bh=VEkE3Eq8eZveoDAh2lolAC5T+pbWPvafVOst83XHu0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cj8QG2nudRU/U3tT2w7SZ6phUYdjKVy7eS7F7xC/5zSKSimUGcm3OM+iVoofEedJ+z8mtuAboezZOri7m3aGzAN2z8v48eei3HA/FMSgt4BijEhHpRpqa7TTwrzUJjLDzb+di/20CkRu4H2A5PaYaVQ0djFv40Q/Wp2NsxafNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b874c00a3fcso217934366b.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386654; x=1768991454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=co7I4okWZTaQdP5UOMt0Lhq59LKi7MnNaM/o9aEj64I=;
        b=oCVB5bBroz8cTPXDRRzzZBYpdASRhyQlIcjiepoV6Gd+vKvkQf0EGL0Y8l6HdjGkp7
         2XGwOsK1Q4zosSA/FbmLleDqZZGMn/mhS6e0J8A0wNnqRi8Fzd4nmycpbvq1+GY2/g0q
         9JzcDZLoEPKtII6LTERHqxwiupmtEbsmVg114JNv/FL6t4gciHc0x1pTUyg47+QOegeC
         xteNebZ9+/uedRa43vDnyemw7Hjosmf7ID/H1Ku66+FFg7wu29HAjN4S9kkeMB7iW3e6
         EmYxouWylWhhNbmsgKc3c0iP6tCRCSBX8oFgywXkiUUFxFoaUZfTd9Onah5aEIDyBQDZ
         cXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsLUP/SM/3HrkZljDIbLuiHmPqzIIxU6Yu+Fb9ooB0nupHbmaT2r1Gn54NBBqv1+lDXwZM8F/l0KGq2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhOn3QXOmfn/EKwrwVAxcmJkbvFZaBGgLmBI65scuxFtJtovD
	GfCH9tr7k7P+f0qW+y+TmCsXPY1VpJe7w0VU9GiBmiDcubK5CPfTcqts
X-Gm-Gg: AY/fxX6AQhW6D+ebzhdY2ifTMjR/fz5ohmvOP+uNF65atnwhm6encg8DH7mQ6HoyIth
	Q4uIL4OsIF+FEuYkl2nFqXq4dzEoZXqxVAihHrFBEPm04OvZsHBYnrtFb77rE6wrlYKRMAhWSVs
	xV1THh8SozuFAYGO7w74capEXynWfDtTRWPV/nElFuJwVXhkSWbgY8HvA/wre5LAQT53FdJiXlT
	8ML9XmyY/tjwyzw8xs2GEse6LhxP9uRjpHgszhA5AwageVI50kJ3KcLizBC/nQs3U/I5eoqGMgD
	DCIOc3IZqahPM2WMi0V1EHWLUswZdxvg2Bae530k9EGxPztHfwFM91IoS3fMlMh945nLHchMM95
	sGtYmz/RmwftgcEoQOVxRIr0IggEEcPJKqJW11k1v/kZHUEBZcyJu32+u0mGRM56Yx/xkTD2Mf+
	ShY8Qnl/cbR1Qbh8GFK1Y18hGtBspi46Mp6Znkkk736X1IPvh6tkRo+oUE
X-Received: by 2002:a05:6402:3492:b0:64d:2822:cf68 with SMTP id 4fb4d7f45d1cf-653ec44ad5bmr1354163a12.21.1768380442622;
        Wed, 14 Jan 2026 00:47:22 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:22 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:51 +0100
Subject: [PATCH v2 4/5] accel/thames: Add IOCTL for job submission
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-4-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

Using the DRM GPU scheduler infrastructure, with a scheduler for each
core.

Contexts are created in all cores, and buffers mapped to all of them as
well, so all cores are ready to execute any job.

The job submission code was initially based on Panfrost.

v2:
- Add thames_accel.h UAPI header (Robert Nelson).

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/Makefile       |   1 +
 drivers/accel/thames/thames_core.c  |   6 +
 drivers/accel/thames/thames_drv.c   |  19 ++
 drivers/accel/thames/thames_job.c   | 463 ++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_job.h   |  51 ++++
 drivers/accel/thames/thames_rpmsg.c |  52 ++++
 include/uapi/drm/thames_accel.h     |  54 +++++
 7 files changed, 646 insertions(+)

diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
index 0051e319f2e4966de72bc342d5b6e40b2890c006..b6c4516f8250e3d442f22e80d609cb1be2970128 100644
--- a/drivers/accel/thames/Makefile
+++ b/drivers/accel/thames/Makefile
@@ -7,4 +7,5 @@ thames-y := \
 	thames_device.o \
 	thames_drv.o \
 	thames_gem.o \
+	thames_job.o \
 	thames_rpmsg.o
diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
index 92af1d68063116bcfa28a33960cbe829029fc1bf..5b96b25d287096803e034fcd4261d51795871543 100644
--- a/drivers/accel/thames/thames_core.c
+++ b/drivers/accel/thames/thames_core.c
@@ -13,6 +13,7 @@
 
 #include "thames_core.h"
 #include "thames_device.h"
+#include "thames_job.h"
 #include "thames_rpmsg.h"
 
 /* Shift to convert bytes to megabytes (divide by 1048576) */
@@ -115,11 +116,16 @@ int thames_core_init(struct thames_core *core)
 	if (err)
 		return err;
 
+	err = thames_job_init(core);
+	if (err)
+		return err;
+
 	return 0;
 }
 
 void thames_core_fini(struct thames_core *core)
 {
+	thames_job_fini(core);
 	thames_rpmsg_fini(core);
 }
 
diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index d9ea2cab80e89cd13b1422a17635a15b7f16fa4f..1ff01428e6c80765cb741ae45c67971b7b0f28c8 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -14,6 +14,7 @@
 #include "thames_drv.h"
 #include "thames_core.h"
 #include "thames_gem.h"
+#include "thames_job.h"
 #include "thames_ipc.h"
 
 static struct platform_device *drm_dev;
@@ -38,8 +39,22 @@ static int thames_open(struct drm_device *dev, struct drm_file *file)
 
 	file->driver_priv = thames_priv;
 
+	ret = thames_job_open(thames_priv);
+	if (ret)
+		goto err_free;
+
+	ret = thames_context_create(thames_priv);
+	if (ret) {
+		dev_err(dev->dev, "Failed to create context for client: %d", ret);
+		goto err_close_job;
+	}
+
 	return 0;
 
+err_close_job:
+	thames_job_close(thames_priv);
+err_free:
+	kfree(thames_priv);
 err_put_mod:
 	module_put(THIS_MODULE);
 	return ret;
@@ -49,6 +64,9 @@ static void thames_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct thames_file_priv *thames_priv = file->driver_priv;
 
+	thames_context_destroy(thames_priv);
+
+	thames_job_close(thames_priv);
 	kfree(thames_priv);
 	module_put(THIS_MODULE);
 }
@@ -57,6 +75,7 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 #define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
+	THAMES_IOCTL(SUBMIT, submit),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_job.c b/drivers/accel/thames/thames_job.c
new file mode 100644
index 0000000000000000000000000000000000000000..bd8f8fa1783cf10c5e71c8f2ce5fcc880a9b150b
--- /dev/null
+++ b/drivers/accel/thames/thames_job.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2019 Collabora ltd. */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include "linux/dev_printk.h"
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_print.h>
+#include <drm/thames_accel.h>
+#include <linux/platform_device.h>
+
+#include "thames_core.h"
+#include "thames_device.h"
+#include "thames_drv.h"
+#include "thames_gem.h"
+#include "thames_job.h"
+#include "thames_rpmsg.h"
+
+#define JOB_TIMEOUT_MS 500
+
+static struct thames_job *to_thames_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct thames_job, base);
+}
+
+static const char *thames_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "thames";
+}
+
+static const char *thames_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "thames";
+}
+
+static const struct dma_fence_ops thames_fence_ops = {
+	.get_driver_name = thames_fence_get_driver_name,
+	.get_timeline_name = thames_fence_get_timeline_name,
+};
+
+static struct dma_fence *thames_fence_create(struct thames_core *core)
+{
+	struct dma_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence, &thames_fence_ops, &core->fence_lock, core->fence_context,
+		       ++core->emit_seqno);
+
+	return fence;
+}
+
+static void thames_job_hw_submit(struct thames_core *core, struct thames_job *job)
+{
+	int ret;
+
+	/* Don't queue the job if a reset is in progress */
+	if (atomic_read(&core->reset.pending))
+		return;
+
+	ret = thames_rpmsg_send_submit_job(core, job->file_priv->context_id, job->job_id,
+					   to_thames_bo(job->kernel)->iova, job->kernel_size,
+					   to_thames_bo(job->params)->iova, job->params_size,
+					   &job->ipc_sequence);
+
+	if (ret) {
+		dev_err(core->dev, "Failed to submit kernel to DSP core %d\n", core->index);
+		return;
+	}
+}
+
+static int thames_acquire_object_fences(struct drm_gem_object **bos, int bo_count,
+					struct drm_sched_job *job, bool is_write)
+{
+	int i, ret;
+
+	for (i = 0; i < bo_count; i++) {
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
+		if (ret)
+			return ret;
+
+		ret = drm_sched_job_add_implicit_dependencies(job, bos[i], is_write);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void thames_attach_object_fences(struct drm_gem_object **bos, int bo_count,
+					struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+}
+
+static int thames_job_push(struct thames_job *job)
+{
+	struct thames_device *tdev = job->tdev;
+	struct drm_gem_object **bos;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret = 0;
+
+	dev_dbg(tdev->ddev.dev, "Pushing job with %u in BOs and %u out BOs\n", job->in_bo_count,
+		job->out_bo_count);
+	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *), GFP_KERNEL);
+	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
+	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
+
+	ret = drm_gem_lock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+	if (ret)
+		goto err;
+
+	scoped_guard(mutex, &tdev->sched_lock)
+	{
+		drm_sched_job_arm(&job->base);
+
+		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+		ret = thames_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base,
+						   false);
+		if (ret)
+			goto err_unlock;
+
+		ret = thames_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base,
+						   true);
+		if (ret)
+			goto err_unlock;
+
+		kref_get(&job->refcount); /* put by scheduler job completion */
+
+		drm_sched_entity_push_job(&job->base);
+	}
+
+	thames_attach_object_fences(job->out_bos, job->out_bo_count, job->inference_done_fence);
+
+err_unlock:
+	drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+err:
+	kvfree(bos);
+
+	return ret;
+}
+
+static void thames_job_cleanup(struct kref *ref)
+{
+	struct thames_job *job = container_of(ref, struct thames_job, refcount);
+	struct thames_device *tdev = job->tdev;
+	unsigned int i;
+
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->inference_done_fence);
+
+	ida_free(&tdev->job_ida, job->job_id);
+
+	if (job->kernel)
+		drm_gem_object_put(job->kernel);
+
+	if (job->params)
+		drm_gem_object_put(job->params);
+
+	if (job->in_bos) {
+		for (i = 0; i < job->in_bo_count; i++)
+			drm_gem_object_put(job->in_bos[i]);
+
+		kvfree(job->in_bos);
+	}
+
+	if (job->out_bos) {
+		for (i = 0; i < job->out_bo_count; i++)
+			drm_gem_object_put(job->out_bos[i]);
+
+		kvfree(job->out_bos);
+	}
+
+	kfree(job);
+}
+
+static void thames_job_put(struct thames_job *job)
+{
+	kref_put(&job->refcount, thames_job_cleanup);
+}
+
+static void thames_job_free(struct drm_sched_job *sched_job)
+{
+	struct thames_job *job = to_thames_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+
+	thames_job_put(job);
+}
+
+static struct thames_core *sched_to_core(struct thames_device *tdev,
+					 struct drm_gpu_scheduler *sched)
+{
+	unsigned int core;
+
+	for (core = 0; core < tdev->num_cores; core++) {
+		if (&tdev->cores[core].sched == sched)
+			return &tdev->cores[core];
+	}
+
+	return NULL;
+}
+
+static struct dma_fence *thames_job_run(struct drm_sched_job *sched_job)
+{
+	struct thames_job *job = to_thames_job(sched_job);
+	struct thames_device *tdev = job->tdev;
+	struct thames_core *core = sched_to_core(tdev, sched_job->sched);
+	struct dma_fence *fence = NULL;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	fence = thames_fence_create(core);
+	if (IS_ERR(fence))
+		return fence;
+
+	if (job->done_fence)
+		dma_fence_put(job->done_fence);
+	job->done_fence = dma_fence_get(fence);
+
+	scoped_guard(mutex, &core->job_lock)
+	{
+		core->in_flight_job = job;
+		thames_job_hw_submit(core, job);
+	}
+
+	return fence;
+}
+
+static void thames_reset(struct thames_core *core, struct drm_sched_job *bad)
+{
+	if (!atomic_read(&core->reset.pending))
+		return;
+
+	drm_sched_stop(&core->sched, bad);
+	scoped_guard(mutex, &core->job_lock) core->in_flight_job = NULL;
+	thames_core_reset(core);
+	atomic_set(&core->reset.pending, 0);
+	drm_sched_start(&core->sched, 0);
+}
+
+static enum drm_gpu_sched_stat thames_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct thames_job *job = to_thames_job(sched_job);
+	struct thames_device *tdev = job->tdev;
+	struct thames_core *core = sched_to_core(tdev, sched_job->sched);
+
+	if (!core) {
+		dev_err(tdev->ddev.dev, "Failed to find core for timed out job\n");
+		return DRM_GPU_SCHED_STAT_NONE;
+	}
+
+	dev_err(core->dev, "Job %u timed out on DSP core %d\n", job->job_id, core->index);
+
+	atomic_set(&core->reset.pending, 1);
+	thames_reset(core, sched_job);
+
+	return DRM_GPU_SCHED_STAT_RESET;
+}
+
+static void thames_reset_work(struct work_struct *work)
+{
+	struct thames_core *core;
+
+	core = container_of(work, struct thames_core, reset.work);
+	thames_reset(core, NULL);
+}
+
+static const struct drm_sched_backend_ops thames_sched_ops = { .run_job = thames_job_run,
+							       .timedout_job = thames_job_timedout,
+							       .free_job = thames_job_free };
+
+int thames_job_init(struct thames_core *core)
+{
+	struct drm_sched_init_args args = {
+		.ops = &thames_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.name = dev_name(core->dev),
+		.dev = core->dev,
+	};
+	int ret;
+
+	INIT_WORK(&core->reset.work, thames_reset_work);
+	spin_lock_init(&core->fence_lock);
+	mutex_init(&core->job_lock);
+
+	core->reset.wq = alloc_ordered_workqueue("thames-reset-%d", 0, core->index);
+	if (!core->reset.wq)
+		return -ENOMEM;
+
+	core->fence_context = dma_fence_context_alloc(1);
+
+	args.timeout_wq = core->reset.wq;
+	ret = drm_sched_init(&core->sched, &args);
+	if (ret) {
+		dev_err(core->dev, "Failed to create scheduler: %d.", ret);
+		destroy_workqueue(core->reset.wq);
+		return ret;
+	}
+
+	return 0;
+}
+
+void thames_job_fini(struct thames_core *core)
+{
+	drm_sched_fini(&core->sched);
+
+	cancel_work_sync(&core->reset.work);
+	destroy_workqueue(core->reset.wq);
+}
+
+int thames_job_open(struct thames_file_priv *thames_priv)
+{
+	struct thames_device *tdev = thames_priv->tdev;
+	struct drm_gpu_scheduler **scheds =
+		kmalloc_array(tdev->num_cores, sizeof(*scheds), GFP_KERNEL);
+	unsigned int core;
+	int ret;
+
+	for (core = 0; core < tdev->num_cores; core++)
+		scheds[core] = &tdev->cores[core].sched;
+
+	ret = drm_sched_entity_init(&thames_priv->sched_entity, DRM_SCHED_PRIORITY_NORMAL, scheds,
+				    tdev->num_cores, NULL);
+	if (WARN_ON(ret))
+		return ret;
+
+	return 0;
+}
+
+void thames_job_close(struct thames_file_priv *thames_priv)
+{
+	struct drm_sched_entity *entity = &thames_priv->sched_entity;
+
+	kfree(entity->sched_list);
+	drm_sched_entity_destroy(entity);
+}
+
+static int thames_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
+				   struct drm_thames_job *job)
+{
+	struct thames_device *tdev = to_thames_device(dev);
+	struct thames_file_priv *file_priv = file->driver_priv;
+	struct thames_job *tjob = NULL;
+	int ret = 0;
+
+	tjob = kzalloc(sizeof(*tjob), GFP_KERNEL);
+	if (!tjob)
+		return -ENOMEM;
+
+	kref_init(&tjob->refcount);
+
+	tjob->tdev = tdev;
+	tjob->file_priv = file_priv;
+
+	tjob->job_id = ida_alloc_min(&tdev->job_ida, 1, GFP_KERNEL);
+	if (tjob->job_id < 0)
+		goto out_put_job;
+
+	ret = drm_sched_job_init(&tjob->base, &file_priv->sched_entity, 1, NULL, file->client_id);
+	if (ret)
+		goto out_put_job;
+
+	tjob->kernel = drm_gem_object_lookup(file, job->kernel);
+	if (!tjob->kernel) {
+		ret = -ENOENT;
+		goto out_cleanup_job;
+	}
+
+	tjob->kernel_size = job->kernel_size;
+
+	if (job->params) {
+		tjob->params = drm_gem_object_lookup(file, job->params);
+		if (!tjob->params) {
+			ret = -ENOENT;
+			goto out_cleanup_job;
+		}
+		tjob->params_size = job->params_size;
+	}
+
+	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
+				     job->in_bo_handle_count, &tjob->in_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	tjob->in_bo_count = job->in_bo_handle_count;
+
+	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
+				     job->out_bo_handle_count, &tjob->out_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	tjob->out_bo_count = job->out_bo_handle_count;
+
+	ret = thames_job_push(tjob);
+
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&tjob->base);
+out_put_job:
+	thames_job_put(tjob);
+
+	return ret;
+}
+
+#define THAMES_MAX_JOBS_PER_SUBMIT 256
+
+int thames_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_thames_submit *args = data;
+	struct drm_thames_job *jobs;
+	size_t jobs_size;
+	int ret = 0;
+	unsigned int i = 0;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (args->job_count == 0)
+		return -EINVAL;
+
+	if (args->job_count > THAMES_MAX_JOBS_PER_SUBMIT) {
+		dev_err(dev->dev, "Job count %u exceeds maximum %u\n", args->job_count,
+			THAMES_MAX_JOBS_PER_SUBMIT);
+		return -EINVAL;
+	}
+
+	jobs_size = array_size(args->job_count, sizeof(*jobs));
+	if (jobs_size == SIZE_MAX)
+		return -EINVAL;
+
+	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs)
+		return -ENOMEM;
+
+	if (copy_from_user(jobs, u64_to_user_ptr(args->jobs), jobs_size)) {
+		ret = -EFAULT;
+		drm_dbg(dev, "Failed to copy incoming job array\n");
+		goto exit;
+	}
+
+	for (i = 0; i < args->job_count; i++) {
+		ret = thames_ioctl_submit_job(dev, file, &jobs[i]);
+		if (ret)
+			break;
+	}
+
+exit:
+	kvfree(jobs);
+
+	return ret;
+}
diff --git a/drivers/accel/thames/thames_job.h b/drivers/accel/thames/thames_job.h
new file mode 100644
index 0000000000000000000000000000000000000000..3bfd2c779d9b783624a25e6d06368f3e1daf569e
--- /dev/null
+++ b/drivers/accel/thames/thames_job.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_JOB_H__
+#define __THAMES_JOB_H__
+
+#include <drm/drm_drv.h>
+#include <drm/gpu_scheduler.h>
+
+#include "thames_core.h"
+#include "thames_drv.h"
+
+struct thames_job {
+	struct drm_sched_job base;
+
+	struct thames_device *tdev;
+	struct thames_file_priv *file_priv;
+
+	u32 job_id;
+	u32 ipc_sequence;
+
+	struct drm_gem_object *kernel;
+	size_t kernel_size;
+
+	struct drm_gem_object *params;
+	size_t params_size;
+
+	struct drm_gem_object **in_bos;
+	u32 in_bo_count;
+
+	struct drm_gem_object **out_bos;
+	u32 out_bo_count;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *inference_done_fence;
+
+	/* Fence to be signaled by rpmsg handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	struct kref refcount;
+};
+
+int thames_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int thames_job_init(struct thames_core *core);
+void thames_job_fini(struct thames_core *core);
+int thames_job_open(struct thames_file_priv *thames_priv);
+void thames_job_close(struct thames_file_priv *thames_priv);
+
+#endif
diff --git a/drivers/accel/thames/thames_rpmsg.c b/drivers/accel/thames/thames_rpmsg.c
index a25465295a177877c5ca2b3c93f52d8288863797..9747690e0f84fe00d605ad0e708d597da2240d97 100644
--- a/drivers/accel/thames/thames_rpmsg.c
+++ b/drivers/accel/thames/thames_rpmsg.c
@@ -11,6 +11,7 @@
 #include "thames_core.h"
 #include "thames_device.h"
 #include "thames_ipc.h"
+#include "thames_job.h"
 
 #define THAMES_PING_TEST_PATTERN 0xDEADBEEF
 #define THAMES_PING_TIMEOUT_MS 5000
@@ -71,6 +72,36 @@ static int thames_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int len
 		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
 		break;
 
+	case THAMES_MSG_SUBMIT_JOB_RESPONSE: {
+		struct thames_job *job;
+
+		scoped_guard(mutex, &core->job_lock)
+		{
+			job = core->in_flight_job;
+			if (!job) {
+				dev_err(&rpdev->dev,
+					"Received job response but no job in flight\n");
+				ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+				return -EINVAL;
+			}
+
+			if (hdr->seq != job->ipc_sequence) {
+				dev_err(&rpdev->dev,
+					"Job response sequence mismatch: got %u, expected %u\n",
+					hdr->seq, job->ipc_sequence);
+				ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+				return -EINVAL;
+			}
+
+			dma_fence_signal(job->done_fence);
+			core->in_flight_job = NULL;
+		}
+
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+
+		break;
+	}
+
 	default:
 		dev_warn(&rpdev->dev, "Unknown message type: %u\n", hdr->type);
 		break;
@@ -191,6 +222,27 @@ int thames_rpmsg_send_unmap_bo(struct thames_core *core, u32 context_id, u32 bo_
 	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
 }
 
+int thames_rpmsg_send_submit_job(struct thames_core *core, u32 context_id, u32 job_id,
+				 u64 kernel_iova, u64 kernel_size, u64 args_iova, u64 args_size,
+				 u32 *sequence)
+{
+	struct thames_msg_submit_job msg = {};
+
+	msg.hdr.type = THAMES_MSG_SUBMIT_JOB;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.context_id = context_id;
+	msg.job_id = job_id;
+	msg.kernel_iova = kernel_iova;
+	msg.kernel_size = kernel_size;
+	msg.args_iova = args_iova;
+	msg.args_size = args_size;
+
+	*sequence = msg.hdr.seq;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
 int thames_rpmsg_ping_test(struct thames_core *core)
 {
 	const u32 test_data = THAMES_PING_TEST_PATTERN;
diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
index 0a5a5e5f6637ab474e9effbb6db29c1dd95e56b5..5b35e50826ed95bfcc3709bef33416d2b6d11c70 100644
--- a/include/uapi/drm/thames_accel.h
+++ b/include/uapi/drm/thames_accel.h
@@ -28,6 +28,9 @@ enum drm_thames_ioctl_id {
 	 * mmap to map a GEM object.
 	 */
 	DRM_THAMES_BO_MMAP_OFFSET,
+
+	/** @DRM_THAMES_SUBMIT: Submit a job and BOs to run. */
+	DRM_THAMES_SUBMIT,
 };
 
 /**
@@ -75,6 +78,55 @@ struct drm_thames_bo_mmap_offset {
 	__u64 offset;
 };
 
+/**
+ * struct drm_thames_job - A job to be run on the NPU
+ *
+ * The kernel will schedule the execution of this job taking into account its
+ * dependencies with other jobs. All tasks in the same job will be executed
+ * sequentially on the same core, to benefit from memory residency in SRAM.
+ */
+struct drm_thames_job {
+	/** Input: BO handle for kernel. */
+	__u32 kernel;
+
+	/** Input: Size in bytes of the compiled kernel. */
+	__u32 kernel_size;
+
+	/** Input: BO handle for params BO. */
+	__u32 params;
+
+	/** Input: Size in bytes of the params BO. */
+	__u32 params_size;
+
+	/** Input: Pointer to a u32 array of the BOs that are read by the job. */
+	__u64 in_bo_handles;
+
+	/** Input: Pointer to a u32 array of the BOs that are written to by the job. */
+	__u64 out_bo_handles;
+
+	/** Input: Number of input BO handles passed in (size is that times 4). */
+	__u32 in_bo_handle_count;
+
+	/** Input: Number of output BO handles passed in (size is that times 4). */
+	__u32 out_bo_handle_count;
+};
+
+/**
+ * struct drm_thames_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_thames_submit {
+	/** Input: Pointer to an array of struct drm_thames_job. */
+	__u64 jobs;
+
+	/** Input: Number of jobs passed in. */
+	__u32 job_count;
+
+	/** Reserved, must be zero. */
+	__u32 pad;
+};
+
 /**
  * DRM_IOCTL_THAMES() - Build a thames IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -95,6 +147,8 @@ enum {
 		DRM_IOCTL_THAMES(WR, BO_CREATE, bo_create),
 	DRM_IOCTL_THAMES_BO_MMAP_OFFSET =
 		DRM_IOCTL_THAMES(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_THAMES_SUBMIT =
+		DRM_IOCTL_THAMES(WR, SUBMIT, submit),
 };
 
 #if defined(__cplusplus)

-- 
2.52.0


