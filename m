Return-Path: <linux-media+bounces-11628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8F8C91C2
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 19:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F165E1C20BF2
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 17:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E431482DB;
	Sat, 18 May 2024 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Gkmlorq0"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-68.smtpout.orange.fr [193.252.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99641773A;
	Sat, 18 May 2024 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716054458; cv=none; b=lK++MeKQK5w5A625KqAvo5bkjw0041O+8+B64j9q/gSQz1EVH+Eq/zYRWi2ytg0CuNSEULsmuydUHhzRXuje194Xk+RZjKtFPV036jhKpY9pNBkR9l2EI95nf2Qcaszude7QXxFz8xFlGMnLVhlzG3Zr0P4TeA1n+k1XbsLb59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716054458; c=relaxed/simple;
	bh=39FrFZdoaAFSVoOAUBw1hybAn/wiSL2XQGAV3UrNVW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfW60neZJ+Rpuo4BdDW2hvzBWY6QBvOl2I2ivEikST2L+mZob5UO/MTzqQUWrUUnFNSzDW9nu5VvLpH5y7JQPZ6ITzW8VclbiMv+Ogk6D7ERJrreQYGFwnSoyraHwuSgj4Jk0CC64PWM5E6D/4k1V35ePYniWPiZsVczcX2TWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Gkmlorq0; arc=none smtp.client-ip=193.252.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 8O9WsISRlQOWM8O9Wsvlrw; Sat, 18 May 2024 19:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716054448;
	bh=UcEQtuE56kOs4tsCCaoGQju/nr916DkGkkvfsJQQWpE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Gkmlorq0ugnc3zwFK8MZXPXZN6UPrE4zoMggZlvYunBiE3Ya9e77/9iN42aea/llF
	 i0xDwilOiIdEMFCvThSIkDJZ7QvIjr3McGuJW8B88QtXyrOCZLLarSyueStalElclH
	 ZPGMZd+jIRp9PjU0eKNagNwvQE2vN5fDbpiXZ0vd1IlxWaj0dwmf3kcpb/efD4iFmo
	 YsTFu+Nue9te4ci0k8UX/6yoEpqIg4gNQu5+YYtq7Yy4nawOlBpQ2zGKiKKyWcaXax
	 7WUoKAeRShDUyHoWYIGECREk+9owyMgEcnQHJ8TOrDEzB46iYIDwhIPDQAcTRjiYCZ
	 ohxtGOqC2C6DQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 May 2024 19:47:28 +0200
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
Subject: [PATCH] dma-buf/fence-array: Add flex array to struct dma_fence_array
Date: Sat, 18 May 2024 19:47:02 +0200
Message-ID: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
---
Compile tested only.

Also, I don't think that 'cb' is a great name and the associated kernel-doc
description could certainly be improved.
Any proposal welcomed :)
---
 drivers/dma-buf/dma-fence-array.c | 10 ++++------
 include/linux/dma-fence-array.h   |  3 +++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 9b3ce8948351..9c55afaca607 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
-	struct dma_fence_array_cb *cb = (void *)(&array[1]);
+	struct dma_fence_array_cb *cb = array->cb;
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
+	array = kzalloc(struct_size(array, cb, num_fences), GFP_KERNEL);
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
index ec7f25def392..a793f9d5c73b 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -33,6 +33,7 @@ struct dma_fence_array_cb {
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
  * @work: internal irq_work function
+ * @cb: array of callback helpers
  */
 struct dma_fence_array {
 	struct dma_fence base;
@@ -43,6 +44,8 @@ struct dma_fence_array {
 	struct dma_fence **fences;
 
 	struct irq_work work;
+
+	struct dma_fence_array_cb cb[] __counted_by(num_fences);
 };
 
 /**
-- 
2.45.1


