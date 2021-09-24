Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FD41779E
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347180AbhIXPdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347179AbhIXPdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:08 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5671C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d6so28549536wrc.11
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=e8ktm8j908F+o346SDIu24SHhmwHHVacBvNBnmLYGX4bjCZ0T/w2KBISyzalGTK8Yp
         T17P07dLJfGwqG4bcMEg0/iy9raP7DcDQd0tLCXKQsIc7xI60ZjREFyX9DMJqWnGuojj
         jDGvLnRhkadbz9GldUlXFBEAx14AjGWHwHXSO1JJ7kF0yTFByHTJF7tKgam2sil4xO6o
         6zOh6Am9zSD+6nGgzYmbR4VPM0y9Aqz1RfYmq7F0Gi/SNo0veUh2yfoYoz8TGhKiMxkV
         AJ0TOagSCKIjrEyz9ocSMalLC4UMTYGriCTWIlHJmqq5yBP0PAcuO+dzR5TZSftTbgiF
         wKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=ZyNjPqoLPv0cJMOzwD6aTe83tzoO2h1mwTxYJNDql0vA4xgiaQcYhySQIJKnIZvH+f
         5o/5mSlldMV28Djhu9QFBFnzRrIVcm06cvyzLqkv1M/bykAkxoA+KHheVdAD2U5M6cLg
         wpONW2zD5EI2U+0nzfiUbQGO5rlgOuzxTFJ8R/uAIuUx2kS3M39Q+DOuZ3P44C9S2540
         1EnLgmXtm/8pmycNrUk/RDlsNHJ2tTG2TTFqGbVo8nGuSMS2eMC6fAo67eU1kWjFRKqY
         jntAQgfValnxpxRvAXxuMO1pWDZzDAeFjKRlIgO1cK4CGFyQxWpXLsVCxaE5k8oM1zbg
         Vymg==
X-Gm-Message-State: AOAM533EKxl0fPyLIQs34ebUo+ai5XxQ2dseRlkJXUB+UuYltn8Ttp2M
        ri0zL2WO3K9ItAW/v9kXZBQ=
X-Google-Smtp-Source: ABdhPJw8um7sB9PGM9PM6XT+29vgXwyT8JT1FRlkJlu9BgxfIgtfxD2SFGvg3W5V/i3CaMY/sscWFg==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr5767805wrx.85.1632497493377;
        Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/27] drm/i915: use the new iterator in i915_gem_busy_ioctl v2
Date:   Fri, 24 Sep 2021 17:31:02 +0200
Message-Id: <20210924153113.2159-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

