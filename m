Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C67F2F45F6
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 09:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbhAMIKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 03:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbhAMIJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 03:09:59 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3A4C061386
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 00:08:26 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 190so697442wmz.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPaIJ4NMJ9MMh9q35TQI1iqMYfx8RWuRYjdqoNV8b68=;
        b=Pl0iBz8pshuI89xlZdvYpcf992qQSZUVTOMqSflDk88q+C/knT37dU5H+g193L0RGy
         Jt8q6Jiuk9N/WlhQxOZAdr34cvKW5c8NMMSA8KKqWBl0S7ro+InhGcLHBprSRquy/Hx+
         0NYVvNBo7mbXI7R+Ts3jsTHi6PAaxDXC/duX6ejbIar1W9hQwSuppdBXXrPUafFk0KPZ
         6KjW2hwHAB66OwA9qf/3eqDAwAAPV1Xg6NuvWWJSp4F673dhAw7mQrJ8vA2vFx6yAKGZ
         k3980aINhNQ3+wT5BwktClc0ojis8PUuJQ030NKbPhV2iAznrIKedpNjdzBJqUAhQ+Tj
         KAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPaIJ4NMJ9MMh9q35TQI1iqMYfx8RWuRYjdqoNV8b68=;
        b=oZJoUw21NV+7AUCldLfbCZkknqYceI8YVHBdgwnyULM8y5b3fQFbkZbdoEVj4iDLjM
         3tVDEZI+wANPwB6JZMMZUNh2UsieO38Cotn6+mnl4bW998ixzbMLq+8kZN6LbqX+GSUO
         k1YyFcmM6h9ZY+m+7OcJuos2/kuxMqAxGXwCC9z0SgOeIvywiwlUMCNFosQJUrKI3zhC
         EY1Qf5afpqyDh2uqB2jVl1G8Bo1Dt/eyuRHCuJF0vyLQ2tBApn4UO2xudeI4S0uiOZwG
         eBdu47Qpina9ipK9MVWQgC/589TTaXsU4DgekCMx0yReDuGP2JrwTgqztqzd44tpF6JB
         QUcg==
X-Gm-Message-State: AOAM532Bq6tbPbus6CCeW08muj+3NCPESe26i7CD6XjOYNvszIC0SfW9
        npshWmzn/EqUD65kVfsM8yEUdplDfIbu6fL8
X-Google-Smtp-Source: ABdhPJwhI4kz7dKLgiYn369E3gtSmgFMuXq0Ti6NvHwq/hN3nNoVYiMhE6eptFQyRqw9gbP3R1ETzQ==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr924513wmc.143.1610525305691;
        Wed, 13 Jan 2021 00:08:25 -0800 (PST)
Received: from dell.default ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 00:08:25 -0800 (PST)
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
Subject: [PATCH 24/30] drm/nouveau/nouveau_bo: Remove unused variables 'dev'
Date:   Wed, 13 Jan 2021 08:07:46 +0000
Message-Id: <20210113080752.1003793-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
index c85b1af06b7bf..1e8d5e1cb18f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1225,7 +1225,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1239,7 +1238,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1249,14 +1247,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
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
2.25.1

