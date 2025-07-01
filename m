Return-Path: <linux-media+bounces-36430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D73AEFA64
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F8D189704B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C398B275B0D;
	Tue,  1 Jul 2025 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9MBxLw+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8B275AF9;
	Tue,  1 Jul 2025 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376142; cv=none; b=Q8p7LzvKnniD/zF+GL8AfdyDiCavu/3glJAJ+mrhht/Pi7m9PI06Tnh/PuJrOmewTN082oYgArliNRtWr2NjCVDZ+9BEj+a6CzxH9BADW0S9jZmMWRTl9h+Gh+6Tc/yQS+1U0SvUf1qfZHbWNT5xMAFdJJAyP+/Au5xe+pIQ9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376142; c=relaxed/simple;
	bh=whKGu+ajEl81bP78bhCwKxoEBbt3SnanKihrJ68af28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUJEYConIw43eNjr/1swnxZ+47pueakUguQyfXxZWSN4eoNp+/EUJt0iUThHvU0NCG/RdRiTFYNqKwuxNhO+4KhZK7ggjudcn6KEfhPdfAlAcwGEQaD8inWR53B9Er59J2qk+k9Q8m9MWoO04Ye+OVY+jk2wSx4PesPCKd/ZmCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9MBxLw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6047CC4CEEB;
	Tue,  1 Jul 2025 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376141;
	bh=whKGu+ajEl81bP78bhCwKxoEBbt3SnanKihrJ68af28=;
	h=From:To:Cc:Subject:Date:From;
	b=f9MBxLw+WmrIjPXSZE8GyJti6//XFK/lTygH82PpOqzF7Q2mA+9pwfjjGNVYr5gVG
	 1/X3jl2RaiUAg52bMKpKEq93yPaCtzNa6kXEHmFBBJcT16BmAUxGiIFLv6jMObCwjp
	 VWLvVopZv+5zIRGDCXecaMrkUzJRXWxnxxEP5HQSGbFAziix4xDar445txDM1zgmq9
	 FmWG50Hx4/JS/DaMbargGwcFp7MEy1cuT3fNP/2NA6DnCFHcp83FE2rr5iwmkJvAPE
	 51rJK6Frl05aLeM6S+TqO2rZRIbGwvPsRkujicUu/wqIL8AmEo0ekGCBwCiaXg8Klz
	 NDx64lkwoPzNQ==
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
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 0/6] drm/sched: Fix memory leaks with cancel_job() callback
Date: Tue,  1 Jul 2025 15:21:38 +0200
Message-ID: <20250701132142.76899-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since the RFC:
  - Rename helper function for drm_sched_fini(). (Tvrtko)
  - Add Link to Tvrtko's RFC patch to patch 1.


Since a long time, drm_sched_fini() can leak jobs that are still in
drm_sched.pending_list.

This series solves the leaks in a backwards-compatible manner by adding
a new, optional callback. If that callback is implemented, the scheduler
uses it to cancel all jobs from pending_list and then frees them.


Philipp Stanner (6):
  drm/sched: Avoid memory leaks with cancel_job() callback
  drm/sched/tests: Port to cancel_job()
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
 include/drm/gpu_scheduler.h                   | 18 +++++
 8 files changed, 122 insertions(+), 93 deletions(-)

-- 
2.49.0


