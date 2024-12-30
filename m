Return-Path: <linux-media+bounces-24175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1319FE8AA
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 16:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698C21883193
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649E71AAE33;
	Mon, 30 Dec 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZUGlkkpF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44D15E8B;
	Mon, 30 Dec 2024 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735574252; cv=none; b=Ne/gf9oOyplys6Nj2AH/jQ+XAgleu8jxm8Qm0sebA9ku+2CrU+kl2ZaDNvLrkQ88ufEpBZreh/Jkhx+/xzKctoldIeP44tOzanKq2Nzdha64Wg/UPb/pE1PSg3Pximrx3dvxc+9UHrakCdCDB32nvPCGJa2dbk/bercjYplBky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735574252; c=relaxed/simple;
	bh=ytWP7xm1N1BYDdL2xV7knjDbUMPzUcgaIdtH8igoumg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sN69WRh+CILHnkssLuhlnEoUeatL29uCJBicUL7Qz4v0YRw+3TPFS5GWkVLz+yQkwZaz4z7LAGvN8Xk0nSl0kJDl0axIHT1e4mu0Y19fE3YogZnlxhf3gYuDAMhJ4j6fXFpzn/9a0rI7SGNC6KMhs6w17FSLbzT0TbNFlJxsxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZUGlkkpF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5CEC4CED0;
	Mon, 30 Dec 2024 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735574252;
	bh=ytWP7xm1N1BYDdL2xV7knjDbUMPzUcgaIdtH8igoumg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUGlkkpFcYlpSIW2FGaRQaQYmq6LzPcNgZ9YaXl/LCqbN/xupDlFtzoHzflMoe6Uu
	 2fhs3uTgT5+9ZdrMwo8jRgEsx40sowK+R95VJ593oFDFcKVAprl9TSM+aCG0lodQJU
	 nR3Pq09eSCGjDvqLzXgqVWIGeMsJpTPp8C++3zQ0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Francois Dugast <francois.dugast@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	John Harrison <John.C.Harrison@Intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 080/114] drm/xe: Move the coredump registration to the worker thread
Date: Mon, 30 Dec 2024 16:43:17 +0100
Message-ID: <20241230154221.171449150@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230154218.044787220@linuxfoundation.org>
References: <20241230154218.044787220@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: John Harrison <John.C.Harrison@Intel.com>

[ Upstream commit 5dce85fecb87751ec94526e1ac516dd7871e2e0c ]

Adding lockdep checking to the coredump code showed that there was an
existing violation. The dev_coredumpm_timeout() call is used to
register the dump with the base coredump subsystem. However, that
makes multiple memory allocations, only some of which use the GFP_
flags passed in. So that also needs to be deferred to the worker
function where it is safe to allocate with arbitrary flags.

In order to not add protoypes for the callback functions, moving the
_timeout call also means moving the worker thread function to later in
the file.

v2: Rebased after other changes to the worker function.

Fixes: e799485044cb ("drm/xe: Introduce the dev_coredump infrastructure.")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241128210824.3302147-3-John.C.Harrison@Intel.com
(cherry picked from commit 90f51a7f4ec1004fc4ddfbc6d1f1068d85ef4771)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 73 +++++++++++++++--------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index c40c91e27f71..c18e463092af 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -144,36 +144,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	ss->vm = NULL;
 }
 
-static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
-{
-	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
-	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
-	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
-
-	xe_pm_runtime_get(xe);
-
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
-
-	xe_pm_runtime_put(xe);
-
-	/* Calculate devcoredump size */
-	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
-
-	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
-	if (!ss->read.buffer)
-		return;
-
-	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
-	xe_devcoredump_snapshot_free(ss);
-}
-
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -222,6 +192,45 @@ static void xe_devcoredump_free(void *data)
 		 "Xe device coredump has been deleted.\n");
 }
 
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	struct xe_device *xe = coredump_to_xe(coredump);
+	unsigned int fw_ref;
+
+	/*
+	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
+	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
+	 * thread and not in the initial capture call.
+	 */
+	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+			      xe_devcoredump_read, xe_devcoredump_free,
+			      XE_COREDUMP_TIMEOUT_JIFFIES);
+
+	xe_pm_runtime_get(xe);
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+
+	xe_pm_runtime_put(xe);
+
+	/* Calculate devcoredump size */
+	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
+
+	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+	if (!ss->read.buffer)
+		return;
+
+	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
+	xe_devcoredump_snapshot_free(ss);
+}
+
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 				 struct xe_sched_job *job)
 {
@@ -305,10 +314,6 @@ void xe_devcoredump(struct xe_sched_job *job)
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
-
-	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
-			      xe_devcoredump_read, xe_devcoredump_free,
-			      XE_COREDUMP_TIMEOUT_JIFFIES);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
-- 
2.39.5




