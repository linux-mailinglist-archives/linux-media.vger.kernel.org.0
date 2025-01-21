Return-Path: <linux-media+bounces-25057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B4A180F5
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 16:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD91F7A4413
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDD61F426A;
	Tue, 21 Jan 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOXIrtyv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95327702;
	Tue, 21 Jan 2025 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472612; cv=none; b=DOqQso6B7RHnI4FpQ8kFCF9NIdkYIkXoY+fVbLYzBFNxv+da2g8d6qXUoa9OeVtLFquUN8xxeY3nfilGlq6lLaPLY3qXJiLe356YSxbbQflpjGE9tpB2k3mGznLXGiKnQtsyOHrgp7n2xHZd4sZWjeZPuGTcnE7PSYjzjoy7rKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472612; c=relaxed/simple;
	bh=OiXJvgk8kbxD6gc50ANNpufqFzqJSKtUAwGGdTi3SdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+pTK7Z1xb9SGrfYeDkgiazq/DIiNoEHQUJ3glC1a655Xt+iRSEP6GAm0YkoqZBSVMFGQlMWODkxMgJ6MwZ4DYvbSgKA4d02oIQLjSGhvcUgjcHOrjiIjhsZM9ts542yeCShrr1VbhtaPj2ohK5rFIPgiszVYDzp59OJ6UUfu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOXIrtyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4DCC4CEDF;
	Tue, 21 Jan 2025 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737472611;
	bh=OiXJvgk8kbxD6gc50ANNpufqFzqJSKtUAwGGdTi3SdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOXIrtyvJEOOkDbQQlfrcMjrB7BCN7aOql+jys8FxWvjhI1kKWV7jrRaSEXd3RNZ1
	 5DMMNqlnIU+FB5/3TriE5r3TB7RzvlKlkum8k/CAsfpph6wve+O99+808wn8eSoGXv
	 VZCgW+GvvODfDJ0W99zFJW2JnIXLIsF4XxGo6RIF2C/dUzAmwN3k9Oobsbd230g35+
	 qwtZ+y0p+/goOoIqJUh94z5x52doVAVhq2CXKRw+KaZNZ0B3FkpjMgdCixS+sGS3mt
	 FLwTzMp/6sgSDuQ0tFfJS8cAQLh3z3jLrYzgyyTGcDez2IUu/DoOa9MQzSuBhedQi7
	 F6rw4unU0kMeg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Tue, 21 Jan 2025 16:15:45 +0100
Message-ID: <20250121151544.44949-5-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121151544.44949-2-phasta@kernel.org>
References: <20250121151544.44949-2-phasta@kernel.org>
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
Folks, I need input for those "refcount" rules. I say that we either
delete that section or someone (Christian?) should provide details about
what those rules are, as Danilo requested.

P.
---
 include/drm/gpu_scheduler.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d5cd2a78f27c..cf40fdb55541 100644
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


