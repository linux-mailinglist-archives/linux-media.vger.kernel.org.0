Return-Path: <linux-media+bounces-24528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F56A077D6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4BBD161EBD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384D21CA1D;
	Thu,  9 Jan 2025 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBxECzfY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD721CA00;
	Thu,  9 Jan 2025 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429875; cv=none; b=g8PFA1nIZT8OyQjmE45innmk5e1C20Ss4Jd9DGz7AMfPaRDEjiKtw3M0to/hH6QQKtezEByZQRXcXuho2bbsgNksw8X+44Bpkis2LaHYD9zV0gEMqQ8tDc67kNA068owuU41sb//WU/JmpEt9tkz5g3mVK8lMZaxThWQGcdVfoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429875; c=relaxed/simple;
	bh=LgjK5otK9P6hpjfRdyg4uWgSBqeILjXkQz1XpFuvanw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQmmvG1DHA3mJRGY3uCMqknlg2wUcBd/SsIuYipWlkcwOmIX2TuQ2DhorZY7mWDjcgZd01UE11g+Tf9LbuWH05ELoxI5wPGuIo65Sy09uo/JSTNNeaHI8eL6EOYRAxSlkl+qjAA17wEVWob0X6aMFHcrnHB273cqaOJg91KeQfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBxECzfY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF62DC4CED6;
	Thu,  9 Jan 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736429875;
	bh=LgjK5otK9P6hpjfRdyg4uWgSBqeILjXkQz1XpFuvanw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eBxECzfYF4678L25cL1r2fdL8TWtMa52UFDMNYkZYySzChzumDIDjul2h8jIFHRHK
	 R+YBlFIlSB2FsC5xaQabz+58qy3cQS0DKAkOUUQHxhSgx2kGV9qxKmsC4sBQu22agu
	 Szw3PSltjgwwpSUizd1nv9SSUDp9+2n6pvQzgYNyZ8j/KzwsnFbupsoXY12j9wEaZy
	 M+lAsak2e3mCzuG8faVsPWm2DRuILw5F3W13me+Wnx0Me3ekGZg7YetCWW3v+IrfhP
	 72m5kyEYX5J5qUS6KMYnV4JA5auNvmT4gW4WAryRkBJPM35kdnqsumKgI1okyo3qzQ
	 FY7o2+iOnEENg==
From: Philipp Stanner <phasta@kernel.org>
To: Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
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
Subject: [PATCH 2/3] drm/sched: Adjust outdated docu for run_job()
Date: Thu,  9 Jan 2025 14:37:11 +0100
Message-ID: <20250109133710.39404-5-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133710.39404-2-phasta@kernel.org>
References: <20250109133710.39404-2-phasta@kernel.org>
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

Remove the mention of the deprecated function.

Discourage the behavior of drm_sched_backend_ops.run_job() being called
multiple times for the same job.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d5cd2a78f27c..c4e65f9f7f22 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -421,9 +421,12 @@ struct drm_sched_backend_ops {
 
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
-- 
2.47.1


