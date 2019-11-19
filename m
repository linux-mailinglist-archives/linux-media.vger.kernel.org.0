Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F08DF102DFA
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 22:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKSVI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 16:08:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52392 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSVI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 16:08:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id l1so4775987wme.2
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 13:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2zlbs2pXUEmTBiqM5uPjmApb3LNff5iUPeL5FIOnQYk=;
        b=ctaU3sXxMTMJ5J+YF5brTmEYkt8Lr8VGNpVjiIlvoDVnfpkFwRT2zYTiVRMmduytPY
         fBE0ZX1DtprGbTrac/f5b2ZXqUDRa7rNEks7+/5DUWVD/qXNDL3URNpN8k4cuLw37RxR
         3aXsKrgEyTsNzdYwlxwhhHU9VVrMKAXjOp7aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2zlbs2pXUEmTBiqM5uPjmApb3LNff5iUPeL5FIOnQYk=;
        b=YPvAaqBVhi8BLbQIVQ9r0C1aYkISOyoMG799OrY5G9OJBm5UFTtBHNUgvPJO89+TjW
         mbCfmZNWFame1gyuM3z0nwy+lpqkgQ/I1erQmDU1rIL/OLuUBeK4qwmnKTXSyarQCfn6
         XK9yqcZJcfKH7n6srpgKJRttv2nPGaiugJNjRVeFThF0ehIPIvU9FwpWcEj65UcnYRG5
         7sidhqep6O1bSyIVni5xpPQfhROnNZC+rWD2aMrBsH4DzKKk7Y7pLRoVwYDl+3dDePNw
         JiC/Gxb+3rgqs5I1PDr/SxYpsw77AD+byoP2W+aPL18gWbNaPD6/57ofUp86HBp3SuJo
         RwiA==
X-Gm-Message-State: APjAAAV8dVw54LGmFbHQO4g84Vbjykn/K9yptUBT154ojrzWHCbO3PY+
        p4L2AbT35AhXDUMPLZaoO7AASg==
X-Google-Smtp-Source: APXvYqzxX3jOaHPiLm+PN11cjUpEZn6I77rrmK+0fYGUxMig2vga+11YIaGfPENiJrgAdlabNeLEyg==
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr7906751wma.34.1574197732676;
        Tue, 19 Nov 2019 13:08:52 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id z14sm28005126wrl.60.2019.11.19.13.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 13:08:52 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Huang Rui <ray.huang@amd.com>, Eric Anholt <eric@anholt.net>,
        Ben Skeggs <bskeggs@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rob Herring <robh@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 2/3] dma-resv: Also prime acquire ctx for lockdep
Date:   Tue, 19 Nov 2019 22:08:43 +0100
Message-Id: <20191119210844.16947-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Semnatically it really doesn't matter where we grab the ticket. But
since the ticket is a fake lockdep lock, it matters for lockdep
validation purposes.

This means stuff like grabbing a ticket and then doing
copy_from/to_user isn't allowed anymore. This is a changed compared to
the current ttm fault handler, which doesn't bother with having a full
reservation. Since I'm looking into fixing the TODO entry in
ttm_mem_evict_wait_busy() I think that'll have to change sooner or
later anyway, better get started. A bit more context on why I'm
looking into this: For backwards compat with existing i915 gem code I
think we'll have to do full slowpath locking in the i915 equivalent of
the eviction code. And with dynamic dma-buf that will leak across
drivers, so another thing we need to standardize and make sure it's
done the same way everyway.

Unfortunately this means another full audit of all drivers:

- gem helpers: acquire_init is done right before taking locks, so no
  problem. Same for acquire_fini and unlocking, which means nothing
  that's not already covered by the dma_resv_lock rules will be caught
  with this extension here to the acquire_ctx.

- etnaviv: An absolute massive amount of code is run between the
  acquire_init and the first lock acquisition in submit_lock_objects.
  But nothing that would touch user memory and could cause a fault.
  Furthermore nothing that uses the ticket, so even if I missed
  something, it would be easy to fix by pushing the acquire_init right
  before the first use. Similar on the unlock/acquire_fini side.

- i915: Right now (and this will likely change a lot rsn) the acquire
  ctx and actual locks are right next to each another. No problem.

- msm has a problem: submit_create calls acquire_init, but then
  submit_lookup_objects() has a bunch of copy_from_user to do the
  object lookups. That's the only thing before submit_lock_objects
  call dma_resv_lock(). Despite all the copypasta to etnaviv, etnaviv
  does not have this issue since it copies all the userspace structs
  earlier. submit_cleanup does not have any such issues.

  With the prep patch to pull out the acquire_ctx and reorder it msm
  is going to be safe too.

- nouveau: acquire_init is right next to ttm_bo_reserve, so all good.
  Similar on the acquire_fini/ttm_bo_unreserve side.

- ttm execbuf utils: acquire context and locking are even in the same
  functions here (one function to reserve everything, the other to
  unreserve), so all good.

- vc4: Another case where acquire context and locking are handled in
  the same functions (one function to lock everything, the other to
  unlock).

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Huang Rui <ray.huang@amd.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-resv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d3c760e19991..079e38fde33a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -100,7 +100,9 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 static void __init dma_resv_lockdep(void)
 {
 	struct mm_struct *mm = mm_alloc();
+	struct ww_acquire_ctx ctx;
 	struct dma_resv obj;
+	int ret;
 
 	if (!mm)
 		return;
@@ -108,10 +110,14 @@ static void __init dma_resv_lockdep(void)
 	dma_resv_init(&obj);
 
 	down_read(&mm->mmap_sem);
-	ww_mutex_lock(&obj.lock, NULL);
+	ww_acquire_init(&ctx, &reservation_ww_class);
+	ret = dma_resv_lock(&obj, &ctx);
+	if (ret == -EDEADLK)
+		dma_resv_lock_slow(&obj, &ctx);
 	fs_reclaim_acquire(GFP_KERNEL);
 	fs_reclaim_release(GFP_KERNEL);
 	ww_mutex_unlock(&obj.lock);
+	ww_acquire_fini(&ctx);
 	up_read(&mm->mmap_sem);
 	
 	mmput(mm);
-- 
2.24.0

