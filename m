Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6672E408E29
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240820AbhIMNbU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239851AbhIMNTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:52 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815AEC0613E2
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w29so13883588wra.8
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UXwMb5OzeQZCq2ep7DQI78NOviskj8HdDAhnVXfOFMU=;
        b=LQIuxs2NluvtAbILKztkthcoLKkqD6fyLabolUUj647rumDSoPZx0BeMEvboQ+otzy
         BJWXRJbhsrllWKo8MHY+kg0rQV6ZQz1jBoo4flqC+Jf12xv7pvy9hBZeVBStFeSM0OEl
         vSCO6Pb1oowtrRQI7Oc49+ul3KFm8QsBr7MeMFSWWLmxd/xrqtwK+AA6U9IkVMkm7JfP
         xpKxgXLPHIGnosFmvOPCa2ZzDdq/26DoXKxqZ7Qfb5/6XQRBoPqqbcezehbE1vtdXyMq
         56wSMp66QCJ03AA4sGtZU3tHVWz7BK/HJBLJ4HZq8xQvLF6rOg35EdEnSOVzy67ANWOU
         OT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UXwMb5OzeQZCq2ep7DQI78NOviskj8HdDAhnVXfOFMU=;
        b=qa7vUua9g6pmNCszR6wTW9geykzlYZe5ov5TP8N/48kPt/q5xz8yAbho3Ej1OSbZNt
         KIXwWzRTXbMc4Bss2lk6QzCyLQHN9finwQUMgouv9mMfCADsyowv9Hnvi/bY8p9PnfAf
         KGs2jClThke0MJxUl3QhUjpiYR2NWAq/AjC78cIFRJlKQvry5WbzFlapNEKVcxF+CLON
         Ph3Ichv49m4/oFWqcGmNQKmpaP+dYgIt85tJC607D4GJEIbxIOsw4kIraB+6kEU3v5Ia
         1pDJ6OggyYvBWCsfhysmYTQkStksVNm9fzRkuc3RIpHB4MIPlExzEChSV1up3+a0rZkh
         rwlw==
X-Gm-Message-State: AOAM533cv+rBctYAeyCZ5bGUKMu7AcAu1nUmDZ+J/J0mFE/kJut/A6FK
        u7RdPFhHpheo18THEYiKO18=
X-Google-Smtp-Source: ABdhPJx5SFCa5irhc3GPkkSApCKQ8UhOmfrRvH0dWTDeu8jsU/lOtQoYl+gw39TN1DoV0crmMql88A==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr12487586wrs.71.1631539039806;
        Mon, 13 Sep 2021 06:17:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:19 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Mon, 13 Sep 2021 15:16:46 +0200
Message-Id: <20210913131707.45639-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0a0e3ee62648..3ce929b770ea 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -571,74 +571,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
+			return ret;
 		}
 
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

