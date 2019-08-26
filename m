Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964039D212
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732757AbfHZO5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35798 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732714AbfHZO5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so16203676wmg.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qr169mH//wra/FZqs+J4o27Nb6o+9jXbc+hUaCfBlw4=;
        b=DN08kfxDmiApfFOUjNg4DxrMasEDzd3NSBjAJhBviJhds/xOhYATXNq+PE2la3Mzor
         UfTMpdovsAcAwxfVri2QWktL9nWhnIoJdAibNVh7jZpu5Lv+gkLdXGMiBt2gaBw5sSkk
         9LzcqEt4z5izEWW0up+u2rkz+U57AoZsClfYrgYafEmgxDPT5clqUHk4rCrdvcoTdH9V
         U1Y3xFAdEtjFhmXJSjydKfrh0ZMAfPvBxbzu9Y7/vU3lsyZnQ7XV5idPDtofXBcNPCUN
         xNAk58/9NvrR9ElsIlcI/vWCK74iEjeBLeXj3kRb4JSYCfCUmm6g+xAp/P9szoq+bQr2
         HkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qr169mH//wra/FZqs+J4o27Nb6o+9jXbc+hUaCfBlw4=;
        b=Yap1R92rH4ZxACZGcllU3G41Oc4T/ejLXLrwc3sRJ5LtWAkotrdqwRc1gq7sDN5MuT
         7Xnc1H7SRFmtrZoBfUygYlJWaHZ/Aq5I1xqukAb1EypHalKSQD4O/eps3gDeAGnpQnzv
         pBiyKwDQzXvzOjxcxz4adwhcMJh5krhEHT6Ssah8TmXMZ7JK8AX/cWdL9riRIYBAFji/
         791a1i0Dngv3PB7qIbg6YziwJ8EfxJ+JMwYQPkXjyxp0dr2/hbiCBB+1fLCn1AYx3+xB
         N22dXrRkF1U0Q+PknxUU/6DeLCi5CQ5p/KZdsS4D3o1yr/GaTZAfK0ElJEpb1sjqV0Lk
         Qn1A==
X-Gm-Message-State: APjAAAUIG24T6yYDbVe0rYJZMFuBJX7wy0Le9MTLmE8Sja/iUQvmU43D
        in8mYGK/MY8txFK41VwVdRY=
X-Google-Smtp-Source: APXvYqzFxm4esv8qKesGZ4Tdm/WpDilocSgmZtylyZpEHX20jb8O8/75GCGIRX/unVlHYPjWvOPBZQ==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr20621083wme.134.1566831455779;
        Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/9] dma-buf: add dma_fence_array_alloc/free
Date:   Mon, 26 Aug 2019 16:57:25 +0200
Message-Id: <20190826145731.1725-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This seperates allocation and initialization of the dma_fence_array object
and allows allocating the fence array together with the dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 101 ++++++++++++++++++++----------
 include/linux/dma-fence-array.h   |  50 +++++++++++++--
 2 files changed, 115 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 52068ee5eb35..4664607f0abc 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -119,14 +119,7 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
 
 static void dma_fence_array_release(struct dma_fence *fence)
 {
-	struct dma_fence_array *array = to_dma_fence_array(fence);
-	unsigned i;
-
-	for (i = 0; i < array->num_fences; ++i)
-		dma_fence_put(array->fences[i]);
-
-	kfree(array->fences);
-	dma_fence_free(fence);
+	dma_fence_array_free(container_of(fence, struct dma_fence_array, base));
 }
 
 const struct dma_fence_ops dma_fence_array_ops = {
@@ -139,52 +132,96 @@ const struct dma_fence_ops dma_fence_array_ops = {
 EXPORT_SYMBOL(dma_fence_array_ops);
 
 /**
- * dma_fence_array_create - Create a custom fence array
+ * dma_fence_array_alloc - Allocate a custom fence array
  * @num_fences:		[in]	number of fences to add in the array
- * @fences:		[in]	array containing the fences
- * @context:		[in]	fence context to use
- * @seqno:		[in]	sequence number to use
- * @signal_on_any:	[in]	signal on any fence in the array
+ * @fences:		[in]	optional array containing the fences
  *
- * Allocate a dma_fence_array object and initialize the base fence with
- * dma_fence_init().
- * In case of error it returns NULL.
+ * Allocate a dma_fence_array object, in case of error it returns NULL.
  *
- * The caller should allocate the fences array with num_fences size
- * and fill it with the fences it wants to add to the object. Ownership of this
- * array is taken and dma_fence_put() is used on each fence on release.
- *
- * If @signal_on_any is true the fence array signals if any fence in the array
- * signals, otherwise it signals when all fences in the array signal.
+ * The fences array is optional and if NULL allocated together with the
+ * dma_fence_array object.
  */
-struct dma_fence_array *dma_fence_array_create(int num_fences,
-					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any)
+struct dma_fence_array *dma_fence_array_alloc(int num_fences,
+					      struct dma_fence **fences)
 {
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
 
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
+
+	/* Allocate the fences structures behind the callbacks */
+	if (!fences)
+		size += num_fences * sizeof(struct dma_fence *);
+
 	array = kzalloc(size, GFP_KERNEL);
 	if (!array)
 		return NULL;
 
+	if (!fences) {
+		struct dma_fence_array_cb *cb = (void *)(&array[1]);
+
+		num_fences = dma_fence_array_max_fences(array);
+		fences = (void *)(&cb[num_fences]);
+	}
+	array->fences = fences;
+	return array;
+}
+EXPORT_SYMBOL(dma_fence_array_alloc);
+
+/**
+ * dma_fence_array_init - init a custom fence array
+ * @array:		[in]	the pre-allocated array to init
+ * @context:		[in]	fence context to use
+ * @seqno:		[in]	sequence number to use
+ * @signal_on_any:	[in]	signal on any fence in the array
+ *
+ * Initialize the base fence with dma_fence_init().
+ *
+ * The caller should allocate the fences array with num_fences size
+ * and fill it with the fences it wants to add to the object. Ownership of this
+ * array is taken and dma_fence_put() is used on each fence on release.
+ *
+ * If @signal_on_any is true the fence array signals if any fence in the array
+ * signals, otherwise it signals when all fences in the array signal.
+ */
+void dma_fence_array_init(struct dma_fence_array *array, u64 context,
+			  unsigned int seqno, bool signal_on_any)
+{
 	spin_lock_init(&array->lock);
 	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
 		       context, seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
-	array->num_fences = num_fences;
-	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
-	array->fences = fences;
-
+	atomic_set(&array->num_pending, signal_on_any ? 1 : array->num_fences);
 	array->base.error = PENDING_ERROR;
+}
+EXPORT_SYMBOL(dma_fence_array_init);
 
-	return array;
+/**
+ * dma_fence_array_free - free a dma_fence_array object
+ * @array: the object to free
+ *
+ * The a dma_fence_array and drop all references to the fences it contains.
+ */
+void dma_fence_array_free(struct dma_fence_array *array)
+{
+	unsigned i;
+
+	if (!array)
+		return;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_put(array->fences[i]);
+
+	/* Check if fences are part of the array */
+	if ((u8 *)array->fences < (u8 *)array ||
+	    (u8 *)array->fences > ((u8 *)array) + ksize(array))
+		kfree(array->fences);
+
+	dma_fence_free(&array->base);
 }
-EXPORT_SYMBOL(dma_fence_array_create);
+EXPORT_SYMBOL(dma_fence_array_free);
 
 /**
  * dma_fence_match_context - Check if all fences are from the given context
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index f99cd7eb24e0..be85c06b524d 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -14,6 +14,7 @@
 
 #include <linux/dma-fence.h>
 #include <linux/irq_work.h>
+#include <linux/slab.h>
 
 /**
  * struct dma_fence_array_cb - callback helper for fence array
@@ -74,10 +75,51 @@ to_dma_fence_array(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_array, base);
 }
 
-struct dma_fence_array *dma_fence_array_create(int num_fences,
-					       struct dma_fence **fences,
-					       u64 context, unsigned seqno,
-					       bool signal_on_any);
+/**
+ * dma_fence_array_max_fences - calculate maximum number of fences
+ * @array:	[in]	the dma_fence_array to use
+ *
+ * Returns the maximum number of fences a dma_fence_array can store.
+ */
+static inline unsigned int
+dma_fence_array_max_fences(struct dma_fence_array *array)
+{
+	return (ksize(array) - sizeof(*array)) /
+		(sizeof(struct dma_fence_array_cb) +
+		 sizeof(struct dma_fence *));
+}
+
+struct dma_fence_array *dma_fence_array_alloc(int num_fences,
+					      struct dma_fence **fences);
+void dma_fence_array_init(struct dma_fence_array *array, u64 context,
+			  unsigned int seqno, bool signal_on_any);
+void dma_fence_array_free(struct dma_fence_array *array);
+
+/**
+ * dma_fence_array_create - Create a custom fence array
+ * @num_fences:		[in]	number of fences to add in the array
+ * @fences:		[in]	array containing the fences
+ * @context:		[in]	fence context to use
+ * @seqno:		[in]	sequence number to use
+ * @signal_on_any:	[in]	signal on any fence in the array
+ *
+ * Wrapper around dma_fence_array_alloc and dma_fence_array_init. Returns NULL
+ * on allocation failure.
+ */
+static inline struct dma_fence_array *
+dma_fence_array_create(int num_fences, struct dma_fence **fences, u64 context,
+		       unsigned seqno, bool signal_on_any)
+{
+	struct dma_fence_array *array;
+
+	array = dma_fence_array_alloc(num_fences, fences);
+	if (!array)
+		return NULL;
+
+	array->num_fences = num_fences;
+	dma_fence_array_init(array, context, seqno, signal_on_any);
+	return array;
+}
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
-- 
2.17.1

