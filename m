Return-Path: <linux-media+bounces-16627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15495C469
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 06:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D294C1C220AC
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 04:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1A04C62B;
	Fri, 23 Aug 2024 04:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byfUHgNq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500CF3EA72
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388831; cv=none; b=Bw1sP2FqDvpOxTQY28L69uPZllMbwQ3GhlWSVJQfsP4Hb8JumlmasONZpuEhDk/BvMPsbbnW9ib66/scIC2xSw+6VQ3v8xn89C/Z51oLfQ4WS79g/94jYcGW1eoI8q7dsOlswid+iR1bBXnK1SBn4Xm5+HNklOWefKNh8212vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388831; c=relaxed/simple;
	bh=9WWRRj1RW5kY9EJCtnqTP5B0OgZazgRaMjqrj4rNtn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otfVCKLlitGAc+8nV+B+Ufr24GZCW1ktQOUS7lgtD2b5NGueNdfJ+fQqcXAY6enntq1uqmphTBPKCp0YPk5HmVlKKAVPKa1xcBlzt2QQQo3n15/+3PMNU9tBqBYxUOtTHalDWc5G5tsznEgNM2Wy/h3SK7OUzyAC4CCwtb5A3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byfUHgNq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724388830; x=1755924830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9WWRRj1RW5kY9EJCtnqTP5B0OgZazgRaMjqrj4rNtn4=;
  b=byfUHgNqqMGh8ijUjYaS4QuVBIVXSUyDr5ghjTpLNid281Qcbz8oA74B
   1/EUdnEtgL+2BjxAGoLDhrNEP8ngpSJpa/loRnLvORWMTqS7cdjwU1KWN
   FO8avFnk1CN1/2IO+tOfXvnClhT1fhvrm34oqDf6GCmFE/TuK6OGFuBvj
   L08+DZsqIWnny9Mhn3fOTcZUDbKptv4ZQUCVwiQSv03SosYd2Dused7R6
   08MTd1y4tgUxkE5GcGy1km4rUVIuLV3919KvMixdomzfnCmS4BE8faceX
   TNY5XSj+DdYjJ76t4zif6FdEwJ1+O6x/4q1y5QezAOhzwoOIKQjDlWkNJ
   A==;
X-CSE-ConnectionGUID: 8zNVMlYZRjiH0sZwARirRg==
X-CSE-MsgGUID: YA13uXGnSFiaQyuVBvPUag==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26709250"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26709250"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
X-CSE-ConnectionGUID: eYjq4NBBSKGLzLe+DIUC3A==
X-CSE-MsgGUID: +mBTDfe2SbOh1JKq+tok2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66608948"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	daniel@ffwll.ch
Subject: [PATCH v3 1/2] dma-buf: Split out dma fence array create into alloc and arm functions
Date: Thu, 22 Aug 2024 21:54:42 -0700
Message-Id: <20240823045443.2132118-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
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

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
 include/linux/dma-fence-array.h   |  7 +++
 2 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index c74ac197d5fe..b03e0a87a5cd 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -144,36 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
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
+ * dma_fence_array_arm - Arm a custom fence array
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
+void dma_fence_array_arm(struct dma_fence_array *array,
+			 int num_fences,
+			 struct dma_fence **fences,
+			 u64 context, unsigned seqno,
+			 bool signal_on_any)
 {
-	struct dma_fence_array *array;
-
-	WARN_ON(!num_fences || !fences);
-
-	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
-	if (!array)
-		return NULL;
+	WARN_ON(!array || !num_fences || !fences);
 
 	array->num_fences = num_fences;
 
@@ -200,6 +202,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 */
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
+}
+EXPORT_SYMBOL(dma_fence_array_arm);
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
+	dma_fence_array_arm(array, num_fences, fences,
+			    context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 29c5650c1038..3466ffc4b803 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -79,6 +79,13 @@ to_dma_fence_array(struct dma_fence *fence)
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
 	     ++(index), fence = dma_fence_array_next(head, index))
 
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);
+void dma_fence_array_arm(struct dma_fence_array *array,
+			 int num_fences,
+			 struct dma_fence **fences,
+			 u64 context, unsigned seqno,
+			 bool signal_on_any);
+
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
 					       u64 context, unsigned seqno,
-- 
2.34.1


