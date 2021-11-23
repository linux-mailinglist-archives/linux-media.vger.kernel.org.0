Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FBB45A551
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbhKWOZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhKWOZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:25:01 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF5DC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:52 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2399850wmj.5
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=TEEklyYpr4YJqPs69chmgb+yzwP1mQMdy5K778Nj1w/9iJe9GLbIj0hWFq/Lky/vUz
         H5mXDRlrL24KotjypM4vV77fCZ/aNpEUXvwcIt7+4bDCHKl4+AyLCL5tvPu4qyErGWhg
         O2F8V7bw6W6rUapXS1ogoyimjwoghSKK7XmycBAlxrhKnZ2WY7jJrupkejqsgn8TroYT
         u4RvOoRTQT8pTkxDjwDcWw+mLs8zkr9UBlyQS340kc6PcE9b7LgckVhg+rDGeOdhC/cX
         zfJb8n2ThmkuaqRkKH5WMaimkI323FelfWs1DadGdSevM24tTmT1jfY4VpjABMXc25DD
         9E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=1r93BkRzTsumRutSQR+rkxb75y65C6dfjLbyRLxYrcy68hZAe0cKW2Gt0uh2JG9/Kp
         0CH2lejAMjktAg4f3RNBl9rF8y5kyxH+Z6riT+xw/A3b9jOPIuYSnWWm1vW7uQGgvaKV
         wt6yG/Lhap53jXUQXbfSBZXVXUExlPQAU/48kWKuCm9yXa6GhEj0Ivv6ug2pT+KOMrHg
         txH6fDk0CjokaAuFw6TOb50/8WAwGYUWjc2UOX9Ivt34jkhWqkIfGQaRAUkenjeCf0ze
         slEy5UoR/1bgZ5uus8W0n84syp+RzC4JsqY639WDNqzHz/UUkUaa7GUP9z/10ewWSA17
         EIgQ==
X-Gm-Message-State: AOAM530F1KPAhnXGRloS9CeY4w7qwgOIXa5Rsb1FvVG1WhXmtXQuNWKp
        B95lDrNSeeFWsrVK5ftsuTs=
X-Google-Smtp-Source: ABdhPJyjlMjyW4yKQFiqSqmTSpZBQ8JHZc2WoFrzLFwWHowvF5mfVuCgRsFk6nGHySXsRcT3UMN0fA==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr3644229wma.95.1637677311585;
        Tue, 23 Nov 2021 06:21:51 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:51 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 21/26] drm/amdgpu: use dma_resv_get_singleton in amdgpu_pasid_free_cb
Date:   Tue, 23 Nov 2021 15:21:06 +0100
Message-Id: <20211123142111.3885-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the code a bit more simpler.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index be48487e2ca7..888d97143177 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -107,36 +107,19 @@ static void amdgpu_pasid_free_cb(struct dma_fence *fence,
 void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 			       u32 pasid)
 {
-	struct dma_fence *fence, **fences;
 	struct amdgpu_pasid_cb *cb;
-	unsigned count;
+	struct dma_fence *fence;
 	int r;
 
-	r = dma_resv_get_fences(resv, true, &count, &fences);
+	r = dma_resv_get_singleton(resv, true, &fence);
 	if (r)
 		goto fallback;
 
-	if (count == 0) {
+	if (!fence) {
 		amdgpu_pasid_free(pasid);
 		return;
 	}
 
-	if (count == 1) {
-		fence = fences[0];
-		kfree(fences);
-	} else {
-		uint64_t context = dma_fence_context_alloc(1);
-		struct dma_fence_array *array;
-
-		array = dma_fence_array_create(count, fences, context,
-					       1, false);
-		if (!array) {
-			kfree(fences);
-			goto fallback;
-		}
-		fence = &array->base;
-	}
-
 	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
 	if (!cb) {
 		/* Last resort when we are OOM */
-- 
2.25.1

