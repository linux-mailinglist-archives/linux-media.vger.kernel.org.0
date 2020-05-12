Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF991CF0EA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgELJD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729270AbgELJAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64E9C05BD0D
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id m12so15932238wmc.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NZNungkfzjrpX3wvUKHqphES4AQA2BjvgdkrK2cjuiE=;
        b=CLBPuhz5g03xplqY3Lp/3c6jCI7cBpGlK2yI20bsQjZlk+Y0DSRAAzM7Uk0yJ/74fT
         qODjSJnOacCEhx0BQuKhrp9xCJljtl7WlTp/enOv9Yf5zmkcwWAQwPHdsOTS6iInjswc
         E2mZfpyZhXG3pjjGV03WLfeasYqdUTvXYUfyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZNungkfzjrpX3wvUKHqphES4AQA2BjvgdkrK2cjuiE=;
        b=isat1JYgb8Q0hNwgQSv+5TdfWe2K2BoWbu7avBNq0oxFwTqJ0Gr32COONAM5sQaHbS
         1HZ1HlUewnLtfDAiCvAeDDi/0+BMJIGHfvYCjeWLxAwYMf1Mi6XiPz3zjX0438EMwvYY
         ztF/xpOKqC6xEkVNoFCrfxl9PWKib5rXhCua4VNK27qU7zNhKQki7RsjIVj3TkZwLtIM
         +hoUgBLDpGcPS4DzELhMT2rvYI3qgXPTc5lMskRh8bY8jHkIXNf7baPl4CijpkBC/VLW
         4VDWdDYEzQZUWU+8/4zabRVDcEW3ME0eb/jvZQMJdMVdYiz/n2lFggO5cD+YLzHmAYSO
         6rHg==
X-Gm-Message-State: AGi0Pubagt5FLQCHEfNFhrsz6gQRsAniV8gUGuRWQrWc6Fu62s1d/YFs
        JECJOk5bchfmcgKM2aE76mDRzg==
X-Google-Smtp-Source: APiQypKft08OoGrIYtbiSYRYQwvgFtVy2fvk5tEE2SUvyg8qKyVKerp+e40UsbcgCmUWXpSeXbccUQ==
X-Received: by 2002:a05:600c:2055:: with SMTP id p21mr13223418wmg.127.1589273999661;
        Tue, 12 May 2020 01:59:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:59:59 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [RFC 03/17] dma-fence: prime lockdep annotations
Date:   Tue, 12 May 2020 10:59:30 +0200
Message-Id: <20200512085944.222637-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two in one go:
- it is allowed to call dma_fence_wait() while holding a
  dma_resv_lock(). This is fundamental to how eviction works with ttm,
  so required.

- it is allowed to call dma_fence_wait() from memory reclaim contexts,
  specifically from shrinker callbacks (which i915 does), and from mmu
  notifier callbacks (which amdgpu does, and which i915 sometimes also
  does, and probably always should, but that's kinda a debate). Also
  for stuff like HMM we really need to be able to do this, or things
  get real dicey.

Consequence is that any critical path necessary to get to a
dma_fence_signal for a fence must never a) call dma_resv_lock nor b)
allocate memory with GFP_KERNEL. Also by implication of
dma_resv_lock(), no userspace faulting allowed. That's some supremely
obnoxious limitations, which is why we need to sprinkle the right
annotations to all relevant paths.

The one big locking context we're leaving out here is mmu notifiers,
added in

commit 23b68395c7c78a764e8963fc15a7cfd318bf187f
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon Aug 26 22:14:21 2019 +0200

    mm/mmu_notifiers: add a lockdep map for invalidate_range_start/end

that one covers a lot of other callsites, and it's also allowed to
wait on dma-fences from mmu notifiers. But there's no ready-made
functions exposed to prime this, so I've left it out for now.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-resv.c | 1 +
 include/linux/dma-fence.h  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 99c0a33c918d..392c336f0732 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -115,6 +115,7 @@ static int __init dma_resv_lockdep(void)
 	if (ret == -EDEADLK)
 		dma_resv_lock_slow(&obj, &ctx);
 	fs_reclaim_acquire(GFP_KERNEL);
+	__dma_fence_might_wait();
 	fs_reclaim_release(GFP_KERNEL);
 	ww_mutex_unlock(&obj.lock);
 	ww_acquire_fini(&ctx);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 3f288f7db2ef..09e23adb351d 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -360,6 +360,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
+void __dma_fence_might_wait(void);
 #else
 static inline bool dma_fence_begin_signalling(void)
 {
-- 
2.26.2

