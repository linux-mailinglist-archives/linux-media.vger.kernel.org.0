Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB74144AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhIVJMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbhIVJMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:30 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778DAC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d21so4550290wra.12
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=j90J/7JUL45MnI4Ak6Zob/9DvPF7tRT9c0kTqlvHmtQqcmG72bRfc7vEybu+f/lGlN
         XGz+AvKTZ9qloKeXOmGC9fPo5NQeTQAayLBopocjrNOrASSjtylOpH8pQNA+khn5wBfn
         DMN2CafDZ4aQl7yb3qHndbvsIk4CKhr/BPf6mdv+m9CAt5nu7SGMmXaqgTHgU1YE4ksb
         dEOYuFLGk/DJ/ZVdrGH5Du7o5bqY7C+Btl/Wfdov3f/1PpNTEGcbsPYysxuXYc+AOwNm
         gZEVj5EKY/0YRhx6o2WO0fYn5cDtf261049prYNT9Tddqh+svLWG/mDmm96Klbg6eBny
         UFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=8AIdRYaQwoaV4AS0B6hPsR0g8EzFZjW2en19AVu7ugZJnT96v6l5oS2gQ4s3KoTISD
         znG5azlFoOKYrU1u6JJ9s5MpUGFM+rxLBH9S8Zz7t7NPkdDGPCwFBqU0Ux4gMGuddJa4
         W2z8nNT54CfN2a3I2p6PrTl/aNczxFmz1+NJy3fH12WZPKYQzh+2Butva1ojKuJEZLaU
         A+s+FihYay9Nm0I6PCgdnUh0coNxyWrmvh3buG8INoralsJmbo01vN1qqXb+SebY5GhF
         DbZe08yhlB5HUk5r6g8qDTHliDCXpsb4qIrGGW0F9i4t8v4CfBu+Wqq4vgJFZ9pdActa
         Xq8Q==
X-Gm-Message-State: AOAM530OVVoPvqgKGwvSnESK1ShFpNxhZqEL1KbxO4t63FByAkTqxbjZ
        fEXzHRoeH1BNcL//39taMVo=
X-Google-Smtp-Source: ABdhPJwaobByNyerA5LioHPKRWh238hsBS9x3PdyiMb0uZTKHX40+PdO2QBIO1h46X7VKKESUTYfQQ==
X-Received: by 2002:a05:6000:156e:: with SMTP id 14mr29312311wrz.393.1632301859163;
        Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/26] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Wed, 22 Sep 2021 11:10:30 +0200
Message-Id: <20210922091044.2612-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

