Return-Path: <linux-media+bounces-23344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CF9EF1AF
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8ACB28E49C
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0663231A2A;
	Thu, 12 Dec 2024 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZuStZbQb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E7231A31;
	Thu, 12 Dec 2024 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021053; cv=none; b=kctH7EE9osKz6gwHMkU0E18Rg/inosOkwIG/g90xJrV8z7kF4TL2Q+Rb0O6CB1xVoFrvhPww4ROzG6ug73vTvliALxFLEaxQkH7N3Gx7OBBQGApBznM9sq1bxT/gVb/7n50FX/RsC01auUAbpVLVv9ovo1fhbk5KhmtBXrUDUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021053; c=relaxed/simple;
	bh=zVDsgnIswwn26nWoXjijFWSdjXxlwRZdy+eGHU3/s/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNDZNdPIRHbFzZPL8WdB28iB8lIpdqwkCOBwmwhQsawGFtSrtgX8L1xYpjNK0JiRzdpC30Qs5yftvWxjQ/zr6h+RfufTNMoqeRVmnWRr1z6kWWEZPCkCmd9/mlK5TY10CnqFY2XogRWqfbenYJ3BbQF+L2qXAtN49VJ2YrwWuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZuStZbQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089FAC4CED0;
	Thu, 12 Dec 2024 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734021052;
	bh=zVDsgnIswwn26nWoXjijFWSdjXxlwRZdy+eGHU3/s/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZuStZbQbdhCYgYyhBX7ykMZrq8pM7p5yqhHgV+afuqHHm/JAvIwh0CJzLvrefDCLt
	 jAVhdQSzpg+3WE+7aRGtft0MD4AV/qkMcTYcX1dH7S7XA1z7SnL/NtQlFWNsvEL5m4
	 XjkeXZJ0T2It1GrI5v0L3ntdDHBW1Mw8Fn6XoX0I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6.1 633/772] dma-fence: Use kernels sort for merging fences
Date: Thu, 12 Dec 2024 15:59:38 +0100
Message-ID: <20241212144416.086014500@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144349.797589255@linuxfoundation.org>
References: <20241212144349.797589255@linuxfoundation.org>
User-Agent: quilt/0.67
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit fe52c649438b8489c9456681d93a9b3de3d38263 upstream.

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

>From these numbers it looks like the heap sort should not be a
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

v3:
 * Reverse the seqno sort order for a simpler squashing pass. (Christian)

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
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241115102153.1980-3-tursulin@igalia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-fence-unwrap.c | 128 ++++++++++++++---------------
 1 file changed, 61 insertions(+), 67 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index b19d0adf6086..6345062731f1 100644
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
+		return 1;
+	else if (dma_fence_is_later(a, b))
+		return -1;
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
@@ -96,80 +115,55 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
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
-
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
-		}
-	} while (tmp);
-
-	if (count == 0) {
-		tmp = dma_fence_allocate_private_stub(ktime_get());
-		goto return_tmp;
 	}
 
-	if (count == 1) {
-		tmp = array[0];
-		goto return_tmp;
-	}
+	if (count == 0 || count == 1)
+		goto return_fastpath;
 
-	result = dma_fence_array_create(count, array,
-					dma_fence_context_alloc(1),
-					1, false);
-	if (!result) {
-		for (i = 0; i < count; i++)
+	sort(array, count, sizeof(*array), fence_cmp, NULL);
+
+	/*
+	 * Only keep the most recent fence for each context.
+	 */
+	j = 0;
+	for (i = 1; i < count; i++) {
+		if (array[i]->context == array[j]->context)
 			dma_fence_put(array[i]);
-		tmp = NULL;
-		goto return_tmp;
+		else
+			array[++j] = array[i];
 	}
-	return &result->base;
+	count = ++j;
+
+	if (count > 1) {
+		result = dma_fence_array_create(count, array,
+						dma_fence_context_alloc(1),
+						1, false);
+		if (!result) {
+			for (i = 0; i < count; i++)
+				dma_fence_put(array[i]);
+			tmp = NULL;
+			goto return_tmp;
+		}
+		return &result->base;
+	}
+
+return_fastpath:
+	if (count == 0)
+		tmp = dma_fence_allocate_private_stub(timestamp);
+	else
+		tmp = array[0];
 
 return_tmp:
 	kfree(array);
-- 
2.47.1




