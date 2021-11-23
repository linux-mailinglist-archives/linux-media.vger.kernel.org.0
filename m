Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E380345A543
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbhKWOYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237830AbhKWOYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:44 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36333C061714
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:36 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so2733829wmc.2
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=oh/rTKJa7q7MBdD7KnRP/2E+q5ITp3UVnwYEL/Dc366iJpn5w7ze/43jJgObxeontv
         TV1Lder2M71UqpmBR2g8Y3nr4BhGjDgeG4Fh/ydEb35zsctop+uR8aGNgnDzLAiU8eUP
         G3wLUW7E2+1iF1gUzgSAEHQrv8rEoOgwyLUyAAX0kXEXyeB8OH+LsU+K7Lltnu6WjRVu
         jS14Dh80rYQmWn7yFmdRXIvX53ACxrdgZoD+HtEdVTNs5QhJO4lR0WY0wrgfBg+PAwS7
         qObzEDAw+32Hs/DW3RAl3MW4PaVR6MfmbqYtDzo3MZfDmWspVRdmUlfaY+uKcAAPC0Xa
         0iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=QuI+mSOgoqA5m6sdgEirSPqx47GbinPumYL6kXxnWBKW+GE1uWvHVR01al5otI3YEw
         e8RLRTToUxjsuxCAqniwQZXv/oNkqDK532rNWuss6oie/PKQWZ8Onc57soNTatXFHUbO
         0/5QodP0Y/QPZKJBMy9XbpkiM9WFi8WBEgzJFVJgtyo0mRMpzmoW91HMyr1xQOEap0TF
         oay26RX8gc/82gvu8JoZb8CZLkpklXa+a9s4KxlZJhB6WOPz7V9CwcG7WHyIl8Ug4vtX
         S8OACM/xJcmz0B0YNxsl3zYNPQibKt6NhcqcvkMLi0WWurzU28TIYLZn0VQR9uHG+hTK
         J7ew==
X-Gm-Message-State: AOAM5315yrEEs6BaBeHQTt1RrmEG9QZF28W0mqihEUYW3Be501zLzzL4
        3wyCF9RyOlDV3gnILmJ24jA=
X-Google-Smtp-Source: ABdhPJxZNYWUTmSHRmW1N2dM7XUNic0YwGfB5C5dAoDF90ZbMxwVuVGVxS/MWIjJMy1ULKsssYTcfA==
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr3470222wmi.167.1637677294799;
        Tue, 23 Nov 2021 06:21:34 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:34 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/26] drm/nouveau: stop using dma_resv_excl_fence
Date:   Tue, 23 Nov 2021 15:20:56 +0100
Message-Id: <20211123142111.3885-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

