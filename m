Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D80C41779D
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347178AbhIXPdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347171AbhIXPdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A2DC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w29so28588457wra.8
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=mmuXhFJ0qEV7A7UrLuynDivz0cZ/r085e6pCA784a2FVamGKuvtee2dOg0nHjMroS6
         UvOnoxzVqqVkOICBgHNknXEw/IrvfRGckdzbkBHVl/OUt87YsWH3vdebSEqmyRjailVa
         xisluGWdaUHNgleuVangMayhSmZsvQRQ0Y0AugyZR7fZVlGYF/hYJYwnv7WksLtZRPeW
         M9hnKztRktOObOPxp3fuur/JzOrEL8xoaHUYmyJMxKmwMTq2BZbRuI91zmIHt8nC7M/Q
         ncaMrUuYf7OxZifqVeoegdRXg2ILxqiwdC9Ar9zMogPUxvecDK1FuBUWunchdryuz3La
         JtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
        b=hX0THJAbaNkH7byD3E9QNNapw7S7SVWkOWJ+hjUI0QF49WooX8x86As7TVqcijXJS8
         C/a5wgXqkd3CKs92jgT3Y1JnzCjYdQV6uN9Yoeywe3DGhILMFNCDjPNJs5QzmJ8v8aNb
         AhSrHWqOo+SHYj27XDtgJJqm5+li7n6QQIzaLnE9g5F43pGw5TAoZhs7nZx5HmrGX1AS
         P3LmpkZNHPkshrImdPacrc2vxMmclXK1qfk7oZWJkGMRzfY+6KS964VeAn8HCU4ZMeKn
         k9yY2qUXDSQ2cmF5aSJbvRewuo4m02wRYo+dQYElYXJiqVJgOWV9MUqHdWcDjpLeSBRY
         8y6w==
X-Gm-Message-State: AOAM530wOnuJaGTpiBO4A0K5fKKaBwbsuEhjbuAvzL2rX2qruhARfP5K
        9PS+ZJiNJ+q9wckGpwG9sf4txacVhHA=
X-Google-Smtp-Source: ABdhPJwijaRgtkvA1rTTTYnmmkrv5+ub1+0ElId0x1Nfo9cuEK8BbS8nqDasRqB7IOjx9Y4kXNMbaA==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr12539577wrw.327.1632497492228;
        Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/27] drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2
Date:   Fri, 24 Sep 2021 17:31:01 +0200
Message-Id: <20210924153113.2159-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

