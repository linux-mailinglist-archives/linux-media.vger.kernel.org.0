Return-Path: <linux-media+bounces-16846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D063A95F755
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5981F22BA5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB0198A34;
	Mon, 26 Aug 2024 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6lgTZk9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F2B198A0F
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691654; cv=none; b=umZ/cyK/oYcaxfHyn8J5KdZmZt8fNb0MJnlUowTfRPJ8TQSwEQdrRvIwt2Q8FP9EvCMBl8Ak0B2npkkdcWkI5ML3HdCI2CfRHqiNWGF9Yw5fLHAjYQPbd1fef4bjS0gVl/ilrihNHXIH/WMOrfsPG4pbrpHIUbf4syXyOUVa3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691654; c=relaxed/simple;
	bh=X4NcHhht7R85hRcl43GBO0i1KlziGSyVufpAc1OriAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtEh65gtqwgNFN9wi9GaeEQ5Xiq8CF3ghyoc0f6QqtfyMaj6aDodNhBRAd355Oe8nTAtfOTFwulowg+qRZHO92F9Q3TyUpccLNIobRjPpja7PTlrexqxmd81SthK5e7RRA2W/LiGPmow2GvjoDO7VcTzR6ootzQkqTjtUksMUvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6lgTZk9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724691652; x=1756227652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4NcHhht7R85hRcl43GBO0i1KlziGSyVufpAc1OriAU=;
  b=D6lgTZk9D3z3eJkM688DT05wUXSGPSQOK+Nr878+nTECHTaYKiB6toLu
   8BAXCSEm7V8WCslgvTYtIrVI1stJnuXCBA1f+x238K232kymXSGE3h3aa
   +Z4fzEsaWhInsoB6GGrwuiTuBDlO230bvt+Xr7FbRsM5w6HcFN/bIi7wV
   1lX8mdLLVQOlaiTNn8PhTikN5GwFYmoLZMN44vt47DnJ/cEyG3F6+3mc4
   57sf0PZeTYvPjYBavm2wc/JxmkE9QV0yrEA3fLHOci3JDoETyvrUqOJJf
   CtCozKWhMyaj+cgZlCEDyQA/Rw+U2GQgjCgjUJRJwXSb3DPJ0Tdeq+Zp4
   g==;
X-CSE-ConnectionGUID: kb/Bos1YT4WILbzmBiTOsA==
X-CSE-MsgGUID: m5DaURYRQKWATXdyxepnrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22997993"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="22997993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:00:50 -0700
X-CSE-ConnectionGUID: tP0j6q0iTUy0GUeqhaclUg==
X-CSE-MsgGUID: aq43GtrdSCSn8KGNQvgBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62247120"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:00:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH v2 1/2] dma-buf: Split out dma fence array create into alloc and arm functions
Date: Mon, 26 Aug 2024 10:01:43 -0700
Message-Id: <20240826170144.2492062-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826170144.2492062-1-matthew.brost@intel.com>
References: <20240826170144.2492062-1-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Useful to preallocate dma fence array and then arm in path of reclaim or
a dma fence.

v2:
 - s/arm/init (Christian)
 - Drop !array warn (Christian)

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
 include/linux/dma-fence-array.h   |  6 +++
 2 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index c74ac197d5fe..0659e6b29b3c 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
 EXPORT_SYMBOL(dma_fence_array_ops);
 
 /**
- * dma_fence_array_create - Create a custom fence array
+ * dma_fence_array_alloc - Allocate a custom fence array
+ * @num_fences:		[in]	number of fences to add in the array
+ *
+ * Return dma fence array on success, NULL on failure
+ */
+struct dma_fence_array *dma_fence_array_alloc(int num_fences)
+{
+	struct dma_fence_array *array;
+
+	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
+}
+EXPORT_SYMBOL(dma_fence_array_alloc);
+
+/**
+ * dma_fence_array_init - Arm a custom fence array
+ * @array:		[in]	dma fence array to arm
  * @num_fences:		[in]	number of fences to add in the array
  * @fences:		[in]	array containing the fences
  * @context:		[in]	fence context to use
  * @seqno:		[in]	sequence number to use
  * @signal_on_any:	[in]	signal on any fence in the array
  *
- * Allocate a dma_fence_array object and initialize the base fence with
- * dma_fence_init().
- * In case of error it returns NULL.
- *
- * The caller should allocate the fences array with num_fences size
- * and fill it with the fences it wants to add to the object. Ownership of this
- * array is taken and dma_fence_put() is used on each fence on release.
- *
- * If @signal_on_any is true the fence array signals if any fence in the array
- * signals, otherwise it signals when all fences in the array signal.
+ * Implementation of @dma_fence_array_create without allocation. Useful to arm a
+ * preallocated dma fence fence in the path of reclaim or dma fence signaling.
  */
-struct dma_fence_array *dma_fence_array_create(int num_fences,
-					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any)
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any)
 {
-	struct dma_fence_array *array;
-
 	WARN_ON(!num_fences || !fences);
 
-	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
-	if (!array)
-		return NULL;
-
 	array->num_fences = num_fences;
 
 	spin_lock_init(&array->lock);
@@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 */
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
+}
+EXPORT_SYMBOL(dma_fence_array_init);
+
+/**
+ * dma_fence_array_create - Create a custom fence array
+ * @num_fences:		[in]	number of fences to add in the array
+ * @fences:		[in]	array containing the fences
+ * @context:		[in]	fence context to use
+ * @seqno:		[in]	sequence number to use
+ * @signal_on_any:	[in]	signal on any fence in the array
+ *
+ * Allocate a dma_fence_array object and initialize the base fence with
+ * dma_fence_init().
+ * In case of error it returns NULL.
+ *
+ * The caller should allocate the fences array with num_fences size
+ * and fill it with the fences it wants to add to the object. Ownership of this
+ * array is taken and dma_fence_put() is used on each fence on release.
+ *
+ * If @signal_on_any is true the fence array signals if any fence in the array
+ * signals, otherwise it signals when all fences in the array signal.
+ */
+struct dma_fence_array *dma_fence_array_create(int num_fences,
+					       struct dma_fence **fences,
+					       u64 context, unsigned seqno,
+					       bool signal_on_any)
+{
+	struct dma_fence_array *array;
+
+	array = dma_fence_array_alloc(num_fences);
+	if (!array)
+		return NULL;
+
+	dma_fence_array_init(array, num_fences, fences,
+			     context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 29c5650c1038..079b3dec0a16 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any);
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
-- 
2.34.1


