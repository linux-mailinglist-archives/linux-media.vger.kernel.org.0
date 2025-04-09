Return-Path: <linux-media+bounces-29734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E729A8244A
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10BB01B8051A
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A79325EFBB;
	Wed,  9 Apr 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8MpBv/V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D425DAF1;
	Wed,  9 Apr 2025 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200430; cv=none; b=JGrdBhBN4NPZeV92SdfeJnrHwQ3uCqUHzwtlAl7nAzQm2fFUUf/HSytigxcjlOKATBa8GQgn3V3sxgyL0pqDAxNVQEnTOLMV9UcZZcY3YVjNNLZxDKwa7nwuKHAcC7Fzqid7/bEwo/fSzAOmjEL5DUnLF1DrCrRH1TxIA8EgaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200430; c=relaxed/simple;
	bh=CP4IzQPsQFU05CPteWgLrKp8oO61tr2PBS7gZ6n8ASw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ckeJNVYkPsQP2HOXXtUDnYQ6nFA6OBQTCDLxw6zcOULUeyS8msNvrjzRD0sXNzcvPGE2xR7JPbhmNOXDqYf+SYKzLXODXUVXfCt5FqYtNIVZ8mou+KVdNvD2lDeFJoXFN4eX8rHJqLSlgUnqhdONEOWP4ZaW4sNVphq/Xokdj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8MpBv/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE8C4CEE3;
	Wed,  9 Apr 2025 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744200430;
	bh=CP4IzQPsQFU05CPteWgLrKp8oO61tr2PBS7gZ6n8ASw=;
	h=From:To:Cc:Subject:Date:From;
	b=Y8MpBv/VoYICVgx24E4PbAEeT/t+3drrYqVPXQj/UWOU981wSUC2trY0ul0RXZ4wd
	 MkAx9PgO5Yw+VwWeCS5mVNPUtido63L93DX1SivyY+13YYrMjDXVJojlKe034sCsIf
	 IXbbSMY6B2lgZvsRRqBcXLbdfgJpCLE9Ocio59lw0qcNczRocWkmdW6u0pMl+PVPSL
	 zLFWnsi95dTx+O1APKbqG17wJqqgfNLu7i1hb4srMezFEWlY/HbWRTVaaEuGyAUa8W
	 dfb1CSfha9y4tiKqGvgilBAPkbv3kopHt/rZkV63FdmiU8P3G8udQT6soJgCn3moIx
	 f0ru9tf/8eXIg==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Qiang Yu <yuq825@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
	Yang Wang <kevinyang.wang@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>,
	Tim Huang <tim.huang@amd.com>,
	Sathishkumar S <sathishkumar.sundararaju@amd.com>,
	Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	Eric Huang <jinhuieric.huang@amd.com>,
	Asad Kamal <asad.kamal@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Jack Xiao <Jack.Xiao@amd.com>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] dma-fence: Rename dma_fence_is_signaled()
Date: Wed,  9 Apr 2025 14:06:36 +0200
Message-ID: <20250409120640.106408-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

I'm currently debugging a Nouveau issue [1] and potentially might want to
add a function that just checks whether a fence is signaled already –
which then would obviously be called dma_fence_is_signaled().

In any case, I think it is reasonable to rename dma_fence_is_signaled()
so that it becomes very, very explicit when reading code that this is a
place where fences can get signaled.

This series obsoletes this patch: [2]

P.

[1] https://lore.kernel.org/all/20250403101353.42880-2-phasta@kernel.org/
[2] https://lore.kernel.org/all/20250408122217.61530-2-phasta@kernel.org/


Philipp Stanner (2):
  dma-fence: Rename dma_fence_is_signaled()
  dma-fence: Improve docu for dma_fence_check_and_signal()

 drivers/dma-buf/dma-fence-array.c             |  2 +-
 drivers/dma-buf/dma-fence-chain.c             |  6 +--
 drivers/dma-buf/dma-fence-unwrap.c            |  4 +-
 drivers/dma-buf/dma-fence.c                   |  6 +--
 drivers/dma-buf/dma-resv.c                    |  6 +--
 drivers/dma-buf/st-dma-fence-chain.c          | 10 ++--
 drivers/dma-buf/st-dma-fence.c                |  8 ++--
 drivers/dma-buf/sw_sync.c                     |  2 +-
 drivers/dma-buf/sync_file.c                   |  4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 10 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  6 +--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 drivers/gpu/drm/drm_suballoc.c                |  6 +--
 drivers/gpu/drm/drm_syncobj.c                 |  6 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  4 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 drivers/gpu/drm/i915/i915_deps.c              |  6 +--
 drivers/gpu/drm/i915/i915_request.c           |  6 +--
 drivers/gpu/drm/i915/i915_sw_fence.c          |  4 +-
 drivers/gpu/drm/i915/i915_vma.c               |  2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  4 +-
 drivers/gpu/drm/imagination/pvr_queue.c       | 10 ++--
 drivers/gpu/drm/lima/lima_sched.c             |  4 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  4 +-
 drivers/gpu/drm/qxl/qxl_release.c             |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
 drivers/gpu/drm/v3d/v3d_sched.c               |  4 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  6 +--
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  4 +-
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  2 +-
 drivers/gpu/drm/xe/xe_range_fence.c           |  2 +-
 include/linux/dma-fence.h                     | 47 ++++++++++++-------
 51 files changed, 133 insertions(+), 120 deletions(-)

-- 
2.48.1


