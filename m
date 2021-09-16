Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B4940D8AE
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhIPLcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238163AbhIPLcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8B1C0613D8
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:56 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 140so4591420wma.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIxvi6EFxqBABKYJnzo5Lw9hfwCaC7HFX+lvVcywepM=;
        b=oKsgdiKsr96XgM3JmAFofC5/0vuipaAwfX9jsgxGyMZ3fTV8A9VyvR/ScjKqxr1iJt
         bducrdb5jL9zm0RZEOVKInM+FZ16fL2q9KOmuRy9n1CIFugnd0OyJ6ZCJ7ba3wVOuIJ1
         B8OWSgFXztchdu/RS5naKpaoWKrhf4BhMJFEF8A9UMwPZssg0n7ERFOnwOCNGB5rqH/k
         S9yDBL4FuIDgwIzfgi+kYaO52GxXcd/kfYvz/1DYl413ZbuqKxaKfJnwMBT2nUwrA65Q
         Rj742F0Dv0ZZw5Gv5z/DJkI1HjLlDzUB+WrprlPlzlYbeV+PJLJaINKpSPpELYuxiERy
         RkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIxvi6EFxqBABKYJnzo5Lw9hfwCaC7HFX+lvVcywepM=;
        b=3/CQCfYfnmI9ZUCAHlO/gLzb6R3sCT9w5dBYv6MOydhJQhjfmsXcGennkf5DNQUsPK
         0ElHCk4K0t91vSofpPsVahkTZAaFUGg29oRz/px19MMGXzUFI1jr08RT9gGCSmBYCIoB
         DyuMRG1xYmssRMM4M5fHPo5tX/xV6vY3j7MiKQCbmLCvv/g5AzGl0cvsyXjI1zep5SLJ
         JdUdSvHAFDHewoDV/OFv3YY42gmw1rwzENQ92/MUH9/hyOMx8bsu3RfXLegJT8zlCjvm
         PO3h+uC64j9izygX+WRzSPGXO8rKAdvfFyr+WRyMRZ8LuwFlADfGJu1Tc/NBBUFMgXKA
         X1CA==
X-Gm-Message-State: AOAM533S2A2dCyU7+jkhE36WyMzqQbDMs4lIW2pBsp+DXtgTmwSSe22H
        h7RmUKqIxPYAxfow67Ud+P0=
X-Google-Smtp-Source: ABdhPJy7b3HQjHDebWAfW7eXMzch47xtmYEOMmPyzkWSnIxSlRLBJJzUeYWwqGoNs1xMajeq93ccIw==
X-Received: by 2002:a1c:3b41:: with SMTP id i62mr9483249wma.38.1631791854892;
        Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date:   Thu, 16 Sep 2021 13:30:26 +0200
Message-Id: <20210916113042.3631-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 22308a1b66fc..5bece4600e41 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(robj, &cursor, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

