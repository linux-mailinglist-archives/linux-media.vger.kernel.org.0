Return-Path: <linux-media+bounces-31639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C42AA77FE
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 19:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1821F1BA64BD
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A536258CEA;
	Fri,  2 May 2025 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TijZquqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6F1A2630;
	Fri,  2 May 2025 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205632; cv=none; b=JyUwaboNiljWgYyPHigLEVmdGVfe/3UtkMFid906bwV8wwy3vvuFpbMpcMm0JV8L+Zm7fp/ISWqmqM/W9UDh6hwIBlCRUup1K5kjx1NOaU+3CRp9tlOeK8ihbteO+Xzfofth3HzHcXC5SlylecPcgKxbWf4uISxxHiOQxh/rfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205632; c=relaxed/simple;
	bh=oGFdbK4hqCbRjD1Ku2OhUo6YHAV0TxHv4RvrfIkhlKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBbWGtYnMCECPWd2IhTI7oGpah3ihn3E/MKXqU+y6BjohKm5BICqchC8Vs3vwkbvZhjArOHNeQIGAQZ+LR/8+1QCKB8F213Ua+v7/jYm/xdMY3RqcGclbp6zX/JeYQY/e19Brx+IeUIwT4j9LbGlJYhRofHGE3G0vMBbJmOfMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TijZquqH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2260c91576aso22499635ad.3;
        Fri, 02 May 2025 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205629; x=1746810429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TunKzoLEJR5EJu7jJjlTuy7onTJgUGYDWPQXzRBljII=;
        b=TijZquqHFBIFbUrU36+3muSRLuVa0hzgwZdFMhGM655SGqPwObxITCkNqNIoL+mG94
         3uxK6cqyKI0L6cB+FNldEym5P/d19TTuLVkXxOKDDcREB4xtoeqc7kOITWJPwAtdMBKs
         hvk5imNyInx5kow0TzcJi/ei+KSwSgDzwZjPd/mlwfyasZDyX/TR6iAxBZzMfOtlXIls
         7fAO2qMDsife1Suz/STZJEmytyOo+77Gk3CT+dUbw76+mUYhMixQfMSpmxNXB/vH/h9P
         nts0vF894ae/k4hEVlrvUijYrqpVSJbTILLs9M2L0WLgfL9mCvqEZ9AhRoxUYtbhKjnK
         kelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205629; x=1746810429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TunKzoLEJR5EJu7jJjlTuy7onTJgUGYDWPQXzRBljII=;
        b=TyRPAerfaKuvR+M54OjOsNXT38rPM/NKDwyrW9C1yFBygriZ0TAvJm+sL7u/F6APST
         MKwEIHc1UJgJ6SnnWJ0s0qhcZVqWQO4FtjeR3PD2tZtcCPShAWDj7gksMGYAAjQp9IaR
         fmBF4xbpqW/SgocrqDLxVtBAU2F/61WtZEzzYf/Mh2Ix5x1tzf21tdDCK6PecWAxtMV+
         gAVHaOJKT8jYhbBd5CuXpJ143nAtN1D/9LkR3IbgO7hyx0JotorIig60lb2wwMA1MyK/
         /B32Hwxq7hSYlNM4uNpB4YcAKR2Ieprxbg2/JVUwj+NcW1d63NyuakcWknbxZMTF/O4l
         Y1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ISJ17Jk/Bo01Qzencj1Iuh0E6yUzNTKjudP6QesKavEVZ9OANP26rj+W3Ae8oq43QHI62QkgcqQ2pq0=@vger.kernel.org, AJvYcCVciNm3pprU21qe7bjMIhXfx+fPpICYj0UX2ClCFPoVoqIwTFy4Q9jKWEUwIluGeKk+XQnERgNbkrfIfXmD@vger.kernel.org, AJvYcCX7Vg55GONL6TvwRDLQ/LpgKO0Jkm9N32aQvLOQg2B3Ss10LjKnklcxxn1lgJnrP+xWLR3VPs4OBPXguxJI@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+DyDRKfGttPCzV6mJtTSrllk8pS7HVBTRhNvBRBYVRpdCwbn
	kT9hsXet0rW5bSrXTqgDpbyjznK7iQdzjIaSMmz96XcocWq3YcF2
X-Gm-Gg: ASbGncsazdtKeucMRy8/XZjGjtwhWSQbB2yLgwmgwbbZdwc3BQVK/V/X6zvsPgLRMmz
	h3Bm7yMAow9/21RQvxG4b/j1FZhbRgDAedZUgLNrA05vKbGT/0ev+oCOkm2mWNjGiJZkgbJqC/X
	vZsUljE5Mv+yPhx9tQYatyVFB3AJwP4t9MOw8TENX5tpIV+wEDSxUD7vfeteNd8jrwHSMWkwe8N
	cQ/FR9B14Y/r+Cu7W1XLRY6tFxdwu/qQLyNJ1BVTl56Ku2sntliDea0UVwKqUUmhKqVcjGXz66V
	1WXHA0xiJEk8/w+8/+IC0hgY8+S4jkzjcPWx8KDes5DzpfpSQ5eodWl903F/TNDi68su3syLTri
	QFBiS1A2nw4O+iTU=
X-Google-Smtp-Source: AGHT+IE/Vs9DjTxhGgDydtiPPcIuTgYawUe+pebY4/T1joTUH5wBFPaEByUbsh42IWm4peUk0OXRgA==
X-Received: by 2002:a17:903:2447:b0:224:1157:6d26 with SMTP id d9443c01a7336-22e10311c7cmr56146565ad.4.1746205628501;
        Fri, 02 May 2025 10:07:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920f6dsm1032598a12.10.2025.05.02.10.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 00/33] drm/msm: sparse / "VM_BIND" support
Date: Fri,  2 May 2025 09:56:27 -0700
Message-ID: <20250502165831.44850-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v4:
- Replace selftests_running flag with IO_PGTABLE_QUIRK_NO_WARN_ON [Robin
  Murphy]
- Rework msm_gem_vm_sm_step_remap() for cases that orig_vma is evicted
  to solve some crashes
- Block when drm_file is closed until pending VM_BIND ops complete, before
  tearing down the VM's scheduler, to solve some memory leaks.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to separate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor.
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700

Rob Clark (33):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: drm_gpuvm conversion
  drm/msm: Convert vm locking
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on GPU hangs
  drm/msm: Add _NO_SHARE flag
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdec support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Extract out syncobj helpers
  drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
  drm/msm: Support pgtable preallocation
  drm/msm: Split out map/unmap ops
  drm/msm: Add VM_BIND ioctl
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gpuvm.c                   |   15 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   88 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   12 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  183 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  489 +++----
 drivers/gpu/drm/msm/msm_gem.h                 |  217 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   15 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |    4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  295 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1288 +++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c                 |  171 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  132 +-
 drivers/gpu/drm/msm/msm_iommu.c               |  298 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |    4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 +++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 drivers/iommu/io-pgtable-arm.c                |   27 +-
 include/drm/drm_gpuvm.h                       |   12 +-
 include/linux/io-pgtable.h                    |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 57 files changed, 3043 insertions(+), 1227 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0


