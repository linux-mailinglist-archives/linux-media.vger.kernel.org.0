Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70C040D8B3
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238187AbhIPLcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238191AbhIPLcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:21 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C75C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i23so8959313wrb.2
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YnWvdXxqHgtmxN+angscxrScd7gs7Wadba51xLqnh8c=;
        b=ZbIjs3A0ol2lDS+YQJ63Dd6wEcgQGUklh2TgGcGARe6MZLf5E3BJL1Q1XNo7+gzHUw
         6G7qBU2xqjfJK6Y7IC+zG8J9Hla2MW/dphAfH+pfaiFf8qF/QNp9kQ2vvzmoIUAEnbm1
         B6kH4ea11pDHrKNScs0IN4e3UuYt9PR1vPJ1KlNCxugZMcaUF7Com2VhSQ/t169aCrHO
         JZzpqTRTQ8r9CorhtLTvInAE7OIW1ofe+ncZXHsDlhDeEAEKDDl8E3INeIVUdPQo0GqQ
         3QekC9peTt2XK++WLl98bZndQMKKaWIAAtJs/vspe/yWK6CKNZ4n4hQ6Iqs3BIRX1LWn
         3z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YnWvdXxqHgtmxN+angscxrScd7gs7Wadba51xLqnh8c=;
        b=TXlld1UDrAJPz/Oj1jitI+z0W6hQEvFYYrYcJrwFcBvjg+FRJdedYBcp5+Esg+UCus
         4hNBAtOc3AFqUKKDT9q99LxgqS7WOJiLV7sjVaZQxbkdR1rfQ2om5X8mwYMip9AAdGtU
         fx9wxV7UrKw+LD4GWjDphERA1m+BZhM4jrABrKjXIkIsKjyyuWsShg6eR5rFmdF5mgLr
         qunDktYKkBLPbds+5tfTTuU6FLtBd8iRWhaKKWoo03gnB0KDwMctwFlDHX/VjJbmVTyq
         vBICztun+umkKg9pSimwPpd4ffshOqfE1ZFNxeAaGPcusy4nq158tWGSiW9uhmWdAwcg
         Bo0A==
X-Gm-Message-State: AOAM530CAs9Vi5ZIJ4F7c54V0V/n231461WPoLu5nJ0bjXIZamKok253
        LDNrZ4cBzkZBWWLv9gpKJ1o=
X-Google-Smtp-Source: ABdhPJw7Pw8Jd6budWz34hzE3bfaQgHcni7ZD1vc1X0EsnbfmW213d/RBb7GiMDjO5iklVt7hu2yvA==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5509070wro.418.1631791859320;
        Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/26] drm/i915: use the new iterator in i915_request_await_object v2
Date:   Thu, 16 Sep 2021 13:30:31 +0200
Message-Id: <20210916113042.3631-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/rcu_read_unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 40 ++++++++---------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..221df2edcf02 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,39 +1509,21 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, fence) {
+		rcu_read_unlock();
+		ret = i915_request_await_dma_fence(to, fence);
+		rcu_read_lock();
+		if (ret) {
+			dma_fence_put(fence);
+			break;
 		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
 	}
+	rcu_read_unlock();
 
 	return ret;
 }
-- 
2.25.1

