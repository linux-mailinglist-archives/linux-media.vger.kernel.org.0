Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA9D3AB22E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhFQLSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhFQLSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:16 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE518C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id t7so3449011edd.5
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0rYVC8GXBvPHta5OQekqQaFTSxF/VrC5pz+9u8ViMZg=;
        b=Zm8qe0yqyJBtIYxx3yuZlWXCq7HjCj79xa6qOLkjBQ0ny6jlNUSeRumUFr5yLlW/eP
         t9MIUL1gtlbyyxx5LXxBlTZxfwwCCCRJwLlMmyObBGpNu3dVMAIFP6DFnEN1umkjFLk1
         qfBqYYLAaTa6qXninH7jyFhqCqABPSCaTAKpLqKJWduNzIApctuezdpbHyUBe7ESPOc1
         IsXe8/WJgv+CmJpRPzoGj5hr+paO4xWKnrd9GSqdBWGnPVXC5LP4uSSZ06djxIz4Ax6w
         qRhm2Urf5kYXD64HOixSMCdg+hXtC8lsvFXkkW+9u2EIz3pftnahDxTTUGp45qwQP1Bl
         TdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rYVC8GXBvPHta5OQekqQaFTSxF/VrC5pz+9u8ViMZg=;
        b=H9pzGrmAMPQ85mYZPGC+feOu2Gf3ElOJZvAmD6vu/Y14rQ1TpClos6tP19TrmoukUK
         3UlbprfgwezBnnAeYqko2iq4FxdcXbOXyyImBwP/fpEXtnw6fuZmGjwf8EcBVgawPJQO
         acZydgCoMTy/XeZFIAFIH/qhx5iEHxTPHs1xHwF8/ZYn5G5X4EczoMN8wZXwDI/IiKXw
         tL401xZVyhycIMlgufGKZUlY5yvGugorAg4dL3yLtkLT+agiwD/h0sUXS1oSDJGTma5s
         UMQhhQLLqIOuUDWzDOaW/kYALx5nSgDFQUyKNu+A+vtV/G/N7ZfpBzpdOo4BQsQWtwnH
         Y1Dg==
X-Gm-Message-State: AOAM5317d8ry5A0v2PBeEDWej1OEWogejXMOk8BfF2nLkMPQFct02x8S
        T+/qcMyX8lEvHpWcHIrnyBU=
X-Google-Smtp-Source: ABdhPJwMPY8wEtDDMVVnoIX7OfvIzuomuMkBFiT0fIuMQDUKJLRIJm09Yp32F0OTRw91VHHDmWIhVw==
X-Received: by 2002:a05:6402:1713:: with SMTP id y19mr5689376edu.346.1623928567467;
        Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 09/16] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Thu, 17 Jun 2021 13:15:51 +0200
Message-Id: <20210617111558.28486-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
index db53fecca696..15edb308e5a9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -256,19 +256,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
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

