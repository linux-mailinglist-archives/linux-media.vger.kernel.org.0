Return-Path: <linux-media+bounces-47861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6138BC923D2
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 15:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3363B4E33E3
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E238242D8B;
	Fri, 28 Nov 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKrYjBlm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7A30FC08
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339271; cv=none; b=uyE74fN5Am+5UDdTXyXRe25qfnTfoLoUcOQptuktxQLB5tvPmKKFpDUTcihIPGSCu6Yjf4Z12WfIB/c1LJag5bA2uYMMABuOYeH9AVvBZC20Et7krDQZQGepBra7IGSCM3i9pK9tpLgC4vumi3QYmlqGKvJmZv0uw8U85hYfSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339271; c=relaxed/simple;
	bh=YUJy7negUaDa3i/z93UmgA296mGxFrrof52RqnC+Knc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VTaEE/qOotvPshP/IQ8nP5jsp3k5iVc8waOT0gH85eD8CIGKapdLHbPUiZqD1M9meE05j3OljLqfCXfBDg5e/Ie13/8+qH5iPT81egTT2tmE0CclEGkSESip8odI1wylkNuEOpw9HgTBUJc330UGRIfjV4X45AnwRMBsN6/BSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKrYjBlm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so15012735e9.2
        for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764339268; x=1764944068; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zhHL3BMFDuZhN/57WOJfnY5bammkP52DxCSg9ZesAV8=;
        b=FKrYjBlmoSXQQjnw84xwuYZzRR44TpFpkruyuFJqfRWgMcmWXldg1TqmNC+Nb6s06C
         TR1iDOt/R69NlNvzAaqAFakN7BdG21nDFz6+u905JKVKMiO22+ZcXYVJiYuk4Biwcjk8
         NOrpYo7oSFvAMNdkRCgS5uziyiRom9IAw6WEyGyWRKOFJa8MsZgjFYEKN0E79xaRHQrU
         f6Rbklj7fuGKiy2p+dg66zCG0dTZS4QzHdMP6AVKrA9fgsZRNNEJg3HwDIv95xtN5ns3
         7rQR0zbcQSNlEcoojHnX5UFk5MmoCKkAXGRojFwy6yIiJIJlJeorycbBxtFljIXpEvJK
         dirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339268; x=1764944068;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhHL3BMFDuZhN/57WOJfnY5bammkP52DxCSg9ZesAV8=;
        b=xVXTPRxl2lS+sIxFkQutXlsJ9aywplO+4c/mq3Qxk22WvxTqLL8VBoTEnyDnwLAR/P
         i2qtlFBWsP/pNeYStbGGceWrMIp521lZG0Ux5ixH9JvbGWkpCeP297FQdoq8nqkY9znt
         Hl8LHsoD4KdJLiXRUinXrsHIKO4SuC0HycwIi5bSAvxXQ/mWOHJN60TFxdtMdXc2hesr
         CK8lG0vEfvFr9R91c+0ER2CY4yCL7CLe6alPVJV1RW678pzHjwxg0vejYzDQYux9F/Lq
         m5fPw7bZCOEmJSGe7p+dItT3sVZj1ppZ+9mfmPlLSzkMTN94+xYWgoJX8pvTmxD1r2BL
         Vz1A==
X-Forwarded-Encrypted: i=1; AJvYcCWWEfZd/IwqDjR7y/BZ37/YqwvV9qvMVNewhoc/ytIfgzvJfaH/Ysd4+Njgi/vl1NjmJlo1s9mVkurpFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4bTi4SCzN79rbHBl2ZvaK4+Tmeyu8wEufdSmED7qFgkZz2qS
	2k4Agr7Z00Tqf4vQV3ylUOoo40jVS0IJss1yeVszXajvPwq4nT3U5wtuRR1coW1sdK9p6Q/3cYD
	u8gK3Nr2wZ343dZUpCA==
X-Google-Smtp-Source: AGHT+IGWyokfoxvVAeT84HHEwKkD03sQllI97v9KLdFvEaRTwW3WBOhmDf1Nxj/s6YQQl7dQASa85gm3ScQahxM=
X-Received: from wmbjq9.prod.google.com ([2002:a05:600c:55c9:b0:477:5c35:1b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1994:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-477c0176437mr295297385e9.4.1764339268358;
 Fri, 28 Nov 2025 06:14:28 -0800 (PST)
Date: Fri, 28 Nov 2025 14:14:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADauKWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3fSC0rJc3aLS4hLdJHNDy+TEZCPzxBQzJaCGgqLUtMwKsGHRsbW 1AINOf21cAAAA
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YUJy7negUaDa3i/z93UmgA296mGxFrrof52RqnC+Knc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpKa4+Ob9zfXNKSCD2DFuIEJCWhazHrkpyvwSJo
 grxNOXFGJaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSmuPgAKCRAEWL7uWMY5
 Rs2LD/0QRiHXFNcsZ2UklzNBRGR+4GXh5VPmeo0TsfZfMCGPmTcBU9l1WecM8NywQUPp8ZomNB/
 rwHrXrvSsnUse/tDhhhk/e9OTimR8oPwJeESKrQv9nz6zzeAjX659YQu500CDt/WT2t2jsjjEAl
 CNtQRslkrFsfdypRq9MpxlittBcgMxXK/e0fJhVNpxGxYnk2pWI871g28GawhxjNJyrGBlf/g7g
 fUSepFjOCu3Xkho19aoO7I5fVZxjjbTG0EKs55RHfX1gwkmEO7aWO5kf4uhoemwqS2fHAvVeFNa
 BdVUXvDpPHF+pykOAyiNApNvuEwnYy9L1DhrctFxYr9YBQBo9G6kNvV/vi7ayj8vfTW5j55mFOz
 Id04xAmbps5UenSTRvSs3wNbVeT9ucvdli2v6FZEg5xrtxLg+vxNLgbR4+GwhHqfGlxOGW6ha6s
 cvrA4DL9Qgo7r1+bcqCAJuCDq0myOvN2O2j5cYQ7Z0DyYd2DKRpbxWsnVujocaMxY1/m2rMr4vj
 GYY+V3U+U2BdvMWNUWdYUvtgtQcpyefH1P1JcV1EzsB33B4TZx+UcIDUiliWIB7+4cfURnadtVI
 VUx0tRJwBnfii0nwY4yFFNBjzHPStgTKBzg6kfBXZ8Gfy6covgoZ8LEjfSTYaRUYArQyGr89AyP eGFLCahwk9vk6AA==
X-Mailer: b4 0.14.2
Message-ID: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
Subject: [PATCH 0/4] Rust GPUVM support
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

This makes a few changes to the way immediate mode works, and then it
implements a Rust immediate mode GPUVM abstraction on top of that.

Please see the following branch for example usage in Tyr:
https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/53

For context, please see this previous patch:
https://lore.kernel.org/rust-for-linux/20250621-gpuvm-v3-1-10203da06867@collabora.com/
and the commit message of the last patch.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (4):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs
      rust: drm: add GPUVM immediate mode abstraction

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/drm_gpuvm.c            |  80 ++++--
 drivers/gpu/drm/imagination/pvr_vm.c   |   2 +-
 drivers/gpu/drm/msm/msm_gem.h          |   2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  10 -
 drivers/gpu/drm/xe/xe_vm.c             |   4 +-
 include/drm/drm_gpuvm.h                |  12 +-
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/drm_gpuvm.c               |  43 +++
 rust/helpers/helpers.c                 |   1 +
 rust/kernel/drm/gpuvm/mod.rs           | 394 +++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs        | 469 +++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs            | 148 +++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs         | 213 +++++++++++++++
 rust/kernel/drm/mod.rs                 |   1 +
 17 files changed, 1337 insertions(+), 49 deletions(-)
---
base-commit: 77b686f688126a5f758b51441a03186e9eb1b0f1
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


