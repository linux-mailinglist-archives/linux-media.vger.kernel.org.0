Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB4F8209A
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHEPp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:45:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38992 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfHEPp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:45:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so31735004wrt.6
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9iyE3YOKUeG5ZizxulW4D4UK5rsERFOEpq/DiuLZko=;
        b=r9V02blzsn/6sU9/5govctOIYa39rlzhhnCWUYpMiBr5RPzdlvmSKgAYjBwfpWrye3
         GIK3Z0ZsnMO+mIW7sB6C9vQSUBjvGPMf9zOz9aEj6gdIUn3pcZ/tQ0qooolgGvNZepz8
         FaPAT4RqE1dpCNs8ZzPAtC773iHBIz96czJ0t6bBJzOnt4p+Q+2D2+ZnCttlZ6+jO4Pa
         8aPnXDJe/Z0fJtACdcGBKFxrlejBuusaM+n5JrCM4ta2LG/MSd9uho9HFVxSEJa9JkTj
         yFCpY3TQfzmD8E024Pzjk7wIcO7LSPBYD8jj6yKYumTylx2nIs0rWabchkJmVBZDT81z
         1mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9iyE3YOKUeG5ZizxulW4D4UK5rsERFOEpq/DiuLZko=;
        b=K4WvUqw4PZ4EtAP+0/+8pYRv6QzA3dESPUWUvQlW94LS0tYVFoYMC4FiYVuBjUtp/m
         8IlCLT+f6ugPKBQ0NAXJW1pH2cHnvP9VJJzXkoKGAC155wZoLNHDpnmoCW8hOewOcdcv
         +pcyFf22/dCQhxr6HXjIYCnjvM22hSV7V0sMb8fBmiL97KG2pgSQI3idu6EyrtCla2mS
         6ny/2YpYHyX4rjt26wW8tNKEo5NK4zxxHwwrr/9j3muDY8m3WV3eiaF2mlOurOOoShgu
         6JOOJ1EbocoZO/bkmx2ZiLwIdTokrDJFhzFg10PkEEfPN7zbfnZS2SkosCyqpv24uZ3c
         RuRA==
X-Gm-Message-State: APjAAAVjP+HVPfJIv/SMnGLIxMGj1GQte6JYzmDrQ5q0JR7SBBjkw/6Y
        mrSfGMpKkyFomnbmtQiSRGRgB/jG
X-Google-Smtp-Source: APXvYqwCfN2jELpOVXfZqazfG5tJI+AkZ8uPPiqhfPSXd+Hfql7qg3WBGsEluL6UnV4wSsPytaVFDA==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr11212622wrx.196.1565019956350;
        Mon, 05 Aug 2019 08:45:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
        by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:45:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk
Subject: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date:   Mon,  5 Aug 2019 17:45:50 +0200
Message-Id: <20190805154554.3476-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The reservation object should be capable of handling its internal memory
management itself. And since we search for a free slot to add the fence
from the beginning this is actually a waste of time and only minimal helpful.

Drop it to allow removal of the seqno handling in the reservation object.

This essentially reverts commit "drm/i915: Remove completed fences after a wait".

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 27 ------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 26ec6579b7cd..bb64ec6bef8e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -35,9 +35,7 @@ i915_gem_object_wait_reservation(struct reservation_object *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	unsigned int seq = __read_seqcount_begin(&resv->seq);
 	struct dma_fence *excl;
-	bool prune_fences = false;
 
 	if (flags & I915_WAIT_ALL) {
 		struct dma_fence **shared;
@@ -61,17 +59,6 @@ i915_gem_object_wait_reservation(struct reservation_object *resv,
 		for (; i < count; i++)
 			dma_fence_put(shared[i]);
 		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
 	} else {
 		excl = reservation_object_get_excl_rcu(resv);
 	}
@@ -80,20 +67,6 @@ i915_gem_object_wait_reservation(struct reservation_object *resv,
 		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
 
 	dma_fence_put(excl);
-
-	/*
-	 * Opportunistically prune the fences iff we know they have *all* been
-	 * signaled and that the reservation object has not been changed (i.e.
-	 * no new fences have been added).
-	 */
-	if (prune_fences && !__read_seqcount_retry(&resv->seq, seq)) {
-		if (reservation_object_trylock(resv)) {
-			if (!__read_seqcount_retry(&resv->seq, seq))
-				reservation_object_add_excl_fence(resv, NULL);
-			reservation_object_unlock(resv);
-		}
-	}
-
 	return timeout;
 }
 
-- 
2.17.1

