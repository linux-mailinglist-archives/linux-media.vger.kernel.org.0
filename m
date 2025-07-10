Return-Path: <linux-media+bounces-37287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D05B0028F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 766EF1C40999
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF6B273818;
	Thu, 10 Jul 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tauv3G7I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D43233D64;
	Thu, 10 Jul 2025 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152069; cv=none; b=rxy+N4U+jjGU20njfn2qEdpLG2nh9/OWrxKfAucfdt/MfR1/2yWkTSMKqwXOTItJMNmQUoSWl1Xmz0IqLKH/hgWRn8yheFBcuTaYttBd4Njyskh7nyXSz+I6qdm/zExcPr+Ec+so3RUF2mci0rigA0sa1H4Hv9EII9PbHMH4xNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152069; c=relaxed/simple;
	bh=Ty3nXIi4HmgfpzGYIeOEefnUtewrgna8f3Lra94ypwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImLCURh8PDaFYibaKAB0wBONthmSmz6A2JgSl+vNHE6g/CVLZXsI2ZH7d+M3VDZNkzf7lPlfqkOxgP7bgw2fEtOoQr8ZgdvhsEUJBA7lzCGbQuxLDKGdKSa6HHELmyxBlNvT3mimvpInxwef/q09LspVrKttKrXufCJOZChg0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tauv3G7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B01C4CEF5;
	Thu, 10 Jul 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752152069;
	bh=Ty3nXIi4HmgfpzGYIeOEefnUtewrgna8f3Lra94ypwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tauv3G7ITX2kczrfAR5yQUDt0/SmS/4WXFzs8CQJGmbuSFP4pAqeo4b4KeHUIoCh0
	 7/cy7Xt5X0QgJnfzwoVD4Rd2XzlVCJWh9DSazTBxd/sglfO3OYdQip/bZRJTKdBG0l
	 WoM8KUxZvlLniV3ib1WkKSPDVcDlq5qY03QP/THs28VmbFoKV3OLizZUpw6tx7w2I4
	 XT/Jq4Fpv7iZZ8COoacfNKljWWcVJy3btnK6VAXPD6Mp9Wih1q8nwNL9IQgp6MGe9k
	 fqT5oQ+v2dYACp//bXvqhvwZvwGomV31zAkFBjOET+mBrquhvqyVBcn5cf1db32S+i
	 3xob00fjPHbdA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/8] drm/panfrost: Fix scheduler workqueue bug
Date: Thu, 10 Jul 2025 14:54:05 +0200
Message-ID: <20250710125412.128476-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the GPU scheduler was ported to using a struct for its
initialization parameters, it was overlooked that panfrost creates a
distinct workqueue for timeout handling.

The pointer to this new workqueue is not initialized to the struct,
resulting in NULL being passed to the scheduler, which then uses the
system_wq for timeout handling.

Set the correct workqueue to the init args struct.

Cc: stable@vger.kernel.org # 6.15+
Fixes: 796a9f55a8d1 ("drm/sched: Use struct for drm_sched_init() params")
Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Closes: https://lore.kernel.org/dri-devel/b5d0921c-7cbf-4d55-aa47-c35cd7861c02@igalia.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5657106c2f7d..15e2d505550f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -841,7 +841,6 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = 2,
 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
-		.timeout_wq = pfdev->reset.wq,
 		.name = "pan_js",
 		.dev = pfdev->dev,
 	};
@@ -879,6 +878,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
 	if (!pfdev->reset.wq)
 		return -ENOMEM;
+	args.timeout_wq = pfdev->reset.wq;
 
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
-- 
2.49.0


