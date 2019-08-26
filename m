Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F14F9D217
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732766AbfHZO5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37227 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732761AbfHZO5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so15663421wrt.4
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4YEZfHUEvfCRDVgXKCcRqJ5N1s+7+Mxi21IddmT3YB0=;
        b=ruoPopLQENqaUT7j/4Rw5VrzOwzAA4z0XRnlTV60QmQYVJiqsjM9fSJyh8MoVf3sJP
         22tkOV7F2LMwlub3ltgOocgOuBDXpxV68t/tIA5wveMuMlTz3edQ/XngQKS5P8+oRu8a
         c0TlZByDQnG+yfKw/7M2nZOllxEnM+OqR7RuPy5p8wPOJJWNGKUV7MOcj2AS2LpCks5+
         eEWK3gFDgWjJ/xL0a6p1TVlWxYhHeIgylB5y4mhUqKaL+FoPnzukeFbiwwrHhvHVSeMA
         9sy1JcFnch974+6G11T9hrk2W/F4Za8rY6k/vnnEFTonWO+Xpa0Hu4NmrBRa3v2uddFr
         5ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4YEZfHUEvfCRDVgXKCcRqJ5N1s+7+Mxi21IddmT3YB0=;
        b=GDhm7yU3/pfkplwIdVdZrq7Mobmfrw8hlX01woZH9jP15kNVvr0N59RMT0i3R5TL52
         zDxbEMukIBhTSJYweCVLtP9NwwJG5zbcVMBiisr46Vpf0RfCnLVUfaqeqlZyc1CSKAG8
         qpSR33iF/eqL85s6fsbf3yXOcTOWsvebXuD8enIxHj2mhJGmMmNAwNftYUUzXQyq1uft
         31OU1cHgZX6y62W4Cmv1q8Fm8AzAbx2BfHj5tORfyS6ChV2ar5/7w1cfmXRqe8RqTgQd
         cG/8xtkjbO7qWIEpLJorfepXi6O8Iz2vhBaKtNUa8Ff99HKQMEDPgfLV6Qi74Me6aukb
         6Big==
X-Gm-Message-State: APjAAAXMTuntPd3/sxp743bwRMOmNLI6/gvlQZnNu7ge4O8pSKxhKoEY
        WlyP+h7ue2XbwMDLd7Nj60o=
X-Google-Smtp-Source: APXvYqzzhFtpY7gybZ6/rOPnJ49h20BUn69Ku0z73CKGBtcr7lfWK1fGCP2+ui9VzVy0dp4n9LQg3g==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr21623643wrw.353.1566831458975;
        Mon, 26 Aug 2019 07:57:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:38 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] dma-buf/resv: add new fences container implementation
Date:   Mon, 26 Aug 2019 16:57:29 +0200
Message-Id: <20190826145731.1725-8-christian.koenig@amd.com>
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

Add a new container for fences which internally uses
dma_fence_array's to store the fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 181 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  49 ++++++++++
 2 files changed, 230 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 59fbcd9f4b01..d67eaa3fa650 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -33,6 +33,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 
 /**
@@ -55,6 +56,186 @@ EXPORT_SYMBOL(reservation_seqcount_class);
 const char reservation_seqcount_string[] = "reservation_seqcount";
 EXPORT_SYMBOL(reservation_seqcount_string);
 
+static void dma_resv_fences_init(struct dma_resv_fences *fences)
+{
+	RCU_INIT_POINTER(fences->fence, NULL);
+	fences->staged = NULL;
+}
+
+static void dma_resv_fences_fini(struct dma_resv_fences *fences)
+{
+	/*
+	 * This object should be dead and all references must have
+	 * been released to it, so no need to be protected with rcu.
+	 */
+	dma_fence_put(rcu_dereference_protected(fences->fence, true));
+	dma_fence_array_free(fences->staged);
+}
+
+/**
+ * dma_resv_fences_reserve - allocate fence slots
+ * @fences: fences object where we need slots
+ * @num_fences: number of fence slots we need
+ *
+ * Make sure that we have at least @num_fences + all the existing ones free
+ * slots in the staged dma_fence_array.
+ *
+ * Returns -ENOMEM on allocation failure, 0 otherwise.
+ */
+int dma_resv_fences_reserve(struct dma_resv *obj,
+			    struct dma_resv_fences *fences,
+			    unsigned int num_fences)
+{
+	struct dma_fence *fence = dma_resv_fences_deref(obj, fences);
+	struct dma_fence_array *staged, *array;
+	unsigned int i;
+
+	array = fences->staged;
+	if (!array)
+		array = to_dma_fence_array(fence);
+
+	if (array)
+		num_fences += array->num_fences;
+	else if (fence)
+		num_fences += 1;
+
+	staged = fences->staged;
+	if (staged && dma_fence_array_max_fences(staged) >= num_fences)
+		return 0;
+
+	staged = dma_fence_array_alloc(num_fences, NULL);
+	if (!staged)
+		return -ENOMEM;
+
+	/* Copy over all fences from the old object */
+	if (array) {
+		for (i = 0; i < array->num_fences; ++i) {
+			struct dma_fence *f = array->fences[i];
+
+			staged->fences[i] = dma_fence_get(f);
+		}
+		staged->num_fences = array->num_fences;
+
+	} else if (fence) {
+		staged->fences[0] = dma_fence_get(fence);
+		staged->num_fences = 1;
+
+	} else {
+		staged->num_fences = 0;
+	}
+
+	dma_fence_array_free(fences->staged);
+	fences->staged = staged;
+
+	return 0;
+}
+EXPORT_SYMBOL(dma_resv_fences_reserve);
+
+/**
+ * dma_resv_fences_set - set the singleton fence
+ * @fences: fences object where to set the fence
+ * @fence: singleton fence for the object
+ *
+ * Grabs a reference to the new fence and replaces the current singleton fence
+ * with a new one and drop any staged fences.
+ */
+void dma_resv_fences_set(struct dma_resv *obj,
+			 struct dma_resv_fences *fences,
+			 struct dma_fence *fence)
+{
+	struct dma_fence *old = dma_resv_fences_deref(obj, fences);
+
+	rcu_assign_pointer(fences->fence, dma_fence_get(fence));
+	dma_fence_array_free(fences->staged);
+	fences->staged = NULL;
+	dma_fence_put(old);
+}
+EXPORT_SYMBOL(dma_resv_fences_set);
+
+/**
+ * dma_resv_fences_add - add a fence to the staged fence_array
+ * @fences: fences object where to add the fence to
+ * @fence: fence to add
+ *
+ * Add a new fence to the staged fence_array.
+ */
+void dma_resv_fences_add(struct dma_resv_fences *fences,
+			 struct dma_fence *fence)
+{
+	struct dma_fence_array *staged = fences->staged;
+	struct dma_fence *old;
+	unsigned int i;
+
+	for (i = 0; i < staged->num_fences; ++i) {
+		old = staged->fences[i];
+
+		if (old->context == fence->context
+#ifndef CONFIG_DEBUG_MUTEXES
+		    || dma_fence_is_signaled(old)
+#endif
+		    ) {
+			dma_fence_put(old);
+			goto replace;
+		}
+	}
+
+	BUG_ON(staged->num_fences >= dma_fence_array_max_fences(staged));
+	i = staged->num_fences++;
+
+replace:
+	staged->fences[i] = dma_fence_get(fence);
+}
+EXPORT_SYMBOL(dma_resv_fences_add);
+
+/**
+ * dma_resv_fences_commit - commit the staged dma_fence_array
+ * @fences: fences object where the commit should happen
+ *
+ * Commit the fences staged in the dma_fence_array and make them visible to
+ * other threads.
+ */
+void dma_resv_fences_commit(struct dma_resv *obj,
+			    struct dma_resv_fences *fences)
+{
+	struct dma_fence *old = dma_resv_fences_deref(obj, fences);
+	struct dma_fence_array *array = fences->staged, *staged;
+	unsigned int i;
+
+	if (!array || !array->num_fences)
+		return;
+
+	fences->staged = NULL;
+	dma_fence_array_init(array, dma_fence_context_alloc(1), 1, false);
+	rcu_assign_pointer(fences->fence, &array->base);
+
+	/* Try to recycle the old fence array */
+	staged = to_dma_fence_array(old);
+	if (!staged || dma_fence_array_max_fences(staged) < array->num_fences) {
+		dma_fence_put(old);
+		return;
+	}
+
+	/* Try to drop the last reference */
+	if (!dma_fence_array_recycle(staged))
+		return;
+
+	/* Make sure the staged array has the latest fences */
+	for (i = 0; i < array->num_fences; ++i) {
+		struct dma_fence *f = array->fences[i];
+
+		if (f == staged->fences[i])
+			continue;
+
+		dma_fence_put(staged->fences[i]);
+		staged->fences[i] = dma_fence_get(f);
+	}
+	for (;i < staged->num_fences; ++i)
+		dma_fence_put(staged->fences[i]);
+	staged->num_fences = array->num_fences;
+	fences->staged = staged;
+}
+EXPORT_SYMBOL(dma_resv_fences_commit);
+
 /**
  * dma_resv_list_alloc - allocate fence list
  * @shared_max: number of fences we need space for
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 03b0f95682b0..c70f13fa6789 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -45,10 +45,33 @@
 #include <linux/seqlock.h>
 #include <linux/rcupdate.h>
 
+struct dma_resv;
+
 extern struct ww_class reservation_ww_class;
 extern struct lock_class_key reservation_seqcount_class;
 extern const char reservation_seqcount_string[];
 
+/**
+ * struct dma_resv_fences - fences inside a reservation object
+ * @fence: the current RCU protected singleton fence
+ * @staged: optional staged dma_fence_array to replace @fence
+ */
+struct dma_resv_fences {
+	struct dma_fence __rcu *fence;
+	struct dma_fence_array *staged;
+};
+
+int dma_resv_fences_reserve(struct dma_resv *obj,
+			    struct dma_resv_fences *fences,
+			    unsigned int num_fences);
+void dma_resv_fences_set(struct dma_resv *obj,
+			 struct dma_resv_fences *fences,
+			 struct dma_fence *fence);
+void dma_resv_fences_add(struct dma_resv_fences *fences,
+			 struct dma_fence *fence);
+void dma_resv_fences_commit(struct dma_resv *obj,
+			    struct dma_resv_fences *fences);
+
 /**
  * struct dma_resv_list - a list of shared fences
  * @rcu: for internal use
@@ -80,6 +103,32 @@ struct dma_resv {
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
+/**
+ * dma_resv_fences_deref - get singleton fence
+ * @obj: the reservation object
+ * @fences: the fences object
+ *
+ * Returns the singleton fence from a resv_fences object.
+ */
+static inline struct dma_fence *
+dma_resv_fences_deref(struct dma_resv *obj, struct dma_resv_fences *fences)
+{
+	return rcu_dereference_protected(fences->fence,
+					 dma_resv_held(obj));
+}
+
+/**
+ * dma_resv_fences_get_rcu - RCU get single fence
+ * @fences: fences structure where we need to get a reference for
+ *
+ * Get a reference to the single fence representing the synchronization.
+ */
+static inline struct dma_fence *
+dma_resv_fences_get_rcu(struct dma_resv_fences *fences)
+{
+	return dma_fence_get_rcu_safe(&fences->fence);
+}
+
 /**
  * dma_resv_get_list - get the reservation object's
  * shared fence list, with update-side lock held
-- 
2.17.1

