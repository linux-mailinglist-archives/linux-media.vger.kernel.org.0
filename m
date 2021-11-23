Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53ADC45A540
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237868AbhKWOYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237918AbhKWOYm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:42 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757EFC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:34 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2398893wmj.5
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=IZZJm5wBcrUw5S+SV0DKy9QiVgxymjOR1JQhuUoWkg1bCpNsQkqMwSrSv6D8LTRV57
         MIkZKFn/6/OMUOeJvWvBfjJ5Too5L/A4vMWbkzToERXVSHue1i1df6RpFjH2h8a0dXSG
         TbOznsKwabznnnt4s5NshynHZxaTV9qPXvjna9Yl+5S73tXfoJiwkz2BX54zHuQ4dauo
         7eX7IguwjBJDZ/BB2v5InrL7EYbPYLRcLrJhXkHhn/v5NVEmEzY277OHesnTzdixPAgo
         +c3VaSap3DGW9WTjVmwzRRzqwF4SW6a1kFgM6jcy4cw1uYzJ5l8P0o8KtCsr+5ZptJaJ
         ggxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
        b=DkZfeySzE6C33RUjWXZYE0w85d6+xv/8Y8vmIyFw6ArAfk3PInVymgtwO8PA+wyaB0
         p0LxjUByCBLXD88EzEBDt5YTpaTR2RQoMxRurBpHy9WEGEf8vH3MMPfQoyMsTEu8Y4fF
         Tm83r3v1FlmOD6t3dDraH7iDzgL8uKYs1a3qDE87M+7cpio3aazG8M4KcYaEwPLn/rzd
         aT0jpuN4mjvvgknxUj9YNLLwuiLJnAe7Jdd1a3jxoS1cG0v7Zsh9gioeILXbnPFoHhw1
         vxPTeTXGLcLkiftUW2JC5ZLAXruwxYNj4UQxeADcja1VIOfZttmAlJOSmjiktA8uh/mP
         y5dA==
X-Gm-Message-State: AOAM532u5qL1GPtHGr0hLbaBQDnGMlhAkWZBy3xMAvUq8Z+ktXLjALB+
        sadzGnQMzOh7ZY62K1gdkBY=
X-Google-Smtp-Source: ABdhPJzExkfEmvQQbn+dzA8SjGvNJAesPqLUleluPP95rkU+PB6EWtrF6hZ828idEP7AoWJqT9uNkQ==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id f13mr3660138wmq.7.1637677293126;
        Tue, 23 Nov 2021 06:21:33 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:32 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/26] drm/etnaviv: stop using dma_resv_excl_fence
Date:   Tue, 23 Nov 2021 15:20:55 +0100
Message-Id: <20211123142111.3885-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

