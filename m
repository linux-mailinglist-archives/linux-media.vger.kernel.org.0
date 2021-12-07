Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D242E46BB21
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbhLGMhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhLGMhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:51 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3772EC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:21 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id j3so29230999wrp.1
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=mNB5ddQOBbfe1ionpAcL5x0CRzIyez/D6M70EWvEOItGOFAXApPEOKoA2Vqa0DejH/
         b5jD3jh1azgEYzv+caN4+5QO7mnByt/Q7uucl8Oh1GqC3XgpFHZuSq5oA/Eat4O4tm13
         GW0UNtdk+jZk3X7nIufqdXubOjYcJ8f8pYBUeouziaBPkAvurdg6Qh4nFcIvh8E5cLzD
         GXVQcRRi2ACP1nPFVN9B/pVJmBrPWGXyGnkNLpahgrZppWQNVm2UPWNP9zRzqvDOzQUu
         o5gQUL/YE63pZJEwKk+YAONcye9An+pY/aGjr/gd6g9i2oBpjH+VT7uWa4mM4Jy8us2P
         xshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=HyCRflbheFGwlRzgqGX+zMnIqHcR5vxHVq8kbLCoU9kRe24fhLji04q8+4ZiW11Pap
         6UEMMyVpHzAH2cpQ5W4xnPwsw5W5AB0PTpB8uIjdTZcNc01OSV2bOZGzLuGbvBe+maQy
         fqGU0Z+WcWpsso8F+XGVgqtxxDvTHcQTTNC9LafR51Ev+xbCTwaFMdhn4jyySHdpNlhK
         guW7sqJdIhXiVgqGCH0ft88+9YUr9hELSUJttxWr9gBZWCTpuX1FNeHbh+dUkDRzEq54
         ztk86SSWlTbydBmqSOlrKC795AFaarwvaTmgsnc0iwPCCfm08SxEj3hDXXl7npSSoLqH
         vO4w==
X-Gm-Message-State: AOAM532KRbT1Sh9otlXySg4yAe7Q4g5HVKKPKIfPbaiXQKOWJgDTJpLx
        Wxk2BGFysvDxEgAHWGkd9g0=
X-Google-Smtp-Source: ABdhPJyqNqRr/d+1EtHHi/G4K6YwaP6V+42Itzf2CfVhHni9ZvqzGXNzIwAQ7PRDySS4qKNVM/55VQ==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr50806916wrs.605.1638880459885;
        Tue, 07 Dec 2021 04:34:19 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:19 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/24] drm/etnaviv: stop using dma_resv_excl_fence
Date:   Tue,  7 Dec 2021 13:33:53 +0100
Message-Id: <20211207123411.167006-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can get the excl fence together with the shared ones as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 14 +++++---------
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 10 ----------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 98e60df882b6..f596d743baa3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -80,7 +80,6 @@ struct etnaviv_gem_submit_bo {
 	u64 va;
 	struct etnaviv_gem_object *obj;
 	struct etnaviv_vram_mapping *mapping;
-	struct dma_fence *excl;
 	unsigned int nr_shared;
 	struct dma_fence **shared;
 };
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 64c90ff348f2..4286dc93fdaa 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -188,15 +188,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
 
-		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
-						  &bo->shared);
-			if (ret)
-				return ret;
-		} else {
-			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
-		}
-
+		ret = dma_resv_get_fences(robj,
+					  !!(bo->flags & ETNA_SUBMIT_BO_WRITE),
+					  &bo->nr_shared, &bo->shared);
+		if (ret)
+			return ret;
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 180bb633d5c5..8c038a363d15 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -39,16 +39,6 @@ etnaviv_sched_dependency(struct drm_sched_job *sched_job,
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		int j;
 
-		if (bo->excl) {
-			fence = bo->excl;
-			bo->excl = NULL;
-
-			if (!dma_fence_is_signaled(fence))
-				return fence;
-
-			dma_fence_put(fence);
-		}
-
 		for (j = 0; j < bo->nr_shared; j++) {
 			if (!bo->shared[j])
 				continue;
-- 
2.25.1

