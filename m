Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D011E422523
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbhJELjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbhJELjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:46 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7ECC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t2so13228635wrb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
        b=k0XwzTVpq/0gbekSSpKyRcQbF2TyRteAqlNXXqMvrUUPSR7lMN4LqgJy1eKA8McOUb
         NrWtH18QzzKHO+jYzqQhDKVMfd28kdoO3FwSEjeB043Gq9olTXDHLDTVFYIKSEbwoTHx
         v56SHz08Qa7OxWaeHm3TqJ3fKnLOCSkngrdF43DZCCZcrUzykxZ0ufSdOFNxeNO1hqRn
         iqtCBhw+K/qssAiLXsBYJ0aSzRZyXqVPCIurJCc6mOq/uFIBsy7G93HzmeR0VDeAbBmL
         4LpjcPjYsgk9PpLOjxCl9rd1H1E4NNPnwBcSMFEXA4u6mxExDWXVqXFAhhyw0Yy+sggl
         qNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
        b=avupmSDAksycqT4vKtvMQd5O6EMCznIYKPH14F8i3NKX3aXCzY/Gj9PWLGExHk0Jhk
         4LphGKlJneJ1C8XkK7VSIamEAy/8flJ97+6s41VRkJHszlxACiNLdz4US+bjhvF/abXf
         ksfFKwcJ8kqdT8CRKgq845tAgi7A4KkEIySzZLns2HdQvphkJ0V4ZKCn7WCUkcaNDqU9
         BjnB55oUrI+WLZh1c5tGCptsn6BJVTB0+iqJLrjiYPoaeVEEjd365UR1MTZIId1kY9LH
         kCuqL4TElmwdfMhbpDPuenhFuTmy0nq5hiN0O5xSRvHfTyFarrQBVjcmZ7jimndbEFgf
         E0yg==
X-Gm-Message-State: AOAM532FwJoasPqZ4hlKcd2l/zyr9TLpvvIHrDvLzggrYgq3lJb+HHE8
        hSEN1YJ2Cbp2Xw+0xWrjJqA=
X-Google-Smtp-Source: ABdhPJyFUca4kEvnBulZg25MJLUsViqrz2cxyYESwTcJJxEAQzJy717ramJFMMoYJYI6vKzn+nbNmA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr17828316wrt.188.1633433874061;
        Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/28] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Tue,  5 Oct 2021 13:37:24 +0200
Message-Id: <20211005113742.1101-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d62b2013c367..3934ee225c78 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

