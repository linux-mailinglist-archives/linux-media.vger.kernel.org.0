Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B58F40F7B8
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244242AbhIQMgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbhIQMgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:53 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A3BC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id u18so13196207wrg.5
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTYRDJJE+t2GlGO6++SOuXKZtEL0uOy1Wu4kUiFazeA=;
        b=do5a6C/CKoJ/t9gO3qZFk6Zo473jj7JAmKlkWbMHGOgVCNCadQiX4dj5blZ+Q02w24
         lpaJ6VbHtguxph/wY2ANf+GuHZNZs6P+bo2k86RSDsg+0kB4bqSsGMb7ldNJA2eF+M06
         HSCJDPYVsoZ9ZN8R/bdAqCDXRbpSlx79Roc8pkfNYUAYYsSZeIwaPbd2eaxG3CcDJ/g8
         xgNy6vuUEaUYZyBDd49Ka3J9+1HZd51MNUGzODtbZy5LUFAByodUCMp5sXjV3yrUXN3h
         bbz08LCoqXRkkchlZI7SStEiAPz8viCz8AyKvWDvo481lE7U5kimmC3ny5iV7246gSCR
         7AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTYRDJJE+t2GlGO6++SOuXKZtEL0uOy1Wu4kUiFazeA=;
        b=MhnxBMbED6qzvdCLPGyhSzm4wo2EJQjgkPFge/WolqpceEj5BWEFjVA0leHjy+pO3N
         u9Stbt9MbO0jtW7s3lwJC5whHZ87hHgLdeFeSPr9dtLvE83bDpNwpcyt4XBDVheOUsjc
         YfBZC2a3B+/B0MjvB4ZGFC6KlWhMua6CpG/nuFaBuVLa2k47+/nOX1ZFTB2vXiN6cVL7
         0rFMKO/krsaCLqt48O4Uk3Sa8N1CjQezxmyG3ScIadW3gKkfHkgE6+39ZwWPVs04lVOa
         CHI2jDDYUMkJJVnkYv79IAB+r0ldc5GxcgDaumrb0C2Zk3PFQnWRj3tWtb2wdYfruWlh
         9KdA==
X-Gm-Message-State: AOAM531T8XW+pFYiGPyqRzI30NxIwMxkjB3p9whp8tEd2iB8y3wOUapw
        K2KCYC0HwtmmvMFKvuPelVk=
X-Google-Smtp-Source: ABdhPJzm97Y1W1aEKpHQPWRcu76jJNrW79Rmy/gN+d5YlVYLRUfEHYXtRHvfLqrk3RsPZ9XPev0k3Q==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr3858944wro.164.1631882129858;
        Fri, 17 Sep 2021 05:35:29 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:29 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 16/26] drm/i915: use new iterator in i915_gem_object_wait_reservation v2
Date:   Fri, 17 Sep 2021 14:35:03 +0200
Message-Id: <20210917123513.1106-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu read unlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 57 ++++++------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..e416cf528635 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,26 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			timeout = i915_gem_object_wait_fence(shared[i],
-							     flags, timeout);
-			if (timeout < 0)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		rcu_read_lock();
+		if (timeout < 0)
+			break;
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
 	return timeout;
-- 
2.25.1

