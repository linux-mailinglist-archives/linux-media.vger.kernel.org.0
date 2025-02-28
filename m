Return-Path: <linux-media+bounces-27182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D1A48EA9
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 03:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8585A7A8537
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 02:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7785E14B08E;
	Fri, 28 Feb 2025 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ibnGn6IK"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C8114D70E;
	Fri, 28 Feb 2025 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740709916; cv=none; b=emLMZB40oSw66aplDbXMx8DZ5TPUfIFWjAGq7gtlVng0LqsOHqRz7eyNtqKmt5NMAn9xZVE2kbSj3A6n2d8WLIOi6n02BWGdnVojKZ/MMA6ZTETDlBvonUrdIowAhjp/6Ym/cefwQSFW73waREHvVe5WNt/2jAQ2cLKFU07C3pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740709916; c=relaxed/simple;
	bh=e75NUM5wjlrcBZraXVssZBmLBIhqh9Vhj6YHd8YMEbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DEc6y26FfrqU7KGtYh/tliYnQ/k7x1EG8+Yc9VyBijCqJKNK5RurqXIrUf8di8XZpaNDFkdtwGZr9K3ctvZcRhCvCgPQ3V9kXVMwJ4OZcuJRiUzd76BWPRQPN2WcyH4IHcNikJuKPV8NAuhiRjvPns3EcayMa6gvqi8gSXLkU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ibnGn6IK; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=rcHVV
	NPM3mgsOgMcJQbDPlD26VF9g2Q5u3/LlGBoFIM=; b=ibnGn6IK5uwh5qLasuhn5
	ECJNJqf9G0/aAlk5r+5Yb8zGEooF0ir6u1R8SW3IxgQ6SzMUoq5T336UWDWKyfed
	fxXohFW+sYmjME39Ojufx44Sf4HU4q4d4ilLkIRG7d0E3IIYXUQsy9BwFF2/6293
	IhB2cHFdLMJI/27tBvS1X8=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDX3+brH8Fn5_6yOg--.23918S4;
	Fri, 28 Feb 2025 10:31:09 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm: fix a potential memory leak issue in submit_create()
Date: Fri, 28 Feb 2025 10:31:05 +0800
Message-Id: <20250228023105.3737605-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX3+brH8Fn5_6yOg--.23918S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr13Kryxur18JryfZw48Crg_yoW8trWkpF
	4UG34jkr1UA3WaqwsFkF1jka45Gw18WayxKF4qv3sxuwn0yw1UW3WUJ3yjqFWUJF92yry3
	tFs2kr1UXF10krUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zicdjtUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqBQCbmfBGNbydQAAs-

The memory allocated by msm_fence_alloc() actually is the
container of msm_fence_alloc()'s return value. Thus, just
free its return value is not enough.
Add a helper 'msm_fence_free()' in msm_fence.h/msm_fence.c
to do the complete job.

Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/msm/msm_fence.c      | 7 +++++++
 drivers/gpu/drm/msm/msm_fence.h      | 1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 1a5d4f1c8b42..0e257afaf443 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -184,6 +184,13 @@ msm_fence_alloc(void)
 	return &f->base;
 }
 
+void msm_fence_free(struct dma_fence *fence)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+
+	kfree(f);
+}
+
 void
 msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
 {
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 148196375a0b..635c68629070 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -82,6 +82,7 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(void);
+void msm_fence_free(struct dma_fence *fence);
 void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx);
 
 static inline bool
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..3fdcfc5714b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -56,7 +56,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
 	if (ret) {
-		kfree(submit->hw_fence);
+		msm_fence_free(submit->hw_fence);
 		kfree(submit);
 		return ERR_PTR(ret);
 	}
-- 
2.25.1


