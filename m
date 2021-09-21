Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B2241388C
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhIURi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhIURiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:50 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A00C061756
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q11so41607373wrr.9
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
        b=B56OpWSJxDJSmXRdA3znPhFcOHH9qgPRhamp/ajhbXWIKt19u8xNRcK8wMwFEMgJob
         phirQpWLn2OO6EF5hmb14FMkKYG1dOmvADSOvH2QaqdetbmoHVlu6ARer9fMjoAZrjdZ
         z1Uru51F1zcCGFW4uDsZuJCC/pOUvYNITfcnD+FJO0muNhg80KN2A7sJnG1ilLvAfMu3
         X3QJKtpy7/pcnrtmed+7/1dT+Fg+6PMjXV3a/xbqjUvRBV1/cJong5OznosmKeyvCZtE
         rBhqb0WMsyp5+bxvcHth+5XttCjl1k3dUPfOx9yZnmD80qJKrnk2faWGgtLPoBK1v7Ze
         jUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
        b=8G+d1dXa+w7JBHDWsn9uIiWJZVQAT7U+oMhS0NoAG6AXBbIYFnLDbWxVybD0BZhctM
         5ZeH7Tx7coXOUeMwWW66UUV/nzHY4/ARr/4x5v/nL3kvak4aFj5mmE1QUfenoYECGjsO
         UFNk4hO0DAxytPJqCbzwC0IB09EMNVpacAd7bH5qoQrXF2E6o4Ify2XozSLVo79ucYD4
         H+IsR6Cu/vU6gKX0tToNDizwR3QZEYgrwTYrkzz9FNgOT12m18N4ArENyQAM8y9gWttf
         FjhAWT4POQKEZlZxkhCsv/9uQL5IHQzW/9i/xqiUgXX8hLB/OEMpRaxpK2IHtSs4t5Yn
         u5vg==
X-Gm-Message-State: AOAM531qyyE3wDaFnYNDCKjAQhRMUVGAYglvj+Cif2MpYj/zbzJchWrw
        DwEwNQ88ZjYYeE7zWy/0I3fFLTkKoJU=
X-Google-Smtp-Source: ABdhPJyYSyjjuGb1tYtiMOCLyKPymW+VUjeVQaofYEkaqbVm39NN+2lth5M4PVJUFa/V9hxpjfPnVw==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr36472508wrr.246.1632245839391;
        Tue, 21 Sep 2021 10:37:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in i915_gem_object_last_write_engine
Date:   Tue, 21 Sep 2021 19:36:51 +0200
Message-Id: <20210921173659.246165-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is maybe even a fix since the RCU usage here looks incorrect.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..e20efffce3a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	return engine;
 }
 
-- 
2.25.1

