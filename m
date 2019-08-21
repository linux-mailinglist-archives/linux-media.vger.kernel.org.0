Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70CE9796E
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfHUMb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43704 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbfHUMb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id y8so1848646wrn.10
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aRXsJmbmtfPxPUN8vKc2ijDmbdxfggBJHwv1ymZT7tU=;
        b=C6avVw5s+Madbo3fCVkLSXse+ieMoqWibO2MBnIklPeM7GNILrlT4uSMLyqQ/UctNz
         hgFVDsBB/ij8pU43oinM9JVa/MIysUAMIx7yswR9kN8yf4dYIFg5b/kfbmaHT/ELsBN0
         PKQxjnIhy9avvJVioQ69szQ50wkhbYmVDwL12x+dL9gfDi9uQGdQCGSkvGTac0je8pCS
         qStOOU8gAkkvRF4hSpfQ8aviFUR7nF8p3lgRwsHynFHoICvmIUwcJFit57U3jMoH4tN1
         4f3ZMQkLGfCCEdUBxb3wHuwChyeQNf97cKSwFmU+p3d9mQzdszwq8FGoHNYzfZhdSCZN
         FGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRXsJmbmtfPxPUN8vKc2ijDmbdxfggBJHwv1ymZT7tU=;
        b=JCm/ayuXn4qrRFHUFWoz9XZbz3006UQ9eTu+rDMlmB+ld5bJlMl9uB9pb1X3Gw4+aU
         Ud33m5RxEb2P2+L3xXhRoTNiH4Mxb03gz0IhPasqAjCSsFDW+iMAD+Ak4BZCmjbkSIGK
         YZ77fmFWDGQAPX25YAuItejjvCbRyWkhA1yu0nmQQMRD1vHcc7xITueEW2/HTDk+TYxz
         52Y3d4i3KF5i7IA/IYHuF8RRzvyJyEqVK6XDWghr1L92QHcACMtkB830XISYrhdATNFG
         BY57sdx2vnjN8tnwkWqnV21ezjPXNHZTSpEUylI4mKcwNVn23oGAGD47WYMyv10GxjcV
         D9bA==
X-Gm-Message-State: APjAAAW+NL6Hj48MouZv47wawYvKVdDC675lzaFXK4E1pg6y7+J+ywhm
        ZAZwHjpo7KKd13hhNXWe5hxO3Ejv
X-Google-Smtp-Source: APXvYqyBNotk8B8aMjwkVU5PjZ14VCximu9p4qoWqEdX3ZKXwTSeKwyq8A3a0zKymAwNIBHgkTA3Rw==
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr34422352wrc.4.1566390715621;
        Wed, 21 Aug 2019 05:31:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/10] dma-buf/resv: add new fences container implementation
Date:   Wed, 21 Aug 2019 14:31:44 +0200
Message-Id: <20190821123147.110736-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 221 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  49 ++++++++
 2 files changed, 270 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d3a9a3bb15f0..83033b3e8521 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -33,6 +33,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 
 /**
@@ -55,6 +56,226 @@ EXPORT_SYMBOL(reservation_seqcount_class);
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
+ * dma_resv_fences_assign - set the singleton fence
+ * @fences: fences object where to set the fence
+ * @fence: singleton fence for the object
+ *
+ * Internal helper to assign the signleton fence without grapping a reference.
+ * If the old fence is a dma_fence_array try to recycle it.
+ */
+static void dma_resv_fences_assign(struct dma_resv *obj,
+				   struct dma_resv_fences *fences,
+				   struct dma_fence *fence)
+{
+	struct dma_fence_array *array, *staged;
+	unsigned int num_fences, i;
+	struct dma_fence *old;
+
+	old = dma_resv_fences_deref(obj, fences);
+	rcu_assign_pointer(fences->fence, fence);
+
+	dma_fence_array_free(fences->staged);
+	fences->staged = NULL;
+
+	/* Try to recycle the old fence array */
+	staged = to_dma_fence_array(old);
+	if (!staged)
+		goto drop_old;
+
+	array = to_dma_fence_array(fence);
+	if (array)
+		num_fences = array->num_fences;
+	else
+		num_fences = fence ? 1 : 0;
+
+	if (dma_fence_array_max_fences(staged) < num_fences)
+		goto drop_old;
+
+	/* Try to drop the last reference */
+	if (!dma_fence_array_recycle(staged))
+		return;
+
+	/* Make sure the staged array has the latest fences */
+	if (array) {
+		for (i = 0; i < array->num_fences; ++i) {
+			struct dma_fence *f = array->fences[i];
+
+			if (f == staged->fences[i])
+				continue;
+
+			dma_fence_put(staged->fences[i]);
+			staged->fences[i] = dma_fence_get(f);
+		}
+		for (;i < staged->num_fences; ++i)
+			dma_fence_put(staged->fences[i]);
+		staged->num_fences = array->num_fences;
+
+	} else if (fence) {
+		for (i = 0; i < staged->num_fences; ++i)
+			dma_fence_put(staged->fences[i]);
+		staged->fences[0] = dma_fence_get(fence);
+		staged->num_fences = 1;
+	} else {
+		for (i = 0; i < staged->num_fences; ++i)
+			dma_fence_put(staged->fences[i]);
+		staged->num_fences = 0;
+	}
+
+	fences->staged = staged;
+	return;
+
+drop_old:
+	dma_fence_put(old);
+}
+
+/**
+ * dma_resv_fences_set - set the singleton fence
+ * @fences: fences object where to set the fence
+ * @fence: singleton fence for the object
+ *
+ * Grabs a reference to the new fence and replaces the current singleton fence
+ * with a new one. If the old fence is a dma_fence_array try to recycle it.
+ */
+void dma_resv_fences_set(struct dma_resv *obj,
+			 struct dma_resv_fences *fences,
+			 struct dma_fence *fence)
+{
+	dma_fence_get(fence);
+	dma_resv_fences_assign(obj, fences, fence);
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
+#ifndef CONFIG_DEBUG_MUTEXES
+	for (i = 0; i < staged->num_fences; ++i) {
+		old = staged->fences[i];
+
+		if (old->context == fence->context ||
+		    dma_fence_is_signaled(old)) {
+			dma_fence_put(old);
+			goto replace;
+		}
+	}
+#endif
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
+	struct dma_fence_array *staged = fences->staged;
+
+	if (!staged || !staged->num_fences)
+		return;
+
+	fences->staged = NULL;
+	dma_fence_array_init(staged, dma_fence_context_alloc(1), 1, false);
+	dma_resv_fences_assign(obj, fences, &staged->base);
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

