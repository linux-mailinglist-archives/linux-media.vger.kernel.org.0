Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6E0422518
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhJELjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbhJELji (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558E3C06174E
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:48 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id s15so8593339wrv.11
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5eLsCDG4D/gZwEvJUAlIVf5UAIyr4g7ytzcN27L37E=;
        b=AF0HqJwcvUD7hyU50rUuoCrMxkSQzdV9xYZyTUjsQ4fvLjVoT1gt6lqd+TdWEGZlmq
         zhlPnvXkmPtIH6YTFYR8h/NvjAzwbeAxppvLCSChf20gJJJ4OPW38aA6vkA095J/4+pq
         bACXCLCzUNrv0jCu99pwpAX1fo6YE2nK3DcD9TnoBkpG8iQEdUxhvbQNmAm5Y8mn8lkK
         GQujmBZm7RNc/Vdvz0L1b9M4Pa8fiRqqnMK76wOXwev1R0UTVKM3Vh9SvrCikqpDeO9i
         EVO/VvvUdUoatSO6gWBpr+AjF5TqUxzwVCdquEAix6dyT27fdwKqhcBTyNC6h0zs3fOF
         F3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5eLsCDG4D/gZwEvJUAlIVf5UAIyr4g7ytzcN27L37E=;
        b=am2c0pJljewRSBuz4mIYrCNigi/QIggOe/ySm2V9ebt9rE6A1p+JIObeixVSAYN0Qm
         h+SA/ZwelGCJVZoVTxi7I4NOk75BdbbksvintBMN5gDFh5mcT5Kzw0P7uOZOgjSbP5UN
         AA1H9Vt78wSpn53r8uW6VYJ7LMtWW9mX9OwBeAZYn6oigzQFLFVp9pdWY9vfbWdNpoqk
         EEKTyAIqX1Qx4+ic5JXJucXuvwdEHZ5//DnamXNk/qSm6pq85oyPexbJuYyX9pxjwsob
         K7eBzLY1XFBWiFV85CQtP6Ce6I6bFkhlzjhwGtVFfiYHfx3XDPm97ZOlV+cQorcoAgdH
         ahTg==
X-Gm-Message-State: AOAM530RoPGqtHe74kiG4MqUrhMX1bqhttDUeru8Xa/aV+xBZ8O1REKO
        2FNmTlR0ezRT/QRZkadom4o=
X-Google-Smtp-Source: ABdhPJzbjiIxgUJExNVcKkH3z7jnC2eesnKRRVbOJyg8O0Qzr7EqwuB/wGUiQw1BCNFFUpB2JRBj4w==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19812593wrb.385.1633433866978;
        Tue, 05 Oct 2021 04:37:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/28] dma-buf: add dma_resv_for_each_fence v2
Date:   Tue,  5 Oct 2021 13:37:16 +0200
Message-Id: <20211005113742.1101-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A simpler version of the iterator to be used when the dma_resv object is
locked.

v2: fix index check here as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 49 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 19 +++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3cbcf66a137e..231bae173ef1 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -423,6 +423,55 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
 }
 EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
 
+/**
+ * dma_resv_iter_first - first fence from a locked dma_resv object
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
+{
+	struct dma_fence *fence;
+
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->index = 0;
+	cursor->fences = dma_resv_shared_list(cursor->obj);
+
+	fence = dma_resv_excl_fence(cursor->obj);
+	if (!fence)
+		fence = dma_resv_iter_next(cursor);
+
+	cursor->is_restarted = true;
+	return fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_first);
+
+/**
+ * dma_resv_iter_next - next fence from a locked dma_resv object
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
+{
+	unsigned int idx;
+
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->is_restarted = false;
+	if (!cursor->all_fences || !cursor->fences ||
+	    cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	idx = cursor->index++;
+	return rcu_dereference_protected(cursor->fences->shared[idx],
+					 dma_resv_held(cursor->obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_next);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 764138ad8583..3df7ef23712d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -179,6 +179,8 @@ struct dma_resv_iter {
 
 struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
 struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
 
 /**
  * dma_resv_iter_begin - initialize a dma_resv_iter object
@@ -244,6 +246,23 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 	for (fence = dma_resv_iter_first_unlocked(cursor);		\
 	     fence; fence = dma_resv_iter_next_unlocked(cursor))
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @obj: a dma_resv object pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * &dma_resv.lock. @all_fences controls if the shared fences are returned as
+ * well. The cursor initialisation is part of the iterator and the fence stays
+ * valid as long as the lock is held.
+ */
+#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
+	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
+	     fence = dma_resv_iter_first(cursor); fence;	\
+	     fence = dma_resv_iter_next(cursor))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

