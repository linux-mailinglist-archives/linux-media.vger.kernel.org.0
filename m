Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56127461654
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243708AbhK2Nae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377768AbhK2N22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:28 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95340C09B078
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:29 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id c4so36235043wrd.9
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=Ls9pyYYC4IRtynWGVv7PST9jgW7xhHwCKudS7fmE4huulke2dfwzeuE9o1LWLYWfEw
         bInGt1reT+dqSlIgkYPeb8xP2J1aHcx60QtRar3gElqtczG8bS83M9BgVkswP8ij1SgN
         t8hHVP+QFxyCwPUpbm+j8f7qVEjtovxSxo9uqbFAAcpO1Z2xqk3CQpBCvd5vx0TQiYoy
         c8p9/qmUrqySlCTEuUG3wAOwNrsjG7WfyGMjP/6RcKyj1OBAGvYvBS5+GP6CV11DsJvW
         xsqBA1QvJoJDxH/rB0F/HLPjMbty4ybd9cZP8SuwnapTs21ZTkg34GNbgv9KpH6v5Vf4
         NtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
        b=kaIiTgqi3fDt00K6Mkhg3RrS1bcHSvJGhqR9ybnGH9riUnejtwbKQ4jAykaBR0wC20
         mM3orO0DC87mXNGClm+YbB5k/AB6EtGsIOjQ2/yhXWYo92fue724tGEfgKLcLyhhrpIQ
         hZCpEQJqvSvqQ/GPIo+8Lm+vPyCCK4xRfoKTNhu5FklU6mr5PP2QEgo5ug3PAUMtzBPq
         94HI0ZZLdLDrY1ICDh3rJNNbfq8k/UXTdjopx7MSuT/w0Ychv0O2w9RK9iebNIfFgJmv
         47/ZuNsdzioFgfa7iEjzHcuVYg2W3gBKifBEfceEUrMAR40V2rSkMN5KYbLC2OpXVS6E
         YxOA==
X-Gm-Message-State: AOAM533GKZ9up6JVumWGMQmIBqC+d6eYzagvwyMDOEU+HYRnmDiOaReF
        0bM0eHAVYjrFZUHjCo2p3yw=
X-Google-Smtp-Source: ABdhPJwLYqaPOW2nguhOPYGXqO3qoZ4hZ/r8fLTEY5IhxAz1jmeW2jZMMnQjf5rdot0FcpgeR5ne5g==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr34904053wrv.310.1638187648289;
        Mon, 29 Nov 2021 04:07:28 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:27 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 21/28] drm/amdgpu: use dma_resv_get_singleton in amdgpu_pasid_free_cb
Date:   Mon, 29 Nov 2021 13:06:52 +0100
Message-Id: <20211129120659.1815-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

