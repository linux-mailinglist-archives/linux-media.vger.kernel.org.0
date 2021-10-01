Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B3441EA64
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353458AbhJAKIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353469AbhJAKIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:12 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED400C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:27 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id b192so6812331wmb.2
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=ggVb8tFWsym5tY2UFXYnp5/+wnnhdTTKklDhpXqU4dN2UZhBEMrcl7xcSW2VYnX7is
         umf7OVYBxPyMxyUR/5R2qTniROZiQo6IJrBeun7y5YjQZ/wYsR8EHazV7oevOeyxLRaA
         ilEl7koiJasAEhERC/Sd9DHlEAcbOxoeyRcAU2PH+ksfq9swgrHqYgV4/Rn7RhfWVkJu
         veQgyB7FNey0VjLsgPOiIn/ZIslZUF0fF+GPAK45UoERalsc1A1MPm7cpaudMkJjn+2A
         eWrNMlXvm6RvQDbesUW/VQdlMi+aEzSk+RVQdBcHw84Gg3IIc04fhqrwSe3KTRfICUID
         2b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=uP0NmDGF1eNmXGk9kAgWEOKACf0mTOe3foUcvXShYOLdzkpc7ra5YVrQOxZmtN0pJQ
         xoq/PVUbqWvFpp+YPx9YOvE9nLwXtGBXFtkjrpePQ4wIYhpr0+y1uQg03GdrQF3UXD6S
         ayt58xBopgRIXFDNbcvghht1/dpl9uutlXV21LoFKxJKxqUzadkB9ypgbZrOP8WCjhU6
         vbEfTy4bTa5CHQzbH0vj2GGZ0xddrstlLEHAoVESWAfnZLRO1v6hb1urZZ3d8RVyH75F
         fayif3/RPco19SY1xna3wWhVI8/4TN/JtOR/U9RF4LmDU0csIw6QJawLazBtS3N/v2Oh
         5GBQ==
X-Gm-Message-State: AOAM533V3XqKoQIvB3xP/YqS4eYTN25mYHQFymwW0h/+7GJE9trm7FeJ
        qSdSfcv7p2NHiL0frGTZ+GA=
X-Google-Smtp-Source: ABdhPJzFcEw39LPJdVp2bONu8d449hKR3YKtBopmWidnNRqiFqYpNm90jU1PdtiKjjOLulAqsyODpw==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr3574645wmq.79.1633082786509;
        Fri, 01 Oct 2021 03:06:26 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/28] drm/radeon: use new iterator in radeon_sync_resv
Date:   Fri,  1 Oct 2021 12:05:57 +0200
Message-Id: <20211001100610.2899-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

