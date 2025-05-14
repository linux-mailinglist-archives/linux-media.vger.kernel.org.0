Return-Path: <linux-media+bounces-32525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B81AB735A
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 19:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F7EC166017
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DE32820D8;
	Wed, 14 May 2025 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ/lqWqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD1280CDC;
	Wed, 14 May 2025 17:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245358; cv=none; b=p4b88h4wFYhXwXA+1b6EA5QLMits8juWUvy3tOwEZE3tqokMNDIQXyC/FR8G/GeHwgZ3V9WCDXUPLBjB3ZSgw9IhAh0w5X+Mf1BpJ9n7keqQ93fvi+6LsLoPIIIJ5L3P/at3D8NoXmkOVgmjxW8ONJz6rV+EVbb7r5mcIZJ8l6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245358; c=relaxed/simple;
	bh=BJ/MngDQrweqXLyzyk/mOzWV+IC2hvudVpGaRIzWNus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l32b++IwyWcURW2GWI6zUp8C48tzC0ztrKGsEiE13bRRNaQ767mcOQrZoBhyLI/CWwwd6WxEc0j4bnBPgscsKvExPHvYBjkeu/DaqtdzGrgUtqRK5zs4tdVaRae/TiOr55eAvtXUlmJDVolOmaXhuo0ShRM1HKcqKwA4PoG2nFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ/lqWqZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so1185485ad.0;
        Wed, 14 May 2025 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245355; x=1747850155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTRZYELUxikHuZrnr6hjy5+oWoL6AQWZaZWVaCTTMUs=;
        b=XQ/lqWqZ2M4u9d4crmogo+IebQcUqdXBE5yMnEYAJPvKS1pZ1q3zFGvFm32Ar6/wjx
         Ca8saiemRFhlXBcSWnC+nfcb/ta+faGbk2XaLTY0UlThxA+b2mhAeGdCMTtlofzmPPVC
         VoI3oTZ/l4DvI5cimH+M5O6+FthwG+3b5LsiAj3o6IfQfiak1sWwW7HZooGB1s5+tBow
         kICpfVv/V0QAjpF3+blmMjvofk/DE/oo6xnuvR/F+teuc7nupMze4TzX40BvnePLGS6n
         RYu+kyoTyG53UtXEyv8gaULy3Zre5R60Mhg107ivXGZwfMUnI/+WCq4Dx+21+3LxzJXR
         bfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245355; x=1747850155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTRZYELUxikHuZrnr6hjy5+oWoL6AQWZaZWVaCTTMUs=;
        b=SPm8YmvG0fYfCskbK5K2n8b9iKNprj8WOzT3Zpi9dHs6zXjA6JwZdKVmlRnUYcHAPO
         OUESx9j7XEYzYAPAGp4oQOXAPwJ9gCkbYWoLQxh2lhBH/VZF3RA6ZKH6Y+ffrzgxKtPK
         bvCAYK9MIj0L4+zBJtKYIqOy73jcm95ytSxnv8oQwHmvABa2AocuVLl6GBILEJKd8Syh
         K2jg5ftqfPizz+H9n8SKIb+0xnFaj51zMidq1DlGu0587mQxhRCeffuSD0SYzofizJcm
         iks0HFkTYdn2/zb5CNYsvxenZ8KJWIymsyG5e3OrXg/BWUe1+p7QInwZeTA4PcK6tpb+
         lCMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1yaQdgzlIk9xDdIZegonAgPW/RGPSNAb0OckOzAx5KGNY/NI3aZZec6tBJIBlo9Igly+d26NfH/DGIAnH@vger.kernel.org, AJvYcCWgV0BvBv3R6q4LuXKbF6YCiyPWC+6mC5cdILx9wsCUaoM2dnVyy5aVOeDBkTmYECIPS9O1mj+QliuqfXk=@vger.kernel.org, AJvYcCX8SabYEfbsfBL/hKuqfTfLVzNjFY3k3XTk6XzA0GNzVu6Ig8toJRjMkC8qTIwhIUCWyso58JivYOOIDRww@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FkzVFeEDcAZxP5UT3kpvt6ecEIBQA2rtyEzHD03WnUtCwcyt
	gQ5A7izauFz55O+kyHihTN/BmoGzZCSoYvWcIiiEoiNniguINv6S
X-Gm-Gg: ASbGncs8oqJQnVXfuUvYgXAHSWmpoYrbK3P/uYKgjCOFgoKBPfd28sMJ7Ia3x2x2IeY
	ZgS9ZqHDDXpxw4jgAuJVTLC/V147ej8DjjL3YtU58meeFA6GFA2I4jD5o+gvtoeLq5CJq3m30jk
	RC6MsfhZdUFmsrjopCFA6HSBlQTVzO5aKgicBXtg0PqL/Ko2AhSos7Pghu3eAhp8tnmTml47lyG
	eAUkzvJRDtph5ebxFD1/aWMRCyPOM0xaZMc1VHaMaRUWQVXrjiCPtgQQkydfQkiM1Io4z4Gp2Fj
	WpsenpKX4N5xFIs10mMcHddpnQXpYqX1E/D+O/S1jJpFcfWMisi+qv8z54N0npKeeGf3zs6CHnt
	TNYNJUu7lwIZ3rg8VAioDJ7RohQ==
X-Google-Smtp-Source: AGHT+IERtpGGySrgt5QWAHTWQX1eTHH64LFVqEChCSjMz12Qnsyq4ROalMoWYLN1Prsn3yufEkRtfg==
X-Received: by 2002:a17:903:32c4:b0:227:e709:f71 with SMTP id d9443c01a7336-2319815e348mr65225885ad.29.1747245354679;
        Wed, 14 May 2025 10:55:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm101695615ad.107.2025.05.14.10.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:55:54 -0700 (PDT)
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
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
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
Subject: [PATCH v4 00/40] drm/msm: sparse / "VM_BIND" support
Date: Wed, 14 May 2025 10:53:14 -0700
Message-ID: <20250514175527.42488-1-robdclark@gmail.com>
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
- Various locking/etc fixes
- Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
  then the kernel detects ops that fall into the same 2MB last level PTD
  to avoid duplicate page preallocation.
- Add way to throttle pushing jobs to the scheduler, to cap the amount of
  potentially temporary prealloc'd pgtable pages.
- Add vm_log to devcoredump for debugging.  If the vm_log_shift module
  param is set, keep a log of the last 1<<vm_log_shift VM updates for
  easier debugging of faults/crashes.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
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

Rob Clark (40):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
  drm/sched: Add enqueue credit limit
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
  drm/msm: Drop queued submits on lastclose()
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
  drm/msm: Add VM logging for VM_BIND updates
  drm/msm: Add VMA unmap reason
  drm/msm: Add mmu prealloc tracepoint
  drm/msm: use trylock for debugfs
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gem.c                     |   14 +-
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
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
 drivers/gpu/drm/msm/msm_drv.c                 |  184 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  494 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  247 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   15 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  295 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1471 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  214 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  144 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
 drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 drivers/gpu/drm/scheduler/sched_entity.c      |   16 +-
 drivers/gpu/drm/scheduler/sched_main.c        |    3 +
 drivers/iommu/io-pgtable-arm.c                |   27 +-
 include/drm/drm_gem.h                         |   10 +-
 include/drm/drm_gpuvm.h                       |   12 +-
 include/drm/gpu_scheduler.h                   |   13 +-
 include/linux/io-pgtable.h                    |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 63 files changed, 3484 insertions(+), 1251 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0


