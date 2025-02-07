Return-Path: <linux-media+bounces-25807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2AA2C2D2
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10670188DAC4
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E62B1F37D1;
	Fri,  7 Feb 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3gEDDWc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075401F150D;
	Fri,  7 Feb 2025 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931839; cv=none; b=Z9IRtBSRjw/v9B7919WNQB4VreCUpGBCG3BId5T6HrK0aZsF5bl8/D6SdP/NpSAy9LS4gTn/aoAl3AZxsTRJHwdaNZ2WGkAuMWIJEt4tdGWfqZ/mtH4Xs7u9Yt5NpH8Y7guVdvUcZjrvRSZ0d932kSUD5DrkRf9afmZGZDqHQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931839; c=relaxed/simple;
	bh=vnICce6GL21h75p3nB8IMGVxxKn6zjjo8zMlN0g4cZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEQNTs1+GYwadvbVY3K72zIOK8RukXogj9r1doddkkI8owBrJQB/DRchNoakia/pheCwBCk3TiYrkgoSELc+eiWWHjYMt8hN1quTOqLPfxYPPSYOhrlDviMDBmrzpfCBRQWkTiO+FDQUWfVCz053wwKQvsWgJhZRLfyW/i1fOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3gEDDWc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654E8C4CED1;
	Fri,  7 Feb 2025 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738931838;
	bh=vnICce6GL21h75p3nB8IMGVxxKn6zjjo8zMlN0g4cZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3gEDDWcrQDJ8IiXL0iyVsCNRQgPHNk9YkDq5KAJ/Ta+DZlf6CYzKbl9dDx7rWjrm
	 uQ8dynokNUxheRldkafr1pbzYtr2BQStATENBJbD6z0fNezxKBIF37eMivoWPtTmVf
	 Erhf4A78VxIo+F63bZT4iGJvLuxzKj94h/OjICRgQQBEekwEl+GMa4/UIIUulKfVb6
	 OQoAjQwV2Zsiy9Qfb2Mb1GhO/SS7WQP9FWbS6x6bnIBoW3CHg8fombNhw0vUcoDstr
	 BGSoK43UWy78EP7QUN2N7Z4rFl6EXdvJVMVddnmKlb/vTJkQvXL6lVVJ5I5+H703ux
	 dT5AGYZJ6ukoA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 3/3] drm/sched: Update timedout_job()'s documentation
Date: Fri,  7 Feb 2025 13:36:53 +0100
Message-ID: <20250207123652.27677-5-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250207123652.27677-2-phasta@kernel.org>
References: <20250207123652.27677-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_backend_ops.timedout_job()'s documentation is outdated. It
mentions the deprecated function drm_sched_resubmit_job(). Furthermore,
it does not point out the important distinction between hardware and
firmware schedulers.

Since firmware schedulers tyipically only use one entity per scheduler,
timeout handling is significantly more simple because the entity the
faulted job came from can just be killed without affecting innocent
processes.

Update the documentation with that distinction and other details.

Reformat the docstring to work to a unified style with the other
handles.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 85 +++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 33 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 8c1a6155011d..7c4ba095731d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -393,8 +393,15 @@ static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
 	return s_job && atomic_inc_return(&s_job->karma) > threshold;
 }
 
+/**
+ * enum drm_gpu_sched_stat - the scheduler's status
+ *
+ * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
+ * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
+ * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
+ */
 enum drm_gpu_sched_stat {
-	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
+	DRM_GPU_SCHED_STAT_NONE,
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
@@ -428,6 +435,10 @@ struct drm_sched_backend_ops {
 	 * same parameters. Doing this is strongly discouraged because it
 	 * violates dma_fence rules.
 	 *
+	 * This method is called in a workqueue context - either from the
+	 * submit_wq the driver passed through TODO, or, if the driver
+	 * passed NULL, a separate, ordered workqueue the scheduler allocated.
+	 *
 	 * @sched_job: the job to run
 	 *
 	 * Returns:
@@ -447,43 +458,51 @@ struct drm_sched_backend_ops {
 	 * @timedout_job: Called when a job has taken too long to execute,
 	 * to trigger GPU recovery.
 	 *
-	 * This method is called in a workqueue context.
+	 * @sched_job: The job that has timed out
 	 *
-	 * Drivers typically issue a reset to recover from GPU hangs, and this
-	 * procedure usually follows the following workflow:
+	 * Returns: The scheduler's status, defined by &drm_gpu_sched_stat
 	 *
-	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
-	 *    scheduler thread and cancel the timeout work, guaranteeing that
-	 *    nothing is queued while we reset the hardware queue
-	 * 2. Try to gracefully stop non-faulty jobs (optional)
-	 * 3. Issue a GPU reset (driver-specific)
-	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
-	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
-	 *    jobs can be queued, and the scheduler thread is unblocked
+	 * Drivers typically issue a reset to recover from GPU hangs.
+	 * This procedure looks very different depending on whether a firmware
+	 * or a hardware scheduler is being used.
+	 *
+	 * For a FIRMWARE SCHEDULER, each ring has one scheduler, and each
+	 * scheduler has one entity. Hence, the steps taken typically look as
+	 * follows:
+	 *
+	 * 1. Stop the scheduler using drm_sched_stop(). This will pause the
+	 *    scheduler workqueues and cancel the timeout work, guaranteeing
+	 *    that nothing is queued while the ring is being removed.
+	 * 2. Remove the ring. The firmware will make sure that the
+	 *    corresponding parts of the hardware are resetted, and that other
+	 *    rings are not impacted.
+	 * 3. Kill the entity and the associated scheduler.
+	 *
+	 *
+	 * For a HARDWARE SCHEDULER, a scheduler instance schedules jobs from
+	 * one or more entities to one ring. This implies that all entities
+	 * associated with the affected scheduler cannot be torn down, because
+	 * this would effectively also affect innocent userspace processes which
+	 * did not submit faulty jobs (for example).
+	 *
+	 * Consequently, the procedure to recover with a hardware scheduler
+	 * should look like this:
+	 *
+	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop().
+	 * 3. Kill the entity the faulty job stems from.
+	 * 4. Issue a GPU reset on all faulty rings (driver-specific).
+	 * 5. Re-submit jobs on all schedulers impacted by re-submitting them to
+	 *    the entities which are still alive.
+	 * 6. Restart all schedulers that were stopped in step #1 using
+	 *    drm_sched_start().
 	 *
 	 * Note that some GPUs have distinct hardware queues but need to reset
 	 * the GPU globally, which requires extra synchronization between the
-	 * timeout handler of the different &drm_gpu_scheduler. One way to
-	 * achieve this synchronization is to create an ordered workqueue
-	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
-	 * queue to drm_sched_init(), to guarantee that timeout handlers are
-	 * executed sequentially. The above workflow needs to be slightly
-	 * adjusted in that case:
-	 *
-	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
-	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
-	 *    the reset (optional)
-	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
-	 * 4. Re-submit jobs on all schedulers impacted by the reset using
-	 *    drm_sched_resubmit_jobs()
-	 * 5. Restart all schedulers that were stopped in step #1 using
-	 *    drm_sched_start()
-	 *
-	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
-	 * and the underlying driver has started or completed recovery.
-	 *
-	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
-	 * available, i.e. has been unplugged.
+	 * timeout handlers of different schedulers. One way to achieve this
+	 * synchronization is to create an ordered workqueue (using
+	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
+	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
+	 * that timeout handlers are executed sequentially.
 	 */
 	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1


