Return-Path: <linux-media+bounces-22263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D242A9DBD2B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49CE2B21AAE
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ABA1C330C;
	Thu, 28 Nov 2024 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKwsiEDu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E60537F8;
	Thu, 28 Nov 2024 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732828108; cv=none; b=Y+L4Jh5Fe7SRYL7bBuZYXnu41s1vbaD74HA1cyWlV9+aKgNtNGw1hjL29EJEydclE6fmRLGbXmPlhwfYKEugeQ0N/ULqRwwS9Uy1HVFHfQaK1iArnuXz0dG0LCYCUV544BDED47HmJuBkIrF6+AIXsgg0XtD02QBVqiLB3kFmfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732828108; c=relaxed/simple;
	bh=MVIf3lAQXUUcAa1h7rIJUF4U8spZDzJhVw7InbCKqTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B3gZTaPOlJ7Ht+OzqFDK4SSLoY04Kz19HknABRk7xwJOAj58BlxCxach+a4TINObusFuQrVB+rN3cy0plQ1+ggDP30eU0XeIUbgyWdix9jkD6Y4Ejquq7Lmi6uj+w3ylQJTi5/pw14NWtnYE089HfnlxxEhqdWVtz9MYrqEUU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKwsiEDu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732828106; x=1764364106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MVIf3lAQXUUcAa1h7rIJUF4U8spZDzJhVw7InbCKqTc=;
  b=CKwsiEDuP04+9Gj3dXokFJNFkt7/sGfI6KzzytdHsofPeXuLSuPfvcY8
   0qoGBM1ShAhWWo1VMhxMdnuQsyMfC2dPkqbPi7JYQpMHsRn7aSnKBcx65
   FDLdCwPrTvAMVdmASJn0sumHNXPCiZZGo8B0fIKsDr4ed80v7HNXNxyq9
   OvUUc5j9aMeHWYU0MUdpOzcEOU4EeuhCE9kDfmJ9QPqgW+Y8DfTto9dTV
   0qw72Eai+KjOP5hZljbO9ouVcSOgJW/Pw9CE+5jTb3L/+2wipQAShUYSR
   0MvIt+H3mO9DwgSDvw9RoK7Ly/OXZbzMB19l/EuCkZqfCkBP4110fr1iQ
   w==;
X-CSE-ConnectionGUID: 47zT1QUJR7a3eVs+aDNxag==
X-CSE-MsgGUID: POGF1z/PT6+enQHfusXXtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33311945"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33311945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:08:25 -0800
X-CSE-ConnectionGUID: z5s8YQJ3RSKN67t21E94iw==
X-CSE-MsgGUID: QMJkUFVjSkeurIYxqvhEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="93165065"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 13:08:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
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
	stable@vger.kernel.org
Subject: [PATCH v6 2/3] drm/xe: Move the coredump registration to the worker thread
Date: Thu, 28 Nov 2024 13:08:23 -0800
Message-ID: <20241128210824.3302147-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
References: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way, Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit

From: John Harrison <John.C.Harrison@Intel.com>

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
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 73 +++++++++++++++--------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index baac50f6dd7e..d24f1088e298 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -168,36 +168,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -246,6 +216,45 @@ static void xe_devcoredump_free(void *data)
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
 				 struct xe_exec_queue *q,
 				 struct xe_sched_job *job)
@@ -334,10 +343,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
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
2.47.0


