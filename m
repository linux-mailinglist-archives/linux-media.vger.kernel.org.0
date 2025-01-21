Return-Path: <linux-media+bounces-25055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19EA180E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 16:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4296D7A4302
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 15:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C341F4E34;
	Tue, 21 Jan 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk8xJK6G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AC1F3D47;
	Tue, 21 Jan 2025 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472559; cv=none; b=h+WJqfVziWX+m5d7DOdEQQdMsG+iF1ips3dCCGbwB+lpvvovFebZk4lh7qmPN2J1eOvqqAdaEMOI1cec9DNt5Ecc0tsrlrzwww4LjogtDPP718Gd2Xnp9xuCoim5LF/gh3Qgb+/hvlZXgkVvihyKQSOV2tYLtqJUD7MLyrUK6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472559; c=relaxed/simple;
	bh=+nIjqYD/j2RTpJxB2Fsvg3Iv/g326EMXel5aJPmyIj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlzsW0rjPN65lpo+jvYViSub1zhWTQJHaSYDkBNY3Sk8IWtM1wJpKrlcIc10EntfaSuELMjLsVRRuNjZAclDnZgkby5mg0HYx503uWLnQ+P/hlcSTPvYJE/79Nh5dzUWML4wXK/q38Lx2FONxfKWuVy1ukoRXD3C4MYAQeVQBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk8xJK6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388C0C4CEE3;
	Tue, 21 Jan 2025 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737472558;
	bh=+nIjqYD/j2RTpJxB2Fsvg3Iv/g326EMXel5aJPmyIj4=;
	h=From:To:Cc:Subject:Date:From;
	b=pk8xJK6GzwaH1fN8KBMMPadPwh8ZBSvwvHqfmmAEeImMJbMyu2gNofem4rDklUdFG
	 N3gVPIqdGutH1zAXAAjdaB7+mJYEvSnDjVmr+yncCXEX7zAYbhsufQfrasBVvr7Ar6
	 3MXegwxKdxsqFTan2egweANthAwMPQELa3Y8/MHEfjcyLi9kUzlgq036C0YLKgStqJ
	 KTZBFgSFRB0l8VVj8lz358643DL0YrqFwWgFU3+iubJuURHkXKsZNOTyTX/4Qa8fAE
	 5tJs6FPq0/2cJQbtKi3aP8Rkx7SWtx+fCEHN6D9iBz0sdVO6XDq+srhSVkM5B5BZa2
	 sFj5G8yglZAFw==
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
Subject: [PATCH v2 0/3] drm/sched: Documentation and refcount improvements
Date: Tue, 21 Jan 2025 16:15:42 +0100
Message-ID: <20250121151544.44949-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Document what run_job() is allowed to return. (Tvrtko)
  - Delete confusing comment about putting the fence. (Danilo)
  - Apply Danilo's RB to patch 1.
  - Delete info about job recovery for entities in patch 3. (Danilo, me)
  - Set the term "ring" as fix term for both HW rings and FW rings. A
    ring shall always be the thingy on the CPU ;) (Danilo)
  - Many (all) other comments improvements in patch 3. (Danilo)

This is as series succeeding my previous patch [1].

I recognized that we are still referring to a non-existing function and
a deprecated one in the callback docu. We should probably also point out
the important distinction between hardware and firmware schedulers more
cleanly.

Please give me feedback, especially on the RFC comments in patch3.

(This series still fires docu-build-warnings. I want to gather feedback
on the opion questions first and will solve them in v2.)

Thank you,
Philipp

[1] https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/

Philipp Stanner (3):
  drm/sched: Document run_job() refcount hazard
  drm/sched: Adjust outdated docu for run_job()
  drm/sched: Update timedout_job()'s documentation

 drivers/gpu/drm/scheduler/sched_main.c |   5 +-
 include/drm/gpu_scheduler.h            | 106 ++++++++++++++++---------
 2 files changed, 71 insertions(+), 40 deletions(-)

-- 
2.47.1


