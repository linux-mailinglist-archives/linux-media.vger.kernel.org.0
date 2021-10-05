Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8023542252C
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhJELjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbhJELjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:52 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B850FC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id u18so36801072wrg.5
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=BhCvxbF/dN5QcuY7bMsWHEUE32beuMSqtn2a9g3Q6axbLMJeHgrAWHIuAAutz5zBUv
         bQCXWMfTxkxH8cmb4WkH+HfL95bmN9CEHaTFGmqdK0xgphrApeBC4N74oueJahd7S1wk
         6s4BTBFf5eBMRym+Z5xcnMQBJDnD2OSSZeUr/LVVPTPbBqGXX8xGPci/dS4RcEPxzjcj
         dX1hdVXm8aQGGABUqysg/WVIcSoIiyREhPSqQiZ/q/KOneWiCeFOA2NX5O5E7qYWYM6G
         UUgeVATr6mGtjXWRLma+ryjA2bRgLz/1D9500ARjSYjuCMfKDI5T3puuhZ9IGIUGxX0v
         iztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=cAQ/481QBVoS5qAunUMec2XN8W/DoUKrQqTecXIYGlzcCGqf49OeOBw14XVbWQ1Wkb
         oZIsocer49cqQQW5YMH12vBfBElMMadiVJV8asBrGuRXxKJOOpbb56kxCHoI6tSgGGBl
         RbWND7P897wieoJ6AFC+S9aVpSDteqoT7SHIN+XsjPZHpefCLepIAAaF0eZaWLHfNErc
         Ln0oFIPD+rbAAo1dBehA3sjI6QbKDAZ7AQY/Wyr5+f8JzewgDX8wqsuDeGNdJ+jdx++2
         sGFP3s7KzI4o8NMVfbfk4ZSvM7X+VCSHOnAiQVf/Q/d/ojwbQkMWW+U9KWY1dyuTZWtw
         KVxQ==
X-Gm-Message-State: AOAM530Utsq0fc/NWWp2PgvwuDUEFefhBDVZEPXJ7QshkjMSCT1oweCN
        wtL+Ilz7EHPjt7/VRGole58=
X-Google-Smtp-Source: ABdhPJxo19rTUZH2OQEHe6oKuoDaSzFXOAK8r+4K35KgQiww0+NoRv1HD37aNfPvPn+EcyuSGOP3jA==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr19789341wrc.209.1633433880372;
        Tue, 05 Oct 2021 04:38:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/28] drm/i915: use the new iterator in i915_gem_busy_ioctl v2
Date:   Tue,  5 Oct 2021 13:37:31 +0200
Message-Id: <20211005113742.1101-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..dc72b36dae54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
+	args->busy = 0;
+	dma_resv_iter_begin(&cursor, obj->base.resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_restarted(&cursor))
+			args->busy = 0;
+
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy |= busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
-
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
+	dma_resv_iter_end(&cursor);
 
 	err = 0;
 out:
-- 
2.25.1

