Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8786640D8B0
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238196AbhIPLcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238126AbhIPLcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:18 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB85C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so4232489wml.3
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0OTgPLj5/kZbUOkhqk9NSO3/CkxGkvCYnJw/k/qjCI=;
        b=TI5K0ilOVbnZM/XwAm/seTvTSzhbru89RUBDeeOE7/Vy9vUHojENTRDsrem5Q4/L0U
         /b5vMg12+v4RnZTZLmN1f+GYz2ojB8iFwntOwn3u6TAhGxT5n42xFOD8vYgyiW+Fe7YX
         NSkWnkXd8d16uA8MYyJu7Gx435UyeXK/9TvgzYISQuiqCwMlaiGIiKQgvrml+PsXzjun
         PzAQy4yYX93oYlBMWvKEG0L7NMBSbAfsZE3rGpJ5EHP8kj0SjndyeyQg024VjUCctMFn
         XDT0IPz7dYR2vzsgiGZBndm2nafL4KSG7qOTX/kBOAxWPJfvAybRog5+o1XDdh349b/J
         TUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0OTgPLj5/kZbUOkhqk9NSO3/CkxGkvCYnJw/k/qjCI=;
        b=8CLSyF7P8eymv6Gepi6ugPx7nRa/93MOvRD77wQt04MsnXNZ12+f5j7/XqlZEhkwoR
         U8a2bCcct0Zgn8dva5rgBjO0Fs6XXLpFrLBzeQrJ9V68SRUZt2r0Kx7cH4hH8XFCdU1D
         AEgs0rhw7XallMFcAT6KCHCMUjtw/fghXB1LfFY0mT4Xah9u5rYTIOwBH6rmM41a8zF4
         Kh7cP/g1K4EalILIOBrmLr7IkNg6eggOlLE9+ZWRe57cvUoFtEzytysLJvACYQF7Eq4H
         9/fKxuLalFyM0AhQkkUWjqIbVTFx22advmKEIiAofq51wis2nYY1WejaOKpfHgqRNiPS
         8DUg==
X-Gm-Message-State: AOAM530hxDfE0TuQ7DRRVGudlKewjwZI06ulJ/0bCXauzWwvlxMc3LfN
        puovoRqIIBSH6WnlHqrO/DI=
X-Google-Smtp-Source: ABdhPJwLEl2QmPWQ2LggYqWGMl4Nkr4hC1T9Yq1jkr6BsuBkMjrwe0T4qkJGOxUAntZijUG5Ih1f0Q==
X-Received: by 2002:a1c:800e:: with SMTP id b14mr9700962wmd.54.1631791856706;
        Thu, 16 Sep 2021 04:30:56 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:56 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/26] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Thu, 16 Sep 2021 13:30:28 +0200
Message-Id: <20210916113042.3631-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 042c16b5d54a..ee2fe37ee724 100644
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
+	dma_resv_for_each_fence(obj->resv, &cursor, write, fence) {
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

