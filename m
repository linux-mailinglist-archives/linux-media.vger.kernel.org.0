Return-Path: <linux-media+bounces-34634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE8FAD749A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9248D167E5E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163CC24E4AD;
	Thu, 12 Jun 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBrPlBKN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6024DD19;
	Thu, 12 Jun 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739884; cv=none; b=ff1/XWjQWp+wEEynPX9mPcLGV4Nr2dVnSYbqsl6tHMqcMM+4y7onw9zvg6HQC3qDnDwKlqX292J1zjbjJi6NyVO1kdZ0l1z+e3jga62CZ8/JE9FWHRN57bVi/OuvOTIwVO7HvpmhPVJMr1CbJ5c/LEjRwTaj5jaSsO+IeiS46og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739884; c=relaxed/simple;
	bh=0qTRo/pmUhEjT80nAp8EEXMwEdEowH/xG6PhDIwPuN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtaICpOhIhPm9K+RLSXKaYCnnSkm3yIIyeb5HJUhcsydddW7sMTA7xSrVTp1mfPyMgSwX/EM8/GOzZD1nJukQ+kRDxwpOLLLcoRDOpXQqMIpUGDi3wUSKFRIgPrfQCSr3oWmgEkCDqUWB6vJIkJM6mWUlUGW0OstfMuw29qGllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBrPlBKN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99461C4CEEA;
	Thu, 12 Jun 2025 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739884;
	bh=0qTRo/pmUhEjT80nAp8EEXMwEdEowH/xG6PhDIwPuN8=;
	h=From:To:Cc:Subject:Date:From;
	b=YBrPlBKNH2a4/bws8W6neqOmymaes6R2+S7rFQ/FRrqsuxUIS+ukWKJupJBcEj0/d
	 KsKX/GnYGqtJvT3Bz3/iGnT6cUja76N/vtSr93k8ISCvreiB7Vnwl34/Ow0MobvunE
	 BRJG/c3t1O/P328EqHMyEWCb3UdWFZgD8LnOqw7cR/mwofBpastZO/GVVDwuyZT/nF
	 W0HzDGXI7DPXc3tYr/Hi/Gg8IDIWcJ4J7+HGkSWoHU4U19olRiv3OTrbnFnnwAhkKs
	 2Z8Tv26brwyFn4dJ5lNt35AaDWhy/kcdgpGB/yH7f5kWjvSG+feyD8s55eDCg+dxAT
	 Byz24fe1YstxA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Date: Thu, 12 Jun 2025 16:49:54 +0200
Message-ID: <20250612144953.111829-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct drm_sched_init_args provides the possibility of letting the
scheduler use user-controlled workqueues, instead of the scheduler
creating its own workqueues. It's currently not documented who would
want to use that.

Not sharing the submit_wq between driver and scheduler has the advantage
of no negative intereference between them being able to occur (e.g.,
MMU notifier callbacks waiting for fences to get signaled).

Add a new docu section for concurrency in drm/sched.

Discourage the usage of own workqueues in the documentation. Document
when using them can make sense. Warn about pitfalls.

Co-authored-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Add new docu section for concurrency in the scheduler. (Sima)
  - Document what an ordered workqueue passed to the scheduler can be
    useful for. (Christian, Sima)
  - Warn more detailed about potential deadlocks. (Danilo)
---
 include/drm/gpu_scheduler.h | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 81dcbfc8c223..00c528e62485 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -21,6 +21,49 @@
  *
  */
 
+/**
+ * DOC: Concurrency in drm/sched
+ *
+ * The DRM GPU Scheduler interacts with drivers through the callbacks defined in
+ * &struct drm_sched_backend_ops. These callbacks can be invoked by the scheduler
+ * at any point in time if not stated otherwise explicitly in the callback
+ * documentation.
+ *
+ * For most use cases, passing the recommended default parameters in &struct
+ * drm_sched_init_args is sufficient. There are some special circumstances,
+ * though:
+ *
+ * For timeout handling, it makes a lot of sense for drivers with HARDWARE
+ * scheduling to have the timeouts (e.g., for different hardware rings) occur
+ * sequentially, for example to allow for detecting which job timedout first
+ * and, therefore, caused the hang. Thereby, it is determined which &struct
+ * drm_sched_entity has to be killed and which entities' jobs must be
+ * resubmitted after a GPU reset.
+ *
+ * This can be achieved by passing an ordered workqueue in &struct
+ * drm_sched_init_args.timeout_wq. Also take a look at the documentation of
+ * &struct drm_sched_backend_ops.timedout_job.
+ *
+ * Furthermore, for drivers with hardware that supports FIRMWARE scheduling,
+ * the driver design can be simplified a bit by providing one ordered workqueue
+ * for both &struct drm_sched_init_args.timeout_wq and
+ * &struct drm_sched_init_args.submit_wq. Reason being that firmware schedulers
+ * should always have one scheduler instance per firmware runqueue and one
+ * entity per scheduler instance. If that scheduler instance then shares one
+ * ordered workqueue with the driver, locking can be very lightweight or
+ * dropped alltogether.
+ *
+ * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
+ * theoretically can deadlock. It must be guaranteed that submit_wq never has
+ * more than max_active - 1 active tasks, or if max_active tasks are reached at
+ * least one of them does not execute operations that may block on dma_fences
+ * that potentially make progress through this scheduler instance. Otherwise,
+ * it is possible that all max_active tasks end up waiting on a dma_fence (that
+ * can only make progress through this schduler instance), while the
+ * scheduler's queued work waits for at least one of the max_active tasks to
+ * finish. Thus, this can result in a deadlock.
+ */
+
 #ifndef _DRM_GPU_SCHEDULER_H_
 #define _DRM_GPU_SCHEDULER_H_
 
@@ -499,7 +542,7 @@ struct drm_sched_backend_ops {
 	 * timeout handlers of different schedulers. One way to achieve this
 	 * synchronization is to create an ordered workqueue (using
 	 * alloc_ordered_workqueue()) at the driver level, and pass this queue
-	 * as drm_sched_init()'s @timeout_wq parameter. This will guarantee
+	 * in &struct drm_sched_init_args.timeout_wq. This will guarantee
 	 * that timeout handlers are executed sequentially.
 	 *
 	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
@@ -590,14 +633,19 @@ struct drm_gpu_scheduler {
  *
  * @ops: backend operations provided by the driver
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
- *	       allocated and used.
+ *	       allocated and used. It is recommended to pass NULL unless there
+ *	       is a good reason not to. For details, see &DOC: Concurrency in
+ *	       drm/sched.
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
+ * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
+ *		used. An ordered workqueue could be passed to achieve timeout
+ *		synchronization. See &DOC: Concurreny in drm/sched and &struct
+ *		drm_sched_backend_ops.timedout_job.
  * @score: score atomic shared with other schedulers. May be NULL.
  * @name: name (typically the driver's name). Used for debugging
  * @dev: associated device. Used for debugging
-- 
2.49.0


