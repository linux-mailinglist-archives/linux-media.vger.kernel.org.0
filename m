Return-Path: <linux-media+bounces-26902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DDA436AF
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AFBF17B73B
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE79825EFA7;
	Tue, 25 Feb 2025 07:56:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848225E479;
	Tue, 25 Feb 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470179; cv=none; b=e8XmOdfiphKm1DvJnyea6R7wjAQkQQPW8qkMMRETVCqYFpSZPtioGIlCYkBi7ZnLL7SOW8akHjnGJjteIt5nuTGHqQclHUl2UXFtRP9dX2zKETa2evaBGcZixg1AO2f2PfaeP17ltl/psfWUtCgazQnXm8DUSfyzkf4vG4txuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470179; c=relaxed/simple;
	bh=TsQ2q2SsE/HTtLUourYc5V9Hd4tEPFXCrTJJad7pk1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pdwud9GqaSBAiFLWDgJHxm2/we1RuGeXsgSYU2l6vqkMOFD6l/KcDLyr3zjkUhgTFwdH3Nzep/atDcwY/Q1kke6Tefpw5vE/EFhV5U1EvgqMuUZ+7w0KhqV66X2OJbiQlyKWohfHbtsrvBhCiVKGl6L1ULnFswwMLml9GjuF0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4397dff185fso45918995e9.2;
        Mon, 24 Feb 2025 23:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470174; x=1741074974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8M9oXvZiUou47XKCcHVDbFoUOcZ0JEmOMQ8wFDLo4lI=;
        b=K1E+GAxElvo79mN41NNhDlNShxQmsndD3xR/4V6yfUQt5+DhOssrQKi+zc/nAk4rn5
         +HdmWyzdu55mQulUQmV0unZaWlZwWx3o5VT3NOyYhFOT5ue4pOURXbUR2aI/x1jZPSuw
         JeHedggkntFIiBXsEbHJqsRP6zqPE2C9+FKachizfi63e/81v3eM7STuLQG7CX41bli0
         Sglmj9RirazX1YEPWjOJVqt3wUi0j6U0fm9ZjaknK6JEn6u0aEkOXSu21GxtlvF5xegZ
         NjU9Dkh3O3+Here5obexsbQgbBihKszlaMaEmqw/Ea01qSK/NWVfHCA56bUwSjACXLWY
         tjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNpRCaqe5eesqCPqx3oVXG1AK7X5M21pa+dpZprlfLHj82OpRUyvQGvidRBmxEewABIwbjsGFNteX5S6c=@vger.kernel.org, AJvYcCXkFOtUp146697TWELu/k6EEDWPgI8C9qWJ8McOpHaKbW+WjEiq3pc0d8/KwCgXtWw2RD3TpTXSnpo=@vger.kernel.org, AJvYcCXu6+NtjavQO8s6XmGKIpq/AtgY8McCHn/zYNKkFLotvxC+2ZKcYjdDww2D24CJ/SHnXAD6XV0kQlkiDIvN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CaH0WZ/TvCa6f+1d+QDcv0mihs6iTn+5XzStybwX/P5GVplH
	JLgpcc9gG0jsF6YalZMy7vStx8LeWYOVodhg0uyUDfOVZXJfreES
X-Gm-Gg: ASbGncurGBnEwXX04PGNJsDQaU31WY7H/TSnhafpDcAOntPDwfUiLYZqnmeQJ4X8yn7
	I526ibn8l+7BNqUCk/A2ha2uNwPaPo5WVdd2+QT5fde4Hw0Qerr+nc/vSWVKsGUm8P3Ua7xwnvq
	me6SU70RMsb43k+KH0GtxI+AR4N5frZ89uBW3BJt8WRAl1+FydJ/YeqW04sFWGodOOH/MR0CKij
	FDM2Ku8JsN61sWkVFxLmBn1gRmUpoDTh/oTjlfarCLnCYQq2iNw5iVvcrVdmOnjJicJYfQmjvd2
	RLTcfxYJDb8nP3wyGpHqJxy9qhE/uo4Hpi3WodGED0fS5S9wT22JFJM/EQ==
X-Google-Smtp-Source: AGHT+IHwBTicXUpbqwWUPSs/T1dwfdrvCMx/gZdQ3WVe4vasGVVR3VYFVOwJpOaLDvPu0HP1D9X3nw==
X-Received: by 2002:a05:600c:46d1:b0:439:89d1:30ec with SMTP id 5b1f17b1804b1-439ae221701mr120222535e9.29.1740470173573;
        Mon, 24 Feb 2025 23:56:13 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:13 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:52 +0100
Subject: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

Using the DRM GPU scheduler infrastructure, with a scheduler for each
core.

Userspace can decide for a series of tasks to be executed sequentially
in the same core, so SRAM locality can be taken advantage of.

The job submission code was initially based on Panfrost.

v2:
- Remove hardcoded number of cores
- Misc. style fixes (Jeffrey Hugo)
- Repack IOCTL struct (Jeffrey Hugo)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_core.c   |   6 +
 drivers/accel/rocket/rocket_core.h   |  14 +
 drivers/accel/rocket/rocket_device.c |   2 +
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |  15 +
 drivers/accel/rocket/rocket_drv.h    |   4 +
 drivers/accel/rocket/rocket_job.c    | 710 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_job.h    |  50 +++
 include/uapi/drm/rocket_accel.h      |  55 +++
 10 files changed, 860 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index 875cac2243d902694e0d5d05e60b4ae551a633c4..4d59036af8d9c213d3cac0559eb66e3ebb0320e7 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -6,4 +6,5 @@ rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
 	rocket_drv.o \
-	rocket_gem.o
+	rocket_gem.o \
+	rocket_job.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 09d966c826b5b1090a18cb24b3aa4aba286a12d4..2b522592693874eed90463e8f85653d5282ae5b8 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -6,6 +6,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_core.h"
+#include "rocket_job.h"
 #include "rocket_registers.h"
 
 static int rocket_clk_init(struct rocket_core *core)
@@ -48,6 +49,10 @@ int rocket_core_init(struct rocket_core *core)
 	if (IS_ERR(core->iomem))
 		return PTR_ERR(core->iomem);
 
+	err = rocket_job_init(core);
+	if (err)
+		return err;
+
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 50); /* ~3 frames */
 	pm_runtime_enable(dev);
@@ -68,4 +73,5 @@ int rocket_core_init(struct rocket_core *core)
 void rocket_core_fini(struct rocket_core *core)
 {
 	pm_runtime_disable(core->dev);
+	rocket_job_fini(core);
 }
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 2171eba7139ccc63fe24802dc81b4adb7f3abf31..045a46a2010a2ffd6122ed86c379e5fabc70365a 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -21,6 +21,20 @@ struct rocket_core {
 	void __iomem *iomem;
 	struct clk *a_clk;
 	struct clk *h_clk;
+
+	struct rocket_job *in_flight_job;
+
+	spinlock_t job_lock;
+
+	struct {
+		struct workqueue_struct *wq;
+		struct work_struct work;
+		atomic_t pending;
+	} reset;
+
+	struct drm_gpu_scheduler sched;
+	u64 fence_context;
+	u64 emit_seqno;
 };
 
 int rocket_core_init(struct rocket_core *core);
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 9af36357caba7148dcac764c8222699f3b572d60..62c640e1e0200fe25b6834e45d71f6de139ff3ab 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -12,6 +12,7 @@ int rocket_device_init(struct rocket_device *rdev)
 	int err;
 
 	mutex_init(&rdev->iommu_lock);
+	mutex_init(&rdev->sched_lock);
 
 	rdev->clk_npu = devm_clk_get(dev, "npu");
 	rdev->pclk = devm_clk_get(dev, "pclk");
@@ -29,5 +30,6 @@ int rocket_device_init(struct rocket_device *rdev)
 void rocket_device_fini(struct rocket_device *rdev)
 {
 	rocket_core_fini(&rdev->cores[0]);
+	mutex_destroy(&rdev->sched_lock);
 	mutex_destroy(&rdev->iommu_lock);
 }
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index c6152569fdd9e5587c8e8d7b0d7c2e2a77af6000..4168ae8da2d38c2ea114b37c6e053b02611a0232 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -11,6 +11,8 @@
 struct rocket_device {
 	struct drm_device ddev;
 
+	struct mutex sched_lock;
+
 	struct clk *clk_npu;
 	struct clk *pclk;
 
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index e5612b52952fa7a0cd0af02aef314984bc483b05..a6b486e2d4f648d7b1d8831590b633bf661c7bc4 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -16,12 +16,14 @@
 
 #include "rocket_drv.h"
 #include "rocket_gem.h"
+#include "rocket_job.h"
 
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_device *rdev = to_rocket_device(dev);
 	struct rocket_file_priv *rocket_priv;
+	int ret;
 
 	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
 	if (!rocket_priv)
@@ -30,7 +32,15 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	rocket_priv->rdev = rdev;
 	file->driver_priv = rocket_priv;
 
+	ret = rocket_job_open(rocket_priv);
+	if (ret)
+		goto err_free;
+
 	return 0;
+
+err_free:
+	kfree(rocket_priv);
+	return ret;
 }
 
 static void
@@ -38,6 +48,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
+	rocket_job_close(rocket_priv);
 	kfree(rocket_priv);
 }
 
@@ -46,6 +57,7 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
+	ROCKET_IOCTL(SUBMIT, submit),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -245,6 +257,9 @@ static int rocket_device_runtime_suspend(struct device *dev)
 		if (dev != rdev->cores[core].dev)
 			continue;
 
+		if (!rocket_job_is_idle(&rdev->cores[core]))
+			return -EBUSY;
+
 		clk_disable_unprepare(rdev->cores[core].a_clk);
 		clk_disable_unprepare(rdev->cores[core].h_clk);
 
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index ccdd50c69d4c033eea18cb800407fdcfb3bf2e9b..54e21a61006057aee293496016e54b495a2f6d55 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -4,10 +4,14 @@
 #ifndef __ROCKET_DRV_H__
 #define __ROCKET_DRV_H__
 
+#include <drm/gpu_scheduler.h>
+
 #include "rocket_device.h"
 
 struct rocket_file_priv {
 	struct rocket_device *rdev;
+
+	struct drm_sched_entity sched_entity;
 };
 
 #endif
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
new file mode 100644
index 0000000000000000000000000000000000000000..25b31f28e932aaee86173b9a0962932c9c640c03
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.c
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2019 Collabora ltd. */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/rocket_accel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_core.h"
+#include "rocket_device.h"
+#include "rocket_drv.h"
+#include "rocket_job.h"
+#include "rocket_registers.h"
+
+#define JOB_TIMEOUT_MS 500
+
+#define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
+#define job_read(dev, reg) readl(dev->iomem + (reg))
+
+static struct rocket_job *
+to_rocket_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct rocket_job, base);
+}
+
+struct rocket_fence {
+	struct dma_fence base;
+	struct drm_device *dev;
+	/* rocket seqno for signaled() test */
+	u64 seqno;
+	int queue;
+};
+
+static inline struct rocket_fence *
+to_rocket_fence(struct dma_fence *fence)
+{
+	return (struct rocket_fence *)fence;
+}
+
+static const char *rocket_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "rocket";
+}
+
+static const char *rocket_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "rockchip-npu";
+}
+
+static const struct dma_fence_ops rocket_fence_ops = {
+	.get_driver_name = rocket_fence_get_driver_name,
+	.get_timeline_name = rocket_fence_get_timeline_name,
+};
+
+static struct dma_fence *rocket_fence_create(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->rdev;
+	struct rocket_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	fence->dev = &rdev->ddev;
+	fence->seqno = ++core->emit_seqno;
+	dma_fence_init(&fence->base, &rocket_fence_ops, &core->job_lock,
+		       core->fence_context, fence->seqno);
+
+	return &fence->base;
+}
+
+static int
+rocket_copy_tasks(struct drm_device *dev,
+		  struct drm_file *file_priv,
+		  struct drm_rocket_job *job,
+		  struct rocket_job *rjob)
+{
+	struct drm_rocket_task *tasks;
+	int ret = 0;
+	int i;
+
+	rjob->task_count = job->task_count;
+
+	if (!rjob->task_count)
+		return 0;
+
+	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
+	if (!tasks) {
+		ret = -ENOMEM;
+		DRM_DEBUG("Failed to allocate incoming tasks\n");
+		goto fail;
+	}
+
+	if (copy_from_user(tasks,
+			   (void __user *)(uintptr_t)job->tasks,
+			   rjob->task_count * sizeof(*tasks))) {
+		ret = -EFAULT;
+		DRM_DEBUG("Failed to copy incoming tasks\n");
+		goto fail;
+	}
+
+	rjob->tasks = kvmalloc_array(job->task_count, sizeof(*rjob->tasks), GFP_KERNEL);
+	if (!rjob->tasks) {
+		DRM_DEBUG("Failed to allocate task array\n");
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	for (i = 0; i < rjob->task_count; i++) {
+		if (tasks[i].regcmd_count == 0) {
+			ret = -EINVAL;
+			goto fail;
+		}
+		rjob->tasks[i].regcmd = tasks[i].regcmd;
+		rjob->tasks[i].regcmd_count = tasks[i].regcmd_count;
+	}
+
+fail:
+	kvfree(tasks);
+	return ret;
+}
+
+static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
+{
+	struct rocket_task *task;
+	bool task_pp_en = 1;
+	bool task_count = 1;
+
+	/* GO ! */
+
+	/* Don't queue the job if a reset is in progress */
+	if (!atomic_read(&core->reset.pending)) {
+
+		task = &job->tasks[job->next_task_idx];
+		job->next_task_idx++;   /* TODO: Do this only after a successful run? */
+
+		rocket_write(core, REG_PC_BASE_ADDRESS, 0x1);
+
+		rocket_write(core, REG_CNA_S_POINTER, 0xe + 0x10000000 * core->index);
+		rocket_write(core, REG_CORE_S_POINTER, 0xe + 0x10000000 * core->index);
+
+		rocket_write(core, REG_PC_BASE_ADDRESS, task->regcmd);
+		rocket_write(core, REG_PC_REGISTER_AMOUNTS, (task->regcmd_count + 1) / 2 - 1);
+
+		rocket_write(core, REG_PC_INTERRUPT_MASK,
+			     PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
+		rocket_write(core, REG_PC_INTERRUPT_CLEAR,
+			     PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
+
+		rocket_write(core, REG_PC_TASK_CON, ((0x6 | task_pp_en) << 12) | task_count);
+
+		rocket_write(core, REG_PC_TASK_DMA_BASE_ADDR, 0x0);
+
+		rocket_write(core, REG_PC_OPERATION_ENABLE, 0x1);
+
+		dev_dbg(core->dev,
+			"Submitted regcmd at 0x%llx to core %d",
+			task->regcmd, core->index);
+	}
+}
+
+static int rocket_acquire_object_fences(struct drm_gem_object **bos,
+					int bo_count,
+					struct drm_sched_job *job,
+					bool is_write)
+{
+	int i, ret;
+
+	for (i = 0; i < bo_count; i++) {
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
+		if (ret)
+			return ret;
+
+		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
+							      is_write);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void rocket_attach_object_fences(struct drm_gem_object **bos,
+					  int bo_count,
+					  struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+}
+
+static int rocket_job_push(struct rocket_job *job)
+{
+	struct rocket_device *rdev = job->rdev;
+	struct drm_gem_object **bos;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret = 0;
+
+	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *),
+			     GFP_KERNEL);
+	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
+	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
+
+	ret = drm_gem_lock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+	if (ret)
+		goto err;
+
+	mutex_lock(&rdev->sched_lock);
+	drm_sched_job_arm(&job->base);
+
+	job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base, false);
+	if (ret) {
+		mutex_unlock(&rdev->sched_lock);
+		goto err_unlock;
+	}
+
+	ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base, true);
+	if (ret) {
+		mutex_unlock(&rdev->sched_lock);
+		goto err_unlock;
+	}
+
+	kref_get(&job->refcount); /* put by scheduler job completion */
+
+	drm_sched_entity_push_job(&job->base);
+
+	mutex_unlock(&rdev->sched_lock);
+
+	rocket_attach_object_fences(job->out_bos, job->out_bo_count, job->inference_done_fence);
+
+err_unlock:
+	drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+err:
+	kfree(bos);
+
+	return ret;
+}
+
+static void rocket_job_cleanup(struct kref *ref)
+{
+	struct rocket_job *job = container_of(ref, struct rocket_job,
+						refcount);
+	unsigned int i;
+
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->inference_done_fence);
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
+	kfree(job->tasks);
+
+	kfree(job);
+}
+
+static void rocket_job_put(struct rocket_job *job)
+{
+	kref_put(&job->refcount, rocket_job_cleanup);
+}
+
+static void rocket_job_free(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+
+	rocket_job_put(job);
+}
+
+static struct rocket_core *sched_to_core(struct rocket_device *rdev,
+					 struct drm_gpu_scheduler *sched)
+{
+	unsigned int core;
+
+	for (core = 0; core < rdev->num_cores; core++) {
+		if (&rdev->cores[core].sched == sched)
+			return &rdev->cores[core];
+	}
+
+	return NULL;
+}
+
+static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+	struct rocket_device *rdev = job->rdev;
+	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
+	struct dma_fence *fence = NULL;
+	int ret;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	/*
+	 * Nothing to execute: can happen if the job has finished while
+	 * we were resetting the GPU.
+	 */
+	if (job->next_task_idx == job->task_count)
+		return NULL;
+
+	fence = rocket_fence_create(core);
+	if (IS_ERR(fence))
+		return fence;
+
+	if (job->done_fence)
+		dma_fence_put(job->done_fence);
+	job->done_fence = dma_fence_get(fence);
+
+	ret = pm_runtime_get_sync(core->dev);
+	if (ret < 0)
+		return fence;
+
+	spin_lock(&core->job_lock);
+
+	core->in_flight_job = job;
+	rocket_job_hw_submit(core, job);
+
+	spin_unlock(&core->job_lock);
+
+	return fence;
+}
+
+static void rocket_job_handle_done(struct rocket_core *core,
+				   struct rocket_job *job)
+{
+	if (job->next_task_idx < job->task_count) {
+		rocket_job_hw_submit(core, job);
+		return;
+	}
+
+	core->in_flight_job = NULL;
+	dma_fence_signal_locked(job->done_fence);
+	pm_runtime_put_autosuspend(core->dev);
+}
+
+static void rocket_job_handle_irq(struct rocket_core *core)
+{
+	uint32_t status, raw_status;
+
+	pm_runtime_mark_last_busy(core->dev);
+
+	status = rocket_read(core, REG_PC_INTERRUPT_STATUS);
+	raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
+
+	rocket_write(core, REG_PC_OPERATION_ENABLE, 0x0);
+	rocket_write(core, REG_PC_INTERRUPT_CLEAR, 0x1ffff);
+
+	spin_lock(&core->job_lock);
+
+	if (core->in_flight_job)
+		rocket_job_handle_done(core, core->in_flight_job);
+
+	spin_unlock(&core->job_lock);
+}
+
+static void
+rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
+{
+	bool cookie;
+
+	if (!atomic_read(&core->reset.pending))
+		return;
+
+	/*
+	 * Stop the scheduler.
+	 *
+	 * FIXME: We temporarily get out of the dma_fence_signalling section
+	 * because the cleanup path generate lockdep splats when taking locks
+	 * to release job resources. We should rework the code to follow this
+	 * pattern:
+	 *
+	 *	try_lock
+	 *	if (locked)
+	 *		release
+	 *	else
+	 *		schedule_work_to_release_later
+	 */
+	drm_sched_stop(&core->sched, bad);
+
+	cookie = dma_fence_begin_signalling();
+
+	if (bad)
+		drm_sched_increase_karma(bad);
+
+	/*
+	 * Mask job interrupts and synchronize to make sure we won't be
+	 * interrupted during our reset.
+	 */
+	rocket_write(core, REG_PC_INTERRUPT_MASK, 0x0);
+	synchronize_irq(core->irq);
+
+	/* Handle the remaining interrupts before we reset. */
+	rocket_job_handle_irq(core);
+
+	/*
+	 * Remaining interrupts have been handled, but we might still have
+	 * stuck jobs. Let's make sure the PM counters stay balanced by
+	 * manually calling pm_runtime_put_noidle() and
+	 * rocket_devfreq_record_idle() for each stuck job.
+	 * Let's also make sure the cycle counting register's refcnt is
+	 * kept balanced to prevent it from running forever
+	 */
+	spin_lock(&core->job_lock);
+	if (core->in_flight_job)
+		pm_runtime_put_noidle(core->dev);
+
+	core->in_flight_job = NULL;
+	spin_unlock(&core->job_lock);
+
+	/* Proceed with reset now. */
+	pm_runtime_force_suspend(core->dev);
+	pm_runtime_force_resume(core->dev);
+
+	/* GPU has been reset, we can clear the reset pending bit. */
+	atomic_set(&core->reset.pending, 0);
+
+	/*
+	 * Now resubmit jobs that were previously queued but didn't have a
+	 * chance to finish.
+	 * FIXME: We temporarily get out of the DMA fence signalling section
+	 * while resubmitting jobs because the job submission logic will
+	 * allocate memory with the GFP_KERNEL flag which can trigger memory
+	 * reclaim and exposes a lock ordering issue.
+	 */
+	dma_fence_end_signalling(cookie);
+	drm_sched_resubmit_jobs(&core->sched);
+	cookie = dma_fence_begin_signalling();
+
+	/* Restart the scheduler */
+	drm_sched_start(&core->sched, 0);
+
+	dma_fence_end_signalling(cookie);
+}
+
+static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+	struct rocket_device *rdev = job->rdev;
+	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
+
+	/*
+	 * If the GPU managed to complete this jobs fence, the timeout is
+	 * spurious. Bail out.
+	 */
+	if (dma_fence_is_signaled(job->done_fence))
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+
+	/*
+	 * Rocket IRQ handler may take a long time to process an interrupt
+	 * if there is another IRQ handler hogging the processing.
+	 * For example, the HDMI encoder driver might be stuck in the IRQ
+	 * handler for a significant time in a case of bad cable connection.
+	 * In order to catch such cases and not report spurious rocket
+	 * job timeouts, synchronize the IRQ handler and re-check the fence
+	 * status.
+	 */
+	synchronize_irq(core->irq);
+
+	if (dma_fence_is_signaled(job->done_fence)) {
+		dev_warn(core->dev, "unexpectedly high interrupt latency\n");
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
+
+	dev_err(core->dev, "gpu sched timeout");
+
+	atomic_set(&core->reset.pending, 1);
+	rocket_reset(core, sched_job);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static void rocket_reset_work(struct work_struct *work)
+{
+	struct rocket_core *core;
+
+	core = container_of(work, struct rocket_core, reset.work);
+	rocket_reset(core, NULL);
+}
+
+static const struct drm_sched_backend_ops rocket_sched_ops = {
+	.run_job = rocket_job_run,
+	.timedout_job = rocket_job_timedout,
+	.free_job = rocket_job_free
+};
+
+static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
+{
+	struct rocket_core *core = data;
+
+	rocket_job_handle_irq(core);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rocket_job_irq_handler(int irq, void *data)
+{
+	struct rocket_core *core = data;
+	uint32_t raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
+
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+
+	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+		return IRQ_NONE;
+
+	rocket_write(core, REG_PC_INTERRUPT_MASK, 0x0);
+
+	return IRQ_WAKE_THREAD;
+}
+
+int rocket_job_init(struct rocket_core *core)
+{
+	int ret;
+
+	INIT_WORK(&core->reset.work, rocket_reset_work);
+	spin_lock_init(&core->job_lock);
+
+	core->irq = platform_get_irq(to_platform_device(core->dev), 0);
+	if (core->irq < 0)
+		return core->irq;
+
+	ret = devm_request_threaded_irq(core->dev, core->irq,
+					rocket_job_irq_handler,
+					rocket_job_irq_handler_thread,
+					IRQF_SHARED, KBUILD_MODNAME "-job",
+					core);
+	if (ret) {
+		dev_err(core->dev, "failed to request job irq");
+		return ret;
+	}
+
+	core->reset.wq = alloc_ordered_workqueue("rocket-reset-%d", 0, core->index);
+	if (!core->reset.wq)
+		return -ENOMEM;
+
+	core->fence_context = dma_fence_context_alloc(1);
+
+	ret = drm_sched_init(&core->sched,
+				&rocket_sched_ops, NULL,
+				DRM_SCHED_PRIORITY_COUNT,
+				1, 0,
+				msecs_to_jiffies(JOB_TIMEOUT_MS),
+				core->reset.wq,
+				NULL, "rocket", core->dev);
+	if (ret) {
+		dev_err(core->dev, "Failed to create scheduler: %d.", ret);
+		goto err_sched;
+	}
+
+	return 0;
+
+err_sched:
+	drm_sched_fini(&core->sched);
+
+	destroy_workqueue(core->reset.wq);
+	return ret;
+}
+
+void rocket_job_fini(struct rocket_core *core)
+{
+	drm_sched_fini(&core->sched);
+
+	cancel_work_sync(&core->reset.work);
+	destroy_workqueue(core->reset.wq);
+}
+
+int rocket_job_open(struct rocket_file_priv *rocket_priv)
+{
+	struct rocket_device *rdev = rocket_priv->rdev;
+	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores, sizeof(scheds),
+							  GFP_KERNEL);
+	unsigned int core;
+	int ret;
+
+	for (core = 0; core < rdev->num_cores; core++)
+		scheds[core] = &rdev->cores[core].sched;
+
+	ret = drm_sched_entity_init(&rocket_priv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    scheds,
+				    rdev->num_cores, NULL);
+	if (WARN_ON(ret))
+		return ret;
+
+	return 0;
+}
+
+void rocket_job_close(struct rocket_file_priv *rocket_priv)
+{
+	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
+
+	kfree(entity->sched_list);
+	drm_sched_entity_destroy(entity);
+}
+
+int rocket_job_is_idle(struct rocket_core *core)
+{
+	/* If there are any jobs in this HW queue, we're not idle */
+	if (atomic_read(&core->sched.credit_count))
+		return false;
+
+	return true;
+}
+
+static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
+				   struct drm_rocket_job *job)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
+	struct rocket_file_priv *file_priv = file->driver_priv;
+	struct rocket_job *rjob = NULL;
+	int ret = 0;
+
+	if (job->task_count == 0)
+		return -EINVAL;
+
+	rjob = kzalloc(sizeof(*rjob), GFP_KERNEL);
+	if (!rjob)
+		return -ENOMEM;
+
+	kref_init(&rjob->refcount);
+
+	rjob->rdev = rdev;
+
+	ret = drm_sched_job_init(&rjob->base,
+				 &file_priv->sched_entity,
+				 1, NULL);
+	if (ret)
+		goto out_put_job;
+
+	ret = rocket_copy_tasks(dev, file, job, rjob);
+	if (ret)
+		goto out_cleanup_job;
+
+	ret = drm_gem_objects_lookup(file,
+				     (void __user *)(uintptr_t)job->in_bo_handles,
+				     job->in_bo_handle_count, &rjob->in_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->in_bo_count = job->in_bo_handle_count;
+
+	ret = drm_gem_objects_lookup(file,
+				     (void __user *)(uintptr_t)job->out_bo_handles,
+				     job->out_bo_handle_count, &rjob->out_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->out_bo_count = job->out_bo_handle_count;
+
+	ret = rocket_job_push(rjob);
+	if (ret)
+		goto out_cleanup_job;
+
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&rjob->base);
+out_put_job:
+	rocket_job_put(rjob);
+
+	return ret;
+}
+
+int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_submit *args = data;
+	struct drm_rocket_job *jobs;
+	int ret = 0;
+	unsigned int i = 0;
+
+	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs) {
+		DRM_DEBUG("Failed to allocate incoming job array\n");
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(jobs,
+			   (void __user *)(uintptr_t)args->jobs,
+			   args->job_count * sizeof(*jobs))) {
+		ret = -EFAULT;
+		DRM_DEBUG("Failed to copy incoming job array\n");
+		goto exit;
+	}
+
+	for (i = 0; i < args->job_count; i++)
+		rocket_ioctl_submit_job(dev, file, &jobs[i]);
+
+exit:
+	kfree(jobs);
+
+	return ret;
+}
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
new file mode 100644
index 0000000000000000000000000000000000000000..93fa1f988c72adb7a405acbf08c1c9b87d22f9c5
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_JOB_H__
+#define __ROCKET_JOB_H__
+
+#include <drm/drm_drv.h>
+#include <drm/gpu_scheduler.h>
+
+#include "rocket_core.h"
+#include "rocket_drv.h"
+
+struct rocket_task {
+	u64 regcmd;
+	u32 regcmd_count;
+};
+
+struct rocket_job {
+	struct drm_sched_job base;
+
+	struct rocket_device *rdev;
+
+	struct drm_gem_object **in_bos;
+	struct drm_gem_object **out_bos;
+
+	u32 in_bo_count;
+	u32 out_bo_count;
+
+	struct rocket_task *tasks;
+	u32 task_count;
+	u32 next_task_idx;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *inference_done_fence;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	struct kref refcount;
+};
+
+int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_job_init(struct rocket_core *core);
+void rocket_job_fini(struct rocket_core *core);
+int rocket_job_open(struct rocket_file_priv *rocket_priv);
+void rocket_job_close(struct rocket_file_priv *rocket_priv);
+int rocket_job_is_idle(struct rocket_core *core);
+
+#endif
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 8338726a83c31b954608ca505cf78bcd70d3494b..eb886351134ebef62969b1e1182ccc174f88fe9d 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -12,8 +12,10 @@ extern "C" {
 #endif
 
 #define DRM_ROCKET_CREATE_BO			0x00
+#define DRM_ROCKET_SUBMIT			0x01
 
 #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
+#define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
 
 /**
  * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
@@ -36,6 +38,59 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+/**
+ * struct drm_rocket_task - A task to be run on the NPU
+ *
+ * A task is the smallest unit of work that can be run on the NPU.
+ */
+struct drm_rocket_task {
+	/** DMA address to NPU mapping of register command buffer */
+	__u64 regcmd;
+
+	/** Number of commands in the register command buffer */
+	__u32 regcmd_count;
+};
+
+/**
+ * struct drm_rocket_job - A job to be run on the NPU
+ *
+ * The kernel will schedule the execution of this job taking into account its
+ * dependencies with other jobs. All tasks in the same job will be executed
+ * sequentially on the same core, to benefit from memory residency in SRAM.
+ */
+struct drm_rocket_job {
+	/** Pointer to an array of struct drm_rocket_task. */
+	__u64 tasks;
+
+	/** Pointer to a u32 array of the BOs that are read by the job. */
+	__u64 in_bo_handles;
+
+	/** Pointer to a u32 array of the BOs that are written to by the job. */
+	__u64 out_bo_handles;
+
+	/** Number of tasks passed in. */
+	__u32 task_count;
+
+	/** Number of input BO handles passed in (size is that times 4). */
+	__u32 in_bo_handle_count;
+
+	/** Number of output BO handles passed in (size is that times 4). */
+	__u32 out_bo_handle_count;
+};
+
+/**
+ * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_rocket_submit {
+	/** Pointer to an array of struct drm_rocket_job. */
+	__u64 jobs;
+
+	/** Number of jobs passed in. */
+	__u32 job_count;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.48.1


