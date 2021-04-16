Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3482F3622BD
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243191AbhDPOiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbhDPOiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:04 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873FDC061574
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:39 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r12so42509830ejr.5
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/qJg/GxIoIQOOm1SNOLLnFRtxZCMtYZ46XvrqG7mv4=;
        b=itln6XERME/4Yh80Mask5Ou5IFhw9E4rP1eKimMutmDEThu7t2bC6wxjUfv9+3am+0
         Ivc5a9UFk2rAyPPvLw/G7NrQrAZyq3TKud34Vt5mGrX7IL5JSu1VmtugH/FcOCGKRI4G
         iCIXzZERumpfQBAlqmR1xjkxjwAPJZmF1Hj8S5yoTM51VsLTNEUuKolsvlWpOtJbSslP
         6D9/3lqjJ8B8JU1NrLhmJAEImB/HJXPjthAGwlNpzU5kOvTKjK4ziF25bgwEF/cv/vW7
         Irer8JRZejsZ1eZ5PXkstUyuQ6PaPg5YsLo+ioQ3cNpsH5qGoyk5YfmpxpOqiqzd5ZoL
         RdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/qJg/GxIoIQOOm1SNOLLnFRtxZCMtYZ46XvrqG7mv4=;
        b=ljX2+RXZ5i6Cgv83d5IrXJLr6lcX5i/MbPTJOsQs3GymQLS2ScAdR/EZjZuWF2PA/5
         Rf6YV59xwElaGI3kR349EOjg5C9g6JhsHunRU95Od2i1UMuESRs5CrsM/z08vQEku6zp
         yFg9rOdbxuFJbCWw8OTlPRxmN3qAnCeGgXklAa7r/4+K5E1JoIa4H6/qowM4SODm7tMP
         ZAni+zBlZZVPbBa/rWKLvggeqJ+Bs9qZo7JzJY6nT8AxD00JT+rq7bB2zw5B9tIIddRH
         eqacwknKCPgNEViiWLKBTBBwOgY7c8GSiaAXlAO/8JNBoy9MBMs5xnU3vVMN0VtBJT5Q
         drBw==
X-Gm-Message-State: AOAM530F7JhbvvJwvbrYaA5q+IwDF9r5DIy+PBlhapOkVRi9OBbpYFB+
        XXr5HLf+1ZUnbHGnFg4TAVVVmA==
X-Google-Smtp-Source: ABdhPJwyyQ78HhFxwVGsHOCCHcrMEtltPH9DKl5AUPQtj9p3tU6DB6ttsT61SqDtIpq8Q2r9Ym/3hA==
X-Received: by 2002:a17:906:c218:: with SMTP id d24mr8346753ejz.363.1618583858315;
        Fri, 16 Apr 2021 07:37:38 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:37 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/40] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
Date:   Fri, 16 Apr 2021 15:36:52 +0100
Message-Id: <20210416143725.2769053-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_populate’:
 drivers/gpu/drm/nouveau/nouveau_bo.c:1228:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_unpopulate’:
 drivers/gpu/drm/nouveau/nouveau_bo.c:1252:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jeremy Kolb <jkolb@brandeis.edu>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3e09df0472ce4..37b3d2c10f5c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1255,7 +1255,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1268,7 +1267,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1278,14 +1276,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
-- 
2.27.0

