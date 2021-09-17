Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A9C40F7B5
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbhIQMgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbhIQMgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:50 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C29C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w17so6771608wrv.10
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrbXMO1uME+f7mLVpMCcy22kq2yF+JjSyltoWjwipSg=;
        b=bviXeXeCrAWZNOqQCBhHL015HD9zANiiD1Ju1cCP+d9sUE83p67saA0OHqEGKzTam7
         HdV54+gh2VmKuE40uOPj4Mf/xEl0M6s5KMpSN3xlzeRcYhJ4ckTPYjpgrzuSRTt4+0Hl
         RXD2oc23kLoXKDqDohUeLEIEWIWrhtqY627SP2iBr4l4lhB0k90vuQ549nrdMQrtdAD/
         cR4vAFJX1Nx1vEZY+Luy7W7qMZ3NHm6LXN3TIz1tcdlz+4mBCwAh0YlfdOvyes6GpVnh
         0IDr45hLwzmFtrnRsRWpKxoUXGATG5bN4+ndE8B/CKSububs2FOS2ENs951hQNB/3Uw/
         B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrbXMO1uME+f7mLVpMCcy22kq2yF+JjSyltoWjwipSg=;
        b=NUqgXnme5jbdl8c6Bf3+scasG+lhn29bsX1xPb3ULTVhiyWGCjJVG7bSyNcTnSSCpb
         QmxIVhVO6pb6l+JKXWNhnX4lcdk+GOlCkOzZC9oI+BwrNIZYeJP2yj7i7NlrYNiDIJGA
         yK5t1pd/IVC7WUyvmzsgGn7Mrpw7xq20vy8oASVWuOzebf5//jOZXIBFqGb1ZKIG5j9I
         yhsmE/OiWtZ6GXkkSre0//l8gVt6Nb+X2f+vFTSylUFLgcoOtVH/RgOP1ikepoVAxFjy
         uwAgFJDMuBr3qfUh7G0r0oD8ZvngbYCYIx2/HEQiAFtFGipqDsvxr1ysYoce4Gx3VEBK
         n3Vw==
X-Gm-Message-State: AOAM531DUp/Zu+DE/h2p2dN0IqqU1VI3Oh3vmPq/4Jdbv1Q805R30kX0
        ZXTmcJ6YV+8GGMXXO7OTsw8=
X-Google-Smtp-Source: ABdhPJx8Hxqa3VDTaoBwL3jmEPhMic46DgkUgKS4VuJlO4HQI4pbqyIWl+bnYxJEX+ODY9LowQLqTw==
X-Received: by 2002:adf:f101:: with SMTP id r1mr11239973wro.355.1631882127339;
        Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date:   Fri, 17 Sep 2021 14:35:00 +0200
Message-Id: <20210917123513.1106-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 ++++++++----------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..b1cb7ba688da 100644
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
@@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
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

