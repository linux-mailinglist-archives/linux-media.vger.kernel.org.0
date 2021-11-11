Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FDD44DC17
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 20:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhKKTWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 14:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbhKKTWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 14:22:45 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30823C061766;
        Thu, 11 Nov 2021 11:19:56 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g28so5990220pgg.3;
        Thu, 11 Nov 2021 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gll+pgQtBYECeJn/RU0NsPRmZk9ALD2l3W41Hro7yLE=;
        b=AtiOD3Rcv6buPs1m+tSPfQKVgnN8eBsb6zxBDTpFTJiTJa1rOCDgBu2nBWCV69MtAP
         sJtFzHofUFf9nnVgS3EmRlb9Dw6DxhyBWHFO14tzbnh6bm6AP8i0hnpdShokxj2CIt4u
         TVJ/w7J3RniL9Cn4w3vFshZFd6otTyw2Ia2k0Uh8BzIr5g21HmuAdQaGS8b+yFAxE0XZ
         VpwAkoKqEIhWvWsuG/8yDKwbSkmrWaSQzz9iuZ7dV42x86dxdXKlQJgd68O/AE9eF3bw
         gACUE9IDKAVj2nimLwRUE8+KClA8AYb6CW/o0F+rJpwSz1VNsbgRPYjTUlEEKNZ6C4Na
         +ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gll+pgQtBYECeJn/RU0NsPRmZk9ALD2l3W41Hro7yLE=;
        b=16kkAYFBqJuxLmTiVBwkuRMrV6aTlTZ4br8vMot6KmRZ4K/TtM2sxUgVRDZkSAxx8l
         4f6JKXXalGQoABWrOpZPj4/fMVapHK0TKIBu5VZFSJdFeqMnZvXGi1W2C0AaQMxNhgcS
         F/bwtoQRiSE2pPOJ8aeRc7xX7/Lr1firA1YhkSk2BYmKi1lxT3FKWLjF2HuoFW9f2TmX
         ZnSsn3HqPq/c6EvfVU8gZi0ffeRgD04504GwVfwMSgEKX72XzXGFMUmYOQ6SS2+xyhLX
         kJP7GtgbRSnT+MZga6hiT2GDqPhsXgSDyO4rC2NoLz/YASdcFc0P/4kMrRWARSiXkRlc
         lDrg==
X-Gm-Message-State: AOAM532uEpQ9cEAYdQw3eV991wrip/UlZGtVfcKw6HKst/5EdwYwEv/s
        sv/oniPGPm2mesh59OfynnA=
X-Google-Smtp-Source: ABdhPJx+lfYqAWYFGx0tk1yaXqVXH2LpwuOrESzXjHIuYrmwylZZLkLUOPKxleNWssUAHd9SngzmYw==
X-Received: by 2002:a63:5a63:: with SMTP id k35mr6119632pgm.230.1636658395706;
        Thu, 11 Nov 2021 11:19:55 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m9sm3588886pff.43.2021.11.11.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 11:19:54 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH 2/2] drm/msm: Restore error return on invalid fence
Date:   Thu, 11 Nov 2021 11:24:56 -0800
Message-Id: <20211111192457.747899-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111192457.747899-1-robdclark@gmail.com>
References: <20211111192457.747899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When converting to use an idr to map userspace fence seqno values back
to a dma_fence, we lost the error return when userspace passes seqno
that is larger than the last submitted fence.  Restore this check.

Reported-by: Akhil P Oommen <akhilpo@codeaurora.org>
Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note: I will rebase "drm/msm: Handle fence rollover" on top of this,
to simplify backporting this patch to stable kernels

 drivers/gpu/drm/msm/msm_drv.c        | 6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index cb14d997c174..56500eb5219e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -967,6 +967,12 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	struct dma_fence *fence;
 	int ret;
 
+	if (fence_id > queue->last_fence) {
+		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
+				      fence_id, queue->last_fence);
+		return -EINVAL;
+	}
+
 	/*
 	 * Map submitqueue scoped "seqno" (which is actually an idr key)
 	 * back to underlying dma-fence
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 151d19e4453c..a38f23be497d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -911,6 +911,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	drm_sched_entity_push_job(&submit->base, queue->entity);
 
 	args->fence = submit->fence_id;
+	queue->last_fence = submit->fence_id;
 
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bd4e0024033e..e73a5bb03544 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -376,6 +376,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
  *             by the submitqueue's priority
  * @faults:    the number of GPU hangs associated with this submitqueue
+ * @last_fence: the sequence number of the last allocated fence (for error
+ *             checking)
  * @ctx:       the per-drm_file context associated with the submitqueue (ie.
  *             which set of pgtables do submits jobs associated with the
  *             submitqueue use)
@@ -391,6 +393,7 @@ struct msm_gpu_submitqueue {
 	u32 flags;
 	u32 ring_nr;
 	int faults;
+	uint32_t last_fence;
 	struct msm_file_private *ctx;
 	struct list_head node;
 	struct idr fence_idr;
-- 
2.31.1

