Return-Path: <linux-media+bounces-45397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BCC01C83
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F2A0F3517E9
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C73332913;
	Thu, 23 Oct 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaoMS5IW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1373328E0;
	Thu, 23 Oct 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229842; cv=none; b=lB2wIhVQ+8oiSZt2FiBLJXLuctkb+Ni6RbDvyzWRqVtpMCf+dxBFrCPt3079s61qAabKPtGkWIs/aEsmejs682HPHRcr4cS2yFoxDWkTVk2LHkTm5DDXERQ9rVwkjLoCOwSWUSlP5uvr/gUyHDqL/SFVM6s9PeByeU+Yjr8B8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229842; c=relaxed/simple;
	bh=KKelnfCVSkqGfD/vx5rJBlReymKdSnPUEgmqAjBvnWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5CD6ZmjSZXCRNN9ciK1N85cbw+xl58MwKxmXEWv64RTQdpFUzAGcVIETAhAZIw7wUlgo5fbZOsuBHJHzy9HONKTghgslOqrEai0uCD03yYKPzjWq0Dc0XRWAudGKnrE4sAbnyVcwVPh7uQfwIXUoGfK43m+ASeu30lmsScrp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaoMS5IW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F4C4CEF7;
	Thu, 23 Oct 2025 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229841;
	bh=KKelnfCVSkqGfD/vx5rJBlReymKdSnPUEgmqAjBvnWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oaoMS5IWKn09HH1Iw8y4mS8NYzgZ+j+8ai1+ykb2cuEA9dKN6TRAp34bmiSZ2foYZ
	 kvkUd4x46kK5ITscsZGS2nxjTxYCWiPW3b0/sdQaV7PS4o0mNjyj8V+S75fOnRPIwl
	 GTlqompY+aSI5A+7rMfU41iuuW7epavWKCxwTTbKfNFqD/vOSHncyIAKZpH0l/cSWC
	 QbyNgQXgUn2gnnQz74o5cstNQJNrghrCGRNNdUB+oBspT3tPnSWsjtEjAi8oQKzhKG
	 SnjxNRRdQor6OV1otmPBktZvUruprJCzj7DIj4iLuPnf2YRjW3Fem69jfPoHdZM9i2
	 1qX1nAqqb7Idg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/4] drm/sched: Remove out of place resubmit docu
Date: Thu, 23 Oct 2025 16:30:28 +0200
Message-ID: <20251023143031.149496-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
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


