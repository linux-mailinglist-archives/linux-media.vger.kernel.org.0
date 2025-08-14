Return-Path: <linux-media+bounces-39899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06689B2618F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B97585C2C9F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF722F6568;
	Thu, 14 Aug 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzIDCjbd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB52F0C54;
	Thu, 14 Aug 2025 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164950; cv=none; b=EO7XyOGd+g7HGNEqM0Wbqai9lxaUtkwlcJvBI0bavzEYw9RqcG/zBO7e7j5O1m/NcBTsSfqnZlVnGxkPlirDkDxBYRDWA4fyCXMol4r7cYfSw91dcbigO8/HaZMU2Uglyfh+yq+TaXGLZ9PGq5urvx2CdhW47x8sLZXY72NG5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164950; c=relaxed/simple;
	bh=QkPxUdpuqr1DUVmmOcH04Inx+a3RZmbXnCVVRgnM76I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3G9ABgJpiQKZcvZs8SVz1utTKrkk6Ltr3gy3QIEl/HuGsvSjQ48tZsznnggfyS6MxBYwfBVtZvL26CF9U5eBsrUsjnUqWPXrbsxuYBisKnHIS+UaXb/OCMnhisctsLZbDCI/9Kl/7hxVTpqxFoN5/J4NvhqO4elUZv3FbUBqso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzIDCjbd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755164949; x=1786700949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QkPxUdpuqr1DUVmmOcH04Inx+a3RZmbXnCVVRgnM76I=;
  b=lzIDCjbdP+qGy95hJCWu/kZzb9EOXKNC4GS27FAowwm/unV4ai0OFV5/
   KaCN+Dj4d82hN+r5Stv9Zx7HzS3W9XgrN+ugYJmkaU+yMRI9KBPWTrRYX
   8CEneg9aRcau0jAxdcruQVd1R1iVRUN5YwzHkEMa7fYHM0+O2iu9o3y19
   3+Y2Fo1+YEnR7brDc1nV3IQG/vrW7G89OW6+yyLBVtl/6kbkwePnhJS1i
   nHZvkhpP9zutCKQgc1SwLsqqAY5aeKH8cQnm8/u08FbunI98a4sUcVchn
   4n/IGNuswHQI9z1fFuYapjgHpOPIbhU0oV40KTRYfj8udPyU4udG2bz4H
   Q==;
X-CSE-ConnectionGUID: rGmNI3EzTUC3N5tEia6NlA==
X-CSE-MsgGUID: 6z4rDNLXQ6utJWJe+GsRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746987"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67746987"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:49:09 -0700
X-CSE-ConnectionGUID: Rs2vrowXQQyB6UfU1Y+Jjw==
X-CSE-MsgGUID: MVSGJjwDRbG3McwsLsRftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166980981"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:49:05 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Chris Wilson <chris.p.wilson@linux.intel.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed callbacks
Date: Thu, 14 Aug 2025 10:16:15 +0200
Message-ID: <20250814094824.217142-10-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When first user starts waiting on a not yet signaled fence of a chain
link, a dma_fence_chain callback is added to a user fence of that link.
When the user fence of that chain link is then signaled, the chain is
traversed in search for a first not signaled link and the callback is
rearmed on a user fence of that link.

Since chain fences may be exposed to user space, e.g. over drm_syncobj
IOCTLs, users may start waiting on any link of the chain, then many links
of a chain may have signaling enabled and their callbacks added to their
user fences.  Once an arbitrary user fence is signaled, all
dma_fence_chain callbacks added to it so far must be rearmed to another
user fence of the chain.  In extreme scenarios, when all N links of a
chain are awaited and then signaled in reverse order, the dma_fence_chain
callback may be called up to N * (N + 1) / 2 times (an arithmetic series).

To avoid that potential excessive accumulation of dma_fence_chain
callbacks, rearm a trimmed-down, signal only callback version to the base
fence of a previous link, if not yet signaled, otherwise just signal the
base fence of the current link instead of traversing the chain in search
for a first not signaled link and moving all callbacks collected so far to
a user fence of that link.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34d..90eff264ee05c 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
         return "unbound";
 }
 
-static void dma_fence_chain_irq_work(struct irq_work *work)
+static void signal_irq_work(struct irq_work *work)
 {
 	struct dma_fence_chain *chain;
 
 	chain = container_of(work, typeof(*chain), work);
 
-	/* Try to rearm the callback */
-	if (!dma_fence_chain_enable_signaling(&chain->base))
-		/* Ok, we are done. No more unsignaled fences left */
-		dma_fence_signal(&chain->base);
+	dma_fence_signal(&chain->base);
 	dma_fence_put(&chain->base);
 }
 
-static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct dma_fence_chain *chain;
+
+	chain = container_of(cb, typeof(*chain), cb);
+	init_irq_work(&chain->work, signal_irq_work);
+	irq_work_queue(&chain->work);
+}
+
+static void rearm_irq_work(struct irq_work *work)
+{
+	struct dma_fence_chain *chain;
+	struct dma_fence *prev;
+
+	chain = container_of(work, typeof(*chain), work);
+
+	rcu_read_lock();
+	prev = rcu_dereference(chain->prev);
+	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
+		prev = NULL;
+	rcu_read_unlock();
+	if (prev)
+		return;
+
+	/* Ok, we are done. No more unsignaled fences left */
+	signal_irq_work(work);
+}
+
+static inline bool fence_is_signaled__nested(struct dma_fence *fence)
+{
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return true;
+
+	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+		unsigned long flags;
+
+		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
+		dma_fence_signal_locked(fence);
+		spin_unlock_irqrestore(fence->lock, flags);
+
+		return true;
+	}
+
+	return false;
+}
+
+static bool prev_is_signaled(struct dma_fence_chain *chain)
+{
+	struct dma_fence *prev;
+	bool result;
+
+	rcu_read_lock();
+	prev = rcu_dereference(chain->prev);
+	result = !prev || fence_is_signaled__nested(prev);
+	rcu_read_unlock();
+
+	return result;
+}
+
+static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 {
 	struct dma_fence_chain *chain;
 
 	chain = container_of(cb, typeof(*chain), cb);
-	init_irq_work(&chain->work, dma_fence_chain_irq_work);
+	if (prev_is_signaled(chain)) {
+		/* Ok, we are done. No more unsignaled fences left */
+		init_irq_work(&chain->work, signal_irq_work);
+	} else {
+		/* Try to rearm the callback */
+		init_irq_work(&chain->work, rearm_irq_work);
+	}
+
 	irq_work_queue(&chain->work);
-	dma_fence_put(f);
 }
 
 static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_chain *head = to_dma_fence_chain(fence);
+	int err = -ENOENT;
 
-	dma_fence_get(&head->base);
-	dma_fence_chain_for_each(fence, &head->base) {
-		struct dma_fence *f = dma_fence_chain_contained(fence);
+	if (WARN_ON(!head))
+		return false;
 
-		dma_fence_get(f);
-		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
+	dma_fence_get(fence);
+	if (head->fence)
+		err = dma_fence_add_callback(head->fence, &head->cb, rearm_or_signal_cb);
+	if (err) {
+		if (prev_is_signaled(head)) {
 			dma_fence_put(fence);
-			return true;
+		} else {
+			init_irq_work(&head->work, rearm_irq_work);
+			irq_work_queue(&head->work);
+			err = 0;
 		}
-		dma_fence_put(f);
 	}
-	dma_fence_put(&head->base);
-	return false;
+
+	return !err;
 }
 
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
-- 
2.50.1


