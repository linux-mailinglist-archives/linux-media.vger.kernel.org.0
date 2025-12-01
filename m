Return-Path: <linux-media+bounces-47934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 235EDC96BAA
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 05A4B343AE6
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C57304BB3;
	Mon,  1 Dec 2025 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy5mBp2w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277830214A;
	Mon,  1 Dec 2025 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586228; cv=none; b=SNb6zZDZhurqnsLGpAlGgdd2pG6eyeAIgkSDmU99Ndd8ctENJHDENJsVkPmHsU9fQ5rTrdvvXw/C9MJc3pYDPU0u7UIi6IrBvDRSVfkFTsPZ1cGHrFx8WmeMqUW1AoFNe9pkAy/XfiwlJGwK1lmh//ryFXp2PNh3c6AdNuxetkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586228; c=relaxed/simple;
	bh=ZkDMIwjBHrScHp6fwm7KhtK8mL0tvYVTa3t+hxATh8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6pj1ZO3YjVpMcVqggh+QipkzBKm0dxhyY89L/1bqVV/1wQ2rQvhF9xkSU2L9AEM8gG8x/k4vBE6lNpV3Y18SwtSzOke4YRsRG+MjcKZRUf7lwWZIAtEg1B4UFZWDuOthr3qbX0u4+idsJemxsnmNALxNKtqq516+xh0ml/y1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy5mBp2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A21EC4CEF1;
	Mon,  1 Dec 2025 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586227;
	bh=ZkDMIwjBHrScHp6fwm7KhtK8mL0tvYVTa3t+hxATh8Y=;
	h=From:To:Cc:Subject:Date:From;
	b=cy5mBp2wEMxMyGKlH3xQaBV7g+VnccD/RV/zCwoZ8jbQIVQeaCPQPsr/FzO2BmiSr
	 IbEYOgUIdi3ZbKHmdMooFnqdNgGll4P46tsjchsq51fPlpDidjoGC0NVk3l+nsxcjj
	 YTk+NWgNOskYRo6WSuBhDg6MvAMASPvXLzWzVJ+gzvuLbEAzs2z4e3G5SW7ziPC96p
	 +wJ1mdAZl4gaEDgo1BRMrQtjB2FwRY4KmMQqFsuiMYMCNbHnexgsl3DepcbVNkS2Nk
	 NnxJgWcsl8XmBsRoqmOF29V9B8r0e1aMDsc05jlRVLlns8z5mtYZpUAd9lCqhUujIx
	 e3ylYefGn9DIA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal() et al.
Date: Mon,  1 Dec 2025 11:50:04 +0100
Message-ID: <20251201105011.19386-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested this with dma_buf selftests and drm_sched tests.

Changes in v2:
  - Fix bug and don't turn the kernel into a smoking pile of ashes by
    not setting the signaled-bit…
  - Add functions (dma_fence_check_and_signal()) preserving the old
    behavior of dma_fence_signal() & Co. (Felix)
  - Use those new functions in amdkfd, xe, ttm and st-dma-fence.
  - Be a bit less aggressive and keep the git-diff smaller.
  - Add a patch using the flag-helper in Xe. (Matthew)

Barely anyone uses dma_fence_signal()'s (and similar functions') return
code. Checking it is pretty much useless anyways, because what are you
going to do if a fence was already signal it? Unsignal it and signal it
again? ;p

Removing the return code simplifies the API and makes it easier for me
to sit on top with Rust DmaFence.

Philipp Stanner (8):
  dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
  dma-buf/dma-fence: Add dma_fence_check_and_signal()
  amd/amdkfd: Use dma_fence_check_and_signal()
  drm/xe: Use dma_fence_check_and_signal_locked()
  dma-buf: Don't misuse dma_fence_signal()
  drm/ttm: Use dma_fence_check_and_signal()
  dma-buf/dma-fence: Remove return code of signaling-functions
  drm/xe: Use dma_fence_test_signaled_flag()

 drivers/dma-buf/dma-fence.c                   | 100 +++++++++++-------
 drivers/dma-buf/st-dma-fence.c                |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   6 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |   9 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |   4 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   3 +-
 drivers/gpu/drm/xe/xe_sched_job.c             |   2 +-
 include/linux/dma-fence.h                     |  35 ++++--
 9 files changed, 102 insertions(+), 63 deletions(-)

-- 
2.49.0


