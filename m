Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3738A46164A
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241347AbhK2N3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377874AbhK2N1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:40 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0229C09B06E
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:15 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a18so36285658wrn.6
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=VtBjAPe9K43fAJMf6bGEWuAz94uvhQvclA4cRn60BcpnZ4v/mL3osWyzE1Ayj0EB7X
         zjwGsRpYqwem20cQrLRWzEPlvn59bRYgbfRVnix7qnv0LTDP0TNUB/S+T7g85toEmirE
         yBvhLP4Hmi/LosJofo4Ofe+6N8wk5qNyS/HFp9g7G7kvkokcK6p12vMoV17+j5Vvol6g
         yzZombhcNMvOcS6kWfJc5zVQAjdd/7f6GqYmDLkeYVBImgycny4hQk+f7CvAEWdqRB2e
         DOWmFcRLaS9mqaPjOIg4PFCYNtCMPzfi3eHn+2mwKpkOoU2I8jBaah8vQzMTmKXazrVI
         oHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=pOBJLp/hSU9lB9RSQKcrVcfBmEHCzQ7FcbBykPxscv54sj6UNi+DKpeU6S3gEsWOI+
         6e6aSu6ZPaUSMDrhWb6LstjIho9ERZarkcupJJVKwqd6cWk2F1D0hqgy6KnbXWdZg5GV
         4+nPhyLzl316fyVHkwWvhgm4LLEuOb1m4UlIDP3bAG183BdHyO8rWtrNPYZglOV8E00D
         xvwbJ3QSVvHupBp8tybt1yNMu8qocguFRoeK2Xpd4jaaD5q04cJiR1TWnEMKZBSpwUhy
         G1vyOI/Du98d+vCM7gg1vp/nVd2AvLReT3a6QCpRc/Y8kBmwmblf01OHhOJUeYISz2LX
         XHcA==
X-Gm-Message-State: AOAM533vELOaav+gRU40bTkgFyraW4h7ZUEXre7ddG44wOgYG+d1I386
        /AF59db5oJ8gnl46BdmdBIQ=
X-Google-Smtp-Source: ABdhPJyuChUJ4YecssetUAuuwF7pVzUNY5Ixq3BjLc+KhWYFiFkYOJ71iuilY6estwP8RlwDu3Oe7w==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr32861049wrw.591.1638187634459;
        Mon, 29 Nov 2021 04:07:14 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:14 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/28] drm/nouveau: stop using dma_resv_excl_fence
Date:   Mon, 29 Nov 2021 13:06:42 +0100
Message-Id: <20211129120659.1815-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..74f8652d2bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
+	struct dma_fence *fence;
+	int ret;
+
+	/* TODO: This is actually a memory management dependency */
+	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	if (ret)
+		dma_resv_wait_timeout(bo->base.resv, false, false,
+				      MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
-- 
2.25.1

