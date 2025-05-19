Return-Path: <linux-media+bounces-32797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C036AABC03F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D91D7A0C84
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CAA280A20;
	Mon, 19 May 2025 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u/JUJ9UF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E227CCEB
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663495; cv=none; b=Hjq0imhaq9wqpwc0+uCqn/H2vvvme2lTHw/qCB0Zhl1i6etOwBIgo+S1bZwx01akyMBQaINB4dvoNFrXXJFdAjxaDDTBHYBPyjK4YYlLWg5s0LWuwXH81hlxwC5lSy1vtoU1P0HfwKb2WjG4QTDLqr1F+X2W+XR1mvR6njpk+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663495; c=relaxed/simple;
	bh=cI3qZu4Y+nInTOuUVLPy6HSJBiDDKcYEIqj7ekFwWj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bV0D3ucmOoIzfCovBkH0EsvV5GOlrCvFAgmhaeM9MOo428nCd+m9ylPBopUoe8D0hrViAUhMyu/zUlmzagWDv2UUJgEj/RCnIjBmTyu9HGaQCAyHLqKD2Gvq43RI6UK6v+HazHO/MiCsln+89aLxN8OE1Cay/Xs3g1asr0zyTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u/JUJ9UF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86EDF1116;
	Mon, 19 May 2025 16:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747663468;
	bh=cI3qZu4Y+nInTOuUVLPy6HSJBiDDKcYEIqj7ekFwWj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/JUJ9UFWvwWk2oY219eSFXL+/tKU7UsYsAqhkiKhjbLGMELiJxCVRDVptjUTctdC
	 iUIaJvAdmZNGzoupSvOJ/ue3JfKvRi/3lFY6zjVhSbi5Zk1b9dYA1j7dPGEpMhnh/P
	 0daYY96s6QJfz9Zlb9PXMlgab3G/KTLr/lo144z4=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 3/3] media: Documentation: Add documentation for media jobs
Date: Mon, 19 May 2025 15:04:03 +0100
Message-Id: <20250519140403.443915-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519140403.443915-1-dan.scally@ideasonboard.com>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a segment to mc-core.rst that explains the purpose behind the
media jobs framework and how to use it.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 1d010bd7ec49..53f13f857c1f 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -327,6 +327,158 @@ Call :c:func:`media_device_register()`, if media devnode isn't registered
 Call :c:func:`media_device_delete()` to free the media_device. Freeing is
 handled by the kref put handler.
 
+Media Jobs Framework
+^^^^^^^^^^^^^^^^^^^^
+
+The media jobs framework exists to facilitate situations in which multiple
+drivers must work together to properly operate a media pipeline in a driver
+agnostic way. The archetypical example is of a memory to memory ISP that does
+not include its own DMA input engine, and which must interact with the driver
+for one that has been integrated. Because the DMA engine and its driver may be
+different between each implementation, hardcoding calls of functions exported by
+the DMA engine driver would not be appropriate. The media jobs framework allows
+the drivers to define the steps that each must execute to correctly push data
+through the pipeline and then schedule the sequence of steps to run in a work
+queue.
+
+To start with each driver must acquire a reference to a
+:c:type:`media_jobs_scheduler` by calling :c:func:`media_jobs_get_scheduler()`,
+passing the pointer to their :c:type:`media_device`. This ensures that all of
+the drivers are working with the same scheduler. Drivers must then call
+:c:func:`media_jobs_add_job_setup_func()` to register a function that populates
+each job with the dependencies that must be cleared to allow it to operate, and
+the steps that must be carried out to execute it. For example:
+
+.. code-block:: c
+
+   static void isp_driver_run_step(void *data)
+   {
+       struct isp *isp = data;
+
+       /*
+        * Logic here to actually execute the necessary steps, for example we
+        * might configure some hardware registers.
+        */
+       ...;
+   }
+
+   static struct media_job_dep_ops ops = {
+       ...,
+   };
+
+   static int isp_driver_add_job_setup_func(struct media_job *job, void *data)
+   {
+       int ret;
+
+       ret = media_jobs_add_job_dep(job, &ops, data);
+       if (ret)
+           return ret;
+
+       ret = media_jobs_add_job_step(job, isp_driver_run_step, data,
+                                     MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
+       if (ret)
+           return ret;
+
+       return 0;
+   }
+
+The flags parameter of `media_jobs_add_job_step()` must be one of
+:c:macro:`MEDIA_JOBS_FL_STEP_ANYWHERE`, :c:macro:`MEDIA_JOBS_FL_STEP_FROM_FRONT`
+or :c:macro:`MEDIA_JOBS_FL_STEP_FROM_BACK`. The flag and pos parameters together
+define the order of the step within the job. Steps added with
+`MEDIA_JOBS_FL_STEP_ANYWHERE` will go after all steps that are added with
+`MEDIA_JOBS_FL_STEP_FROM_FRONT` and all steps with `MEDIA_JOBS_FL_STEP_ANYWHERE`
+that either have a lower `pos` or were previously added. They will go before all
+those added with `MEDIA_JOBS_FL_STEP_FROM_BACK` and all steps with
+`MEDIA_JOBS_FL_STEP_ANYWHERE` that have a higher `pos`. Steps added with
+`MEDIA_JOBS_FL_STEP_FROM_FRONT` will go `pos` places from the front of the list,
+and steps added with `flags` set to `MEDIA_JOBS_FL_STEP_FROM_BACK`` will go
+`pos` places from the end of the list. This allows multiple drivers to quite
+precisely define which steps need to be executed and what order they should be
+executed in.
+
+Adding a step with the same `flags` and `pos` as a previously added step will
+result in an error.
+
+The functions held in :c:type:`media_job_dep_ops` define how the media jobs
+framework handles job dependencies. It is expected that there will be some hard
+dependencies before a job can be executed; for example pushing a buffer of image
+data through an ISP pipeline necessarily requires that an input buffer be ready
+and an output buffer be ready to accept the processed data. The operations ask
+the driver if the dependencies are met, tell the driver that a job has been
+queued and reset the dependencies in the event the job is cancelled:
+
+.. code-block:: c
+
+   struct isp {
+
+       ...;
+
+       struct {
+           struct list_head pending;
+	   struct list_head processing;
+       } buffers;
+   }
+
+   static bool isp_driver_check_dep(void *data)
+   {
+       struct isp *isp = data;
+
+       /*
+        * Do we have a buffer queued ready to accept the ISP's output data?
+        */
+       if (list_empty(isp->buffers.pending))
+           return false;
+
+       return true;
+   }
+
+   static void isp_driver_clear_dep(void *data)
+   {
+       struct isp *isp = data;
+       struct buf *buf;
+
+       /*
+        * We need to "consume" the buffer so that it's not also considered as
+        * meeting this dependency for the next attempt to queue a job
+        */
+       buf = list_first_entry(&isp->buffers.pending, struct buf, list);
+       list_move_tail(&buf->list, isp->buffers.processing);
+   }
+
+   static void isp_driver_reset_dep(void *data)
+   {
+       struct isp *isp = data;
+       struct buf *buf;
+
+       /*
+        * If a queued job is cancelled then we need to return the dependency to
+        * its original state, which in this example means returning it to the
+        * pending queue.
+        */
+       buf = list_first_entry(&isp->buffers.pending, struct buf, list);
+       list_move_tail(&buf->list, isp->buffers.pending);
+   }
+
+   static struct media_job_dep_ops ops = {
+       .check_dep = isp_driver_check_dep,
+       .clear_dep = isp_driver_clear_dep,
+       .reset_dep = isp_driver_reset_dep,
+   };
+
+The actual creation and queueing of the jobs should be done by the drivers by
+calling :c:func:`media_jobs_try_queue_job()` at any time a dependency of the
+job is met - for example (following the earlier example) when a buffer is queued
+to either the ISP or DMA engine's driver. When all of the dependencies that are
+necessary for a job to be queued are met, this function will push a job to the
+scheduler's queue.
+
+The scheduler has a workqueue that runs the jobs. This is triggered by calls to
+the :c:func:`media_jobs_run_jobs()` function, which must be called periodically
+as the pipeline is running. When the streaming is finished the drivers should
+shut down the workqueue and cancel the queued jobs by calling
+:c:func:`media_jobs_cancel_jobs()`.
+
 API Definitions
 ^^^^^^^^^^^^^^^
 
@@ -336,6 +488,8 @@ API Definitions
 
 .. kernel-doc:: include/media/media-entity.h
 
+.. kernel-doc:: include/media/media-jobs.h
+
 .. kernel-doc:: include/media/media-request.h
 
 .. kernel-doc:: include/media/media-dev-allocator.h
-- 
2.34.1


