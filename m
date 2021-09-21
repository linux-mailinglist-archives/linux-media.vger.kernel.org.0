Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D71B413878
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhIURin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhIURii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:38 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C41CC061756
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i23so41643391wrb.2
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=VePXpSNXCwTK5NQ0fCHN0VvxQK/RJqR8uuQ+7WinkOk4JnqT4ta3E4ePLIcwg5K1gG
         Un7iqimOrX8S/QtaB6twwiic17xykFh68tj8EcjBBrYjZBdgG3TQT89RtNBlaYZ9WprC
         hEX7NmJtWqpb6IUdhuKLhrmP5gOcsItiqcZodcdLctFKGDSNsxIWgPwhVa/jCMCtAHgc
         +pAIXpLxIUSq1izgp14q+0rIhzS2/CkJE65YKYBdQ5VeTMI4ZJG1Pw4zi9uT1pYxlk8x
         wcTp1ZjYNCAwPy8mK1WaNbPK3wmz/8+TT6OvZOugu63a2TBHOv6qMoutROi2Q965Ft4T
         IhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=w1HX+DtWzIwH3w+EGnUfpRcxc7DCMzKQpE4t4L325bCxLMqVWU1srN+MbAbhdIpd4y
         I2RLnw8hRC+8HHP+MGEUj38SRutwdvbBpM0+R8/LktEQuVLzUZW9duNqN5BtSbPctRF4
         FEqdeHo9MHlYVHOuNz7Vtm5g98dWgsrKpezOEwnzo7Al7eN6utjrfwPDaIq7KpBZNXvV
         X9QygVEKuQKEZJ73qjWcEu1o6DAC6M9WkcBKj5xyKQ57OwRgMrF9idXyxAFaz1ZxmhmW
         d0QfHHiCvZCEQSs/WzcS9n5ULe3LDZBAKEVO0NijUFZpdp2bip76jfPuSSi5ZrRsEqwA
         45CQ==
X-Gm-Message-State: AOAM531Qd4TAG8MSoJfSm/qXqMf0oAG4HlBtrf8p52+7SwQJ/Y5UL9ef
        Uag4T6zPnsV4js0DDaXpUAE=
X-Google-Smtp-Source: ABdhPJwZXkcoOGg52wUstyhEmW0SBl14bNG6ygc2+W4Cn9IQUk6lNLl53rNUcP3WtzLBLwOzwiXawQ==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr6202904wmd.20.1632245828252;
        Tue, 21 Sep 2021 10:37:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Tue, 21 Sep 2021 19:36:40 +0200
Message-Id: <20210921173659.246165-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
index 3b22c0013dbf..301b0b4b082e 100644
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

