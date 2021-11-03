Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D292443E1C
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhKCIPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhKCIPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:15:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDD5C061203;
        Wed,  3 Nov 2021 01:12:37 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b12so2254361wrh.4;
        Wed, 03 Nov 2021 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
        b=JXOifM4MNm9L+pvuMPCtYiZuBmZxpoW+xBg9RV/lvq0vyOIrhLBU90/mOdrfeSUONJ
         7oJiN5DqUEPt/WZUSZrMEMk+u6gaZPniYJUK2Jn8Mog/pUaRgkGcVa2d4azMjZu6ge8V
         2tRhElbBP5TnzfgEFaFCCbq+ZCv503uEfWo063bHwjqdW1+lIRR8cQ017Xhb5Lxev8vf
         MzKFGpB7hjfY0/bSldFn6nMBqnpLeZXejg6iMgrLKz9QstuA7ymU8B9MqkqTUA6Mx0J7
         RDMtBegu9+f9FTuDvCyXICw1ac39wji75n9NXrc1PWh8c/06rLLwAnVBC6hsK9QkqcDd
         oAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
        b=aBAZPpBOfxupJ4dCL2iaAwWz44iKIIoQ9wLRsnDmIND4KyA2qllVXCW5ScLCmboKj0
         s8t6a/JAM4RghrsovY74Tqyzze4OCYtQVSjUKcNFvnEeRt1AAJCHiGZHamB5DODWTmNL
         /16b9JSs6UXITI/l6K6EwvFFCWXpX1IKw2I7CvEJSj96Jl65QBTAYIyhuDo+BBVa1KdO
         lH87ASNc/uKuXegeQS/AjI0gwvzIWi1qHjBPnDhQs0HNCkSI3/qCWTUu7Le0itLSqVIP
         6511wtEoA6Kr5I5dxNHIvZtE7PFYZJ3twee07lLS3JgrNbWO8myfBXltIkwF/SFxFfhG
         xBiA==
X-Gm-Message-State: AOAM533D3rhuPvIebRIB3jF98RI6Z46igLNo6BqS6CU8NMmt0tL7O5nw
        ap/Pl/YojsbSBW0tgY/wfBE5lHnF+lw=
X-Google-Smtp-Source: ABdhPJzp5J2ZSTw5FkIantmdIMrJRVk6kmOjpd1Snb9Ua//19DlbcOGakawpnJrzusJ9UjVTMxcMiA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr50612704wrq.44.1635927156535;
        Wed, 03 Nov 2021 01:12:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm1450088wry.86.2021.11.03.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:12:36 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, l.stach@pengutronix.de, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/msm: use the new dma_resv_describe
Date:   Wed,  3 Nov 2021 09:12:29 +0100
Message-Id: <20211103081231.18578-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103081231.18578-1-christian.koenig@amd.com>
References: <20211103081231.18578-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling pretty much the same code.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5bd511f07c07..3878b8dc2d59 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -865,23 +865,11 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void describe_fence(struct dma_fence *fence, const char *type,
-		struct seq_file *m)
-{
-	if (!dma_fence_is_signaled(fence))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-				fence->ops->get_driver_name(fence),
-				fence->ops->get_timeline_name(fence),
-				fence->seqno);
-}
-
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		struct msm_gem_stats *stats)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
@@ -955,13 +943,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	dma_resv_for_each_fence(&cursor, robj, true, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			describe_fence(fence, "Exclusive", m);
-		else
-			describe_fence(fence, "Shared", m);
-	}
-
+	dma_resv_describe(robj, m);
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

