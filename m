Return-Path: <linux-media+bounces-28493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3167BA69234
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD273BEFBA
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B3E1DB122;
	Wed, 19 Mar 2025 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkS6uoRk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294E41B2194;
	Wed, 19 Mar 2025 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396089; cv=none; b=jaFqMz1d5e9jsdsVNVL85LJ6iGaLeoNOBlSy/q7cDoxOkkUMTpT2Tb/ClcM2H8OIdBIlvzn5QNy5lloB0+zLkUSq90LvREbhqN3emAgFZrYxRRQQktJWUiD/u9wD6ETlllHYfddqxwhUB3FG+1/jzDaHzMrCQ3dURTm8N5iQKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396089; c=relaxed/simple;
	bh=AGyODwLobG1NCgwCezUM+zv2QHG0aN1ehA3R8olmM0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iP6ljMKhYYk25cu0ipBYMvRX/TjZYLnm05mgD1bBh77FOYO0QTi3yiC8vLQLEdKDfQlXeUSV8w/oQ+TWpp9/I6L5jWLIWAg+g02Icj7R72b9wE/tymJwhxVaQ9TDy35WZl0/sm5oVwqmiCrXVkBtCZyWcudHGI8q37WO6ByffEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkS6uoRk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225fbdfc17dso71123155ad.3;
        Wed, 19 Mar 2025 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396087; x=1743000887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqnqIl7gzMI6XYAL9+ESVwKY9TAcHFNVEaABvSsYd58=;
        b=gkS6uoRk6h3bF095rWyO+W04ChQuNUCRRZ+XyYJw1T8WtVPuH5qoO2IgXkZ7o23Fz6
         MqoWfh+hTB8/3rColi2pv+18qRcNqG+/TBIj/0cygVkwoyEp+zNYriIfxtxhPJvfvEJg
         2uJArTilr9P9Hhi3VoTQ7oSEwPMguxd7Qd3WbIseW8+RoqEhn1LgxeNDsVICGLrQbNiE
         AuZyM7iBXrGBwA3LK2wVHO2/4T7XvRAiplYPVcrWwc27t7x5XTYApZe+Y/Pe3tMvPGmr
         Uqzh8+jyfZBwz42qHNWDIVR9gKoRCjsUNNmNuAd/84X95W23Fcvtc2OJ9706RUs/oFkh
         UNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396087; x=1743000887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqnqIl7gzMI6XYAL9+ESVwKY9TAcHFNVEaABvSsYd58=;
        b=wcyp6SPS6IorWxaIC3keFad43JxC1+r7xEJczR5CiQkqi0AGO46SsqsoIGjvHP9a64
         09KirHB9grq5ltu/tyG4N0d+JO8rzhgIUa+iXe2wVTt77Htgg3mP5FNa7eA9WTB7WK+B
         oL4W5uhPgyo3R7kHda3s05Os0W677niCjB0Pem5NQ/BqasxYI/4MOgZtw3Gjluqn7Tv0
         jnUwGonv+31W6btE4tUWGfSkBxlnQm1BQD/j+Xhf9RZEAaDlJPdHUUSGPcYYKFxbm3H5
         5mwNch+y9fh6/xSt4ud9VuD2aGIuSqJ8LdNMoyopb7zMAJ1rG+sZpo8K7AXC5ioj9o+8
         937Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoglUHbJTTlRKVDSLRSFtIi2AjFSTty/xb8V/yrga52kdlrKqtxKBaLeM2iRW81rNIDY+42hi3W8vX4bA=@vger.kernel.org, AJvYcCVN2BoRiTnqMqyeSDQi7yuJ5RZpx6xe5JFnk7TBPeWoSU3oFmOePrMEWlHIKHU/TP2UtAKPa6SqnH54XxNt@vger.kernel.org, AJvYcCWJ7maI/f/n98IUOmxxWpU0SBV8Oy1RAsQsYOWmMRgW0/bHPyVxSoSf+dyZPvZGFQilGIe5k1nIrMHFR/wY@vger.kernel.org
X-Gm-Message-State: AOJu0YyVujuweXjvdWCrHm5T7hg4fkqf2K4RSyK2UJOebGTEC+Bm6uN8
	FIjQ4he6jEE4UJn+1R7fr+3vN1oa+UF90Xdo93g9kz4g6pHDDZAL
X-Gm-Gg: ASbGncsqCk59bgB3R0XLc0AnPlG8Ujz3IObHlUldiGycwtfIQG0f5mu8xJShmSN7M1D
	nuxgCOfFFYrkmPuRvQ4KJgivPgxQXvBDDXw63GuUXb1l8uzx2ylbXzbZ5Hf/GyZrtvEsS8A0bLh
	2ydIF8NNh1+MdY7BeRUidAEUbmGQLHxEs2VTBdui47xOXQa0F2CnUOlKZwXPgef8+DX2vYSOF+k
	nKmBWPcwJhfBB+d+zhZytUKSmE7LEMiF2JGTPnhcn0pGexb52SA6uR5Q6DNzueOhb6Nl9243M+Y
	mmSAmSnOlLne0EJuJngn7d7jR/qqg/QTyPzEj+qxUO10nfX97IfBNtijbpnD0vr675mAZoRvyKj
	JQ1GG9egEspqwDIs53SM=
X-Google-Smtp-Source: AGHT+IEM2Aydh8wQyAb3fV9+udMGx+2FPS+SU7qcCCvi4qn6KMqVbM+eGzMKYXiVBUkhhnlIU/lnAg==
X-Received: by 2002:a05:6a20:12d5:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1fbebc87101mr5465045637.19.1742396087191;
        Wed, 19 Mar 2025 07:54:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9fe51asm10978709a12.36.2025.03.19.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH v2 00/34] drm/msm: sparse / "VM_BIND" support
Date: Wed, 19 Mar 2025 07:52:12 -0700
Message-ID: <20250319145425.51935-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
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

2. Extending the SUBMIT ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

The UABI takes a slightly different approach from what other drivers have
done, and what would make sense if starting from a clean sheet, ie separate
VM_BIND and EXEC ioctls.  But since we have to maintain support for the
existing SUBMIT ioctl, and because the fence, syncobj, and BO pinning is
largely the same between legacy "BO-table" style SUBMIT ioctls, and new-
style VM updates submitted to a VM_BIND submitqueue, I chose to go the
route of extending the existing `SUBMIT` ioctl rather than adding a new
ioctl.

I also did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

This series can be found in MR form, if you prefer:
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/144

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

Rob Clark (34):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Remove bogus lock assert
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  drm/gpuvm: Add drm_gpuvm_sm_unmap_va()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: drm_gpuvm conversion
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split submit_pin_objects()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on faults
  drm/msm: Extend SUBMIT ioctl for VM_BIND
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Add _NO_SHARE flag
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Split msm_gem_vma_new()
  drm/msm: Pre-allocate VMAs
  drm/msm: Pre-allocate vm_bo objects
  drm/msm: Pre-allocate pages for pgtable entries
  drm/msm: Wire up gpuvm ops
  drm/msm: Wire up drm_gpuvm debugfs
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdec support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gpuvm.c                   | 141 ++--
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |  25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |   5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  24 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  51 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  84 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  14 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  20 +
 drivers/gpu/drm/msm/msm_drv.c                 | 176 ++---
 drivers/gpu/drm/msm/msm_drv.h                 |  35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                 | 437 +++++-----
 drivers/gpu/drm/msm/msm_gem.h                 | 226 ++++--
 drivers/gpu/drm/msm/msm_gem_prime.c           |  15 +
 drivers/gpu/drm/msm/msm_gem_submit.c          | 234 +++++-
 drivers/gpu/drm/msm/msm_gem_vma.c             | 748 ++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c                 | 146 ++--
 drivers/gpu/drm/msm/msm_gpu.h                 | 132 +++-
 drivers/gpu/drm/msm/msm_iommu.c               | 285 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                 |  18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |  38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |  62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  86 +-
 include/drm/drm_gpuvm.h                       |  14 +-
 include/uapi/drm/msm_drm.h                    |  98 ++-
 52 files changed, 2359 insertions(+), 1060 deletions(-)

-- 
2.48.1


