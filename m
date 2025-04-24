Return-Path: <linux-media+bounces-30892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDDA99F99
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 05:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D166E7A89AE
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 03:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065DF1B4F1F;
	Thu, 24 Apr 2025 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nPZLSXqR"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBFF42A82;
	Thu, 24 Apr 2025 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745465323; cv=none; b=Qi8Kv54tWTTMss7h6ghq7u0vBoGgtG5t8yYqKSrdQxPyob3xqLTWcY7gC9Lck4SnwPM1pQUPVwvXr4HRPsEfIQbm3868f5fJdlrZdR3T+KbwpUxSbqAprsCgQzk7yP1MQfLXHKjH7UhEgO4iOWAdLww4//YCD6Ybl91kydgOPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745465323; c=relaxed/simple;
	bh=noHbPR3sLsndnulXNWyZeHg3HcciLEB7XfaZ3CZdWCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YD9kL1InWFOLDwvfv2SrgTCJj00EczSguyaOBPk+bOlFr7nNfJGbcQ7J0pYChFl96p3jh+2QLbr6k8ikwVAcK5oB7c3BgVd/1F5VN/UTZNk1XIsCVG8usTmjJOAakBWxm2KaQ2kbSVTWUrMjdxXVoshxxf+5/vc+Qabpo849+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nPZLSXqR; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=GI6Sp
	yLuPvAVEE4Ld7Nf0E+xh/9cZZvxLRmeApwpMZ8=; b=nPZLSXqRi+fcf9E5WXa+X
	DJMDd0wb/cI8WVbaniqvPscb097gdCjTELvhQsn6IO9pDuWf3mHgU4d6UaGjU8xi
	0a9Aevm5fQU16fyC7lRbyG08XXtKji5RE7qMmCyH1Ej4q+X4Ntfknaf4RejuH19q
	MCUQhGJMy6qGt/kYLMmOwk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAnVhS7rwloFhNACA--.42303S4;
	Thu, 24 Apr 2025 11:27:57 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	lumag@kernel.org,
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
Subject: [PATCH RESEND] drm/msm: fix a potential memory leak issue in submit_create()
Date: Thu, 24 Apr 2025 11:27:51 +0800
Message-Id: <20250424032751.3511768-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnVhS7rwloFhNACA--.42303S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr13Kryxur1UKF1rJF45trb_yoW8trWkpF
	WUW34jkr1UA3WaqwsFkF1jka45G3W8WayxKFWqv3sxuw1Yyw1UW3WUA3y2qFWUJF92yry3
	tFs2kr1UXF10krUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zic18DUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkAk5bmgJr3YKpQAAsZ

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
index d41e5a6bbee0..72641e6a627d 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -183,6 +183,13 @@ msm_fence_alloc(void)
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
index 3e9aa2cc38ef..213baa5bca5e 100644
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


