Return-Path: <linux-media+bounces-37197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB7AFE860
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81E2583BB0
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376912E03ED;
	Wed,  9 Jul 2025 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWqgbQc/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D442D780E;
	Wed,  9 Jul 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062029; cv=none; b=fMpFx/x3l3J2mfqS2Yp0o/sI+2QQnCBJNHtQFbeatfJcc7jbd0/V+ygdnbO8sLN+92RGx1rk3RMpRzVUPhmwLi8qebHPet8glk2BQbx1C481/EaKoPg9JSD2K1YaqoGUvmaHRI0QtKhshWBPOR70wLPlLFcV8y2Ruv9xFNTK6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062029; c=relaxed/simple;
	bh=IPadNyzazGr54PAKwUSWd3Gd6sWe9Ohiu/qKagtD5Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taHu8dzkZuEioha5bQpmWHP90cPks0v/xlH/EsKONwgOK49OMgL5ro1Oj4iXwmQmqDhGynocQ9ul0zQYfqlszy8ImDOluiiktOauK2Ac9R7V6Vt72IicJieWnw8p020Tz/XEGaDQAirsq6i+aIrYW/VSMXj3YIlorwIJCjzMnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWqgbQc/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49752C4CEEF;
	Wed,  9 Jul 2025 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752062029;
	bh=IPadNyzazGr54PAKwUSWd3Gd6sWe9Ohiu/qKagtD5Uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RWqgbQc/NwpLyAV7TVCfpisO2Yk8RxFE/h+0Fc7ry4hLWetS/NuL4yDK6VVqr8TvT
	 igb9JZtnJ40e5RCTWygJUcg0QibKQKAXy45GlMbtNPAjOm0se9G3hkLLWIMM/pBBHA
	 71BIqEIFwOSvfnWB1+CWHPS+rNpYWlY8BJ02TmJeDXMGngAT+Yes0F0i6Quff+evwE
	 ksfthBrCSmEyaGrz2FDSCzMQ5MMv8QGJFOHicJX7qXDyb2+UubxPHpGRfofMyv4/h4
	 EdnsUn5dVnng/+5RhXuQh1WbSS7u+r4ds8KEKkRdHOyV/qQOhJf7/0D/8NKm/Bqa3W
	 1MNR+ZYasJtvg==
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
Subject: [PATCH v3 6/7] drm/nouveau: Add new callback for scheduler teardown
Date: Wed,  9 Jul 2025 13:52:56 +0200
Message-ID: <20250709115257.106370-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709115257.106370-2-phasta@kernel.org>
References: <20250709115257.106370-2-phasta@kernel.org>
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
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


