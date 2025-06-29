Return-Path: <linux-media+bounces-36163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04063AECD28
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E2E4172879
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4A1227BAD;
	Sun, 29 Jun 2025 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWtgEFY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F3226188
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206030; cv=none; b=oYNvmOUpivpfXzLhuSvGtmc9+opS3kqF4SHU5bCPQBF8MeeaeSpT/OV6iGHCrHadU65b8IkhPiFi8zWsdTkwftuFBJI8ee0CVh3UHrlSlMOpnb/MOGGM6aH4GOBFGuJJPr4pmEBcDgL899RPHXmoNkeDFgez5P00u7HM7hVE0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206030; c=relaxed/simple;
	bh=nZXAEpjpBcWbwMig/n0nlZJbR+q6RNykKF+wCQbAjAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgwxWAdnbk+EBZyPh52JR+rnoPldo7KDzX8vkSGKnOGy/R0Xo4zHkeXD32bZ18klar5CWvdcR6bYkIEiBWya6ryPwTgXfR/KfGflqpxMyzUtB6QXsCRWzliWvl+oWqCt3LOYgLdERn+abEYcoXdijTH4KhDwRe/JcNSxo4uLcI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWtgEFY4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TANmLq030508
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NxmZxmH3Caom1v308hhluvOelyj5bBFzbfv
	GvsvAv9s=; b=DWtgEFY4PWFtJrwLVgpWPvXPieeRyFAiTpb2+DlxkeR41BaGmlf
	eufk4XyuRefRZg1iWkRYZeFJcQ3JIEeG+rwgfx+I1FGJkp6xQwI18ysSwhbGguVP
	67XCA4SsUUG16z6vLABsBwwSSZ+9UGOLd33JKTthMzP15pPCnN5PYxky9513Mw98
	zShTsKdlxSR3wist3cogt5BiqcNb8wi2BaCfnP6hqHIvUi6L98xhev6b6bdRhTMd
	kK/iipGe6HvM5jhK6gPPA/VZfbMRyAPAMuypO/3TsMZtcq9h4j3ig9zez3adLvLI
	/6YxT3GZpitnip6A5GvbI3ZCGxegG0H1SyA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2ett-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7398d70abbfso5595733b3a.2
        for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206019; x=1751810819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxmZxmH3Caom1v308hhluvOelyj5bBFzbfvGvsvAv9s=;
        b=ew+V1LhJCwuxYIGvDfua3Wln6D8d84CLJlCCA90Z9dFRPbJHAhZFP/oDvQrf0ZRC7H
         IdNLZ2z97NZouDLO0ST0zyDLH+Ms4io5yru6KBnNIfvXzaEX5byTiFmW9fKeynR3mIZb
         /dXoSrw+w2OW2mu/u/DDPd7y/1JltbZ51KhilcvPuKI0hX0/Wr2bj6F//mhR4yOxqMPa
         DCDchGHp30tajm3Ww8l5XEbips1ARf3Uh8Qq+ZGJGMbDlmZi9sg1c163JWhGHvS2bfjT
         XKdbUJ5Qgh4MvHGXVk/xjNsi6G9EptUHVNmKGOZ+KZifzHaokQ/xbzrUVrxCV8EALNzL
         TxQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbaLJF59KvjxifnZxiMZxS6HoT8Z4WXK5D+LuYeVcL96+ciUj+UW7k/4FZlFHRCz6KA/H0Sf58KaenWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAt1dx9RRIpbK6ZzLyCqB10mSSVkwgzTTmypG4LfaPA8fA/ChG
	0t4+SL/Z6SWOOle5lCICoTt7Seo1KoXptVWrmc1mLNwhj1a24DIiyq1LPhW/nFsuifETzJiKs4Z
	i8frgEUkc+8v+6r5NAW/Xiod9wtTZHyjECHkeNSBRTYJ2qxe4pRvQb5Q2XrBDAwaNlhDVs1X31A
	==
X-Gm-Gg: ASbGncsi4wQanJa/S5JCiG/Uct1EZgDr/8gjwcVD8LDFJGCr/q4rNkGIAJlr1eotKxT
	bDkTovKSrF3eudn1DqUIAyRmP23VZtuTCyXAzTdDhAIiGmiwXEnPhJMVdqg+Lf76BgAAeHsggov
	XouKee2a7EBGTG0Pw2wWAa5ih8wHvNA0twfgdThgoD9v2sdvulq77K7pFIzb0inTIoJQ80TyfxJ
	o7nz0g0kFi2ATqfKOHQqyEy8WWZ6vLinSUAqrUxbdLDCIGRCxEGjQ6uqq8QYWCdl3ecIjsDbhPb
	M+Ch9WKtGSgfOkBDEbCSHJ8PcwKQiwwA
X-Received: by 2002:a05:6a21:998a:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-220a12abcdcmr15245895637.13.1751206019296;
        Sun, 29 Jun 2025 07:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/BWmnSO4Eu3GkgINjqnjH/O2wvRYnJpLwFtt7wvbFGyGI9UhK/j8LzwPVQYM8odo3cnzO8g==
X-Received: by 2002:a05:6a21:998a:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-220a12abcdcmr15245861637.13.1751206018819;
        Sun, 29 Jun 2025 07:06:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f2280sm6831299b3a.165.2025.06.29.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:06:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Haoxiang Li <haoxiang_li2024@163.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v8 00/42] drm/msm: sparse / "VM_BIND" support
Date: Sun, 29 Jun 2025 07:03:03 -0700
Message-ID: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OwbyYcxNZoHzNNoZToxf-O-mPNszOFMT
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68614884 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=zBYVM8QCAAAA:8 a=Kgy_UhXEN60RKTLpf-gA:9 a=eVM1_HBmYRkA:10 a=YgSuLXRpIuYA:10
 a=te1wHPZ5H10A:10 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=ArXkYGXkE6hBHcUMFODu:22
X-Proofpoint-GUID: OwbyYcxNZoHzNNoZToxf-O-mPNszOFMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXwPT76+b2Lgbx
 ypPdtUROgPgi2WxCv0AykW4MrsG76hZAlI8kLNWDTGAVZNUGRX4FNa6RvMeWH1ZBybBrIZ4YghD
 xjgE5Km+6i/hJgWkzyzczGdh/1mk8cB914Dfx8DKGVa+Cat3vySFTviNwCscoj2EPVVHR2Pujlz
 CbpxkdmhJhxue20IMmPpkmXq6TR0qOD0CwPF3wNbt6jCE3TGvBZ4UxFu0c3EhC83Euz63ZVbdN5
 U2ExY8DV8B0+bsMyzi5BZ0gbT6QnFaGx5fnnDM/IWP4T086YCilwrmEtNDLyjreqBQZrKJBPe0g
 8fDdiha2P6B2GniX+JGh3P9Kw6brsQq/HifAfSh6NaxSc1xtdi9fTVYWwfZdJUwE/4S1szTjSJy
 gzL+zW7diWQfF5MABv7YUkD6+60Eus1OSOEvn7vvJTDoy8XoTezhY62RYzyqILLzYh6EJVsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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

Changes in v8:
- Just a rebase and collecting tags
- Link to v7: https://lore.kernel.org/all/20250625184918.124608-1-robin.clark@oss.qualcomm.com/

Changes in v7:
- Rebase on, and use, gpuvm locking helpers[4], included in this
  series.
- Various small fixes
- Link to v6: https://lore.kernel.org/all/20250605183111.163594-1-robin.clark@oss.qualcomm.com/

Changes in v6:
- Drop io-pgtable-arm patch as it has already been picked up in the
  iommu tree.
- Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
  when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
  a vma_ref refcount is added.  This refcount is incremented when a BO
  is pinned for scanout, and for userspace handles and dma-bufs.  The
  VMA is torn down when this count drops to zero, breaking the reference
  loop between the VM_BO and BO.  But as long as a pin or userspace
  handle is keeping a reference to the BO live, we allow the harmless
  reference loop to live.  (This is only for kernel managed VMs, which
  includes the kms VM.)  If no userspace process has some sort of
  handle to the BO, it is unlikely to be reused again.  (The exception
  is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
  out.)
- Drop gpu sched changes for throttling and move this into the driver.
  We can re-visit a more generic solution when some other driver
  realizes they need the same thing.
- Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/

Changes in v5:
- Improved drm/sched enqueue_credit comments, and better define the
  return from drm_sched_entity_push_job()
- Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
  make it clear that some of the gpuvm functionality is not available
  in this mode.
- Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/

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
[4] https://lore.kernel.org/all/20250620154537.89514-1-robin.clark@oss.qualcomm.com/

Rob Clark (42):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers
  drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: Stop passing vm to msm_framebuffer
  drm/msm: Refcount framebuffer pins
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
  drm/msm: Crashdump support for sparse
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
  drm/msm: Defer VMA unmap for fb unpins
  drm/msm: Add VM_BIND throttling

 drivers/gpu/drm/drm_gem.c                     |   14 +-
 drivers/gpu/drm/drm_gpuvm.c                   |  132 +-
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   98 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  185 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   30 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   33 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  536 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  276 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   65 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  300 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1508 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  208 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  147 +-
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
 include/drm/drm_gem.h                         |   10 +-
 include/drm/drm_gpuvm.h                       |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 58 files changed, 3709 insertions(+), 1260 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.50.0


