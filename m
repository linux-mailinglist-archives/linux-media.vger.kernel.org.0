Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D960A461649
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241301AbhK2N3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377487AbhK2N1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:40 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06D3C09B06D
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:14 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d24so36327445wra.0
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=VArbpu7FuPQbaXNYwlbNTtUvh9E2TEdL+Tznj2CvUsCZpJV0a2/xhr0W8XxnpgzmCG
         AvK6E5gzE7CzKib77oVwJ+WJiRnLQjCwVWBfHee/uV7cubHXxRtSrLMae44+yrtGc2hQ
         zmVi1fvvYxKt3K+avKRejVud0+n5p/F73xMaP8jlw6Ayt5uRBvkNO3F4zOKw0YcPVIM1
         CwSUbK8Y7nnWcsZdbbuKGQjqvhT5EEk6gPP2TeivfjUyq0dZBm+kQ74uQYzDv0gW/14M
         m+F9MigUK0qIwssLixtYUWLJx7+YaXxTb1T51tgazv19rqy4uGs113a7Qvs4eg8fyuX7
         aPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=I9aTtnRLCJjosJkcFEglmJ6oNQzEe+c454ED7Sq7RI5dIqB291SpYD4yhKs35KlDyu
         NOYTZ9xZY9uWhs628CxwUyEfp80QmM/TcuKGBMJ2KJBfiVuVszb2Ix4zrbxztUXGXrPQ
         wQcXEMQqNPM5upQjLHzAKWg0LjC0ISlDCpP3/7jySY7lXEsbsWbb7nzAwWPyVndqSkYS
         JYqx9Sc91EV7Xv+d+qBpvrnrG6MsQO+AtA1hhNNPg4a7g3Q3nSjH1R+jNwUV6UScwdjg
         SFTH/RV1dz1h2+bxslbEDZoquKFGWuR+Dw1mvxdCDA1suBmnn0qT5jdWaLXB2J0qmpmr
         T+SA==
X-Gm-Message-State: AOAM5332usYv4EIc3bYgNEW0v6oreug5lpzaxkLoKE3SZ88hD/MBqbum
        HkaUrgz0gIDPbYJbhxNr8oA=
X-Google-Smtp-Source: ABdhPJxpTknK3FBKpRmHjMi8jw7cT7T58Ury2nOUZcmFt/8dKpJ0afnRF0Ft+z0r8QVLSFLt7r/FCQ==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr33356965wrs.605.1638187633534;
        Mon, 29 Nov 2021 04:07:13 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:13 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/28] drm/etnaviv: stop using dma_resv_excl_fence
Date:   Mon, 29 Nov 2021 13:06:41 +0100
Message-Id: <20211129120659.1815-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

