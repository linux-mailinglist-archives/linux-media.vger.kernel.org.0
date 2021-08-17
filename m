Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5263EE8E6
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 10:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbhHQIxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 04:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbhHQIxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 04:53:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4858DC0613C1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 01:53:14 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso1296485wmg.4
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Foq1jfoZEIBs4n7G/bZZkaAEZKAMJ2fq58X7W55B5Cs=;
        b=ON05/OnTdpSUTAVLFueKtDr2Q2P3k1V4fLOpdhTNgRcS3Mf1AmODgDnnWxVXZD0xS5
         YnDBWCwf9ndzJhCQXUrKh+KxdR0ljJnroirmJG/jugfbsUUvzy7qhJDQpwA1QtDfsrpT
         cXU1kaWBVCQ3iSp3NTFJ9aLbiNIWvRM3CzZDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Foq1jfoZEIBs4n7G/bZZkaAEZKAMJ2fq58X7W55B5Cs=;
        b=sG8newakPes3R79nbtlUM7u2RHyDPslxNdMJxYV6c9ESzFrbVgtVOHL3sfvXh3l7+Z
         e3YK+2JncuVWfEQDc/WkeU6XIrwK4jQ7M5Qgqthp91nhqI8qfcr1vCceWIflnz6jjVIa
         W4TRw+f6xAnb0rDGVbaJcdxvothzjcNToktQ5omWhPqEn0wwib9nNCj7KdDrsVgX01Cn
         wUIxmfIln8dXQWT1NGCZpqRTkCC+KR7MiK48HVFqhIqipJgv6pDhURp8/RfOJkQ3ABgX
         5QZz4oO7QaeQGTS5IaWYDmJkwettK//8KA558MEzo0yMWA0PC3j9022+KALFYtD4/YmW
         ZNlw==
X-Gm-Message-State: AOAM531MzIzeagTa2IwXXVA91OtoJOivr0kiE/5LKGezd3OKvLCGmpWl
        FlkKu+SeeMptDAq/ykdxfnRSZQ==
X-Google-Smtp-Source: ABdhPJwpUUwXnjaRx60+hWeIp7RglqDMAgg9WKN2STzJ0qtxfyLS51dWqmDcYZYLpOCamTSqG8h5Nw==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr2219643wmj.45.1629190392928;
        Tue, 17 Aug 2021 01:53:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g11sm1645525wrd.97.2021.08.17.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 01:53:12 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] drm/msm: Improve drm/sched point of no return rules
Date:   Tue, 17 Aug 2021 10:53:08 +0200
Message-Id: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Originally drm_sched_job_init was the point of no return, after which
drivers really should submit a job. I've split that up, which allows
us to fix this issue pretty easily.

Only thing we have to take care of is to not skip to error paths after
that. Other drivers do this the same for out-fence and similar things.

v2: It's not really a bugfix, just an improvement, since all
drm_sched_job_arm does is reserve the fence number. And gaps should be
fine, as long as the drm_sched_job doesn't escape anywhere at all.

For robustness it's still better to align with other drivers here and
not bail out after job_arm().

Cc: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4d1c4d5f6a2a..371ed9154e58 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	drm_sched_job_arm(&job->base);
-
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
@@ -882,6 +880,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
+	drm_sched_job_arm(&submit->base);
+
 	/*
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
@@ -891,17 +891,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
-		goto out;
 	}
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
+	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		struct sync_file *sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto out;
+		} else {
+			fd_install(out_fence_fd, sync_file->file);
+			args->fence_fd = out_fence_fd;
 		}
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
 	}
 
 	submit_attach_object_fences(submit);
-- 
2.32.0

