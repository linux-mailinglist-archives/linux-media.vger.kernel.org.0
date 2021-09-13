Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD40408C96
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240335AbhIMNU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240079AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE15C06178A
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m9so14676667wrb.1
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwL17ws4Cj5CpVM2J1DKtpxQdvIAu+7iFXWlMc3XdYk=;
        b=cI1+0bSkX70HMwya9WuZBP8r8rOXEE9AtiZYYqg1KaqnK4SFdTBcBle/XxUgsyhI0I
         m11TzRrr6J3E1Kc3u/1g1Jxp+L4919hjF9kdWEhOUsy6JMmBhIn5dkKU1Rr0TxqP4iDb
         7XSPOS8qVXORHnmhObg8SJQ3JYrgiVkdkueOCXFFi4SM/VfqkhAfZ58P2iJjRVYmsLUZ
         H3pKICOUzDxmVe/YVjBregqPlZXFNCoa7WK2n0IlHL+QtIabgPIPs6ffwfTzuep+tZ6L
         WbGPGYOUr3oGWu1uSqVAVpLf3Heq1/QSVIunkGNOpCM5cnbHWYxsfN0HAkEy4tKHBGw2
         IZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwL17ws4Cj5CpVM2J1DKtpxQdvIAu+7iFXWlMc3XdYk=;
        b=HpLXg0VrheOert0BOMmzDazX/WNQVFQxJIgraSWfdpV8EmdnhIac39juNSb2Dh/9aB
         9cU0eNCTbc4wLI8ZHzNLnOPIE9szatcHy8MIxBPdLrRAp4QAvIAPj39DKHrODfRcnWxM
         KydPqUP0HrsmUYy47THOxIyJKgM7gNXLP9IuEA9T/G3O5mok6m4Dv3AZIuvayEDCRrNk
         rkxt3yOPmtd3hNSMJE17mp3qEVYYBOYhV1ahx8JHyjm8hDLlqx9Ow7wOIj/gh8ixrtjj
         Uobdr+0iaXKhlM2AhTGXXfLgn4kL5HX0kJzjL8KK73Xu7+o/RhTwbqTMA9oqB25DYzpz
         1NnQ==
X-Gm-Message-State: AOAM530Ul0PcYLEnOa59ayFnT23ov5KuVh1kXDCVJb/it6EcnTVACjSm
        fexZvLRCpFl/PvzTjTfoKwY=
X-Google-Smtp-Source: ABdhPJyBTaLGrf1lQ8fHQu0y5Qx4go6SxyETrhxHj6NCimrHFRCETpdmGEpMhxdYU0MD2gXT4dNbRQ==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr12453466wrs.271.1631539054588;
        Mon, 13 Sep 2021 06:17:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/26] drm/i915: use new iterator in i915_gem_object_wait_priority
Date:   Mon, 13 Sep 2021 15:16:58 +0200
Message-Id: <20210913131707.45639-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 29 ++++--------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 13174541f6c8..e2173a55e527 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -120,31 +120,12 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
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
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 
-	if (excl) {
-		i915_gem_fence_wait_priority(excl, attr);
-		dma_fence_put(excl);
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor,
+					 flags & I915_WAIT_ALL, fence) {
+		i915_gem_fence_wait_priority(fence, attr);
 	}
 	return 0;
 }
-- 
2.25.1

