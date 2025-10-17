Return-Path: <linux-media+bounces-44906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7DBE8FCD
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 477DA1A623EC
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0651434AAE7;
	Fri, 17 Oct 2025 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjkzgWyN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2B6C120;
	Fri, 17 Oct 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708872; cv=none; b=jZIaWUvXMo5UyZq/WsCBihaxRHPZ4jfXWSdsTlI5P0vB9k6l5+8jXL/blWWbKUJJSOf4bijeJkOz3AD6VuYGKU3mmMFDrx8pCDlbBzONlJfk1PhxJseCOfp45o8TIfyBhkCinWX7IbkG2StIm+CbF2j4P55RQBXdnmBFEmSQZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708872; c=relaxed/simple;
	bh=KKelnfCVSkqGfD/vx5rJBlReymKdSnPUEgmqAjBvnWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCVtsny0wZj24nETzYf4PqTb06lY4FjZs46XkyYJdIw0bPGDxNg//6DEGYbomXQtTg2a94WhXG9KoEGZHjpt42H/JT/oD5Xs8K/vk0/M15TlIpL1slSKteaRoSM2IIeZep7udLvP3Wz4VqQMTXZhLBuT5jlqGt4ZJB2FKSxRhg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjkzgWyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C0FC4CEF9;
	Fri, 17 Oct 2025 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708871;
	bh=KKelnfCVSkqGfD/vx5rJBlReymKdSnPUEgmqAjBvnWQ=;
	h=From:To:Cc:Subject:Date:From;
	b=VjkzgWyN7WvWpRW4x8oP8VL3Ug4dDalsjXbaCr7N+ZNXWeybQuMzO64xxwITP0iPE
	 O2tDxVLF+k1kf6X04+DUnehUVHkXf9J1iLK9WlCpSGYqWx5CLpMHYmkxwO41VeA9W2
	 SEPSbwIiSW9VfFJ7UCxVwCDGECYoAfeveSk/IiBKUg23Xs2RNC3OZPYVgw1ZBMDrgz
	 xfS2yRFxC/HvVcwUJsiTpvbRR+tkhLoaqhoExkrsUqxb4IQ/bENOwTVFGNKveMXwz2
	 I2GlDim2ywJ7hqkxNBoqAVhkn7Ycn7VlSWpRQkTbdD3F3Mi+xPMabdUBFBmBCm4so2
	 ZCGBv+1kN32ZA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/3] drm/sched: Remove out of place resubmit docu
Date: Fri, 17 Oct 2025 15:47:01 +0200
Message-ID: <20251017134716.187723-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for drm_sched_backend_ops.run_job() details that that
callback can be invoked multiple times by the deprecated function
drm_sched_resubmit_jobs(). It also contains an unresolved TODO.

It is not useful to document side effects of a different, deprecated
function in the docu of run_job(): Existing users won't re-evaluate
their usage  of the deprecated function by reading the non-deprecated
one, and new users must not use the deprecated function in the first
place.

Remove the out of place documentation.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..9c629bbc0684 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -429,16 +429,6 @@ struct drm_sched_backend_ops {
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * The deprecated drm_sched_resubmit_jobs() (called by &struct
-	 * drm_sched_backend_ops.timedout_job) can invoke this again with the
-	 * same parameters. Using this is discouraged because it violates
-	 * dma_fence rules, notably dma_fence_init() has to be called on
-	 * already initialized fences for a second time. Moreover, this is
-	 * dangerous because attempts to allocate memory might deadlock with
-	 * memory management code waiting for the reset to complete.
-	 *
-	 * TODO: Document what drivers should do / use instead.
-	 *
 	 * This method is called in a workqueue context - either from the
 	 * submit_wq the driver passed through drm_sched_init(), or, if the
 	 * driver passed NULL, a separate, ordered workqueue the scheduler
-- 
2.49.0


