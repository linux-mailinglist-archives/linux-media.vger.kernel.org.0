Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A683408E0C
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238877AbhIMNbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238154AbhIMNTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C02EC0613D9
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u15so8599290wru.6
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qg7l/EFf9rR8AshzqDpvjOG0up4Bpj2cOJ4DPctGlsg=;
        b=LI9Ifh2ypWUTErkc4FekJdwXonhRf4/y5ip43fSlrHDTGrLLEIBEon9VVGafQMPS08
         qXovA6E56uUCI7Ao4bP8sU0eKN5J1f6wiY0WS7h9o7sA1jwdnKaUKSGO/j3NhrKzA7qk
         SVn0BfC7g/33vFF4tKzSL5rLz0ME8F87twl3wLwtHFvpfJrnUeWY9JrOT0nX/MvYqVDh
         SkmNLuApPjhnA89MkdScf6BD59Su86HaF8vSD4FFWWkSql/lh9vhxYlk0775XvKubKR3
         nnwUDN7Y9DmDgW/XJp1YLGkxwSfz8KuUfLHyw3Wxy6EcW//KvrJe2Jp5fDJS/ALYGOtz
         Vk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qg7l/EFf9rR8AshzqDpvjOG0up4Bpj2cOJ4DPctGlsg=;
        b=LO89CdbmadI1FjkGcdy9zcXXum+9NNSh9GwluFtXV1pqwsBCsfGOqMXrzNhwfcok2h
         6EBT64+Hy2aUdRIUvvzG9iCvoPkYbnHJrczqndqunhD6mbvLT1rXprybN4fgW+s1nUoB
         xzQxCkKRCXuMOW3zu3OfG76tshe71BFc1qFmgn6iDjBr1R5TPkk/ntoGk5qElUqZOeQO
         sQ4d0W+EdGsP+EMETtEVkvh5qlK/PtATysm/meLosH9tvuvqvKgqYIxKoENL0L1+xUuS
         dzeKkGG0eX7lmf+sr4d8kwYdJG+rW92oRrYTFNTel3dqVgjZRwo1q5zG47/W/q68c7yP
         07lA==
X-Gm-Message-State: AOAM531LV0Vvtzq3LXjzaAISKPiU7qPGNJT5yCvowq/eVLU46J7QVcy6
        ZeFwcXbLnH8ywZXu5GJHfgs=
X-Google-Smtp-Source: ABdhPJyxGGjxzxOBQNDKEYHVDcK+Tlu11nN1e7riEFEr4H3WucP8cGfRuYUz9h3+ZyagU85/kS1lgw==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr12675492wrp.281.1631539033152;
        Mon, 13 Sep 2021 06:17:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:12 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked
Date:   Mon, 13 Sep 2021 15:16:42 +0200
Message-Id: <20210913131707.45639-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Abstract the complexity of iterating over all the fences
in a dma_resv object.

The new loop handles the whole RCU and retry dance and
returns only fences where we can be sure we grabbed the
right one.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..213a9b7251ca 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterator is started over again.
+ */
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_cursor *cursor,
+					 bool all_fences, bool first)
+{
+	struct dma_fence *fence = NULL;
+
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(fence);
+
+		cursor->is_first = first;
+		if (first) {
+			cursor->seq = read_seqcount_begin(&obj->seq);
+			cursor->index = -1;
+			cursor->fences = dma_resv_shared_list(obj);
+			cursor->is_exclusive = true;
+
+			fence = dma_resv_excl_fence(obj);
+			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+				fence = NULL;
+		} else {
+			fence = NULL;
+		}
+
+		if (fence) {
+			fence = dma_fence_get_rcu(fence);
+		} else if (all_fences && cursor->fences) {
+			struct dma_resv_list *fences = cursor->fences;
+
+			cursor->is_exclusive = false;
+			while (++cursor->index < fences->shared_count) {
+				fence = rcu_dereference(fences->shared[
+							cursor->index]);
+				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+					break;
+			}
+			if (cursor->index < fences->shared_count)
+				fence = dma_fence_get_rcu(fence);
+			else
+				fence = NULL;
+		}
+
+		/* For the eventually next round */
+		first = true;
+	} while (read_seqcount_retry(&obj->seq, cursor->seq));
+
+	return fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..f5b91c292ee0 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,39 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_cursor - current position into the dma_resv fences
+ * @seq: sequence number to check
+ * @index: index into the shared fences
+ * @shared: the shared fences
+ * @is_first: true if this is the first returned fence
+ * @is_exclusive: if the current fence is the exclusive one
+ */
+struct dma_resv_cursor {
+	unsigned int seq;
+	unsigned int index;
+	struct dma_resv_list *fences;
+	bool is_first;
+	bool is_exclusive;
+};
+
+/**
+ * dma_resv_for_each_fence_unlocked - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_cursor pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * dma_resv::lock. The RCU read side lock must be hold when using this, but can
+ * be dropped and re-taken as necessary inside the loop. @all_fences controls
+ * if the shared fences are returned as well.
+ */
+#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
+	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
+	     fence; dma_fence_put(fence),				    \
+	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
@@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_cursor *cursor,
+					 bool first, bool all_fences);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-- 
2.25.1

