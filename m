Return-Path: <linux-media+bounces-37004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCEAFB4D3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E1E18953BB
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F2F29E0E0;
	Mon,  7 Jul 2025 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcHylehk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633E28750E;
	Mon,  7 Jul 2025 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895750; cv=none; b=USiOxctkCVuNX6y39AlSt3YKKG0W0MX4xzLSuOMQ6/F0lH13BMWjhpztfQ3rQDPbBbtPcgyhuEyqPR5ylM39+AgHy5HOJJrqvke0YGoHhG1xZIrNrPskm8gNusYxl7BOdATkmXAh39kBe4XubqMzv/cxcUXQettLroQk0QViGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895750; c=relaxed/simple;
	bh=VIeOoT9ZnXv6E2NaHqTSzrn3b9DbwMxUShiN0VuJpJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KX6MJ4xGjM8M0jLNoG7vO/+CaCtUHtAxGsx/S1mxNz7YS4B2R1W20zlkOQ0xmssODvZ/LM+PSmRbmEDFtmyZwHro8mVyb0BxpxBbJqlRu99ia+yjLtFRXB5veiiOPbDWPKecqk5BIfALzFlgaw4U5e/Q8i2FFIVYSMMaQaIM7O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcHylehk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B102C4CEE3;
	Mon,  7 Jul 2025 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895750;
	bh=VIeOoT9ZnXv6E2NaHqTSzrn3b9DbwMxUShiN0VuJpJE=;
	h=From:To:Cc:Subject:Date:From;
	b=lcHylehkHJjr5c1vgbo3YTN4xBnKvAGa4BBMPUVQ4fKap0/8mD8B33OsKaOnkjBCN
	 ESGJsNcY5MR3zS/xbQCaGchtsFkGNJ5wip62OS29+yWkaAehGt+dGOqJUreqVIFahv
	 8T0FeFSvJxUYR66mdPC45kqUA2+EA8GwMCICd/uWVL8/qbdU9p4YoIQ/Ill/gjL8rF
	 gqxUrcwtMIFanLeRibaGKPW5OflTTQWDE7hx8YUhm2x7BUG4PcV7GdN9+w0/aVk0Pl
	 m/l9/uD16HM9TrDfff+RXNz68TZuPX5FWiqIA44DnncYOJ12GuW0nKy10Epd02YQQ5
	 DJM5FNEnhnBOQ==
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
Subject: [PATCH v2 0/7] drm/sched: Fix memory leaks with cancel_job() callback
Date: Mon,  7 Jul 2025 15:42:13 +0200
Message-ID: <20250707134221.34291-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
  drm/sched: Warn if pending list is not empty
  drm/nouveau: Make fence container helper usable driver-wide
  drm/nouveau: Add new callback for scheduler teardown
  drm/nouveau: Remove waitque for sched teardown

 drivers/gpu/drm/nouveau/nouveau_fence.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  7 ++
 drivers/gpu/drm/nouveau/nouveau_sched.c       | 35 ++++++----
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  9 +--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  8 +--
 drivers/gpu/drm/scheduler/sched_main.c        | 37 +++++++----
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66 +++++++------------
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 43 ++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++++
 9 files changed, 165 insertions(+), 93 deletions(-)

-- 
2.49.0


