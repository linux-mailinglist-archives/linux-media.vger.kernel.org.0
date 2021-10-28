Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7655D43DD41
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 10:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJ1JBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhJ1JBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:01:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A109C061570;
        Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id p14so8799475wrd.10;
        Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
        b=WQOumxgn7tGakSu5vcFCNz4PF9zeeT7h3I8Fd5JCGr5QZqH9JuEQyee3u4RXZGM0JF
         2qN9vGoreHgP4GYf2DuuIWa0T5YJtrIjdkKqScRQQGRVFsJ2M2AfsM41iVpgKVRDCueh
         Tks011F8LfrX+O1yMnW5bFWqClwA7jYDsmR/iR3B/5s76ze7QSARIDNZKO72bW+Cz4Dr
         27p3x8eS+GwsOvLd8Tcvj4PQ+cL/HvSnuLggXHzvet7PJ6dJlTbzduHVqRr+IYCNYsI8
         93WjSD51yaDQXPMEfIcawmO+bE/gzd41qk001w5HDk0VO+PRPmdrdbleWlHNxZLJkLyu
         Ehhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HJ3FVZIBonOhulw4j97XZ+WDT4N0aGjKYTEFgdMl2bY=;
        b=aWXYqioTGDnLqsDkfSG0rAubv+xE5HI6rHTa7tMWeei2jJkBPrlkkdtcJqutneVBev
         Tuh5klnucYw+iK/jp4dRwLPZjqx63dDkrClPpWKjlIrIirQobAFPFUgxGD/tAFm4Ouan
         W/kpi0rzn2Vj2zwbChrRZAJcwJx4EzScOHH2yxDOIBGU6rZSH81Hkarmq5+4ZhTQ4Ryr
         LD/Xn4QOYMyIX0noBHR05bkg7pWhrzkHa0gNvPLYPES9V/1JkVZu3ybYlHHtszoxmS1M
         ZCp7pJP1Zl4Lw48mHJRZTNT+eL5v/nQ2ZZUs70EunfOwTCjSQBhILp1s74XnubOjvbpo
         4SFA==
X-Gm-Message-State: AOAM53343aYOyOwMZWTQj8a7OKJ93EAe3NjsmvEfbbqVn7y0kQLtuqz1
        KUkz2IRsnKLob4JnplFybdQ=
X-Google-Smtp-Source: ABdhPJy81fvykOcidGCavoYOA0fRG5j8hjfU8RE6GPqMrh5VHEL6jayQ/XCd5S8AoFEBgDmg04fTgw==
X-Received: by 2002:adf:ea81:: with SMTP id s1mr3884320wrm.59.1635411512271;
        Thu, 28 Oct 2021 01:58:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id k22sm2412143wrd.59.2021.10.28.01.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 01:58:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm: use the new dma_resv_describe
Date:   Thu, 28 Oct 2021 10:58:27 +0200
Message-Id: <20211028085829.1726-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028085829.1726-1-christian.koenig@amd.com>
References: <20211028085829.1726-1-christian.koenig@amd.com>
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

