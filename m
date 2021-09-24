Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B053417799
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347176AbhIXPdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347171AbhIXPdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D21EC061613
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d6so28549176wrc.11
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=h75DPlfzvi0Y5L6JHOzXyzPJNHfjtxZfuvuYNARNXh37ufDGKFdCsSz920sBteo4Ff
         2+ZyPBESlT065wf3LBrNWNS/9G7wsxcBfJy3Eqk32hn43Shwy+pM6U+kJ9R0ZejuR+Vz
         yLXzbd9Fqh58hReqDGcLpg5cRhUJS1FqN9OB8KTqMrHIiZ4JuNtRBeI1pPj2jOt8Skri
         u0LDjp7UCnj2gZ2CFnDl8PaexMJygajFPVi7CRCis59A6Ez7Ikfjf32Yi5LUm+uc0SSG
         mLfBDsQ5wQIYfQHwtMpWP5Yhja4lWiRV/2XgAq5g2TWJONo8xDiz0PWZ4axw3N3EayBb
         DzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
        b=FWuyX1EK3kqqhZoAaS1Jfk8LCwkwEgQkJnf67aUUklyjBTpfvj4+D2sdh0k9fCrXDX
         iqh7B+zUhXQrvK41AqBWkNxGx/eK+UD8ZTsUFiKrJcUGbm42z6bCO+f1DariOMGnQzfT
         GE+mnFPC4lkdlDxW260mk7t9N2b3tvehJWBpavwKdCpv+bP39lf144ta+PR8BbFXDL29
         o/V9s2pSBYm2enuysItyAPWMCUeEEIQoADcBFioZWlcH7CbSV2+FAxoBDh8iQYf0wYD5
         fGzA4mmhz4/Ju7ZhxQWV9ROx7Wq0pbgkHmEouNjJ6MHVPyVAm3qQPy7lAttDMIfsKQdX
         Trgw==
X-Gm-Message-State: AOAM533ppuoeianmYpDArCC4CQ2AGUAeBx6Qaih/RRs5oYnnxulAsz1a
        DXLYEq/B/WnaKoSKOkWbFrI=
X-Google-Smtp-Source: ABdhPJwyWAVMcyXwelTSK6xbOku8WjdhPsn8N1Gqe2DhnPKS7Z/zmZ1yQ1Z6lfpvcNwol/KLubCcmw==
X-Received: by 2002:adf:fb04:: with SMTP id c4mr12282673wrr.244.1632497491274;
        Fri, 24 Sep 2021 08:31:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:30 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/27] drm/radeon: use new iterator in radeon_sync_resv
Date:   Fri, 24 Sep 2021 17:31:00 +0200
Message-Id: <20210924153113.2159-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

