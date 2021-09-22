Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CAD4144AB
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhIVJMr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbhIVJM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38BAC061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i23so4765776wrb.2
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=NZTcio66H20o4+aUG46IMbNGw/gsR2MLvFXmQmrJ1OvckTnHYUtbx4r0nCCpJ9Y/dz
         8BKfVinC47zlJHH6rS8n3bD9UN7mY7dVjy9mtZhsCbvB7pOdK+u5UVa6moyghTviVXty
         JKWpDYxOO97TlVUvPZ+JverRMrAH6NJVttL14cvQr0t4Ep3DnIzH9wWEx3WFkKtpikou
         qak0OwH3VMEabNYCOUN9WhPoCO4hzX9ziRvsBq9k/tc41rqmVm/wPn1FgKIKYV+Mr4Wj
         hdSTPEeOHlQy4LcT3krw4byAtBl0DBxq+7ZwIGKifvVu4P2T3fHDvO80to/Aa9HvoJho
         Tlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=MyiqJaxIQr8BD8yzs98wGMKZTRc72Arg7nJC3y/6eRj9bHDKfSQlDIXYrTeUXakgRc
         xeM7dpDaCnz0fnHseoqwu4raAMxo690GWygM91D69zTk54eBRyzlqW9NUKnpropkKEJu
         jXwahVq9Zni2kbru5yWtY5BEVntacxySnWowwJM4ycxCmDFiePJInOVXoZ4j+8okgxoT
         kF6SZRpMgR+BZ0BwCwSmj+uEEi7nOwZCVwyCMbhLG0MozQ1TzV+W+dEz+AzxnWkX4l1q
         O9SqlUbmhlxYzUrYsnq1O7I+fO5bQGj/1T/dENOROgKPYwenRCYXvvbe1z6np2O2mraa
         yh9w==
X-Gm-Message-State: AOAM532WSJn74MFI7ZNcPnECz/fgZIpzU4ALHYvsf/5t5aqokTjoPqQa
        7Vtd50KgXBUQiQOWlKzwYzBY7RXaTkE=
X-Google-Smtp-Source: ABdhPJz88bvnw0jC1PGYz8LxLw5TlE7TvUYTgbj0Klim7fWgvO2htMt4CDF1oeNQCrfg3JzBmHIM4w==
X-Received: by 2002:a05:600c:35d0:: with SMTP id r16mr9147612wmq.26.1632301858176;
        Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date:   Wed, 22 Sep 2021 11:10:29 +0200
Message-Id: <20210922091044.2612-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

