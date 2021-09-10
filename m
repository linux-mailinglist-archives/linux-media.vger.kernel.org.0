Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6134040685C
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhIJI2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhIJI2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:17 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BCDC061756
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id g74so612277wmg.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=WtZaZ8lTrzJYkzKuB+d6ATVa2C6k5r+VXR9fkvKSv7zY3+Wpt9lWHA1pwqPZlayoft
         TEa8zcAd84lNsM7gKRlyqKdfBV74rX2zlmk9xfsqP03pWCwl3GJC56Qkn1idmJdF1Lg7
         s8WJvVtgv+lT7Orxk1R/z7jCJD5m/s4KJ1UbtU7Fe/er9HCRKjBAV/uicmyDXGLLUKws
         78FVl2AsmhWdmtCwnn03bFgTiNBOeOxsKjKi2ZC2OZI/rM8wVNxgsr5wxM3mjFqUOZiQ
         CUhI+LEJufmj4NPth0Oi6nUMzKDO/3IGhc7ZbdTxoVRpsJkHRpYbU6mBGxdQeMFRIqAS
         08eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=D6CejkYL1KWbkRu66wAk9tFe9oseWOL8Sg4ajfqmmsXc2rqX6n1ad1/gHTiZh/Ttnz
         MNMgzxC8IWNm1Y7PKkcKZpdWDUCVBRWD8PozOzIsejLEKzE0tcw0rQWlDhixjDHRLTso
         p2LarbVClMgjBAEBuzgisIN/5vLRnxamudS8it3SRrwZUoZR3nH+mJeSNZe6ViZHBhGk
         ooPVEFopCX/Fj5QL02AFMpNft4yzoSZJswD1sz2fn/Ez7zelOhh3NFDo+rHe8umFUGJD
         Be6Y1fkPbnmCDafrUhCedFhPblt0l6F5micu94u0JYLBticSFavLoIUtXBD3fGUlvxgY
         SFtg==
X-Gm-Message-State: AOAM532WOHpL7sv1N2MfwOMcMSe616ZwtBvjWeVLA0uFhQGO6ic4B4Jj
        IaBwshTyqCSmWIq1h5rvb5o=
X-Google-Smtp-Source: ABdhPJyz6KtB+9SFHXD6Ag3BbTzhdxjn4oJj/Wy4PIb7F55aitZHvqm3vDWMLYmLb9u7fpDLGo1GpA==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr7165760wmj.78.1631262425147;
        Fri, 10 Sep 2021 01:27:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 09/14] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Fri, 10 Sep 2021 10:26:50 +0200
Message-Id: <20210910082655.82168-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..6808dbef5c79 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -437,19 +437,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -459,19 +457,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

