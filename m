Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00C84144AC
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbhIVJMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbhIVJMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6F6C061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:01 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w29so4623936wra.8
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
        b=MTS+8CxT71Oe7hMOt5KRA2yUEnaBP213RX88NXAbzUEHOeCZ93DaA8pTcHWaj8dDyZ
         h7RXT/obLhKoTk59ve8Lj15yGywz/u2fmJ74RoicC4oxRHfYMXReIlKc7k+SeoG9Doz9
         xM6OBGZlNfNqWhk1ed2lxGKzycWTpW6CDkoLUIjG7Lk8azTSkuTirraPT9Kr8fxWO9m2
         hu+1TZFBExqLZiwkoym6mhNiHDVSUYVoidGfjSGJ1dxiNYBb6wr6FYCYv31mZsZLnf8C
         VxZdDsCjdVH5Dp+wBPEvE8cOJJ9/aIh6w4OZocXdY3sEvGGIU7pnD+A3Jde6NqVxOCZy
         Xn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
        b=7aKXlBWLQ7rtQvbCFo8UWeqDdIwVx4VnyVPh0Jjhsr48MxFU8pGJgwr7KWW0uIpgBU
         4QOKbywSbDsDn0zZhSkQ6A1zKpdo4lXpdMzKh7uvlvfQtyq/IBjpmPtBbK4fxcK3lEBE
         E2u5n7knqTgSHX9CP3BnVJ6+2r1+vdBK83PQjdKRFQ5EXe75IaqJApIgO7N5rCfGyCDs
         GeWC1JqhlrSQiLbmsVIiGRfIKBymPhzjIOXzI285xge06vFArs9YHzcEFDI01KyHULLx
         npNrcplFZkMbb2NfGHURX6vMGxqoc7vG9Ebo5sD2de2EapVrH5KbjE194aKVRmJSu6rI
         Thdw==
X-Gm-Message-State: AOAM532i/P2NYsd1rBS2oSsqy7heUHFoJA54SkS3oPLzTsZK+HLTp/CY
        k62I/wtnNzPuifUM/PXIZYdUevbqLC0=
X-Google-Smtp-Source: ABdhPJzCbC82QhHH5hdyWRlXJ4Bk6zDGjppXG8JDIjAeP4hhouA56wVcY38fj8lDLIwgypugjBclrQ==
X-Received: by 2002:adf:fd92:: with SMTP id d18mr40757513wrr.28.1632301860060;
        Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date:   Wed, 22 Sep 2021 11:10:31 +0200
Message-Id: <20210922091044.2612-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..313afb4a11c7 100644
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
+	args->busy = false;
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

