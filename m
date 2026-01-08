Return-Path: <linux-media+bounces-50241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9AD0456A
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 17:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A25123039879
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3D02192F4;
	Thu,  8 Jan 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kbT5nZLn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C35E218845
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888466; cv=none; b=fRf4lNx3w/BLFMSpeulNrZEa1NzBFkZ8uZkjirL0zjD4DBXFHs/LR53mrbCgom/A2UD6GEksaqoinofgUo/2uKw6H1kOhw6tSqxkxa0YUWhofKDWU/WzSZ/Gg2/t0swuyTDkm8CVYMHw2GIR1jDlH4uybam+oNlCLRhOzHW+sBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888466; c=relaxed/simple;
	bh=snxThI8cYlPfWm0VQSv1csU1h0GPhmXiSH+DK97/5yY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X5/X+0vdM9c5SkxsRj2lYOqXR5stf22e8nLpoTCgSYKoFcI5XTg+qO6rZj6AxiBybVo+IhLj+/p4sUrxhRliRGBZ5iy1FQWBEhaaEsDfsEy0wQ/9EdvDh5V0KqPB8CiC97yBlYeBntg/OHxaqXLdJRl352ReUG35kud690IV56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kbT5nZLn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-432586f2c82so1503626f8f.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888463; x=1768493263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
        b=kbT5nZLn3rlq3Zq7jqmFKRyCS2mQZ+LfUx8T60u/4/VAJKKtjGAWSRPRGu4q+i+gME
         TRKrNfBwx2DN60ncQqYuGfBfo09vDSa7gLwAiB+6007RMSjxcFmJP4gUYyRbHb22BO/A
         LaGFuE1Al35wfJfxZzQ/7TUAAbxx8G63zSb+e+JXn9wr8zDVBupHcQHG9LVl9CABIPeQ
         4v84V+9xQwIo92OciyxV0Hrfnl6mgI+UbesNnPurF/aByWj/Env+UrhL0NAiQ+qeXrvm
         Ugg0LdvGXziM5WioJOcSsH8YIsP36WEBecrz6he/V81mVTGUA3bLKaji7Yrj3WpHGLxa
         ViMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888463; x=1768493263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
        b=a1wNs6cqySABTzGLN+WzW1I/Tg/5Pn1g7ro1Zh6HBCikLpGrhpX4fRQ+F5nElqARbH
         xtAuYKXDx5H2WK1o9tVMrNHEPq3wN5ZrR7Bf4ndVGoc+VRKux5lGvBVYdgCCwJD0aUI+
         8uKeX4IEaItaXCSMKl/pKhpXYWbYLhaws1ZOMjG3wMWaG71aK6gkLzV4C0RfxRMmQZ8v
         Betu2SnrIqr+a8QfGbeY09TfP1LZ/nPnlmM5BkLYPgKw93SzVLC+umNFEIebuWIL/AIP
         hDGSehmgGIoEEgUgz1IbNHZlMGEFB7rMHi61J7ICRG6DSs8ebKGU05lSsLphKlMH6C/j
         ZTKg==
X-Forwarded-Encrypted: i=1; AJvYcCXkF/hRlcsOEcFKnIt/KK47nQd2yIDLTmZyZ7gOWTExc3UbGa+ZIDSdau/3mcg7MWNWdSAGTqWZOlEDkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyx4H6U2X07NX/eOOGj2gFmnQxgYcet6y5AsxqyFSmHFeYKXQg
	aO9vdOq2PabBghfqiZauuOlhIRnR10Gg0R9bWPAeUD8S2t24KhK/gc30v6YFNt3iRouYB1eXkbB
	Lc5I3sgIM29pk2g3YfA==
X-Google-Smtp-Source: AGHT+IELwgIWCY/J1hvJcROgHHhPtNfYmVFPy3DR5T4AF6N3+oYhJGrZ8GFSbPrxOSUZVlJIw2ilobL0+dO9O/E=
X-Received: from wrbay21.prod.google.com ([2002:a5d:6f15:0:b0:430:f9bd:2c6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2207:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-432c362bf78mr8482438f8f.5.1767888462740;
 Thu, 08 Jan 2026 08:07:42 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAELWX2kC/23MQQ7CIBCF4as0sxYDo1J15T1MF0AHSmJLAy3RN
 Nxd7Nrl/5L3bZAoekpwbzaIlH3yYaqBhwbMoCZHzPe1ATlehMArc/OaRxbXtDDdiptRBlvVS6i HOZL17x17drUHn5YQP7udxW/9y2TBOCNtpdQWT2fiDxeCe9HRhBG6UsoXJH5RoKUAAAA=
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=snxThI8cYlPfWm0VQSv1csU1h0GPhmXiSH+DK97/5yY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZH3Tr28HEcClQ+ZDYSEkR/L6fUjzsnzmv5F
 BeIx0yoLAKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WRwAKCRAEWL7uWMY5
 Rt0REAChUrcJne916D6faDvqGiRD5g231h04N9otKKhmpsWolA2a/ys2BTZD3POx29KNCGGwvon
 rqbEXw+izw0oLt8nyONEyDJ0FQEzYNg3U3XCwhcafeEAwjXPl/qShu2jZqWKJpckQbpZfrxMBP5
 RAjMWIalnaE9hAQGspLSNAatkA1Dp/mAA7/zZFc2+mRr3BzsnRMOHZNJoIxQWwdAmXAHjdy4nvC
 cUHwu1MetM2WGhE9cNzEB84RdpIc59o68meuQ4a0odTAt2r2yIdpcLSgQIGgefFrYhCstjzFy8/
 hIWLbWwxUfP6l3Ie0u09nLOHn8/tHETnuZ4soTrvi7bBIsBIhgibrnFyefgrRPUdl+g5vkZbS87
 xoqIjxnjwBJYD7QrIw04iFmCSArVo1bjZ8piHoXzCmwDJhI4rc326Lm5pO8ivgdz7o/i8UiBEF3
 MywNzDyTMwsUjle/HG2/Z5lhRpT+Chm5BCjtirWXP3EAp0h1wJcsH8AF1avryc5CqDVIBBU6kc5
 sweGcqQFhTo5Ra5bDr2K9LENRjSmkHwzmHFnipDJph8IELNzuEdGGeba2EGzaszhlCzmTENVrbb
 vx9a86rmbiUuivhvyCcNbH8dRQG7mvTc3kLjBaRKM8UmIVKm95dXUMV9sYrIm0rJurciOILvVyx gsvtgtvLv6p7qBA==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Subject: [PATCH v2 0/3] Rust GPUVM prerequisites
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
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See v1 for the Rust code that uses these C changes.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (3):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs

 drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----------
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
 drivers/gpu/drm/xe/xe_vm.c             |  4 +-
 include/drm/drm_gpuvm.h                | 12 ++---
 8 files changed, 76 insertions(+), 49 deletions(-)
---
base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


