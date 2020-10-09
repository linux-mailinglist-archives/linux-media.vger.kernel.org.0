Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1916288C12
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389133AbgJIPDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388803AbgJIPDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:03:48 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6263DC0613D2;
        Fri,  9 Oct 2020 08:03:48 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e22so13558547ejr.4;
        Fri, 09 Oct 2020 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
        b=AGNyrdR7ovbvwJNKv5ShYQCGvaCPWMmDRaTW8qFyGws/zj5z3jnoqEBR9M1d8zZE9Q
         jAk6GE/rpLdeexJkeXjFnem3hWHuZIeIlIu2oYCnFR9FljYxFEIImO4DFZPcYp3a/IJU
         ksXRHC/0Glzu1uQnao8735fyHT/dBdhu4m5EMqDOtHJ5GcjNcBxeNi09cFjne+MbmsCR
         up0c37ZFeDZEzWeWAUHS3G0wM2twAG54Nn5vszFVqfa/YipqiiaAOO9t9Xgck5CQP6gc
         TmIX6Pbg9w3ySpPvLK8s77mld/oQKFhR9HY9wQFxzrvQdE6DYWu3dHcS2m9u47vqcESC
         ncMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
        b=GnbRfHM7RBOWUh+5shYlyOfM/kD+psiim0MNzSgXgtRhZwAETzBD/VHnlFEQq68C+q
         izQySKy4dYAuPCFF9oQzS1BPgBymetD8EUh10aZwhax/msw3F5WWRGlFkDWVP8mW/2rC
         0J9KUnYl2IlSh5EGXFOY/aQjUn2OzT21sEj5cRfS7Fit7IWuEaDiFLq9DEXUKLsAqqxK
         JMOifECVHtSWKQZViTzyhDind8H/d/JvAEGoAjMZV7QFRtl1k71zE9/vM1Eh5QCExAxr
         qjKS+KDEp2bk+vRA05/JWkTyU1jkLy7cAhGX79T74Zl87FJ4nrKYOle6ZHpCoO59UVqE
         iFlg==
X-Gm-Message-State: AOAM533s7OyFbKOGINBFuQ37L2J0TR9tkr9kD3mqQCwAkLw4cT5ajng5
        GzyDK+kDajLcwOgIB+Le5hQ=
X-Google-Smtp-Source: ABdhPJxX/Ju3hIyvLL3zSpMfzkxoIFpTpsg2eOHcQ1zbkD40IYw/NBRbhJgYcsG8QXE4hPf8JNVcAA==
X-Received: by 2002:a17:906:11d3:: with SMTP id o19mr12363058eja.287.1602255827107;
        Fri, 09 Oct 2020 08:03:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
        by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:03:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca
Subject: [PATCH 3/6] drm/radeon: stop using pages with drm_prime_sg_to_page_addr_arrays
Date:   Fri,  9 Oct 2020 17:03:39 +0200
Message-Id: <20201009150342.1979-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is deprecated.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 63e38b05a5bc..4b92cdbcd29b 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -474,8 +474,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *
 	if (r)
 		goto release_sg;
 
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-					 gtt->ttm.dma_address, ttm->num_pages);
+	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
+					 ttm->num_pages);
 
 	return 0;
 
@@ -642,8 +642,9 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	if (slave && ttm->sg) {
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-						 gtt->ttm.dma_address, ttm->num_pages);
+		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
+						 gtt->ttm.dma_address,
+						 ttm->num_pages);
 		ttm_tt_set_populated(ttm);
 		return 0;
 	}
-- 
2.17.1

