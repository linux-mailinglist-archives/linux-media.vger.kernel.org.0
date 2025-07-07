Return-Path: <linux-media+bounces-37010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDBAFB4EC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615733B5C16
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF4E2BDC06;
	Mon,  7 Jul 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6XocvBv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D44594A;
	Mon,  7 Jul 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895777; cv=none; b=IZlepTvVn6xk1ztfqF0knprgV/5VO53rKhh9wKmzwNNmJDYcDJHOdEd1/gK1UKsPncA+MjhQhQ7vEzGzsqTXtFigSs9/bqgkIsSNIfabGjDvLYRpBMlIr09bwtryK6u1xKGVrNvhjqNh2ruY13TL/jAkvMgAZ8Vi+/MiSApfwjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895777; c=relaxed/simple;
	bh=YPEvwsrhEYilovZE/FzKLWSDVL/XkoOF8+zmDx8isVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFFrchjYmxzfcnZaaGpeNsL7lsd5GzlgBHFjq0Q31xn8hvKfZRgUU57+6Y/SEUO46j+U6Wd0dkLqGcZiI9VfCmKNatjVRcz2C9MC44PlYEx+R78axb8s9k/xVBEE45/RmlV24NpvRZ30GYMAeEbbr4RQCsaSuRs0My7IXR77PaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6XocvBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5BDC4CEF4;
	Mon,  7 Jul 2025 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895776;
	bh=YPEvwsrhEYilovZE/FzKLWSDVL/XkoOF8+zmDx8isVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6XocvBvqNUB5/9tCW7d8fPhNJFKSQMo4bgJIqkJp2LyWU6RQlPwZf31Jb+UN0OBu
	 lNUqkl9Y/oUiJZ930NUmN4vKajMjqHq5sYyK8r/7U6LN9ceo90L8M6JrsxkDQi+J5u
	 mgDJOTQFkRfgcWbAzn6XEfR5rliAly+leHYK5BW6E5bvIsus1LQzKwkxN/A1II/K1L
	 kejRTDxLnQIiA/b314drqx6M5Kqn+fJH7uCvygv3Kmg8Y/a2hXJg39Ky9H2d3BmOmf
	 oyYY2uWyTNFtTRCtAw0oBeB7OC6m4QCDsbUrS81G7712SxsQkxZq7R74S8WGlqy1P5
	 hasr6upNTcCng==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 6/7] drm/nouveau: Add new callback for scheduler teardown
Date: Mon,  7 Jul 2025 15:42:19 +0200
Message-ID: <20250707134221.34291-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707134221.34291-2-phasta@kernel.org>
References: <20250707134221.34291-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a new callback for always tearing the scheduler down in a
leak-free, deadlock-free manner.

Port Nouveau as its first user by providing the scheduler with a
callback that ensures the fence context gets killed in drm_sched_fini().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_sched.c | 15 ++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..9f345a008717 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -240,6 +240,21 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	return ret;
 }
 
+void
+nouveau_fence_cancel(struct nouveau_fence *fence)
+{
+	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	unsigned long flags;
+
+	spin_lock_irqsave(&fctx->lock, flags);
+	if (!dma_fence_is_signaled_locked(&fence->base)) {
+		dma_fence_set_error(&fence->base, -ECANCELED);
+		if (nouveau_fence_signal(fence))
+			nvif_event_block(&fctx->event);
+	}
+	spin_unlock_irqrestore(&fctx->lock, flags);
+}
+
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 183dd43ecfff..9957a919bd38 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -29,6 +29,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *);
 bool nouveau_fence_done(struct nouveau_fence *);
+void nouveau_fence_cancel(struct nouveau_fence *fence);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
 int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 460a5fb02412..2ec62059c351 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -11,6 +11,7 @@
 #include "nouveau_exec.h"
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
+#include "nouveau_chan.h"
 
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
@@ -393,10 +394,23 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
+static void
+nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
+{
+	struct nouveau_fence *fence;
+	struct nouveau_job *job;
+
+	job = to_nouveau_job(sched_job);
+	fence = to_nouveau_fence(job->done_fence);
+
+	nouveau_fence_cancel(fence);
+}
+
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
+	.cancel_job = nouveau_sched_cancel_job,
 };
 
 static int
@@ -482,7 +496,6 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
-
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
-- 
2.49.0


