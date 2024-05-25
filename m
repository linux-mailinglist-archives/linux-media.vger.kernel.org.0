Return-Path: <linux-media+bounces-11869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E38CEFFD
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 18:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 070B5B21127
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 16:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C33085953;
	Sat, 25 May 2024 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oKBfEsCO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EB1DFFC;
	Sat, 25 May 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716652935; cv=none; b=iIhXh6diJwCv+AgRsoXnl5w/MRqGKZIaxKV6jI25mWyKnsu5bnHh47WjYCX3jRYIMN9o+UxwooGVN22lID5zpkbptrh/+q9rpdwtJm1ipyruSaDScfp5zWD1Y8pZaR3oaZIVp84+1na9uZA50EgeSmnmktzlobUInSfYXAU6iwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716652935; c=relaxed/simple;
	bh=wA/DZCGQBGXvbLeOSNQtjnT7YRvsCmmXA2f4Xq7qKyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UE/+hfVJiafb20wHz9JPVBj9oJojbH6c2Y6WhfZStFSfk6DthTlyUf9w8bOx9Tyk0g71uhcwK2a/AgO0MmGbT/k6XDp2Yu9QGIWAG1FSN3PmpdnyRcd5+bBLvFRF0LN64G2ASyU5k1rcLrAnsSoPPyLwO4FqAY3gEqF6NHxMH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=oKBfEsCO; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id AtpGslhQJ3tO6AtpGsclcT; Sat, 25 May 2024 18:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716652856;
	bh=WNut/xtqmEtO3vfRepBElQ9DP3GCge0U4oTsojKf0dA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oKBfEsCODhjYN3BuoeE7mxdjrfivsP7ev1oxVxunkS7Xyq8NjX3IACLpQA8aaF4dV
	 IXUvuoWfI/e8POQL1UsoAbm9jAiUgP6m1hH7CPgcIpomq6iP4RetU5U3bx0C56vhVz
	 K2fD8tOA5/zPwuLwZvLn94m9V465MwTg+1Bn2FgM3qpS7epANCO3SJ6qrbBlLz1vGv
	 vVIq8CDs0USJrTHwiVQa7U/05dsyTG4uw7cttnaOkpEIVYKP0RSwJZjSmiTuZnxOl/
	 FMxIy6hi60srtYd527d8I+WX7MW7jI4w0gybwSUwO2vMSwyDcfK8/fFkz36bP3kgD6
	 +NYA7E3F3le5Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 May 2024 18:00:56 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] dma-buf/fence-array: Add flex array to struct dma_fence_array
Date: Sat, 25 May 2024 18:00:31 +0200
Message-ID: <8b4e556e07b5dd78bb8a39b67ea0a43b199083c8.1716652811.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an effort to get rid of all multiplications from allocation
functions in order to prevent integer overflows [1][2].

The "struct dma_fence_array" can be refactored to add a flex array in order
to have the "callback structures allocated behind the array" be more
explicit.

Do so:
   - makes the code more readable and safer.
   - allows using __counted_by() for additional checks
   - avoids some pointer arithmetic in dma_fence_array_enable_signaling()

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/160 [2]
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
Compile tested only.

Changes in v2:
  - Name the new field 'callbacks' instead of 'cb'   [Christian König]

v1: https://lore.kernel.org/all/d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr/
---
 drivers/dma-buf/dma-fence-array.c | 10 ++++------
 include/linux/dma-fence-array.h   |  3 +++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 9b3ce8948351..c74ac197d5fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = (void *)(&array[1]);
+	struct dma_fence_array_cb *cb = array->callbacks;
 	unsigned i;
 
 	for (i = 0; i < array->num_fences; ++i) {
@@ -168,22 +168,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 					       bool signal_on_any)
 {
 	struct dma_fence_array *array;
-	size_t size = sizeof(*array);
 
 	WARN_ON(!num_fences || !fences);
 
-	/* Allocate the callback structures behind the array. */
-	size += num_fences * sizeof(struct dma_fence_array_cb);
-	array = kzalloc(size, GFP_KERNEL);
+	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
 	if (!array)
 		return NULL;
 
+	array->num_fences = num_fences;
+
 	spin_lock_init(&array->lock);
 	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
-	array->num_fences = num_fences;
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
 
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index ec7f25def392..29c5650c1038 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -33,6 +33,7 @@ struct dma_fence_array_cb {
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
  * @work: internal irq_work function
+ * @callbacks: array of callback helpers
  */
 struct dma_fence_array {
 	struct dma_fence base;
@@ -43,6 +44,8 @@ struct dma_fence_array {
 	struct dma_fence **fences;
 
 	struct irq_work work;
+
+	struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
 };
 
 /**
-- 
2.45.1


