Return-Path: <linux-media+bounces-25806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34616A2C2D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D06C188DA9F
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087E91EEA2A;
	Fri,  7 Feb 2025 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGKUbyRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D1533EC;
	Fri,  7 Feb 2025 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931837; cv=none; b=ELb8oORbveSkIfjAFSC63RUQAVWcf0wff/b6g1vSBZWE4ME766rnNTvxY7FSVkVY91IYOsET5RLWeAliWgv211nnK4qoP0ZJmlt6Cn394yZ/rOTgCF3hwL9ZSRw2Ukhs6vfEm14vNF6LWdwJ/t/g9RIZQxO8m+DtfMXk92CZ+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931837; c=relaxed/simple;
	bh=KObGuLxNso7rtKMvpX2NnwNbW6cYh78MQmuHsn1FJpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAgVNYmxFP9Y+jWOpLGFIorukHcA1ra/TvrGJTkhFOjiFM33qJSaOJhpaPyNTvigo7Re6Vk4jZ4iBkPyvD1ZDBju3kRei3JzISxNyVCZzdoTDCwxOuAfUvKdamwhBs0cATSOPigQ/RvhQCMYkEvAbHiVkO8OkJSEKn0wNIpFrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGKUbyRQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8611C4CEE4;
	Fri,  7 Feb 2025 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738931834;
	bh=KObGuLxNso7rtKMvpX2NnwNbW6cYh78MQmuHsn1FJpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGKUbyRQKx3MU+JfqRnxEcMecdzuHU30Lar7Owxx1UttWvJrheuvIIB5TcdEpqKil
	 laZz8J8+3bIG3e9a9UEUcW/hWRzYyWpYSwv47B9QcYv2XLKgmAVABSmcmLsucb3pyW
	 XJfzSDAXI57Y91+YGD9jinG9SXVoUIzE9o8xJAm0LIOR0iHCDMD/1WY1NyFpqA88th
	 T+BWJgVdNisxyOD9kKHjblIYrrJMRTC34woyGSDumYxSyqnFJqE0dx1O8zIh2oKray
	 FPIRqqG0EZvs4/VjRHNYQqZd/A8gwN5XCR+qffSPzMdP29saa7MGyGsgPJMg/auRw+
	 V1c3G7DRU8HgA==
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
Subject: [PATCH v3 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Fri,  7 Feb 2025 13:36:52 +0100
Message-ID: <20250207123652.27677-4-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250207123652.27677-2-phasta@kernel.org>
References: <20250207123652.27677-2-phasta@kernel.org>
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
 include/drm/gpu_scheduler.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 38d2053528c8..8c1a6155011d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,14 +421,19 @@ struct drm_sched_backend_ops {
 
 	/**
 	 * @run_job: Called to execute the job once all of the dependencies
-	 * have been resolved. This may be called multiple times, if
-	 * timedout_job() has happened and drm_sched_job_recovery() decides to
-	 * try it again.
+	 * have been resolved.
+	 *
+	 * The deprecated drm_sched_resubmit_jobs() (called from
+	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
+	 * same parameters. Doing this is strongly discouraged because it
+	 * violates dma_fence rules.
 	 *
 	 * @sched_job: the job to run
 	 *
-	 * Returns: dma_fence the driver must signal once the hardware has
-	 *	completed the job ("hardware fence").
+	 * Returns:
+	 * On success: dma_fence the driver must signal once the hardware has
+	 * completed the job ("hardware fence").
+	 * On failure: NULL or an ERR_PTR.
 	 *
 	 * Note that the scheduler expects to 'inherit' its own reference to
 	 * this fence from the callback. It does not invoke an extra
-- 
2.47.1


