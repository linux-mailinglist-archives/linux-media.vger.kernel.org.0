Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8E7417793
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347165AbhIXPc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347141AbhIXPc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:32:58 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5822BC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t7so28540469wrw.13
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=XVCAHX80yj7fOOVhGmDrldDzQ+tZU1P01Ey6y5LZO1bhqLritw4vRboSKw9v1ZiVkJ
         +Qq+Im9zUJGVqrUWGXSAA9IcemqPtfIo/wr7WwzzeRFMun+hksrMaP7yBhACzRkr0q1L
         egGSvjFbf21ceOxwJWa+XiU6iUda0TyWJZsf3rLkzV0VznYvWfe8uDzuQO+dMPQe7fQ4
         ttTwD8bIXQTG9D5hbaNC92Nmi1nT54rn/RbHFH4CvhxiR546Lxo1jSzsooQoQzggRUXC
         hYKln3uM44d2NgLl0u8LlqS79zw1VeOXTkn+7LUEddNRZVB8Wze6nUkK+ZnFZlEl03c+
         xinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=OR+r8fmOfhamwG/65ge4K4jjGqE0inidCfLzMcL4J3qC+XhhlBA8QaUm1DAXjXXyaF
         n2VqmCY5mU2L8a3zpEyuTyAVW2ESKsFsnSpUGndo+iLXq3U8vEqAuamH+nazlgMCmDUU
         g8DM5epCdpH09zzGsv5vAjmihHex6swKFdQV3pZZRZ+ElKFh4QXi8jhD+EjbfcJMzqC1
         ZWH6Lj/SMnm9DJb8fjj/oR3hMSvDXqB/lYngFAeWfK3Rs2SMPJKhow9xTJMWWlAC3LA2
         WH8EbZCluVZqKPxRE7Pl+TzHzwf4caLLEo1ZAq3NZnv/vXMpsVvJGi+dbaBzeyrfkddF
         OOcw==
X-Gm-Message-State: AOAM532eY00PczvWA39Acryv7EkV97kOLGc9ub+Vt/JrzH85ZRipY/Ca
        yEC5SDElAYr7Qb1b5F7Un+s=
X-Google-Smtp-Source: ABdhPJxfVU2ZRGajuHbNqSwwhLNc1V+itYxHz7cNctZZYqzXr+vVdmnmCGw1zqkJ6hJhq4Oo9BoeSg==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr2680834wmd.189.1632497483876;
        Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/27] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Fri, 24 Sep 2021 17:30:55 +0200
Message-Id: <20210924153113.2159-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

