Return-Path: <linux-media+bounces-36149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F31AEC770
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 15:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FC197B061C
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168711EB9E1;
	Sat, 28 Jun 2025 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt2Yz9LK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B853FC2;
	Sat, 28 Jun 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751117528; cv=none; b=C1hS0dlwVYHlBmhZ/hn39uIxzXqp9qSjTp/DCLR3a3YgQFtDZDuNQEiJulpnS9O2aiHjIIajrSZc6VzU6G54PuPZPqEBIk7jxQDR+fWVOX7sbbMWsAPqJXXY9+L/nJpE7SyGKTf7w/+dVYvCwVKUzaH0+vClxkwHEKT+GYzz7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751117528; c=relaxed/simple;
	bh=MxJm2gNc1QGTCXR1O0y4Yw3sn0MaheTlSFzE3zKzqpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGDDHXSE1it0VjbYZjMOQcxNza0rkP7k0Bj9Rbqz8xSB2HZEGjHenaIfD/IdAZvmuF3JOwf9m+NSZslnIgQ5a42P4nvX/tLTTYjdSlH1Wa2cjgF2CwaoBGaAndNt9yqRohqU73JS7tweTLAQ1ew51Gc7w9zT1kZazspu53KhJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt2Yz9LK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so4955922a12.1;
        Sat, 28 Jun 2025 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751117525; x=1751722325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7JNGwhqmkLHkCZJcO3wcG7mGEUYQ7GvAu9Lg/4W5vQ=;
        b=gt2Yz9LKRpoC6cVckftLDxejPscBX352/0q/BhvO6bMx7hfONuR9LmBg+sbRb2L+aX
         bR3w2PZaL+sfsI1fC0ruVXaE1Ay3Dt80GXpmFlaStmN2XPtZAKeWzy5WKH0p0LNuMfn/
         0G1ghAEM4hOBbphdrj6zfPeL+r5z6uD8ONx+KmVRMf3vQERF6YFCAq/Erxhjz/9idBnd
         l24zWnQT2DJdE8dTZ1y7072jRSkrca6UAXCjaTnzU8tKXpITQ8bNrQ/lRwbqDxgjbygD
         DqMAVBcTgZKLtF4JFzkydzNK1ReHw93dwpO3Ahr1ANiTkmoGbYm3uzL9iYrytviJQ5wR
         xBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751117525; x=1751722325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7JNGwhqmkLHkCZJcO3wcG7mGEUYQ7GvAu9Lg/4W5vQ=;
        b=KMVwq8DD7aguGfxGLaCSWsvWTZy/fudBzs33gR6Aeee2mb6AYREjFHaXQnM764Dujg
         Sb2mhpIngp29/axgfHncWCJEQ4ntLXLQr6je8en97NxPIrjyR/aX1YdB0gzb53luIRQv
         LRwotoYlLNdrV4nC+Wr0SAHstd+1S8JRSe1mNuhqP/XygcEe0c5c2gxyrKuFTVzsBVJa
         YiTQs1rMrUZBX/SvBPZogai82ErBPEblgmLhWpWQNLG2nXmjOuS4jHqGyaHMMGMUSmdr
         gcidLY8HjooKORLiVS0aAfzuyn4wkM8wArAMwwu3V8paobCF4ZengtmhQgj4QzX7j2Wr
         ++Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXOtq9i2VjEWdf+IfSRxntL5Rn/YzepvchFu/9Su9ViQ2qp/Hj0lubjbpqtPx70RrVJhDMuTOOFHlqYGhs=@vger.kernel.org, AJvYcCXvItZnK2Jf3Of/I0UjhNkOwbPEFGK6C85DxASUfFwyLkIEcbpZMbce8uokOFaIcu0wIRtpqhVMlm1cT1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxiV2wIeoAQtMsAsB7xYlm9PVrALzacuQpL2JEP94DvnOfBHu
	Br07pcD/22MpXuwTf8NsAmkoL/hROiZzJFIeAkzM8lAYMJCazdLvYPS6
X-Gm-Gg: ASbGncuHe4T7ZUqRF6ApvuKSdr85SCK+W8D7LTRMx36l86OqACCO1e5wY5Z9vnIC4ei
	KRyxeqC/xPlQb9a6HK6xpv6+L7REjyOA3NAkGXzKLu1/wWGiDXr5YlFseWXvQ/VAtk4260Md93O
	cNaj0+JHIoz4U4AdHGuH/2dvCJripRL0EynQnU5/gqDZM4chA6MyR7DOZ8FpsOM/aE6rJJQM1Qb
	I2R0y6HvSEM7xsXyxpTlFwSTER/YMZQHlU2fgf8r+1OtE4KKQzwk9ru2t280dzdF9lrn7rQCbT9
	8Sd6UX3AQoBPF/Wb1xCyfpvVpylmBh7q/o8Wt5FYacw1JJdNc6QaTL3AhGMy3xZbRHsG30h9wQh
	NSncM7coiPjZNx+UVK28ClMlJtPEsrrVgAQ==
X-Google-Smtp-Source: AGHT+IGkr5LmRrohxl9zAROOcU5E/Kq1YD41LcYqKzh+gkq6NvJ2mXdabTSZBNm1MWhosMBzRjh4DA==
X-Received: by 2002:a17:907:7ea8:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae35013da97mr677648766b.41.1751117524324;
        Sat, 28 Jun 2025 06:32:04 -0700 (PDT)
Received: from [192.168.1.17] (host-79-30-34-31.retail.telecomitalia.it. [79.30.34.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363aed9sm310552166b.24.2025.06.28.06.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 06:32:03 -0700 (PDT)
Message-ID: <6d2a4d30-47f6-432e-8f56-2dad0eb36a90@gmail.com>
Date: Sat, 28 Jun 2025 15:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/42] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 8:46 PM, Rob Clark wrote:
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
> 
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>     MAP_NULL/UNMAP commands
> 
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>     MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> 
> I did not implement support for synchronous VM_BIND commands.  Since
> userspace could just immediately wait for the `SUBMIT` to complete, I don't
> think we need this extra complexity in the kernel.  Synchronous/immediate
> VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
> 
> The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533
> 
> Changes in v7:
> - Rebase on, and use, gpuvm locking helpers[4], included in this
>    series.
> - Various small fixes
> - Link to v6: https://lore.kernel.org/all/20250605183111.163594-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v6:
> - Drop io-pgtable-arm patch as it has already been picked up in the
>    iommu tree.
> - Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
>    when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
>    a vma_ref refcount is added.  This refcount is incremented when a BO
>    is pinned for scanout, and for userspace handles and dma-bufs.  The
>    VMA is torn down when this count drops to zero, breaking the reference
>    loop between the VM_BO and BO.  But as long as a pin or userspace
>    handle is keeping a reference to the BO live, we allow the harmless
>    reference loop to live.  (This is only for kernel managed VMs, which
>    includes the kms VM.)  If no userspace process has some sort of
>    handle to the BO, it is unlikely to be reused again.  (The exception
>    is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
>    out.)
> - Drop gpu sched changes for throttling and move this into the driver.
>    We can re-visit a more generic solution when some other driver
>    realizes they need the same thing.
> - Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/
> 
> Changes in v5:
> - Improved drm/sched enqueue_credit comments, and better define the
>    return from drm_sched_entity_push_job()
> - Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
>    make it clear that some of the gpuvm functionality is not available
>    in this mode.
> - Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/
> 
> Changes in v4:
> - Various locking/etc fixes
> - Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
>    then the kernel detects ops that fall into the same 2MB last level PTD
>    to avoid duplicate page preallocation.
> - Add way to throttle pushing jobs to the scheduler, to cap the amount of
>    potentially temporary prealloc'd pgtable pages.
> - Add vm_log to devcoredump for debugging.  If the vm_log_shift module
>    param is set, keep a log of the last 1<<vm_log_shift VM updates for
>    easier debugging of faults/crashes.
> - Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/
> 
> Changes in v3:
> - Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
>    cleaner, but OTOH the userspace code was cleaner when the end result
>    of either type of VkQueue lead to the same ioctl.  So I'm a bit on
>    the fence.
> - Switched to doing the gpuvm bookkeeping synchronously, and only
>    deferring the pgtable updates.  This avoids needing to hold any resv
>    locks in the fence signaling path, resolving the last shrinker related
>    lockdep complaints.  OTOH it means userspace can trigger invalid
>    pgtable updates with multiple VM_BIND queues.  In this case, we ensure
>    that unmaps happen completely (to prevent userspace from using this to
>    access free'd pages), mark the context as unusable, and move on with
>    life.
> - Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/
> 
> Changes in v2:
> - Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
>    merged.
> - Pre-allocate all the things, and drop HACK patch which disabled shrinker.
>    This includes ensuring that vm_bo objects are allocated up front, pre-
>    allocating VMA objects, and pre-allocating pages used for pgtable updates.
>    The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
>    were initially added for panthor.
> - Add back support for BO dumping for devcoredump.
> - Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t
> 
> [1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
> [2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
> [3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700
> [4] https://lore.kernel.org/all/20250620154537.89514-1-robin.clark@oss.qualcomm.com/
> 
> Rob Clark (42):
>    drm/gpuvm: Fix doc comments
>    drm/gpuvm: Add locking helpers
>    drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
>    drm/msm: Rename msm_file_private -> msm_context
>    drm/msm: Improve msm_context comments
>    drm/msm: Rename msm_gem_address_space -> msm_gem_vm
>    drm/msm: Remove vram carveout support
>    drm/msm: Collapse vma allocation and initialization
>    drm/msm: Collapse vma close and delete
>    drm/msm: Don't close VMAs on purge
>    drm/msm: Stop passing vm to msm_framebuffer
>    drm/msm: Refcount framebuffer pins
>    drm/msm: drm_gpuvm conversion
>    drm/msm: Convert vm locking
>    drm/msm: Use drm_gpuvm types more
>    drm/msm: Split out helper to get iommu prot flags
>    drm/msm: Add mmu support for non-zero offset
>    drm/msm: Add PRR support
>    drm/msm: Rename msm_gem_vma_purge() -> _unmap()
>    drm/msm: Drop queued submits on lastclose()
>    drm/msm: Lazily create context VM
>    drm/msm: Add opt-in for VM_BIND
>    drm/msm: Mark VM as unusable on GPU hangs
>    drm/msm: Add _NO_SHARE flag
>    drm/msm: Crashdump prep for sparse mappings
>    drm/msm: rd dumping prep for sparse mappings
>    drm/msm: Crashdump support for sparse
>    drm/msm: rd dumping support for sparse
>    drm/msm: Extract out syncobj helpers
>    drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
>    drm/msm: Add VM_BIND submitqueue
>    drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
>    drm/msm: Support pgtable preallocation
>    drm/msm: Split out map/unmap ops
>    drm/msm: Add VM_BIND ioctl
>    drm/msm: Add VM logging for VM_BIND updates
>    drm/msm: Add VMA unmap reason
>    drm/msm: Add mmu prealloc tracepoint
>    drm/msm: use trylock for debugfs
>    drm/msm: Bump UAPI version
>    drm/msm: Defer VMA unmap for fb unpins
>    drm/msm: Add VM_BIND throttling
> 
>   drivers/gpu/drm/drm_gem.c                     |   14 +-
>   drivers/gpu/drm/drm_gpuvm.c                   |  132 +-
>   drivers/gpu/drm/msm/Kconfig                   |    1 +
>   drivers/gpu/drm/msm/Makefile                  |    1 +
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
>   drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
>   drivers/gpu/drm/msm/msm_drv.c                 |  185 +-
>   drivers/gpu/drm/msm/msm_drv.h                 |   30 +-
>   drivers/gpu/drm/msm/msm_fb.c                  |   33 +-
>   drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
>   drivers/gpu/drm/msm/msm_gem.c                 |  537 +++---
>   drivers/gpu/drm/msm/msm_gem.h                 |  276 ++-
>   drivers/gpu/drm/msm/msm_gem_prime.c           |   66 +
>   drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c          |  300 ++--
>   drivers/gpu/drm/msm/msm_gem_vma.c             | 1508 ++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c                 |  211 ++-
>   drivers/gpu/drm/msm/msm_gpu.h                 |  147 +-
>   drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
>   drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
>   drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
>   drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
>   drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
>   drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
>   drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
>   drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
>   drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
>   include/drm/drm_gem.h                         |   10 +-
>   include/drm/drm_gpuvm.h                       |    8 +
>   include/uapi/drm/msm_drm.h                    |  149 +-
>   58 files changed, 3712 insertions(+), 1263 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
>   create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h
> 

I've been testing and helping debug this series:

Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

