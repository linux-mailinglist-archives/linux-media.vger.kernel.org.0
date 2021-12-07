Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2759E46BB22
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbhLGMhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhLGMhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:52 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054F4C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:22 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so29095873wru.13
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=gc1YGrRR02J26KgtbWl2UnhYk9fouM1WZeAvCID85guiFbtLjzxu9WouIDKxsL1zOf
         bByKukPovwnGh4vdbGTMWd1TpDgTE1w3fTU1IG6Btf6F4UwhcEzcCHLZQiZBhAHb/0RZ
         zhMcimw4HKDOQjFJJMSleGbaN/nVFGRV5YlvXbpl0icay0lGVvvqG3gima8ilWAdO0l/
         eGukstecJaPMUAjX40d0cIBoDqrgsqKnku543GHczx7IimV0GMlQ6bfyvTIjcq4B++jI
         bglpetl5Oh1j23+OttiAHKhl1TxGKmFbDmrwsKzlpvBJ3RvZ0vjjDg4aeq0iF+6ThUX1
         SPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
        b=3OGRp55rnU4EqS55tvfpbHRZIRc2HrCwjO0resoXKVV3G/kko3B00ltqIxwxZBPXEB
         bs3FuvRTrwYSZM7XHT06RiySBc/J3nmLfa/xO1Owccugwvk++XWSrKd66CoXVAjNC/3m
         Q2k7Q0S+vXJyqbDe96zXFGJkhDc41uU3hzPMCVU6/j12VY461XgPwb1RJZpnl0h6JEop
         7jqwILG8K0RD4MaPmdXuwRnZVUQmnV92PX38osYpg7FrpdssGyqOoxUJpG5s0wIWWqVW
         howFDXFBk54cLVrHbaAlzKn6k0QxuvXXrHGO6+q4HyFGqy3UtgacwpCLt3BVlURAxvz3
         PMog==
X-Gm-Message-State: AOAM53172Wrzf8+3WeG8cg0x4fgNRXBFonax0vwFu0D9Xx/uaPJqs+ZY
        b3nENH/zQtk1AH+eHEg5OG8=
X-Google-Smtp-Source: ABdhPJzCUAc21cxAn4aaSO5xC2Dcgwa6/a2y1qsI81TK+cu41x6GFrCxVoreFyWugo+uqrN9VMmM6Q==
X-Received: by 2002:adf:b18e:: with SMTP id q14mr53774033wra.477.1638880460696;
        Tue, 07 Dec 2021 04:34:20 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:20 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/24] drm/nouveau: stop using dma_resv_excl_fence
Date:   Tue,  7 Dec 2021 13:33:54 +0100
Message-Id: <20211207123411.167006-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

