Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2437A40F7B3
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244218AbhIQMgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244209AbhIQMgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:49 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6792C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 70so4280228wme.5
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a24rUD+lvDbozllBrOmPRNBHQxSSbhyfXU0oYcihzyg=;
        b=nIdwXfLabzXcW1XiceUdnmzctWEURDQizwpJU2OUqH6G1ZuU2YX9NskikFXUwzC392
         C5rT93WnEzI1d4Ke7nxW2BlJsrJbVJK2iydZlt5YaIzbEqGtKMBUGj2I3IPDHW18JhRw
         uYr3RCuz1bJLcMzHogMCrhy7GS4HCNI79lUSSd7Q2iKhSNYeQZ896b2jE6LSGgUP50LX
         IJfUfcPPVKBVQekWxSWFIVSQkiGPlHcbN/HB9LuOH9NvXIYHPkxN/KocH83NGwHhXRzR
         RJZoBw7DJdr7lDQlEeZA3IZMHAnq9h4cj5h2pcyZzDIgyQdWDJXJTMlLjCtgn4KohfgW
         enZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a24rUD+lvDbozllBrOmPRNBHQxSSbhyfXU0oYcihzyg=;
        b=UccWY9Sc8wdYYxLT15ubxyhMlihhvRU1Bc8V+JSVk4dQ5p4yIjtvvPsiM3+bnjkca4
         3NGRy1xigonMyQ+n5WES9Y6wbu00JI7kyPh623v8pqsf7OPwP8GX8Dz9ks3zTmhTCbpl
         PoJ476ZQ057nD0T9ScCmXlsxRZUA+Ht4TyVUIsOy3n4AIW3j51I942qVoRf2xCuhVKjx
         LMwsslkghgu4rWgjMiylq6c4wHP96fUoyXvjIrzGvAI8w24IeoEsUeoqKUon8ye2oJtE
         VA8GC57dAUmYpMQv9U4YfcLuJDuufQizD+NTqfl7oT0UrqxkXOiH8xD0gvchixge9lbU
         R6AA==
X-Gm-Message-State: AOAM532vleyvUwPKtYnH2MimLJvhrSD6QizKHsfXeMmwPU6eyOu62CGT
        u5lOBvx/kADGjAvI8h3iyvefbVFNtnw=
X-Google-Smtp-Source: ABdhPJxh2B8tbcdyMHyLlJwdm9twJffSI2woQBoj+J90WpQgS6tgdN39QXiHuGZvFewkLx3TxfV2Kw==
X-Received: by 2002:a7b:c4c2:: with SMTP id g2mr10105760wmk.134.1631882126494;
        Fri, 17 Sep 2021 05:35:26 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 12/26] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Fri, 17 Sep 2021 14:34:59 +0200
Message-Id: <20210917123513.1106-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 042c16b5d54a..5bc5f775abe1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
-			break;
+			return ret;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
-- 
2.25.1

