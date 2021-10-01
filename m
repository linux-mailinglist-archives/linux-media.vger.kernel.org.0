Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC36C41EA63
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353406AbhJAKIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353411AbhJAKIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87DAC06177C
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:23 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m14-20020a05600c3b0e00b0030d4dffd04fso1049132wms.3
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
        b=K00QXrgQxZygBJhqldjpdmwq0Z5FQMgADFlRfTssTKaJE3iovqCn0W1uWy/liFb27G
         sRmAAVDGt10vOqAJN0XqaYtC7FbPeUEetGV5wXz82aJ1DtKUYn9lbgVZn6BaKXJuKOML
         x8ozY++DPIsV7PPpHPTt9h9iinHbivfk3NL2ifluDQ8edJitoGOmN5bJPKiU1riKJqvU
         7rmcZWL3h1FqkMXqqcvTUv5ANiq3XXBvjTtN7DeD4CD1j1FcN6mW2FYMXurRwYJMibFk
         A3PYLakR7Nt52UVSXLXGwoSgLGCmH5XuwoUIEgI0I//exVwLlvDSMoIUatN/5zgo3MbS
         uPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
        b=FFmjH9pdLp/Y2N6lbSQkLFEtV4kFdHYAxzJmbcqzBXv1BLLwAejO8yC+5BJSXS5XkH
         T2g2T+fZJF3Vuu6EiG6TBhN0qcHJqW0ZU/LeWY3UDvy0Siyzr8+dxoxHZv7kPGQ7MhcL
         QqNf+mC1ZEmT3hSJhHGRNojjOKJJySeHo+9N5aDecQ8ARG4D2b3bkPIL+k6bsBh+rkrC
         N/72nlswZPsJ4OxbZ35uCB1pJewZ7Aq9651Kiblvp2uz/KR6KYmJ6oBQQcI84nJkeVWP
         q4tRSHgVHnvoUtZOmD0/d8vn5KFiXAJ86aXDvR3xM2z2mfPY5UZM1Mu3ex0OA7XFfY7+
         GjsQ==
X-Gm-Message-State: AOAM533DFyszGUEm3Q4vBPVrbh04uwk5Kkm4XsfQ7a+pZnyjuWeR9UQS
        duVSribajXZS5quHxzUm6nIxz7pS4tE=
X-Google-Smtp-Source: ABdhPJzKkdtSodQ60XlSPJX3CpAQhUJ5wkBsX+8uyL9AlLN6Kemxmfa1pWO/5mr4TwWesK30VX9KFg==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr3614174wmb.92.1633082782335;
        Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/28] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Fri,  1 Oct 2021 12:05:52 +0200
Message-Id: <20211001100610.2899-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d62b2013c367..3934ee225c78 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

