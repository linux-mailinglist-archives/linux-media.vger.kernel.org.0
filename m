Return-Path: <linux-media+bounces-21402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B509C8894
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 12:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E3B21F225A2
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 11:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249B41F893C;
	Thu, 14 Nov 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PDLlCfjq"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E177376E0;
	Thu, 14 Nov 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731582918; cv=none; b=P/FBXLZsBjAl+ghiDTzCBWv1FpWUgPLe3ndqP5M2fWQUdKF4eDv9jSXSaB9SKMLLTQrtjaZ7SySUBQ/2odaMgGGrFun6n2cMA+KPV1xB+JkE9y43i/YcDoNDPPcsfiGaMCmkFnE9N821iu5sQSW3Yz+Q48HP1XOUBN7Atd8aidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731582918; c=relaxed/simple;
	bh=/K/UiJX0j7hMtZ0RmMBY3H5qgODir9oL/dlLxAvx2iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KgUMOKyPYMbWoY+HGQJ2ddQ+hF8Q53u4xH9hgO8PIfU8ARWtsuilG+QbdO/E0D3OQ+JzQb57ucW0I9tluNXs2LBWmr0/nHwfGLLtsqgac4crewxQhE6p3VJrB93HwM4c5bDtFcN89vHmgTJSP9rRtU3uQ/IHqkgPMNG7OAMIOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PDLlCfjq; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2LuLTdWQm1q7pIyzru/q80ZGTB2+cIlxufsJ+3St1k4=; b=PDLlCfjqjPE08MBpEd5+caiKlW
	Hl8k9yWKf8y0TffASpehG7Szl7Ll5ewBqMrZbAiiItU7aSW6bxoaeSKIAtyXGZOiRquFRxXY/sbvL
	jnT7l6iqF7jZS/0wHpONdlcIIA8qD6ZtWJ+IOlQf74PI51Y9q5J90m1GAXaHpTW4r4g8v61bvwOw0
	NzqQ06llPxuwttWy3M8JN1JxJ8K7l6ERRr0RZUhYQKom0H008TCo7gzoQVHr/Z9vIUj/xsIrWawLC
	mf871oIE/A6VAcsEt7pMhWwL1k/dGzz7EyErHH1SE8qHldlO5ej19FItD5jBFcurvk1xkvC06bQ+5
	xvQXb/Jg==;
Received: from [90.241.98.187] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tBXoY-006m84-2u; Thu, 14 Nov 2024 12:15:06 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dma-fence: Use kernel's sort for merging fences
Date: Thu, 14 Nov 2024 11:14:59 +0000
Message-ID: <20241114111500.77358-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

One alternative to the fix Christian proposed in
https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
is to replace the rather complex open coded sorting loops with the kernel
standard sort followed by a context squashing pass.

Proposed advantage of this would be readability but one concern Christian
raised was that there could be many fences, that they are typically mostly
sorted, and so the kernel's heap sort would be much worse by the proposed
algorithm.

I had a look running some games and vkcube to see what are the typical
number of input fences. Tested scenarios:

1) Hogwarts Legacy under Gamescope

450 calls per second to __dma_fence_unwrap_merge.

Percentages per number of fences buckets, before and after checking for
signalled status, sorting and flattening:

   N       Before      After
   0       0.91%
   1      69.40%
  2-3     28.72%       9.4%  (90.6% resolved to one fence)
  4-5      0.93%
  6-9      0.03%
  10+

2) Cyberpunk 2077 under Gamescope

1050 calls per second, amounting to 0.01% CPU time according to perf top.

   N       Before      After
   0       1.13%
   1      52.30%
  2-3     40.34%       55.57%
  4-5      1.46%        0.50%
  6-9      2.44%
  10+      2.34%

3) vkcube under Plasma

90 calls per second.

   N       Before      After
   0
   1
  2-3      100%         0%   (Ie. all resolved to a single fence)
  4-5
  6-9
  10+

In the case of vkcube all invocations in the 2-3 bucket were actually
just two input fences.

From these numbers it looks like the heap sort should not be a
disadvantage, given how the dominant case is <= 2 input fences which heap
sort solves with just one compare and swap. (And for the case of one input
fence we have a fast path in the previous patch.)

A complementary possibility is to implement a different sorting algorithm
under the same API as the kernel's sort() and so keep the simplicity,
potentially moving the new sort under lib/ if it would be found more
widely useful.

v2:
 * Hold on to fence references and reduce commentary. (Christian)
 * Record and use latest signaled timestamp in the 2nd loop too.
 * Consolidate zero or one fences fast paths.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.0+
---
 drivers/dma-buf/dma-fence-unwrap.c | 129 ++++++++++++++---------------
 1 file changed, 64 insertions(+), 65 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 628af51c81af..26cad03340ce 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 
 /* Internal helper to start new array iteration, don't use directly */
 static struct dma_fence *
@@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
 
+
+static int fence_cmp(const void *_a, const void *_b)
+{
+	struct dma_fence *a = *(struct dma_fence **)_a;
+	struct dma_fence *b = *(struct dma_fence **)_b;
+
+	if (a->context < b->context)
+		return -1;
+	else if (a->context > b->context)
+		return 1;
+
+	if (dma_fence_is_later(b, a))
+		return -1;
+	else if (dma_fence_is_later(a, b))
+		return 1;
+
+	return 0;
+}
+
 /* Implementation for the dma_fence_merge() marco, don't use directly */
 struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 					   struct dma_fence **fences,
@@ -67,8 +87,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
 	ktime_t timestamp;
-	unsigned int i;
-	size_t count;
+	int i, j, count;
 
 	count = 0;
 	timestamp = ns_to_ktime(0);
@@ -96,78 +115,58 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	if (!array)
 		return NULL;
 
-	/*
-	 * This trashes the input fence array and uses it as position for the
-	 * following merge loop. This works because the dma_fence_merge()
-	 * wrapper macro is creating this temporary array on the stack together
-	 * with the iterators.
-	 */
-	for (i = 0; i < num_fences; ++i)
-		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
-
 	count = 0;
-	do {
-		unsigned int sel;
-
-restart:
-		tmp = NULL;
-		for (i = 0; i < num_fences; ++i) {
-			struct dma_fence *next;
-
-			while (fences[i] && dma_fence_is_signaled(fences[i]))
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-
-			next = fences[i];
-			if (!next)
-				continue;
-
-			/*
-			 * We can't guarantee that inpute fences are ordered by
-			 * context, but it is still quite likely when this
-			 * function is used multiple times. So attempt to order
-			 * the fences by context as we pass over them and merge
-			 * fences with the same context.
-			 */
-			if (!tmp || tmp->context > next->context) {
-				tmp = next;
-				sel = i;
-
-			} else if (tmp->context < next->context) {
-				continue;
-
-			} else if (dma_fence_is_later(tmp, next)) {
-				fences[i] = dma_fence_unwrap_next(&iter[i]);
-				goto restart;
+	for (i = 0; i < num_fences; ++i) {
+		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
+			if (!dma_fence_is_signaled(tmp)) {
+				array[count++] = dma_fence_get(tmp);
 			} else {
-				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-				goto restart;
+				ktime_t t = dma_fence_timestamp(tmp);
+
+				if (ktime_after(t, timestamp))
+					timestamp = t;
 			}
 		}
+	}
 
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+	if (count == 0 || count == 1)
+		goto return_fastpath;
+
+	sort(array, count, sizeof(*array), fence_cmp, NULL);
+
+	/*
+	 * Only keep the most recent fence for each context.
+	 */
+	j = 0;
+	tmp = array[0];
+	for (i = 1; i < count; i++) {
+		if (array[i]->context != tmp->context)
+			array[j++] = tmp;
+		else
+			dma_fence_put(tmp);
+		tmp = array[i];
+	}
+	if (j == 0 || tmp->context != array[j - 1]->context) {
+		array[j++] = tmp;
+	}
+	count = j;
+
+	if (count > 1) {
+		result = dma_fence_array_create(count, array,
+						dma_fence_context_alloc(1),
+						1, false);
+		if (!result) {
+			tmp = NULL;
+			goto return_tmp;
 		}
-	} while (tmp);
-
-	if (count == 0) {
-		tmp = dma_fence_allocate_private_stub(ktime_get());
-		goto return_tmp;
+		return &result->base;
 	}
 
-	if (count == 1) {
+return_fastpath:
+	if (count == 0)
+		tmp = dma_fence_allocate_private_stub(timestamp);
+	else
 		tmp = array[0];
-		goto return_tmp;
-	}
-
-	result = dma_fence_array_create(count, array,
-					dma_fence_context_alloc(1),
-					1, false);
-	if (!result) {
-		tmp = NULL;
-		goto return_tmp;
-	}
-	return &result->base;
 
 return_tmp:
 	kfree(array);
-- 
2.46.0


