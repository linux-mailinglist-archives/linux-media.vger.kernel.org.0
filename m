Return-Path: <linux-media+bounces-26272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B1A39A37
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B03172C6D
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 11:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8674E23FC68;
	Tue, 18 Feb 2025 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGl1DWoD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA623F276;
	Tue, 18 Feb 2025 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877194; cv=none; b=FmwLd+i7Sou6n/nnBIq4zQP91VIwM2epxpweM1qfEB2wAzadQwJtWvUCFIl9nDveEBsNBst36yBiF35HDCwT5Ys46QdIA6OnSDDITXh+NIGNAJQA1Wu+davuFkWu5EZNurPtQ5KRe9VVbQCxLRGCVFP2Hg7IhB0oju78xt8d2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877194; c=relaxed/simple;
	bh=ryBWSSH+vxnj25RO828aq+7FfD30J+Zn25JvG2s5aZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QssIaYle7fMiMWMeyIDEDPMShNxK1ZJttBBP/uUi82flK4tbN6gSgULaplu4NcatApAya6ZxHQcAom32HsDmlQea2nozxwfFTKOSDAp5pFkar6D73fwXYWTnZifOwIcvJ4dEZNtAk/ftVwCqVo30mkC6c6miOMLuIVGTzF20n20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGl1DWoD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E7BC4CEED;
	Tue, 18 Feb 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739877193;
	bh=ryBWSSH+vxnj25RO828aq+7FfD30J+Zn25JvG2s5aZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGl1DWoD4yPr9flUvAElnD7BmbAhxGOWSg2uq3MVvp5CfT2MjsIjogEjO9sV+eJrC
	 d7YGG5zAfnsfMh3lB2crsOmzQWlJHnq7iBH6hzXGfKfcEiW/9GuqnNz7SUweysVnW7
	 3FHDgLhzdvjkfkg0pkZN/AFrowBUTPv+CVVFWjUssENzGeJ4qPxlQ3ZN6ExyMFzAfs
	 s+A95S81MDXoYn2ejkcKkpMLE8FZeNFU2u2j6f6/tNF6XuD3LvZuQC9bf3vu8ayIql
	 abkX2haLB74Z2sTQIrMt8kspozJHxxN79yAOiL68J/os0GW0+rifzQbJmC9vL58YeG
	 G8Hh6vpTWHsCw==
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
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Tue, 18 Feb 2025 12:12:46 +0100
Message-ID: <20250218111246.108266-4-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218111246.108266-2-phasta@kernel.org>
References: <20250218111246.108266-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for drm_sched_backend_ops.run_job() mentions a certain
function called drm_sched_job_recovery(). This function does not exist.
What's actually meant is drm_sched_resubmit_jobs(), which is by now also
deprecated.

Remove the mention of the removed function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 916279b5aa00..3fc43c6dc405 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,20 +421,24 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters.
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * Returns: dma_fence the driver must signal once the hardware has
-	 *	completed the job ("hardware fence").
-	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
 	 * this fence from the callback. It does not invoke an extra
 	 * dma_fence_get() on it. Consequently, this callback must take a
 	 * reference for the scheduler, and additional ones for the driver's
 	 * respective needs.
+	 *
+	 * Return:
+	 * * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * * On failure: NULL or an ERR_PTR.
 	 */
 	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
 
-- 
2.47.1


