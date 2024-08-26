Return-Path: <linux-media+bounces-16843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5748395F734
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 18:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892AF1C2186B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEE9198A08;
	Mon, 26 Aug 2024 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0S19/RV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543AE198848
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691251; cv=none; b=C0shlQtE4ssEzP8x/1eYLKZTZc2ysakTVg8rIBXtqxUFjtJ2SQgxMPKSQSvH73KyZLawrY4X55ZLKrHIa4mLnD3TbG1eH03HtAZRbcpUlvajOMY5bbjk1sUXcv7rmVExFTNgNgq01t5RCzDbPCK4rkNlYbpMXXRtyVpdCloIzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691251; c=relaxed/simple;
	bh=mo9b4Do01eUKfFsI45Afrofw/5Dbt+h5VclaWoxLb3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=najsbMcPVz2J/wg+jzfxrOtOM8g0sZ13MVOTEgBjolPBL25Id76LG0UMdNHTfKkhV7Az/RuN4Zj7XpqWNrOdcppQ/eM/IrUPqGnygXEEnp1Y2OFEtfQcNgP8AITkg9NIFCURXr+vCtssaJLYxn9uwb6la0NRy8+0CtCS8iBuYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0S19/RV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724691251; x=1756227251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mo9b4Do01eUKfFsI45Afrofw/5Dbt+h5VclaWoxLb3g=;
  b=T0S19/RVGOyYeDDxWhlxw6mSxs+lvwOxWR2bwks/9bxkGz/fUUpQ3lN3
   cup9sjUuP8suRBzsP3o9rKtZcb+bALcD9sdqHnY72JpmlPfZZenAu5Ch+
   9vH2HGhm9PgdF9YJfiqwmQszCATFvcVnZ699zp8S85y14PEjown5G5Yqr
   nbM9Dg9I32YhkAUUzpIE7vF9psD3JZaNgZ9BDNLSwJjteqPAitL7pPxIR
   cHYX2yqHB0z8nNsQig33LxTxZar93gcgwIiKf7Nw0Fgr2J2TXKz/tRI6f
   M0Rd+vXbKs7gaA1S0c5Q2BvrriskEGJA9MkSlgqFw+SPEcV8mIQYVtr7Z
   g==;
X-CSE-ConnectionGUID: WecuqxXURPubaw7DfIgo4A==
X-CSE-MsgGUID: 511GuLgmQoujU/k6ZKaFyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923445"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26923445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:08 -0700
X-CSE-ConnectionGUID: B+5VXKv8S8GnXoaYQmKt8A==
X-CSE-MsgGUID: NmNeDeHJRVuk1YOhMgdTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62563499"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH 1/2] dma-buf: Split out dma fence array create into alloc and arm
Date: Mon, 26 Aug 2024 09:54:55 -0700
Message-Id: <20240826165456.2491477-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826165456.2491477-1-matthew.brost@intel.com>
References: <20240826165456.2491477-1-matthew.brost@intel.com>
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
 drivers/dma-buf/dma-fence-array.c | 19 +++++++++----------
 include/linux/dma-fence-array.h   |  9 ++++-----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index b03e0a87a5cd..0659e6b29b3c 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -158,7 +158,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
 EXPORT_SYMBOL(dma_fence_array_alloc);
 
 /**
- * dma_fence_array_arm - Arm a custom fence array
+ * dma_fence_array_init - Arm a custom fence array
  * @array:		[in]	dma fence array to arm
  * @num_fences:		[in]	number of fences to add in the array
  * @fences:		[in]	array containing the fences
@@ -169,13 +169,12 @@ EXPORT_SYMBOL(dma_fence_array_alloc);
  * Implementation of @dma_fence_array_create without allocation. Useful to arm a
  * preallocated dma fence fence in the path of reclaim or dma fence signaling.
  */
-void dma_fence_array_arm(struct dma_fence_array *array,
-			 int num_fences,
-			 struct dma_fence **fences,
-			 u64 context, unsigned seqno,
-			 bool signal_on_any)
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any)
 {
-	WARN_ON(!array || !num_fences || !fences);
+	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
 
@@ -203,7 +202,7 @@ void dma_fence_array_arm(struct dma_fence_array *array,
 	while (num_fences--)
 		WARN_ON(dma_fence_is_container(fences[num_fences]));
 }
-EXPORT_SYMBOL(dma_fence_array_arm);
+EXPORT_SYMBOL(dma_fence_array_init);
 
 /**
  * dma_fence_array_create - Create a custom fence array
@@ -235,8 +234,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	if (!array)
 		return NULL;
 
-	dma_fence_array_arm(array, num_fences, fences,
-			    context, seqno, signal_on_any);
+	dma_fence_array_init(array, num_fences, fences,
+			     context, seqno, signal_on_any);
 
 	return array;
 }
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 3466ffc4b803..079b3dec0a16 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -80,11 +80,10 @@ to_dma_fence_array(struct dma_fence *fence)
 	     ++(index), fence = dma_fence_array_next(head, index))
 
 struct dma_fence_array *dma_fence_array_alloc(int num_fences);
-void dma_fence_array_arm(struct dma_fence_array *array,
-			 int num_fences,
-			 struct dma_fence **fences,
-			 u64 context, unsigned seqno,
-			 bool signal_on_any);
+void dma_fence_array_init(struct dma_fence_array *array,
+			  int num_fences, struct dma_fence **fences,
+			  u64 context, unsigned seqno,
+			  bool signal_on_any);
 
 struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       struct dma_fence **fences,
-- 
2.34.1


