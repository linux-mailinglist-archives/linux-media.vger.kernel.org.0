Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3775742252B
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbhJELjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJELjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:51 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA24AC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id z2so16087336wmc.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=AGHPzHyTbObVNAaOwMKpwE8lBcAqbw3FoKyW5qe6/Tdlq22O7vBLpHqZdE3XQnyP17
         IzBEoj/NDsiwk8ePd5Tcnfgr+g3X6c6TCM2mk7A5Jqu1DOqv08jBY1anu4IolTU/eu9g
         IpXMhmocTqgL+/ljGYyUsKz7dUvQF1lYIH5ZVgmgZjVHchR3w/ZEJdKNywIL+iodO5DJ
         8fdC0+a0daS/uDDGSpUnOv9OLwV7Ia+XfDk46AzESIhh03jl7PZmkdKs9zCFuknZGfhN
         QonswpRKkK8eH2R3c5BtVDVWXXdPXuICFyfz10ZSKeQOnBiM2ZfUNJ10YK0GGS80GX6a
         +tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=pToPm9ChTt1z3OTmeABCbHGrroIbhKxl+kURJe2pOdJNmAJiI0H95k89SuuHAmT44q
         3CeKei3lXB1fUK8FRhVKsBRIXeBnAFPALplxcPeDrfcGEMqvsZGuYa3312w+wB1eQJsj
         v+2qUGIxrBAIAPWglF5sqNLo4d3LOilksoG6KAXJa6UkdHHJzhFPAx3RYXQmI80lRlSw
         8Yii/FE72TXjETWsE0uRftiefYgHXhUAKwAbrA/1Ubyt2aspHUKg5Gv8doTVoNEfMJ9D
         lsZYFr8TuS1Q+V197bGgq2Vj6sCYYUw30/F2RIAh5nYK/a3xfV9x2D/1fUDGpHM26qVb
         KPZg==
X-Gm-Message-State: AOAM531G+7zUm8rEpfKv4VN0JCCppWMwiPJEOJKVZ4MoWPl5mgQg97zz
        aSWJotDGAlRPD5P1ujmv6Po=
X-Google-Smtp-Source: ABdhPJxecRyNg3S437RhSJiozzZhKzwjhUlyj4Z6lAlk+StsOMG/YjUPqJMYy7r2Gpdz3R/hLke3lw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr2873140wma.72.1633433879512;
        Tue, 05 Oct 2021 04:37:59 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/28] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Tue,  5 Oct 2021 13:37:30 +0200
Message-Id: <20211005113742.1101-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

