Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5490640D8B5
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbhIPLcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238185AbhIPLcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C2BC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d21so8890174wra.12
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L+JeWSkenc3rnv6OEgzQ/+sXft+O1bz+b+dQLLQQnPs=;
        b=cIbU1aj2FqXDYlTj1UpiY66k2myFtYTJnkKcsfTobpH58cczpQR0i1cTKyaK/yUsxV
         +0oE3avjOWpdGIQmJVhqM5+7wAR2FBz18U34WMWL7Tquyiq9snfcv/C/DQqUzb1DioLp
         sT2zxpfj2XyAFOLsqcP+90nf2dC7vSEEY1CqnZ5AwItQ0rmcceKohAgOPLYKm0PS8wxQ
         B+HdgYZfjDZhnqw5epDETuK6x3v3eBDKfrIjlEQh8UiWtXWAOJH+rhFA/tZD5ivSCWx4
         8gjCZnCZp+gp7m1Akga9O4uFvGxhJF1hJ0ij2XrurjkIl2wcGNNAHeRxwm0LdAr5LpDs
         FzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+JeWSkenc3rnv6OEgzQ/+sXft+O1bz+b+dQLLQQnPs=;
        b=I4phNOxByUOopuke07ObRrPi8Tvb/N4Iqz+wXwc9laHH1QHHW40qD22pJBN+llvrKy
         eC8Wsqq9WXExc9eDwnTqANmO+wK3UiQCebYdKu2zoo7JqItYOw7lRvhuAEPcxp2FuMCL
         ifzTXPVTOGvCh9huBEJVJ/3/bxw8BtIq9RdnZo7iUzX7Fbco54CL8fV1i99RBUwutH2o
         qSu7iTtMmvLo6rayKs0oyt0ZBrfIXT+Vow6FWAaZRuzX0E8MPsBP11NStfbxIhicyRCw
         MBj/aUE9q2jOllwmWeD07Lwp+1l10SfB1YzBDHW/6p+LgF+GTJtQpr1xgRhu+SRE5ObF
         wOuQ==
X-Gm-Message-State: AOAM533t/jj/AvGRuDnm39/cJb5KRuW0jG30quzIXuNaoH5NRVEmdzuC
        3yyig+1nAoWtQq3fw9GPPKQ=
X-Google-Smtp-Source: ABdhPJy5pNIvHOlHKg+/Q1+JQDe68gKs41mN6XAxrKyNoVbf9sezyMD6dzKzNFWhYUEe09lnxnZgNA==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr5582537wrm.430.1631791861162;
        Thu, 16 Sep 2021 04:31:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in i915_gem_object_wait_priority v2
Date:   Thu, 16 Sep 2021 13:30:33 +0200
Message-Id: <20210916113042.3631-18-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 33 +++++++-----------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index a75dee9d7790..db8a72556338 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -124,32 +124,17 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 			      unsigned int flags,
 			      const struct i915_sched_attr *attr)
 {
-	struct dma_fence *excl;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			i915_gem_fence_wait_priority(shared[i], attr);
-			dma_fence_put(shared[i]);
-		}
-
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-	if (excl) {
-		i915_gem_fence_wait_priority(excl, attr);
-		dma_fence_put(excl);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor,
+					 flags & I915_WAIT_ALL, fence) {
+		rcu_read_unlock();
+		i915_gem_fence_wait_priority(fence, attr);
+		rcu_read_lock();
 	}
+	rcu_read_unlock();
 	return 0;
 }
 
-- 
2.25.1

