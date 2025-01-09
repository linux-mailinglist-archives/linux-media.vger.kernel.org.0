Return-Path: <linux-media+bounces-24526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ACBA077CB
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F740165189
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCA421B8E1;
	Thu,  9 Jan 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rox712/S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92221A45E;
	Thu,  9 Jan 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429859; cv=none; b=E3GK6lyrGwj80l5TmDLgmBITVnuiuJkguM0fqVAw7Df8WbDtCMhXlHfw/nir+3KaFsDJF9z6BjCRAcj3lWZauCVDvxP/pTU7OjWe4FoU+1vGWt/N1IAAKQoK9GgxIurE0YNe2iqtOjFtXNw2SY5G8hbHVU5sYUdEhAh44XoaY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429859; c=relaxed/simple;
	bh=HGkCW/M1y6D9k2/Wp6dPN6QlebActNNsrqeAzQJEoY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrZKcMjUaploGW0sZuhp522oNLe9KGLthpbIhKtX2PUBl2pnKyK0dpXSd787xWRzlZKCfYB6PrnbxEO4F6ozH20l47hys94zDfED59TLXT9i9px5x85zaHcjYX+D6mshMmXXs17fyc1IaBDDmj2lUvwIQFpfM1suPpAD7ORW+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rox712/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0375AC4CED2;
	Thu,  9 Jan 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736429858;
	bh=HGkCW/M1y6D9k2/Wp6dPN6QlebActNNsrqeAzQJEoY0=;
	h=From:To:Cc:Subject:Date:From;
	b=Rox712/SokhN6VA7aVSyHvdQ75vCF/A8BQJffVATtxL6K2MUXcIqAS48SgqxyvG0W
	 r0nr/cm5bb1UKHyJmaDOzHI8S0aFqNIYeZCFSphkBXQLTwjLX+HGM3bhh2vxEcWSrI
	 Mv01lEPbncZJV4RzYWB508zgbgxrAv7szAi//JdK4FtqWcPn2YGVDno1KXP5rr2h09
	 W/brOX8F+Kkih/dfUWJFSUYCZ00CqTTj2RbGKjpVfyGXil2WfN6q5rFTXJa9Bl1ZYx
	 cuovlWDxyKPNA0cBGgM0RICj+ElSKUo5cK+nvtbN82f4k4CssRITYvZc2LABhlnTvQ
	 Pk1PNyVniSHkg==
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
Subject: [PATCH 0/3] drm/sched: Documentation and refcount improvements
Date: Thu,  9 Jan 2025 14:37:08 +0100
Message-ID: <20250109133710.39404-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

 drivers/gpu/drm/scheduler/sched_main.c |  10 ++-
 include/drm/gpu_scheduler.h            | 105 ++++++++++++++++---------
 2 files changed, 77 insertions(+), 38 deletions(-)

-- 
2.47.1


