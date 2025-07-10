Return-Path: <linux-media+bounces-37286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E27B00284
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACFE4485FE4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491D125F984;
	Thu, 10 Jul 2025 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGF6/V4O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4755233D64;
	Thu, 10 Jul 2025 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152063; cv=none; b=jvWJ4gKCV5g84g7syeB/l9iJJZe6HKBvYj19euRVu/ME7uPPVtz0P0BrggdhFKm/+HI6556sCz83mClxLJDRwG9mP3eylg/D3i1aj3Vd7n1xloFLQmI2riZNeWtouZy7pZtUyWHDt7Ed6qgAiD8eoRb9/socpmya5Ziwb+FI2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152063; c=relaxed/simple;
	bh=u74M1EW5VU19MnDPuvCa6vHxBhmEOdY3hdgjpiY39AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RFBGvQldYwFT6G62sGL9jHDG+4VY0Pvt1HmXf86OdbP/HLKSVpumDQEs8TYjWJrQKyLjkKfQCbWonx89qoo2yC1LwoD9vtuFv37KR0025SZeYc6eUwhKD7a29AMOh70NaFYMzWlu2Mh688/V8S2B1D846w8Eh1RjRZ3iF0O2uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGF6/V4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28B5C4CEE3;
	Thu, 10 Jul 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752152063;
	bh=u74M1EW5VU19MnDPuvCa6vHxBhmEOdY3hdgjpiY39AM=;
	h=From:To:Cc:Subject:Date:From;
	b=bGF6/V4O+tpNGko7XNwOq2zFo/JXkKkGGlryqxq1f0VgJ5zXzfsnQMhuWJTiMqa8D
	 8YfoE7NDTrdw6GRHlkYNZRYmUf5YVTnSw7II5pdJ3+INflsNlpHC+d72Sdkqb5P+up
	 9AhKDzmkAruXHLTwcjimh02fp1AKgM8ZzUsOr2xIDSqzzem3H4z/OSl06lntEoWf8+
	 kHgH8jKAwfzENzyAu6ICdLvYApGcFFZA/J1ATqSXp/cIF5K5+4fDFcvBY50mGgAyK9
	 N9mzyGlxNbJchAWXU5LHdDqZF5E27MD1KY/hwllnkt00pVBsdCX+iQmEkeG7cjedb+
	 puK2JwdKBRvpg==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/8] drm/sched: Fix memory leaks with cancel_job() callback
Date: Thu, 10 Jul 2025 14:54:04 +0200
Message-ID: <20250710125412.128476-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v4:
  - Change dev_err() to dev_warn() in pending_list emptyness check.

Changes in v3:
  - Remove forgotten copy-past artifacts. (Tvrtko)
  - Remove forgotten done_list struct member. (Tvrtko)
  - Slightly adjust commit message of patch 7.
  - Add RBs. (Maira, Danilo, Tvrtko)

Changes in v2:
  - Add new unit test to test cancel_job()'s behavior. (Tvrtko)
  - Add RB from Maíra

Changes since the RFC:
  - Rename helper function for drm_sched_fini(). (Tvrtko)
  - Add Link to Tvrtko's RFC patch to patch 1.


Since a long time, drm_sched_fini() can leak jobs that are still in
drm_sched.pending_list.

This series solves the leaks in a backwards-compatible manner by adding
a new, optional callback. If that callback is implemented, the scheduler
uses it to cancel all jobs from pending_list and then frees them.

Philipp Stanner (8):
  drm/panfrost: Fix scheduler workqueue bug
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Implement cancel_job() callback
  drm/sched/tests: Add unit test for cancel_job()
  drm/sched: Warn if pending_list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 68 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  1 -
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 ++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++++
 11 files changed, 167 insertions(+), 95 deletions(-)

-- 
2.49.0


