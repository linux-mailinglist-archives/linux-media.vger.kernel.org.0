Return-Path: <linux-media+bounces-35725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA1AE5E98
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576A840344F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0205B255F2B;
	Tue, 24 Jun 2025 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SX7swNmZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924E2512D1
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752015; cv=none; b=X0XdOWuxhZw+5UMYaIGo3qG+0hdLBXI/QXEz3t+F3pf8owOaJlbSEP23I9YvAGPe6tX3mr66/BK5ynC1TE3KPJDfhIbTvi1SQuxZw3Iiva0N4nKVq3bf8zTMDD2716pZeApNHd97/h/tkFKw/9pDivCyo5LPlr4DQk2s6kQly90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752015; c=relaxed/simple;
	bh=TgSpj8RIL8lr5Y8pzJvT+F/nAkYA8cq5JZQAL+LsQyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaRJCeAo6VbTJdZNiU1TnT4zP1Vvc0JO32FcGXwnCEusKUIkZPIlwurgAsA3ybelvitZOxlf8Gs7ICcwSOaBC/WUSuXdd2fPlsUcszsOPXv5nNppcu7Cq+D8klREfdCI9CIoePxYCLPOm+UksP1Oe8BZX7x0LclVUsJZwsRW96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SX7swNmZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 628FC134A;
	Tue, 24 Jun 2025 09:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750751989;
	bh=TgSpj8RIL8lr5Y8pzJvT+F/nAkYA8cq5JZQAL+LsQyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SX7swNmZObR+lwJaXOZc4/cVIPQq0GIqeIiHmLE+71xUDwC+8tab5vXL7wM9hpjpd
	 lwtcJ7/simwQdXU5hZ6vLtMLN0AonHP3KozrlSbPda0iPkRbqlaIg+XIVj171yRWKU
	 ah1W6RERXg3b6XgveF+qnElevLPZdlCseoHO9XTU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 08:59:52 +0100
Subject: [PATCH v2 3/3] media: Documentation: Add documentation for media
 jobs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-media-jobs-v2-3-8e649b069a96@ideasonboard.com>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
In-Reply-To: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8494;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=TgSpj8RIL8lr5Y8pzJvT+F/nAkYA8cq5JZQAL+LsQyI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWlsD5+b30FSdlM8XyXf+BfxGpulcEhiBaK0p5
 IX35e6Xs0iJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFpbAwAKCRDISVd6bEV1
 Mjl5EACPOh0ZA46KsFxWuyuFX7KEM+UGNTwAK7w9aXVJmuEFS6hlw0CLb4rp1IWcl1c+fWR/JVX
 PzliMlXXT/SNzC+MVmGWYFey4Ff5Iw3JrmrLczhb6lJiv6MhifgYdxFLK80CvB7SrPuy+YPCjDB
 rV8pI+A+m59I1xtagOnMfgHJ5tXtD6kKJ7sU2KI9+EzLfvvTSYYl2Df4dlC/RN56QMES+tff/k0
 E4mIpcVnSS8ClGqWbUGJDDiLmaQojKjej3izKUnR3GoBM5KyuC7v8j7qesTCGIji9Mc+XDOhPxb
 kBCDOf3mEPpRlkY+cJ48KyC82E31nNkkRuIdbDH1GnB/GqG6JH0M4zxSKnIKK3iJDEQfQVlH3As
 hVaqJrLhZsymi7KXP7sS83OIIOge6cSA8VNzTaVX5ZfzqIGtMRkqdtkddtv1yIZnH26WjwRa0vN
 eGhvfWPcIyR0I8J909NydvXYXAV+r/XvFNxLHciedFc6QMP6IPVvCSzDVb4xK6tzWAl0hEGe+RO
 jPq3UrAgEWvtXJUnfu3rvO8h03ZnQqdCjQglZPj5YRhAD2LSNY1mgoYXLiV1brDz6lv7v85gOPZ
 zhfOQuoS6t5b7v1BE9tAkacUVcTVMuHbLx5YV5mnEVxxqs0HbpLNomXSfsvVo11oZ4GyTOQlqI5
 0pKiJ5jkc+VNZWA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a segment to mc-core.rst that explains the purpose behind the
media jobs framework and how to use it.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- Updated the documentation to account for the changes to the
	  media jobs framework from patch 2.
---
 Documentation/driver-api/media/mc-core.rst | 169 +++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 1d010bd7ec49bed379e9c9b590092c0ef6e80d2b..a711b720779e1e2d2afe540d27800e6435a36e74 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -327,6 +327,173 @@ Call :c:func:`media_device_register()`, if media devnode isn't registered
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
+:c:type:`media_job_scheduler` by calling :c:func:`media_jobs_get_scheduler()`,
+passing the pointer to their :c:type:`media_device`. This ensures that all of
+the drivers are working with the same scheduler. Drivers must then call
+:c:func:`media_jobs_register_job_contributor()` to register one or more
+"contributors" to media jobs of a particular type. Each contributor has a set of
+operations that the framework will use to make decisions about the queueing,
+running and cancelling of media jobs.
+
+.. code-block:: c
+
+   struct media_job_contributor_ops {
+       int (*add_steps)(struct media_job *job, void *data);
+       bool (*ready)(void *data);
+       void (*queue)(void *data);
+       void (*abort)(void *data);
+   };
+
+The first function will be used by the framework to populate a media job with
+steps that must be performed when a media job is executed. The callback that is
+supplied should use the function :c:func:`media_jobs_add_job_step()`. For
+example:
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
+   static int isp_driver_job_add_steps(struct media_job *job, void *data)
+   {
+       return media_jobs_add_job_step(job, isp_driver_run_step, data,
+                                      MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
+   }
+
+   static struct media_job_contributor_ops isp_media_job_contributor_ops = {
+       .add_steps = isp_driver_job_add_steps,
+       ...,
+   }
+
+`media_jobs_add_job_step()` can be called as many times as necessary to add as
+many steps as are needed. The flags parameter of `media_jobs_add_job_step()`
+must be one of :c:macro:`MEDIA_JOBS_FL_STEP_ANYWHERE`,
+:c:macro:`MEDIA_JOBS_FL_STEP_FROM_FRONT`
+or :c:macro:`MEDIA_JOBS_FL_STEP_FROM_BACK`. The flag and pos parameters together
+define the order of the newly added step within the job. Steps added with
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
+Adding a step with the flag parameter set to either
+`MEDIA_JOBS_FL_STEP_FROM_FRONT` or `MEDIA_JOBS_FL_STEP_FROM_BACK` and `pos` to a
+value that was already used in a previously added step with the same flag will
+result in an error.
+
+The remaining operations defined in :c:type:`media_job_contributor_ops` are used
+by the framework to determine whether or not the contributing drivers are ready
+to run a job, to inform them that one has been queued and inform them if one is
+cancelled. It is expected that there will be some hard dependencies before a job
+can be executed; for example pushing a buffer of image data through an ISP
+pipeline necessarily requires that an input buffer be ready and an output buffer
+be ready to accept the processed data. The operations ask the drivers if those
+dependencies are met (so that they can check to see if buffers are queued), tell
+the drivers that a job has been queued (so that they can mark the buffers as
+being in-flight) and reset the dependencies in the event the job is cancelled:
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
+   static bool isp_driver_job_ready(void *data)
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
+   static void isp_driver_job_queue(void *data)
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
+   static void isp_driver_job_abort(void *data)
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
+   static struct media_job_contributor_ops isp_media_job_contributor_ops = {
+       .add_steps = isp_driver_job_add_steps
+       .ready = isp_driver_job_ready,
+       .queue = isp_driver_job_queue,
+       .abort = isp_driver_job_abort,
+   }
+
+The actual creation and queueing of the jobs should be done by the drivers by
+calling :c:func:`media_jobs_try_queue_job()` at any time a dependency of the
+job is met - for example (following the earlier example) when a buffer is queued
+to either the ISP or DMA engine's driver. When all of the dependencies that are
+necessary for a job to be queued are met (and so all of the contributors'
+.ready() callbacks return true, this function will push a job to the scheduler's
+queue.
+
+The scheduler has a workqueue that runs the jobs. This is triggered by calls to
+the :c:func:`media_jobs_run_jobs()` function, which must be called to start the
+jobs and periodically as the pipeline is running. When the streaming is finished
+the drivers should shut down the workqueue and cancel any queued jobs by calling
+:c:func:`media_jobs_cancel_jobs()`.
+
 API Definitions
 ^^^^^^^^^^^^^^^
 
@@ -336,6 +503,8 @@ API Definitions
 
 .. kernel-doc:: include/media/media-entity.h
 
+.. kernel-doc:: include/media/media-jobs.h
+
 .. kernel-doc:: include/media/media-request.h
 
 .. kernel-doc:: include/media/media-dev-allocator.h

-- 
2.34.1


