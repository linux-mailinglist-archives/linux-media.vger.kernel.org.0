Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F60408E30
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241017AbhIMNbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240083AbhIMNTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:54 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D0FC06178C
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b6so14629309wrh.10
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yu+uANfSVtr9RYJDKCjIWM/agN/tBH1C9/EMJmqSKvI=;
        b=a+/bhKH0jW9epgYrHnpIdEsBMYm0jm1t0FDhEk9F7lXVcqgduaiSs+VnX8Np9p6AcU
         JvuZPm1F3lpM1dMVEcXSpeFaAeku0FYps9n7Zy7LIlAAr3rKIkLqgy/E46+CCIIFOu1+
         QChFR2z6JMS22sm5OdOYt834Y6HQXYt3z5k/Cnw1a0peu3zrKNoZNVrL4Mffaq/NFdu+
         7HXic7NNPAnaHDW5uTwUKceMM0UZGBcoyMsuTaYTrpxtRkVHg+xV5Xw8L69xuBtzQJQU
         rmKt57SYv1S5LrZETWQCTrp1s3m6ifWTysLqX+8BZwUoUYFc5Oc67bBx+18SUEspN+xo
         XcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yu+uANfSVtr9RYJDKCjIWM/agN/tBH1C9/EMJmqSKvI=;
        b=qF3F7eSdt2uufGo1GQQ1gzplBq5EMhnJq2AoM9gusbZQQjFghRV3QyCuEQ2C03Z71X
         H6lXYkFyo72CU+iUUTd8OI5vBaWLKoeul+3gUMd+u2cImD8Gyee4qNEK1SEp5yKK6pv1
         knRYYVFXYLHLAoFKY5O3FNfJzDhorIuroq4NwYN0gWeMrjAY3yKaykXPwPzaRQq4vf4N
         E7sDzo5RgKfX3cI0Mtx+U6tOoa/u8n2igrq0Ztcnjz1TfHB3dYuJhONYdJOU9tbPK7J3
         m6fV+/40Yq1DDmRuHAkNvJZlUeR41Vu3ei4aaZS3AFz+vLMYwVQO2TsHw2JwUuyTO0Xl
         evnw==
X-Gm-Message-State: AOAM530MPbigiqUr4YJKQewVToYuqPwClelbysCYlIqU++2LqwBYl9G0
        ghjCpFVbp5XZSJT7fY9jMb8ezmMJAXcHsuu0
X-Google-Smtp-Source: ABdhPJydXs0asWZpyrRJrMmjsSDul5X8jlQvC2GehIIYBg8yV+HU7Q1UFpMBJjKJ4JU1wkLZ+baPQA==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12693618wrb.329.1631539055735;
        Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/26] drm/i915: use new iterator in i915_gem_object_last_write_engine
Date:   Mon, 13 Sep 2021 15:16:59 +0200
Message-Id: <20210913131707.45639-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is maybe even a fix since the RCU usage here looks incorrect.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index e9eecebf5c9d..3343922af4d6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+					 fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
 	return engine;
 }
 
-- 
2.25.1

