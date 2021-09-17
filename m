Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F02D40F7BB
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244268AbhIQMgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244253AbhIQMgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:54 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86D3C061764
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso9862178wmb.2
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPSU1DXFCGE7WDMspzajAb5+e08n2RYsOOJEReWtL6U=;
        b=G7GZR/a3uftoZUOQE1c5/xOo1bxgEpGvghaVs/z0MIKYtjDRjokQ7n9avxKHenfJmP
         QJpAsdMHxHBym8ybMepqG99FkHP3tRqLVtRAzRFUZBypbd+VXJUStpFWHbDo5iiVCgn3
         Pbvps5yJ8rmr9efaFRBWkvaz8BarNd/aexogI9NPT7fHt/P6Dyl16sGMXHbZKkPWhT1L
         qFMnnDBkaCb+iz+HInXNKlKtuO9s1Apg9hXVe07nLBnntrGUmKflElYKOw7/qyMdOOOa
         r16gh0Q625ASoLJMdrsIWYI8ud+9xFbYuUCCUqSU9RwfLAo9dQiRgQb5UNk7i6huNurb
         cjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPSU1DXFCGE7WDMspzajAb5+e08n2RYsOOJEReWtL6U=;
        b=S1cEHcY+ynhD+kj273iwhkxFY73bNxBVxFafQxD32VmCCpGYAg+eFkt2jcZzzLLz/6
         ylA3rGd9YzmuoNs20KTu/WbxPuMN93pULhIIFhvZEbVdUXzxqqNntuCpMuTS/vWVyt5h
         kB0DLFgGq17FiK4pt8UDs+aYt/q4WHYGkf32SqThOe5jonCXE5MVGE91cGoEHVpcX4Uy
         zGd3Fq/SOd4qfJ3CV5EJImHfew5a7eMn4vSlilUpeYtVdDakVjLyICLtHbZnhktWx9dA
         5gB49dkq26IHp1NPJjd7/x+Z7pr8It0dOUsRVtAHOynCQevyDHM01kKeJiqPky4f2u8h
         g7Mg==
X-Gm-Message-State: AOAM533Nrw+VHti0LHWs/89fA6w87sP4IR8GMQOs/oAmkcZ/0o2dC4An
        DbMGMYr4kDF5Pk/Q+YwKPpw=
X-Google-Smtp-Source: ABdhPJyYZOZM3qHZmzmJADXhbU1qBTWv4kCQvYb25PVLMl4AWhnK4e6h1RUh9Oi/FX1k49dfTAyXWQ==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr15128737wmi.93.1631882131496;
        Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 18/26] drm/i915: use new iterator in i915_gem_object_last_write_engine v2
Date:   Fri, 17 Sep 2021 14:35:05 +0200
Message-Id: <20210917123513.1106-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is maybe even a fix since the RCU usage here looks incorrect.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..487329a96e92 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,18 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
 	return engine;
 }
 
-- 
2.25.1

