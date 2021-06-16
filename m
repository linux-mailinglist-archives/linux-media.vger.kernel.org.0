Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A58F3A94F1
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhFPI3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhFPI3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:11 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B5AC061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id ba2so1567237edb.2
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
        b=NVrqaPl19uEslX/a+KyWratsaSC97kBg4iUcUB8MZJukI/CUgyD9y2YUaJ2tOIj3Vb
         ixt1qRYMlSRMZnfCGzpujLwyyLlQeLXocGBTZH8KvIb+6ooOpakMj5YkfcoQRGgqTjPP
         AqYI7SqZDm6uW6UNrRpGRvdMe/7lQOiq5tnaQA0AG3Bs1b6+UKNgmls2Dz05f86K0etC
         UjAVH9NsRWKPjP5uVLJbNEf/l0yLnpTITa6piqgHIcAMbIwpks+BdphqoYZUTQKeDOuE
         KNxiTx8W3IbQw2UyIMREJWGpzjv2/kWL0J1pW9a+ZsrhV+6DA+cLIKnuoF+3a2+/Vmvi
         SY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
        b=alQmsaCTVzrgXNKEdhvgp+jgxJsLw6IpTaKZkokp98H7mtK0DW4lTuTFlQhAIjwXlm
         BgRACQupDjj355uLD6t37qzO+E1zpC0qQlxjm+8twHguureedq+F23i6tTWGsw4IA360
         OOFDryHEqa0yTqxYlmMJpc2/i5fgCtDN3MxuQe0f1/93OE3OMyWg81SSBCm+6St5oI+W
         JcVAqMKMuEuSIa4IIRkx7fTZK/5J+QvI6WdIM3Z2ByghwvsbHDJlK1N7pBKNEXZ2FubF
         0uD2RU/qnUkjJhmqe0eM6YVYuaJ8FUNHHNZyIq7EGO8qLjFPzOXYfmWYjF+I6L3asOPS
         MuYg==
X-Gm-Message-State: AOAM53299rGDFYz2nXv0Sus+JLmRPNw/qIb1QJoT8/uqOEqQoD3j3R1Y
        CRAuJnzzza/93Vfod/+VpP0=
X-Google-Smtp-Source: ABdhPJwV7+n84rFPY62ZziQgf22oMXHmHw5Wg3+23X3qqR6nGWr7dVvkNQCVJypfg3IWq7wiJAhiTA==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr2758141edu.312.1623832022944;
        Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 5/7] drm/msm: always wait for the exclusive fence
Date:   Wed, 16 Jun 2021 10:26:53 +0200
Message-Id: <20210616082655.111001-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Completely untested since the driver won't even compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a94a43de95ef..72a07e311de3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -817,17 +817,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.25.1

