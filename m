Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708224F7AE2
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243513AbiDGJCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243514AbiDGJB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:01:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF601F519B
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:59:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id p23so5578876edi.8
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
        b=lBNEaytd0NftSUtsbodZTdCkPUN0fJidaDYSDIU7wlBSbnycDWD4ZJfpyDYcoh5P68
         VZnNNWqkdfMpqZwMyCK0fJTiyqKD6lpCUks+brrYe7GhREaBAMyp5dOJ9rswZuias7BP
         sclBMLrn1V0+NDM4jGcQl5lF2uHQqQNTYKAsNB4AGQQYs8oznj+V72oSQpd+Q0xCcce6
         pjDC7ip5LUJueJNCVBJ5694Ynowl8m+JINS6F+tSGKodZEjGD1qHV8PmcXIZFogAKU14
         eApb0xu3IOdgo50bbUA+oejNFdVwjZ/6aCqX5SPrfJND7syFeG/GJOi0cw2si0m6uHWb
         /Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfjanQgvhLSomqp2Kk/d3ivSsETYStFsbFD7urvi9ag=;
        b=qY3x8F/JpBp3oUimGUpITy3E1CeXgk/bbsJpOwLe2+mugCxcwdMTH4qdhQb3WI2n7e
         Aoba+z2RfJL6QmznV7ThJswFkbTWSorIEYv4YQDgtayyCFgbJeM6fbHEqNyKeFRjgc1T
         xlH4aj/j2G2Ezpp8NV7chgZ4ejIddeIVtjKjJL4hkgj44IjOzflrX4rNReEc11nsR8DB
         ZIuPzzMhCa+tnJLT2yZ7+KyHFEy9rlETS6Q12CgXWLBeCzZRWJSFw7cFqWwvSzSeDewK
         slIUuJeM7MI1XxQB6hLfOSbbQC6kuvWGlEUbot+tgX3eivpBwrAiT6+/2GRTSOuG1g9J
         8Jgw==
X-Gm-Message-State: AOAM530OsxSXbRdLCKUoTrqifjEXbJmed43vYY3QLaPsmqw1K4Kes9q0
        F6TIQaCwWIIDC7cs23p/JRc=
X-Google-Smtp-Source: ABdhPJwAA4GW/7bCD+NJa2Rf7+dfYkks4/cwOVV/PXe754GBZwyLuEH5NsnlvI4dzV6afABiYYLXYA==
X-Received: by 2002:a50:c3c6:0:b0:416:293f:1f42 with SMTP id i6-20020a50c3c6000000b00416293f1f42mr13006479edf.187.1649321997805;
        Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 07/15] drm/nouveau: only wait for kernel fences in nouveau_bo_vm_cleanup
Date:   Thu,  7 Apr 2022 10:59:38 +0200
Message-Id: <20220407085946.744568-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't wait for user space submissions. I'm not 100% sure if that is
correct, but it seems to match what the code initially intended.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..13deb6c70ba6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -962,10 +962,10 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 	struct dma_fence *fence;
 	int ret;
 
-	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRITE,
+	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				     &fence);
 	if (ret)
-		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE,
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
-- 
2.25.1

