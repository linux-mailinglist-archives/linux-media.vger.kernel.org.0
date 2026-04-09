Return-Path: <linux-media+bounces-58354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hy2Hq/F12mdSQgAu9opvQ
	(envelope-from <linux-media+bounces-58354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:28:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33513CCAB2
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F00D3041685
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5AD3DF004;
	Thu,  9 Apr 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XfbB/X2K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA753D34A8
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748379; cv=none; b=fzD5YPIggJpbt0cg+eZRHfFbaXoCtlq//CUvNuCnuVSpluI6D29pyR/muDOmEdWZR3PwNj0HmuhsPr+/dQhUxmaDijjXk7/QYr1ppMRbamhjbDicnOJUl4PqQqKiSSuPj+8a5z3cf+rW631/DIp97fqpzr8F4i/P4FzfZpSUWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748379; c=relaxed/simple;
	bh=3hE8CiYDdL6dIJtuPkdDujtMFv8WlE2/F3zEHqm7ymU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YWDUpL0Avja9hD4zUm9fpizypCyai1dVajWdhVaux3UZv+Qm1aQMCE0q6siaL6OhXjO/9dSlp4GVrCIkc646zSY4GKcFJUkiJKJbr9dv0g9uxXcTPTqTBHemz8wYQF/MxZnB4TROfDmi0wPgSnPrh8M6Suo9odJ3kVhDTc1b+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XfbB/X2K; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43cf5b4dac8so1062244f8f.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775748377; x=1776353177; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cl4zHEWa3vbNqjNAUqI0XoqCdjJniLlktUteRV6Lwh0=;
        b=XfbB/X2KcXhF6tO2rLHTMgBT8p2kwnkA61QDomI7JyvuaEEXu+NFs66klJgn73uI1h
         BHm394Jcsh4EIcpIZf/i3nZddvdQxQDU0qKQI/CO4Ej48hn390+Yh5Bj7iff5U9CfMT3
         ufJQAgOiqjTnriJzvktV4kOBti3UWik7ExioAuybC8nl3BfN5iuS+pNrJsbjEidqF6g/
         rKTrGfp+uouheng+JhiEVT/7xMeEnlob57qyDGxMfv39koYtNS3AvxU5fbC43JtEoAWu
         /P2tRQ9sKJ9gt2VEZuz0qaG7XLFgRVrkT7tpyLrxMPuSEIfjO26VqkzvxpGNNiYxDUK/
         oEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748377; x=1776353177;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cl4zHEWa3vbNqjNAUqI0XoqCdjJniLlktUteRV6Lwh0=;
        b=IJMvXJcSVHWHOtVX/BUDfjesD7ihSkzLdDhQwccpFWKiLMoS9K5KMZv9988LM+I4na
         Z+P9mHR6JlXhBcVrkFr3dOBC+OsuT+jhj2dEeg83+KrFIc5lu0VqdY4Ix2Q5WK9atbBG
         nXcGMN++xEGkWxlhAH2/v9AsgmVPQou5LUOj+adZqAfSsNAoQzAsl3sYK4AM+vqdCK7P
         iRvQd+o3Macxao0CADWHvhQTad/SoSQgTHvBRTYPDHX8tXMOze6ByniOYHeCh6YJMmrT
         UqqsJ4wnVztuztHa+Cg2Koj0cryQGZsQzxpQElel3Ix/8p+Vd4n5HgVWfEjalibYFGBg
         BVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUAeFImBKJLA4xZKFKTBBswHZWE1ymTt+LIEOdA/v4qD1CdhPqu2Hszljm92NTbxYZzktgN3i4kFw9dhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXxjVFi/gJTpLkB6b/B7D6Lm4VuGuHGIMMAok02nyKV/pTXate
	LTAYeWXkrqhAQKmipVUmlnUeEgJ52t3EgmmMIvF7Ba9tLULm/POa9Jc5BHBEyVw9FkgkxJv0Lf7
	KMLgmmuw5El88JNVyCg==
X-Received: from wmbgy21.prod.google.com ([2002:a05:600c:8815:b0:485:c45a:fcc2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec7:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-488997ed46dmr357920975e9.27.1775748376544;
 Thu, 09 Apr 2026 08:26:16 -0700 (PDT)
Date: Thu, 09 Apr 2026 15:26:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA3F12kC/23OS2oDMRBF0a0YjaNQpW/bo+wjZKBvWxBbRrJFg
 um9R20IsegMX8G51J3UUFKo5LC7kxJaqimf+1AvO+KO5jwHmnzfhAGTiGyi8+XWTrTc6pVajXt
 nHNPGK9LBpYSYvh6x94++j6lec/l+tBuu138zDSnQYKNSNjIuArzNOc+f4dXlE1k7jf1aBQijZ
 d166wEFgDRgN5Y/WYaD5av1e+lAmOC43FjxZDkMVnQ7cSU8gohRbH+Wf5az0cputYpeiIjaTHq wy7L8AF9Z+YeVAQAA
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4085; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3hE8CiYDdL6dIJtuPkdDujtMFv8WlE2/F3zEHqm7ymU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp18USp6b8g89yw68rMzxWuogMUxOhaCvjY1ee7
 ooHzNNMzgSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadfFEgAKCRAEWL7uWMY5
 RpUKD/9RArAhS1RNQNBOKI+dzKU6bec/e0RRFc+Yu77+EHBMb8iJE8A0EbveMxwvU9wF1IAABFS
 1OEIkKcy0LP4pEg5szdlL3/PQRPPztTMX0iabUkSFtFXDUSYVIP86tVP65Wjd8jYotmz37CALOo
 ygNXHhHSE/6gn84hQIRr+vrRQ9LImROE+i88NpI7Y3LHGRbBUdqq6JbKPkqB0yau74SMT0dNw0p
 I6GsAfIZHjmOzwWnsqEpxBIws0hK58HXorjhnVkA/8HiefQvjcXVW13ePNIm/BeEAo/iNeWi9jx
 Y5gOCfQnEzSpM+SGRk+zfhZndiP7IbCCUOKw1cqt8OARn4QSGaCoS4ZoKmjDwX3xQqYURhVhYX1
 ih2rQec17TGFCjQDdvwCoK2KAuXUHbAZ9hWP6CegghkaBeZ/90VCKp6QFr8HVOEgymFhlNAwgKn
 O5B3fNWTXT3MOV3m0bjf2D2vdOxeNh7S58xc1DRaIuXvzcOtiJxP6mB/CcK1fISr3sXi7qKXmrw
 C0d/96DNC17Mx3MYm3M2R8S6tj0AqchTGjqmEpx/IQKHuJkQmkOif2CIHh8ZYcEYcOspyeeUG3b
 SblsNtpxV1B+J3VjLFphdAw+RLwBYzIZjMZ4grLEK3Kg7t1Q4pVy+DeVjCDIdXVRAy8ebtz2jyA wXyA1n8zfk5zZuQ==
X-Mailer: b4 0.14.3
Message-ID: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
Subject: [PATCH v6 0/5] Rust GPUVM immediate mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58354-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E33513CCAB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v6:
- Rebase on drm-rust-next-2026-04-06. As a result, the dma-resv helpers
  patch is dropped because it was already merged into drm-rust-next.
- Fix Send/Sync impls for GpuVm<T> to take T:Send into account.
- Fix Send/Sync impls and data()/data_ref() methods on UniqueRefGpuVm to
  take T:Send and T:Shync into account.
- Pass __GFP_ZERO to kbox, so that data is zeroed when calling drm_gpuvm_init.
- Call drm_gpuvm_bo_extobj_add() in obtain() even if it returns an
  existing pointer to avoid race condition.
- Check that vm_bo is from the correct GpuVm in sm_map().
- Change sm_map() to take &GpuVmBo instead of ARef<GpuVmBo>.
- Document that sparse VAs are not yet supported.
- Link to v5: https://lore.kernel.org/r/20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com

Changes in v5:
- Rename GpuVmCore to UniqueRefGpuVm.
- Implement Send/Sync for GpuVm.
- Move helpers/dma-resv.c in MAINTAINERS
- Improve GpuVmBo allocation and free docs
- Add "in GEM list" invariant to GpuVmBo
    - also mention said invariant on GpuVa
- Replace GpuVmBoRegistered with ARef<GpuVmBo>
- Add TODO about dma-resv lock usage
- Add __rust_helper to helpers/drm_gpuvm.c
- Change _invariant type to silence type complexity clippy lint
- Link to v4: https://lore.kernel.org/r/20260130-gpuvm-rust-v4-0-8364d104ff40@google.com

Changes in v4:
- Add trait bound so that DriverGpuVm::Object must be the same type as
  Driver::Object.
- Add rust/helpers/dma-resv.c to MAINTAINERS.
- Add __rust_helper to dma_resv_lock and dma_resv_unlock.
- Rename GpuVm::raw_resv_lock() to GpuVm::raw_resv()
- Reword comment in obtain() for adding to extobj list.
- Fix typo in commit message referring to GpuVm<_> instead of GpuVmBo<_>.
- Changed the PhantomData type used for invariance and add comment. (No
  functional change.)
- Rename offset to gem_offset in args to sm_map().
- Link to v3: https://lore.kernel.org/r/20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com

Changes in v3:
- C prerequisites have landed, so only Rust part is present.
- The logic for drm_exec was removed, and is for a follow-up.
- Split up into patches.
- Add lifetime to SmStepContext.
- Docs filled out.
- Mutex abstractions used for GEM gpuva lock.
- Drop 'shared data' concept for now. (Can be added back later if required.)
- Rename 'core' field to 'data'.
- GpuVmCore<T> now derefs to GpuVm<T> instead of T.
- Renamed GpuVmBoObtain to GpuVmBoResident.
- Probably more changes I forgot.
- Link to v2: https://lore.kernel.org/r/20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (4):
      rust: gpuvm: add GpuVm::obtain()
      rust: gpuvm: add GpuVa struct
      rust: gpuvm: add GpuVmCore::sm_unmap()
      rust: gpuvm: add GpuVmCore::sm_map()

Asahi Lina (1):
      rust: drm: add base GPUVM immediate mode abstraction

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/drm_gpuvm.c        |  26 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gpuvm/mod.rs    | 328 ++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 429 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 168 ++++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 249 +++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 9 files changed, 1205 insertions(+)
---
base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


