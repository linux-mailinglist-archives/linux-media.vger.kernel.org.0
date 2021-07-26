Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621BE3D6A44
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 01:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbhGZWya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 18:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhGZWy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 18:54:29 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5C4C061764;
        Mon, 26 Jul 2021 16:34:56 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so2297406pji.5;
        Mon, 26 Jul 2021 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOCwRi9hxpNHgxPfLImA8XjRn0qGzkVI05nd0NTq6uk=;
        b=UMdDGkO5sH4beFwSPlOOtv6JRzN+gpzELhacSFi7vvaQQ1PwmNbkfYf44YSJQaBLpr
         vVV0beEQqJV0NuTrh3WVluml5kosYKXPr9U5iyNbGEHEnWPREtu7FUB2q7w+oJTefR1N
         nxhrxUsL/yhwl8fKcflbrIpY5obQR2TALxuMCayo8c8wDQO0eaI6GFbUCJf3pr8RanC3
         lpKxIhzu44oKfzHbedvRslZeVPkbiBMj0MBXvllJzc/2Ok4djmZsXBK3c9DbPUgVz+GT
         Ad5XrI/AMY80dotYjiTUCM0Zb4DP3NOJpJAs9lA+0Yu8rBP+Sisqs25ugYEbBPneZq4S
         A5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOCwRi9hxpNHgxPfLImA8XjRn0qGzkVI05nd0NTq6uk=;
        b=tl3mk+FL7DWE+MK4T0S/V/V9+tJMh9XZCggGxAALBFHnaNQI1VG9Wg9CtTvHohnr0y
         eAhP/9F+zTaHXOOPB9lFCXZ1orMrzjN/O2BpHVj7oTZ5ViG9SWbPS2BJPMFhUCA6g6a+
         oNUCei1LAI34TgzP1o2nfBACdYTK2VeFpl4f5tV1sgTF9pxZytJrZV9a5DV2iSeqn7aF
         kqlj4mmmLdYmtdEv1eeZeqp2o9T0KpO5yYW6GLf+93TLIVVKO0j0hzkxZjlBTw527yOH
         J7n8SDulBgyRBJVXI9W3VU8UKsmAda48Z6KK4TOfD6kXT/Y6X3pjOvAvNyOjTArGoirZ
         0kBw==
X-Gm-Message-State: AOAM533/+5wmoh1jZXTaKB6BM5Si8icp+1ncEbUrgZFk5MVqnjAOorVN
        XkUwqffkHv1TE5a19JxqYkE=
X-Google-Smtp-Source: ABdhPJyKNvvOsVEx6SQdxLRvjXmblFnYyDE+d88dd2vCChknqQFuJLEJg/rykB5kBwIJAy520O/kiQ==
X-Received: by 2002:a63:3445:: with SMTP id b66mr20626420pga.141.1627342496218;
        Mon, 26 Jul 2021 16:34:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id t205sm1171971pfc.32.2021.07.26.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 16:34:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [RFC 4/4] drm/scheduler: Add fence deadline support
Date:   Mon, 26 Jul 2021 16:38:51 -0700
Message-Id: <20210726233854.2453899-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

As the finished fence is the one that is exposed to userspace, and
therefore the one that other operations, like atomic update, would
block on, we need to propagate the deadline from from the finished
fence to the actual hw fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 10 ++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..3aa6351d2101 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -128,6 +128,15 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
 	dma_fence_put(&fence->scheduled);
 }
 
+static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
+						  ktime_t deadline)
+{
+	struct drm_sched_fence *fence = to_drm_sched_fence(f);
+
+	if (fence->parent)
+		dma_fence_set_deadline(fence->parent, deadline);
+}
+
 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
@@ -138,6 +147,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
 	.release = drm_sched_fence_release_finished,
+	.set_deadline = drm_sched_fence_set_deadline_finished,
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a953693b45..fcc601962e92 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
+			if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
+				     &s_fence->finished.flags))
+				dma_fence_set_deadline(fence, s_fence->finished.deadline);
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-- 
2.31.1

