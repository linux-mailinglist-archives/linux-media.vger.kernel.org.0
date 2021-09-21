Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246A3413881
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhIURir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhIURin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:43 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9766C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id g16so41542881wrb.3
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=cDp4X8nEmxvJiGYdGuWZzu8D1TLfgJyLtBQE2jZxeRe5vgCyvEk0LBVxllfDfy39wi
         iqugiMSc9ZfU+mS0MAdxOpTwrE7/cRbkNMWZN20OuQvOB7+unzYuuE0FhY2H7Lg5/guh
         7u6O8TMtWlOqqkWD6pd3r8yA2oRmlDwah0lUM/Q4kBAgRkGD+d5vtv14LtFJgAFqEfDa
         WpFM+ClJZbKdGevGrhvsCriciOhGaN7Pd4EUpYikZR8Yg8BDmSw/9iHIoEdSnnxzDJBo
         E0qfxDgFHtC6LYBDS5i4ryTI/rHlHMT6zo7rju2Vxy5eiC6CdzPnIUVhBAjEjdAGJPTL
         E1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=N8tlZ4AhiOmcSye0yQ4J6DoKVZJsj4d+tCeRFGG62r5kmNeEwk+Vk78NuwKyGNdS5G
         7MSOxciEw3VT/l6ZnIkJHXurz/Cj7HQvT/HZ2yH4+Q9y+JU9MtGx04aXoHBVecxlIM1Z
         Xe5BaEsZfuLrUOvMjXmMisz9RMdMnsaHdKbrUxT4Zcc/TJOwXgt+z296Ep+M6IJudiMv
         2TXO914wpS8VnMJXpNP+qadNqfmXTgKgODSeh8aHJ4AJtDiPwUF1nOb26X2PRdUMYW3S
         9dHMfJbvmG3ySYA4N2ktGgbZopeaVnc3+QfXQeqUDAI+4FgnUw6Ucle+U/zw5oX6pHpz
         tlxQ==
X-Gm-Message-State: AOAM5309hZkOE/2kxQKBgfYEQdj8TiTkmb9NBlWE8ffsQRKHyXyQ7l5U
        AVweHlAEwLQiaTqbwl/kLMQ=
X-Google-Smtp-Source: ABdhPJw/F52P2/JZ97k5+Q1iHrdLYrh6e95FiQ1py0vN9kS3NvlA3/pP1bkc0d6Bi2jIpnxKyrZ+WA==
X-Received: by 2002:a05:6000:1207:: with SMTP id e7mr35843869wrx.170.1632245833656;
        Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/26] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Tue, 21 Sep 2021 19:36:45 +0200
Message-Id: <20210921173659.246165-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

