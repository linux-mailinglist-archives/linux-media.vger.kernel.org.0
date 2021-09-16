Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B1940D8B1
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbhIPLcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbhIPLcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FA6C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso4230444wmd.5
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=619EAz9TvrXlFEEg1bXuHi1QdjRBbwVPPanVgBf3wcw=;
        b=eIOI2c8bvusaWxzxUusQ8CJabg6fj2kTwK1gPAobaKP6AFAu/5cx08fiSmduHcJHq3
         p7bCajLfrsbum4xAKMfk4Vi2QioxbtN2m8tO8blw0v2OvP9XGDiy8HIDN+p3KLcyPwzd
         dYnOJZXDpKrUFMIaSmwj5xygzcLUxKfyAsEckA063l4JTBjCuWm1JUi/wLr2r46wMOqv
         8DUjD1YILD7zccxDi1BJBkwhiOEzIomt3yTgwVo5jdQlv2P93jblrUFm8mN5vWDyUaiR
         AyPcHl6yOXcB8NZnppTApPT324tIsxF6uRR83kvHLE4uVDsFBUCw9TsGgKVxVVtz4qmV
         VZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=619EAz9TvrXlFEEg1bXuHi1QdjRBbwVPPanVgBf3wcw=;
        b=dgp4G1TUsk9Hfh8bSbghc35nmFEHAhVfaZGpKLwCx2zj0Ks1rk04qmsARcrwJ2/J2w
         VEWpwmZorjdjqpYE2ppRvKCTEmj+XnLj2LOKgUkWk3uUFhOncVevwz8RqN1pUjalm6se
         j217M9+fEXl/8O58N44oC2yly98yOxPK5sJ8EdofjyidTCMx1fg+vgsYXutNU+xGcEOR
         SmsHG2z+VyfHI3Ef+Ra/1AJ5uuUf+0jt5DuYEugxfE1a1/KUThwRs+t7AxVwdRqdou9e
         vWseGSUc6IFRmRrX6pwHXkgGP7G7RTDDeXfV4Bz0R4fe/vRbMR0l1ATsf+qIlAS/lmvq
         54dw==
X-Gm-Message-State: AOAM531+tkdKFKXN19kn7SCe2k6ULnkEsEb/cF8wl4gYAGC8MtXb2HxU
        GF4rSwDz/KRnQ4VBC+bd8NaZCWdH5mo9JywM
X-Google-Smtp-Source: ABdhPJx+LVHV0RoCdRxrz79zGczQwIUfnEDaV9mE/KpbaDXh/TdYi9OVCpLSSb6QOCq+D3ep2yVHPQ==
X-Received: by 2002:a05:600c:2057:: with SMTP id p23mr9530967wmg.25.1631791857611;
        Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date:   Thu, 16 Sep 2021 13:30:29 +0200
Message-Id: <20210916113042.3631-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 6234e17259c1..adf9a8413446 100644
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
+		if (dma_resv_iter_is_exclusive(&cursor))
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

