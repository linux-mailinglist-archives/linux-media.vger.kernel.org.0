Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDB151749F
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380317AbiEBQlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386327AbiEBQlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:16 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581C511A0D
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:36 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso11136335wma.0
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5B4Auy7jd8jQDW0N9881N8dXhobh36tEV/4wwMqA4v8=;
        b=C1UJgSKx6J52Qk7ZHhgTZrjjmTWFmby49NUiKkboiTEraCCWRXYvZtNkrR74WwmRvx
         BooWzQecxcEmr5/HIDzo41n9T8ESUdyawEMnem2KN+OdULadriLP1LSAEGGD6Jn1qWl2
         DuVCL8R9tIvgDzo9vCxLyO9rxqSjpdET3CezqwfuDM1QG+IZ/7rNifqSHNCoChYuRDiu
         INNq5rSbOOWNeZHkW0C9bJb69MvvEcKFWsEOYnDZBUOwcin94PqcS8qq3IqmyfHyEmFh
         BFE+n22wd/pZnZeQadDBSG1OBiIbegR3FkhnRPqGqAKTGC6TGpbQWQDukJoF910Og1st
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5B4Auy7jd8jQDW0N9881N8dXhobh36tEV/4wwMqA4v8=;
        b=t+yN+NAJcYzNMS6hNPensK7NiUcvNP8zM0VHaN9d42NwaAS3JTAPOiRj6or5+aBMPC
         RXp42iIkxRO7xG61EqeP9FW285rdGHyISo4LKRJlZqaM/yC5SsrEZv9sExir06uP0l9e
         SuRFhRfsCXAqinoTA+knCEt9ngNTGb5gW0zAW8qyN1PI1mWZL17hueszwIL6O6grL9qj
         vBXdJA3TG3gz9HE9xVyHxg84ebkd8n01+QpBhe+tziFDpD8CGQP0dQrwsHhuFI+bcHPg
         V+shDNqX69Kus3pP122BTEKaERuLGXBZRMjatoJVzBsG/qBvgI5jXgN+fBFZaPMYG9Zy
         w2QA==
X-Gm-Message-State: AOAM532dVJOv26u2aODDswh4z/gDHkpvY9haUixpiRZIb6p8+XOsw5Ba
        u6JRp4xOY6Ox8tnq37qMUVA=
X-Google-Smtp-Source: ABdhPJyaATORD6OjT4IsmnRnb38/vqPmuN7LAymrKwYEI0Npk0PJ/NXtoYiC6u1vxAvmWCAKyDK3pw==
X-Received: by 2002:a05:600c:354f:b0:394:3bd4:c747 with SMTP id i15-20020a05600c354f00b003943bd4c747mr1164wmq.142.1651509454747;
        Mon, 02 May 2022 09:37:34 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 05/15] dma-buf: add user fence support to dma_resv
Date:   Mon,  2 May 2022 18:37:12 +0200
Message-Id: <20220502163722.3957-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the new DMA_RESV_USAGE_USER flag to the dma_resv object
which must be used with user fence objects.

In opposite to the other usage flags this one doesn't automatically return
other lower classes. So when user fences are requested from the dma_resv
object only user fences are returned.

Lockdep is used to enforce that user fences can only be queried while the
dma_resv object is not locked. Additional to that waiting for the user
fences inside a dma_resv object requires not other lock to be held.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 62 +++++++++++++++++++++++---------------
 include/linux/dma-resv.h   | 23 ++++++++++++--
 2 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0cce6e4ec946..da667c21ad55 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -58,7 +58,7 @@ DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
 /* Mask for the lower fence pointer bits */
-#define DMA_RESV_LIST_MASK	0x3
+#define DMA_RESV_LIST_MASK	0x7
 
 struct dma_resv_list {
 	struct rcu_head rcu;
@@ -288,6 +288,10 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	 */
 	WARN_ON(dma_fence_is_container(fence));
 
+	/* User fences must be added using DMA_RESV_USAGE_USER */
+	WARN_ON(test_bit(DMA_FENCE_FLAG_USER, &fence->flags) !=
+		(usage == DMA_RESV_USAGE_USER));
+
 	fobj = dma_resv_fences_list(obj);
 	count = fobj->num_fences;
 
@@ -349,6 +353,15 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 }
 EXPORT_SYMBOL(dma_resv_replace_fences);
 
+/* Matches requested usage with the fence usage for iterators */
+static bool dma_resv_iter_match_usage(struct dma_resv_iter *cursor)
+{
+	if (cursor->usage == DMA_RESV_USAGE_USER)
+		return cursor->fence_usage == DMA_RESV_USAGE_USER;
+
+	return cursor->usage >= cursor->fence_usage;
+}
+
 /* Restart the unlocked iteration by initializing the cursor object. */
 static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 {
@@ -385,8 +398,7 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 			continue;
 		}
 
-		if (!dma_fence_is_signaled(cursor->fence) &&
-		    cursor->usage >= cursor->fence_usage)
+		if (dma_resv_iter_match_usage(cursor))
 			break;
 	} while (true);
 }
@@ -405,14 +417,9 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
  */
 struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
 {
-	rcu_read_lock();
-	do {
-		dma_resv_iter_restart_unlocked(cursor);
-		dma_resv_iter_walk_unlocked(cursor);
-	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
-	rcu_read_unlock();
-
-	return cursor->fence;
+	/* Force a restart */
+	cursor->fences = NULL;
+	return dma_resv_iter_next_unlocked(cursor);
 }
 EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
 
@@ -428,18 +435,21 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
  */
 struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
 {
-	bool restart;
-
-	rcu_read_lock();
 	cursor->is_restarted = false;
-	restart = dma_resv_fences_list(cursor->obj) != cursor->fences;
 	do {
-		if (restart)
-			dma_resv_iter_restart_unlocked(cursor);
-		dma_resv_iter_walk_unlocked(cursor);
-		restart = true;
-	} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
-	rcu_read_unlock();
+		bool restart;
+
+		rcu_read_lock();
+		restart = dma_resv_fences_list(cursor->obj) != cursor->fences;
+		do {
+			if (restart)
+				dma_resv_iter_restart_unlocked(cursor);
+			dma_resv_iter_walk_unlocked(cursor);
+			restart = true;
+		} while (dma_resv_fences_list(cursor->obj) != cursor->fences);
+		rcu_read_unlock();
+
+	} while (cursor->fence && dma_fence_is_signaled(cursor->fence));
 
 	return cursor->fence;
 }
@@ -491,7 +501,7 @@ struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
 
 		dma_resv_list_entry(cursor->fences, cursor->index++,
 				    cursor->obj, &fence, &cursor->fence_usage);
-	} while (cursor->fence_usage > cursor->usage);
+	} while (!dma_resv_iter_match_usage(cursor));
 
 	return fence;
 }
@@ -663,6 +673,9 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
+	if (usage == DMA_RESV_USAGE_USER)
+		lockdep_assert_none_held_once();
+
 	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
@@ -678,7 +691,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -717,7 +729,9 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
  */
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
 {
-	static const char *usage[] = { "kernel", "write", "read", "bookkeep" };
+	static const char *usage[] = {
+		"kernel", "write", "read", "bookkeep", "user"
+	};
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c8ccbc94d5d2..81a9ca32cc69 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -42,7 +42,6 @@
 #include <linux/ww_mutex.h>
 #include <linux/dma-fence.h>
 #include <linux/slab.h>
-#include <linux/seqlock.h>
 #include <linux/rcupdate.h>
 
 extern struct ww_class reservation_ww_class;
@@ -57,11 +56,15 @@ struct dma_resv_list;
  *
  * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
  * when the dma_resv object is asked for fences for one use case the fences
- * for the lower use case are returned as well.
+ * for the lower use case are returned as well. The exception are USER fences
+ * which only return USER fences and nothing else.
  *
  * For example when asking for WRITE fences then the KERNEL fences are returned
  * as well. Similar when asked for READ fences then both WRITE and KERNEL
  * fences are returned as well.
+ *
+ * But when asked for USER fences only USER fences are returned and not WRITE
+ * nor any other fences.
  */
 enum dma_resv_usage {
 	/**
@@ -103,7 +106,18 @@ enum dma_resv_usage {
 	 * The most common case are preemption fences as well as page table
 	 * updates and their TLB flushes.
 	 */
-	DMA_RESV_USAGE_BOOKKEEP
+	DMA_RESV_USAGE_BOOKKEEP,
+
+	/**
+	 * @DMA_RESV_USAGE_USER: Special usage for user fences.
+	 *
+	 * This must only be used with fences which have DMA_FENCE_FLAG_USER
+	 * set so that memory mangement completely ignores those fences.
+	 *
+	 * A warning is raised if a fence with DMA_FENCE_FLAG USER is added with
+	 * any other usage than DMA_RESV_USAGE_USER.
+	 */
+	DMA_RESV_USAGE_USER
 };
 
 /**
@@ -221,6 +235,9 @@ static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
 				       struct dma_resv *obj,
 				       enum dma_resv_usage usage)
 {
+	if (usage == DMA_RESV_USAGE_USER)
+		lockdep_assert_not_held(&(obj)->lock.base);
+
 	cursor->obj = obj;
 	cursor->usage = usage;
 	cursor->fence = NULL;
-- 
2.25.1

