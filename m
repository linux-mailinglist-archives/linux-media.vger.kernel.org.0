Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7352D408E21
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241092AbhIMNbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240043AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709ACC061786
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x6so14629206wrv.13
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sKcmOjs+nnoTfTMzj1B5wwjzz9EHhzICWjOSUDa4Z8U=;
        b=nBPqCuTA/TC2qVnaVxCbTiYSf/S2Zb+rPI3NMesDDCkuCLK6GhnykrXk2iMYKdSdT1
         jvPsOLCrv2QnGCs4MxccvHdcgMir8VwtF8aB35eDL1jKIc2IhHVRj6bnTtWyN7WQV28X
         EXCaP1pbmof5OEUYC6IXxSI5P9/RjqqhzG0gvV09dp/aonbhLWGKRjt40FZ10nAA9aN0
         xEOyQS0g4JwN98ffF/JVBgZs6jXfF0J4uPfsjmHBggroCU5cHYtt1pPnadRl4cMs+W04
         Hg9Pfu7wtmSxrbMAlBBbwP74P3dl+SpST7alSOENKz66OCpJJQA8a5J5aELwnIkgm1h0
         vqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sKcmOjs+nnoTfTMzj1B5wwjzz9EHhzICWjOSUDa4Z8U=;
        b=LB3WuMGECYFEAGmT2wZa+vFJ9+aPEoBtJHTKte/VuR7WK80LcU7hv6tTOws40sg+XE
         8KoR2F3iU5pEKmlPaemwrlsgZ+YPj12GFIqoMSYWRlAgj4XJ0e3aTHqh07J6UmiZiuDk
         ponYJ6VWuI6QOrzc4bJpSU4TO1SqbCcA0gErHl2eSrQ4Ge7rKiQ1wQdSOUGxjzSDL+ys
         1wLIpME3Lw6///QVOuzhEts+qFHtyUlAsUD8IDNJ2a/S0G5VzDNNLOD99WqSawwVfNGG
         s5P09bkqr/5uMpLaERkwato+AeLNsGm/sobdkd8WZBUh9JJp5SUH3PBCi7WtwZLpmNoZ
         XO5Q==
X-Gm-Message-State: AOAM533wdssup1d7XvIfHzFTZKQbxKm78lRf9wKu9Us24iDRLUH1GQkf
        km8WA+WiipUbVYafOYBaRRQ=
X-Google-Smtp-Source: ABdhPJxsd5NTCKCjaeMUfEJLxSPuesNlwu+JoEsLMfvIj+y4YAP3U29/E88Z+2CBo6RfJbhW863CUw==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr9242218wrn.238.1631539052126;
        Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/26] drm/i915: use the new iterator in i915_request_await_object
Date:   Mon, 13 Sep 2021 15:16:56 +0200
Message-Id: <20210913131707.45639-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 37aef1308573..b81045ceb619 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			break;
 		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
 	}
 
 	return ret;
-- 
2.25.1

