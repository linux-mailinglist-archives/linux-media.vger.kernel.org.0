Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECE740D8AF
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238186AbhIPLcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238132AbhIPLcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22767C061766
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w29so8925829wra.8
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KcGBgTqPip6/dZ1AoQyg0Edp54HfoO6axaUUT+kNZpA=;
        b=m+pyF6jf44i4RFjZqLoivuaADocbP/v5QWB06GPgd1/roGp9WvfNytXzKBle2L6Zg+
         mXyqPQlUVZyn0Tdrle2F+DVwrvdzCxUtK0OykRLWv+xUYlynlOx+zb44EcfwYz08Nzql
         547FX8c15NPftjpGuJdDtv2A3mDNnPbwuFkk4dQdYh+Yy0wV2b6Ruqsqi3nqJzWJE6XD
         u5fMcQuxLDZvK2qot1O5pzPZFlu9OvFq2BE+GEldPNlXvOrlP3dmgIyQoEhRbfBpONgZ
         z3xM4JTg6fRcIB55W+je3nazucPxWZqTLDtOQfMEBWvnUFiN8fjc3GJ5qqB1Kk3a+7Ry
         fwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KcGBgTqPip6/dZ1AoQyg0Edp54HfoO6axaUUT+kNZpA=;
        b=oP1XSY2vXZ4SW4mWMoNfNf3ItFmTym6DSM8UVSJ4TAB8uHIdIA140E7B91lEu68QD8
         RgJ12yev3SbkApbUJLskGQgxbVrhZAltNkXIo7vWDl4F+hRnQrxOur6RzNGEm5CquKz/
         bJpwJW459vJzpeOkrucSX5AdrrgAW1J/i0443mNu0JP2fpx3P+vR8PikdH99uORyaZ3X
         OM+2NKzi6HBcyYmr4MtM+UFsXkaSUgtuhwQGrccfLh31ap7cWr/Tn4i3xZvc9IDopNFz
         kljzxdqZTdtTNAJ9n4fM2Cdko+cgSH5n4uKmPK7t6qIz2coaFa2K0DaU8du/EkmMgIRs
         gd4w==
X-Gm-Message-State: AOAM5323Sqvc1XcpCYJfaUXAuNd+UZjMgonfidrVHsJ3EJYdRzsi2h1S
        2PuB3Ajpdolh3D/2591IJYQ=
X-Google-Smtp-Source: ABdhPJzituzq4pK7OzQD32lgKLYW+PH2DCitMAhYPsU+lk7Ipv+2utGYpP1F4S0XgzV0ZuuuDedxMQ==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr5550180wru.324.1631791855784;
        Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date:   Thu, 16 Sep 2021 13:30:27 +0200
Message-Id: <20210916113042.3631-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 9257b60144c4..23fa98dfe04b 100644
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
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
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

