Return-Path: <linux-media+bounces-37191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF7AFE848
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 138D17A96B3
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62232D8368;
	Wed,  9 Jul 2025 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvlIVi3E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D52957CE;
	Wed,  9 Jul 2025 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062001; cv=none; b=Fd6lw3/d51HpYB5FMpZw8W35S66zAfiyPQjyTpRXEgJ2XxcgJVBDBPJ+onBnMtj1qHveBbRTQgM06+Nq/Onth0m05WkkHV5Lc6Yq0AJI15UFtJ11v4JoBQovpIQb0oJGLSQrzpI7pYCpbTenDOKbgovOH7lUtXbW37kp8zJQbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062001; c=relaxed/simple;
	bh=CzB6mDElDR+VEne/1VLgWZHCNaUK9k/sY72VkqmQsB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oapKtL1P5D2nGofZeqflMcjMIl6Gcf896IRcDLr6dgzdDPG6gnzIAP3TaZ7VDjN4eZjdXr8twC+cjY5twI2QE1r9yOqPf5bHhzIkZCgulEKpgvIl4Ksb4vdfNUl0jj5A7VgoSrfXpRYCiQ400sLAvCRL7ZTRQWYksAUZFEWHpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvlIVi3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD2CC4CEEF;
	Wed,  9 Jul 2025 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752062001;
	bh=CzB6mDElDR+VEne/1VLgWZHCNaUK9k/sY72VkqmQsB8=;
	h=From:To:Cc:Subject:Date:From;
	b=PvlIVi3EIvVO8SXFThZm0t7FVpOUXK7jeODwMyf8k68JZqM4sYH7x5C2PPRxB3yJe
	 kOVIpqpz+41eNjPwvzSTn+CxXFicIrOq9Q1bqV+arXsVfG0A2tJpsFWhwqk4+wNPOz
	 C3ze1Q+CHpb8YSYSsa6rKUdvAweYNbqy1lpyYW45JEeYFBSiR6+R8U3zE/QzXXq6D0
	 JsyPB6p2OlBoRIGayNZ3XkCmHdPJGJtt2YLvePNtUSGRHMaZd1Nvn0/SpEwc4iME6w
	 YtxKALfZ7uk+9qhBWU4nZFFopGTm+nhrIOt1qQasR78eeKOPzvkWz54btF2iRzw+jX
	 DgsMxbpY97Vlw==
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
Subject: [PATCH v3 0/7] drm/sched: Fix memory leaks with cancel_job() callback
Date: Wed,  9 Jul 2025 13:52:50 +0200
Message-ID: <20250709115257.106370-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Philipp Stanner (7):
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
 drivers/gpu/drm/scheduler/sched_main.c        | 37 ++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 68 +++++++------------
 drivers/gpu/drm/scheduler/tests/sched_tests.h |  1 -
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 42 ++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++++
 10 files changed, 166 insertions(+), 94 deletions(-)

-- 
2.49.0


