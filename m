Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3FB3AB238
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhFQLSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbhFQLSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CECC061760
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id nd37so9263477ejc.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=JGK01UuNZMIEIDibVS0nyIINaWe1LD8WZSd2MzqqM2c1KEb2oA3W9tigP/K49EqQW8
         HZxCrrioSf1JPwkEFtuGmZZRBoArktZT6ohdSForRUjBj23LLhDX3yQPRXYyLMozPX7e
         l/t6i/bxYWFoVNcLTK5HgX2RtfTcooCVtxNCp2D/9SEn52xJiDUO84QtRapdt+IJlEok
         CJ/lmWyy/U6dbXa2Wniz6V7zBH0SdBaNv+4HPtws7b0i6j4yuu/SCwo2rT0oVh2DOaju
         TJzNFPmCQnAbO6g6e6nPuoZt4kam7XNW4A0fqhl+bNthPPPtHRZpXfuD5m1sNVTOBZlL
         O/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=FAXy5b/HZ4cN9jiNHoxwdZsvSh8vwPrJ2CKL8Sgz2dWpvt+6EJlPXnmuPXibE10o0i
         G6XoG7cHsbqo6LEmR+as02HiAuR/EYReYoYL/nvbmZDch+xEiw0oAIxGxn2x38x/WIj/
         ViawR8dtHYy0U+EWr5Qu4dwG9BBp/mhuyzYFXETRgmLQ2XCMgBvXDwoIXvSXsY8STj1M
         uLQek6tDkVgQ4ydZ8N27fmit1Yt71GBWIODv9ap7bkSjqsWhIC3oPnEI2ePZ335dyKQP
         wXjMxHPWCfcsnRnDv9Ig7ADm6Rbbt8QrGdeL4/R4RfrCfG+1rZiuv3AQSoPGIcJ0WyQM
         yiqQ==
X-Gm-Message-State: AOAM531IYcUL5ult3TamTByihTLlXFwAm7sknkB1/iOB5xwqcqYc+YWd
        jyWYfAVg3/N/AHt1dmJMulU=
X-Google-Smtp-Source: ABdhPJzM+36tYqZqJ/QN7yQ4BXU4PIysQ1XlwHkj9hQ3HC1RgavOExt7bDD1K7FT+NqCLwr8YaMZWQ==
X-Received: by 2002:a17:907:20ee:: with SMTP id rh14mr4645376ejb.461.1623928572354;
        Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 16/16] drm/radeon: use new iterator in radeon_sync_resv
Date:   Thu, 17 Jun 2021 13:15:58 +0200
Message-Id: <20210617111558.28486-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

