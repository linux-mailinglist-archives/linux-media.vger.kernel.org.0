Return-Path: <linux-media+bounces-47755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD87C89F81
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CC4B4E4516
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27E4313E19;
	Wed, 26 Nov 2025 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YloxW97u"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097127B4FB;
	Wed, 26 Nov 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163203; cv=none; b=Uvy6rdrxzLH9oMWp+rBXDtMayyVWda2MnSz+ya9DvIEx4AZr7g4QJffwNL8z7PHaHPkZfdreJaze8FxOaogb3XHwXQ3aMzmmQavHF3gY5lIZCyr4ST5dA6b8hUU6KwWgXL8cElMah9fY5YCBqULcRBDWUJv5LG8XTuP9nkIZ9aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163203; c=relaxed/simple;
	bh=Sxi/6Q4jvM2wf7pGd7IQAsQCeNxuHVhX9VsDta4LQiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dpOlLs4d7ZooQBzrqhEWYCgIWetdjqsWxHbrgyEVzLlIP6cEIw9G6KV6bg0xbXR3sqHQD5ArV4ccczVN9W5bZKdF7WZty2CYtjMtDXPqjvHQVlI7yl4B2PzyirDP4FHIPPhU5J8lO/IgIDci33/6s6pnLs8xRb4N+tbZJYmflQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YloxW97u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A38C113D0;
	Wed, 26 Nov 2025 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764163201;
	bh=Sxi/6Q4jvM2wf7pGd7IQAsQCeNxuHVhX9VsDta4LQiA=;
	h=From:To:Cc:Subject:Date:From;
	b=YloxW97ukkemiEAEPPhT3JNEHRNsVszBesyclyxTRy/EnrWClbK0bOMKoj3DfHXYz
	 qoI4/w2RckPGF92iCtRSt0iYnXyoM8Tc88E/i3SGDnoJAVqj1KaIxoqV/t0KumtfHg
	 7eQHOasX20pp/F4RF8CDvu7tYubl2WDsVGsRbqWeXsn9htX/5681mjms4g1PWtPT9m
	 Z0H73pNH42qhH97McsOJran19ljL/9/E989x8UdZfitpJSEVz95DcX/Dbty5lKKfmz
	 D63AVLSZR/MJ4CnCHUZ4j/BSbAPPTzStWNmNcKA9dSOgRtNbeK2KIECPRkfHhReJzG
	 QTlTTkRMr0uGg==
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
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/6] dma-fence: Remove return code of dma_fence_signal() et al.
Date: Wed, 26 Nov 2025 14:19:09 +0100
Message-ID: <20251126131914.149445-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Barely anyone uses dma_fence_signal()'s (and similar functions') return
code. Checking it is pretty much useless anyways, because what are you
going to do if a fence was already signal it? Unsignal it and signal it
again? ;p

Removing the return code simplifies the API and makes it easier for me
to sit on top with Rust DmaFence.

Philipp Stanner (6):
  dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
  amd/amdkfd: Ignore return code of dma_fence_signal()
  drm/gpu/xe: Ignore dma_fenc_signal() return code
  dma-buf: Don't misuse dma_fence_signal()
  drm/ttm: Remove return check of dma_fence_signal()
  dma-buf/dma-fence: Remove return code of signaling-functions

 drivers/dma-buf/dma-fence.c                   | 59 ++++++-------------
 drivers/dma-buf/st-dma-fence.c                |  7 +--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  5 +-
 include/linux/dma-fence.h                     | 33 ++++++++---
 6 files changed, 53 insertions(+), 59 deletions(-)

-- 
2.49.0


