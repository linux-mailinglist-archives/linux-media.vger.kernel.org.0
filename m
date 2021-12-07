Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6465F46BB36
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236444AbhLGMiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236447AbhLGMiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:07 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F0AC0611F7
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:35 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q3so29145911wru.5
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=kydhL9kRH5vu7h/8SuwNuxNb0VqKSz7uKb1zPPvh2kJ6g9nVe1zj4lx7ztLlYJKr89
         H86vkTQSxflXTmvj83lXKqw7epO5ETn8PguNsrYGJoMOnTXAScgr8v3nwoKgqE9oxrhr
         HDTAH4YJD+4fUJ5DuhKb67sg2PmjLRwXw+SaBPwAjbiMtDU5YNskJMIUybwtRlUIi4x6
         zRQRTk1pI1vki0ymof0Ggd9/9bGUkbUgXPvCJ7o8n66/At7smu0N9HDMtp3Gqq3F/V/R
         Sglt5ABKyB5j7EBeAsjd7eBuDhktJIZIbXERavXnP9krzVyZuoBPusMJWEccbKWHFGTE
         Ummw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=ecItRmGoMXxtwxi9i9eksqODLcs204rR5Yq7TMO1gggBDSRFm56o4emspfdMh/lmhT
         ASZVEcMw6eGvuF0RIk+EIG52YKnRcbunGDqTT2kila8whL3A7pfecskvSR2L2w5zNez0
         QZoP1K300KaMkUEd3cfL2FBS5lE2gQ5psDd/m5Bn5WCX5PEH8wPyr+9/rKectNUlbAIj
         xCmP9uNOERdP9ghvS97R0jNvrTUCiaDlDqOJ3Blt0xamnhyFE2GgEZq/4MR2Ukp+/sMg
         AHFQiN3UT0Zr6Lsz7m8F2TO7z2B6Aqu7hXP+UtFJRJYhFluFdHjXxJH7c9fpoFXhPcJR
         WzIw==
X-Gm-Message-State: AOAM532xrfVUSNEAcS8Cs0kKyeQ5J9XDhu16nvDR6bikKptMolt2vzMv
        9CfLEvHqQbLgfWwmToaKnCg17GIDXMGo7Q==
X-Google-Smtp-Source: ABdhPJwLumJKHj2aIvDP+/sFNcmmCRKSI8CwCjsKgq0rIIr6CWEaG1f8o87TdObZfawb0yckZGBQDQ==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr50576890wrw.57.1638880474682;
        Tue, 07 Dec 2021 04:34:34 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:34 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 17/24] drm/amdgpu: use dma_resv_get_singleton in amdgpu_pasid_free_cb
Date:   Tue,  7 Dec 2021 13:34:04 +0100
Message-Id: <20211207123411.167006-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

