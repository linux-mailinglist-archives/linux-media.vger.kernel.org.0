Return-Path: <linux-media+bounces-32996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D94ABF0C6
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A61E94A88D3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2C725B1E9;
	Wed, 21 May 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb/7Ly5G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D5023BCF4;
	Wed, 21 May 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821920; cv=none; b=ZWs6cMVwu5gefd2tDCAMRNJFHcmtH58gufXTEIkvQZrdkStTc/rS+Nu1xg9PHWZ6t6CYLFm3DAXYbE6sSBCP6UAcEhSSwfvfn5hCR2uMJ+hLYXz37c6Y3OXRx8BM0OELj7TcAox89iobMZSbtJGD4Csy6dFrvahdQlZl8VJTxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821920; c=relaxed/simple;
	bh=jYCPLpmjCZwqIjzIBMh5UL0q6Ebpw9E0czo06+AzlDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2bjCgRpUlq/wDEQcEqRMZFcB+MzM0XHRKNe64qlHwPUjxta2P7DvUaS3qZS2kw7InfkmfvhVMeWK7ecwDGg6IMFTNALz29ejnqsME9zKfiStnP12Sr/7WA0JhtDRBdFwvaNdBIeNcAxy9CYQRdjI59wKUmMdVK2nCgeAG9aF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb/7Ly5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6271FC4CEE4;
	Wed, 21 May 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747821918;
	bh=jYCPLpmjCZwqIjzIBMh5UL0q6Ebpw9E0czo06+AzlDA=;
	h=From:To:Cc:Subject:Date:From;
	b=Nb/7Ly5GTdimYBFDrmhATZWGMNLPs1ulWJrOcXiMRXFzeUS0BKDbxVvTUvK1a762g
	 h+T2uKG4cdbhuKNHikUMRhnFTq/WC8xRlfvW91+MFc61xA59Z0s96ywzTCkfngdfBg
	 TbS0zxsojUzlXhw4gLROxtwIfUiYOzNlN6sSOUO9zJV/UlbWwzB5rmYxYSB7CBTC+/
	 KD1DB93jJX/65DIEQSKyDO3HViRIvM2eojKEttRpfYZ+c5/fb4j0J0ZvvqjPgWKa5/
	 6y4bZKb+Tb0WU6U40Mdejgt1agx2u3bHKAW4UVJ6URJJY19wd+OvfJq1K3gcN7VTwD
	 r9xvU5DbVZhYA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] drm/sched/tests: Use one lock for fence context
Date: Wed, 21 May 2025 12:04:41 +0200
Message-ID: <20250521100440.110019-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the unit tests were implemented, each scheduler job got its own,
distinct lock. This is not how dma_fence context locking rules are to be
implemented. All jobs belonging to the same fence context (in this case:
scheduler) should share a lock for their dma_fences. This is to comply
to various dma_fence rules, e.g., ensuring that only one fence gets
signaled at a time.

Use the fence context (scheduler) lock for the jobs.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
 drivers/gpu/drm/scheduler/tests/sched_tests.h    | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..17023276f4b0 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct drm_mock_sched_job *job)
 
 	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
 	list_move_tail(&job->link, &sched->done_list);
-	dma_fence_signal(&job->hw_fence);
+	dma_fence_signal_locked(&job->hw_fence);
 	complete(&job->done);
 }
 
@@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
 	job->test = test;
 
 	init_completion(&job->done);
-	spin_lock_init(&job->lock);
 	INIT_LIST_HEAD(&job->link);
 	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
 		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
@@ -169,7 +168,7 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 
 	dma_fence_init(&job->hw_fence,
 		       &drm_mock_sched_hw_fence_ops,
-		       &job->lock,
+		       &sched->lock,
 		       sched->hw_timeline.context,
 		       atomic_inc_return(&sched->hw_timeline.next_seqno));
 
diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 27caf8285fb7..fbba38137f0c 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -106,7 +106,6 @@ struct drm_mock_sched_job {
 	unsigned int		duration_us;
 	ktime_t			finish_at;
 
-	spinlock_t		lock;
 	struct dma_fence	hw_fence;
 
 	struct kunit		*test;
-- 
2.49.0


