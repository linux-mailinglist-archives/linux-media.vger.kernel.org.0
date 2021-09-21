Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F13B41387D
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhIURiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhIURim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D67C061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t8so41612564wrq.4
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=QzMA/MJYLzsk3fKoS93pNaqQULxZ7tIKjhecJyxX+My31cSMztTOIDiNKFaGZu7+sM
         Zz2XQj3G6rwGASa6eUmy9UpTfIJX0YfdpjEFLFo4EM4rmP/K/ixcmqwT/Ud16sk/+Zgq
         igUcslde55qLgyiVrjiQ3Omt3sKzUkX24IEpoqYCLDc6x9J0bY7Ktw2kEYc6Cf+Ke21m
         0FkxYIuv34lA9y1RDhJHy8/pINXoD8JHA+CD0OrOLATne9Aj63mB4C6sJKkY0lrpG6Xd
         IaNto0v0qYmSGP5zQ8aSvcGp0/wlfB2aMtYqNeGNtxqK1PTeNyApddXNQZfOJbK1sUXT
         iZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=6kYxCKv6DNDbZEcEkN8w0Ujdgznr1aYVxV91nA7p60J6dlDbUcCP2NXJRvFP9WVzOG
         k+UzScy8DMpjVENBuk26fqesqu2kXdjpher6XFla1Kj1rkHIyEo5Pw/YILd6dKh2xaW4
         GOWnFWkW1LIt2dyf1PI0WW4dbeIE1qeKTrg0bDPE1nbAKgHzKgTRe+iE6EwhHTvHjp4f
         xGTtHcRcL0wJIwExSh/X6qtrMGqJky9VJ0qvSHGM4Kdm7rqLVx7KloaUJtEqp9eaMPsY
         RGRJNdpMXNL4AH1FXU/WnfoPS29sCzEIKIihgVTslgZSqI68t6rAmYWXAwLaJiaVmnke
         8XNw==
X-Gm-Message-State: AOAM531rlWeBf5ksSuB5LKVmxqrp2gzRakkqTV0SaC9pKPkBYDy0DQkY
        u2Npw5X5g2Gl7OAnT9NwskQ=
X-Google-Smtp-Source: ABdhPJx9BSlIPy12vMo8UwZ/k1sZ2Iu5q5ti+N/kgo5j7w4UmBjHDnDHWN7dwqPuLhZdrHpzyicmVw==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr36265102wrx.413.1632245832661;
        Tue, 21 Sep 2021 10:37:12 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:12 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date:   Tue, 21 Sep 2021 19:36:44 +0200
Message-Id: <20210921173659.246165-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..b991ba1bcd51 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_iter cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

