Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D733C6484
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbhGLUEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbhGLUEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:04:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3578BC0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:04 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id y21-20020a7bc1950000b02902161fccabf1so20212wmi.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pX7hNnavZz6v2B5OwM5RK0o2VBN9HFTyeZuTIzqGtmQ=;
        b=ASVh5OPaAfeGGrcW424ez5POyQf1R3nlLHzHQU6gXI2mKJEMAz4wE3AnIVH6FFiv9f
         KE3urO5pTB+8I4D7/0obrhkocQALUoBEdcEEKdoVOGzknTwHcJo7qrTumSZw8BRWUvWf
         PiRO6J3MKFJJW5rZkg60XTZGqhrzLtgmJoROM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pX7hNnavZz6v2B5OwM5RK0o2VBN9HFTyeZuTIzqGtmQ=;
        b=eS/vEfaFYSTPzcfspUTQP0nWCzIEPDHIhYWe+y3FelO1N0faX2F0OtvKHH9ekZ1cxW
         plW/ad27IZM5HOY/VKNoHJ+YdOOEB7G09gdV+44Li6RZDCGlpdOjN89x9eaO0nsJyr+H
         fYFxkDPenRiw7jPoyXiKTAl1jsNTEaxBh6w5KJWoqQ2VnfNIsOcjdOkv9v6ec4swkKYm
         2qDcES+NVluGSVR6d8lD+YmWPK7g2lbfjOF58e+YgJSPVEZgiu4azuvi4vvk7zPbzzu/
         LRGxIxXujQF13RbUz0mN4/dDAsfYNxODtaTQTHjy0xhWwPT4NM46JlmVfhih2BEY4hGk
         tFqQ==
X-Gm-Message-State: AOAM532fh8rIGAqxGuuCiuRVMsyaxngtW9HdvAh60NMGKm46QPceqA7T
        7k/WSCl0EeDSbyb1ItPQZ2wyAA==
X-Google-Smtp-Source: ABdhPJwXPx6wh+4bZr3WId41fmpTExgZ2P9ZWJSACVAVexstfpSmlB+XPxtkqs+WOsxYAJqcU8PlAw==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr958329wmf.114.1626120122633;
        Mon, 12 Jul 2021 13:02:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:02:02 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Chen Li <chenli@uniontech.com>,
        Lee Jones <lee.jones@linaro.org>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Kevin Wang <kevin1.wang@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Dennis Li <Dennis.Li@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 04/18] drm/sched: drop entity parameter from drm_sched_push_job
Date:   Mon, 12 Jul 2021 19:53:38 +0200
Message-Id: <20210712175352.802687-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Originally a job was only bound to the queue when we pushed this, but
now that's done in drm_sched_job_init, making that parameter entirely
redundant.

Remove it.

The same applies to the context parameter in
lima_sched_context_queue_task, simplify that too.

Reviewed-by: Steven Price <steven.price@arm.com> (v1)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: "Marek Olšák" <marek.olsak@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Dennis Li <Dennis.Li@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c  | 2 +-
 drivers/gpu/drm/lima/lima_gem.c          | 3 +--
 drivers/gpu/drm/lima/lima_sched.c        | 5 ++---
 drivers/gpu/drm/lima/lima_sched.h        | 3 +--
 drivers/gpu/drm/panfrost/panfrost_job.c  | 2 +-
 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++----
 drivers/gpu/drm/v3d/v3d_gem.c            | 2 +-
 include/drm/gpu_scheduler.h              | 3 +--
 10 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a4ec092af9a7..18f63567fb69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1267,7 +1267,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	trace_amdgpu_cs_ioctl(job);
 	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 5ddb955d2315..b8609cccc9c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -174,7 +174,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 
 	*f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 05f412204118..180bb633d5c5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -178,7 +178,7 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
 	/* the scheduler holds on to the job now */
 	kref_get(&submit->refcount);
 
-	drm_sched_entity_push_job(&submit->sched_job, sched_entity);
+	drm_sched_entity_push_job(&submit->sched_job);
 
 out_unlock:
 	mutex_unlock(&submit->gpu->fence_lock);
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index de62966243cd..c528f40981bb 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -359,8 +359,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 			goto err_out2;
 	}
 
-	fence = lima_sched_context_queue_task(
-		submit->ctx->context + submit->pipe, submit->task);
+	fence = lima_sched_context_queue_task(submit->task);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 38f755580507..e968b5a8f0b0 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -177,13 +177,12 @@ void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 	drm_sched_entity_fini(&context->base);
 }
 
-struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
-						struct lima_sched_task *task)
+struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
 {
 	struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
 
 	trace_lima_task_submit(task);
-	drm_sched_entity_push_job(&task->base, &context->base);
+	drm_sched_entity_push_job(&task->base);
 	return fence;
 }
 
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 90f03c48ef4a..ac70006b0e26 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -98,8 +98,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
 			    atomic_t *guilty);
 void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 			     struct lima_sched_context *context);
-struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
-						struct lima_sched_task *task);
+struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task);
 
 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name);
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 2992dc85325f..4bc962763e1f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
-	drm_sched_entity_push_job(&job->base, entity);
+	drm_sched_entity_push_job(&job->base);
 
 	mutex_unlock(&pfdev->sched_lock);
 
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 381fbf462ea7..e4d33db1eb45 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -516,9 +516,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 /**
  * drm_sched_entity_push_job - Submit a job to the entity's job queue
- *
  * @sched_job: job to submit
- * @entity: scheduler entity
  *
  * Note: To guarantee that the order of insertion to queue matches the job's
  * fence sequence number this function should be called with drm_sched_job_arm()
@@ -526,9 +524,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
-			       struct drm_sched_entity *entity)
+void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
+	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5c3a99027ecd..69ac20e11b09 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -482,7 +482,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 	/* put by scheduler job completion */
 	kref_get(&job->refcount);
 
-	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
+	drm_sched_entity_push_job(&job->base);
 
 	return 0;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 74fb321dbc44..2bb1869f2352 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -407,8 +407,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
-void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
-			       struct drm_sched_entity *entity);
+void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
-- 
2.32.0

