Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E543AB22D
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhFQLSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbhFQLSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218AEC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s6so3427230edu.10
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
        b=sOQGBXqPZYb4VhHiZysul1mv0Y5S+MhCCItbz9UHtXicp3kUgp/stG1N3WEDg0WQNA
         KuX+kWiSQcyHtd+4Q3yVKARfSprDU5SoZya210yjZ+7yxgF472bhYHycnphV0w17aEmG
         cl/w93GKuJUqiPTDj78CNuPHdSmnWgrvFEeb3nHdfcN9j7kiP402JJsocFKh7gawRlVf
         F4jfa+uvDDSOQ/3a4A675gYsIYpd3q2aJ5Yhp+qGdcYgJrohoHSxXL6YNEisPGWS0PgT
         +7e0clwZ6uX0erSLNWWG9pQLaPg7eBt7DNTTXQ9KuAt6xohb5sh6m1AC5RGGNAn/KKpg
         bjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
        b=AkOP4c/NbgphBR0VFtjx8n181cDIJ1cN8+iX9pPDDDQRjFewQPIFMjgBqcdq6OrxV/
         zFcwYsHIZCWIiqHe2GOywI9q+exE3p/4IH3U4D+oDp2L1t/hoglnrvuwD9lYCPrtMS1B
         W7LFETpltaufTGD1GL/TSlqyzfzLXup6KHSfXd6M6IjpxnumBwQJ2G4GJwoIuVA4GShL
         6HwP8v8/Ekno+4tNjya17x6gLPKtY6iCRdRlaD6A4fjiDraFn05iQ02d0YJez8SHIIe8
         j7RFmzKIKciq9YGXAmhJMv6VkZGw2ltYSPbXuKqwwVxPQQ/h3g66slW0Jq4bgtCRTK5m
         LZ9w==
X-Gm-Message-State: AOAM531wSllV03dEOUu7+//Igzcgse/wF7omBobducrYyVxns6N8ITve
        CAgxKyQQndIBESneIhJ0J4PonKuMiqE=
X-Google-Smtp-Source: ABdhPJxPES9M3EFm+goK97aBV/aqBmulWsvrxZXDpmswFtsIKGYgZSrLa6HNl26BpQgDFlDZEnIjWw==
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr5838983ede.371.1623928566809;
        Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 08/16] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date:   Thu, 17 Jun 2021 13:15:50 +0200
Message-Id: <20210617111558.28486-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..c6c6d747b33e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = false;
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
-- 
2.25.1

