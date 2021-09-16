Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAA840D8AB
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238180AbhIPLcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbhIPLcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:13 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78316C061766
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso4257987wmc.1
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fH2la9ERLn922MNwdjpBzucxgwCx4MWLLwnxQZAkV2A=;
        b=QygDHeC9HsVEtELC3djbtZW6/0UMFEgNYKIXOY5ItCyz+1xafW/q/R2sJcJb8+Cn3O
         GDSnKG+cFou9ZzvIbvJgDf1cAdsyAfisFunb9pfcUc5n6/XNpVTLLAhflx62HXJPijos
         H8pEY1imBFv+eRQxkBc6uyflXxV9Hv75wsQO5fDKxRoZwh8TUQxjYufMBqg7q0msEavO
         Kn/oD58ImLwQbjh2Fwidp3TA4A9EBP1CSdGQQIV/dL15JPxPyPV3RxLOoovLApguCDB2
         NIH/Tz7fjTf8crcBPzJgv7LxbG0EBJoS3iJJYocFx8kkGyz6sM/LMSgTG16LRnJqBXIh
         sV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fH2la9ERLn922MNwdjpBzucxgwCx4MWLLwnxQZAkV2A=;
        b=dI3DiqWmYmjhx3a3m/KmEri9mRv8ayPiQSydUCUAUhTRZ5hahAvDpqtqdV6G1RebWM
         b11Ltx6AfJStXo90Dz6e7Ay54I/KybhHeSidcBG3gjHSJIinP/tknWKMgu1pq3o9f2z3
         vRg8d3tjGEtM+8Wf75yvdOz0izHKsq+UjalB1M0OqeyrLGZtdv5HkU4mcBpOTfYlsS23
         UWSuiiNZWI37aZ66G5nnd5wAKExuSZprVMqIq6O08Qp7mobCPE3bvVwJRBjoG7EcWWsF
         n3jr3nTpsghnej4JMdSA9PWKpjlWZdI2FymAs7UWG+P1vj6vpvr0Lh8/R/n2dnvMtOM+
         vQZQ==
X-Gm-Message-State: AOAM532tzP0jXDHE3g4yYVz/8OgVlUVeeDmKqUbYqxHzGa7PIvBAgX/H
        RVDwJmyNvYmAuMeL6MJlFKE=
X-Google-Smtp-Source: ABdhPJx8rGNiCUwWUC8lksSU3s2LHyKP4S7ovy1WxAHJ8ow8lfQ9S4SfWYyXUenSQuBU1zVE92+Rwg==
X-Received: by 2002:a1c:d2:: with SMTP id 201mr4420740wma.67.1631791852124;
        Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Thu, 16 Sep 2021 13:30:23 +0200
Message-Id: <20210916113042.3631-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..d5912f5b5953 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,19 +269,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_for_each_fence_unlocked(resv, &cursor, true, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-- 
2.25.1

