Return-Path: <linux-media+bounces-56539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC8IBzZxvWmt9wIAu9opvQ
	(envelope-from <linux-media+bounces-56539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:09:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FA2DD153
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F4B0305F484
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C389F2D0607;
	Fri, 20 Mar 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K2k35VTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31539B483
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022919; cv=none; b=ESqXoArLv68xiIMUaH9RFO7F/xfs4EwVsFBSDOmWb9Cu4telF4/WEBn6G6Uw0CqTNryTPVXtrrfdSpGJYwtK0JIBgbKJ6NAQmc9H9EjyGzkopQDF0St8Dv/+iuZh6iunJ5vFrDbxpW71+ZzMlIIOJiu6FEQqWabMbi/jMB1DOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022919; c=relaxed/simple;
	bh=hBlKdMS6RYtRgGMEPDODjPhE5SmwLiL4EI9j5rPli5Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=W9AfXs7JHR0VJW5H8xzvnS8pAod6VDqsl7N/IGeuroGIWcWE03isJpkGG0FcXFspyfPAyzwAqv4ZWKfXcR5s1XG3umWYqt9igKRTcyHvD56KoVlJyZRfFAitxDQJcIZEf3iduEGe4a0wE6xfJLZKtoJXNrSun03qek39n39+Sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2k35VTW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4852ccff333so20987655e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022916; x=1774627716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hILqzC7MD7FbW4XOE96YtVaGbJfLwnag6+QDuuvsh58=;
        b=K2k35VTWrVHNBUm65NkNHhtkTbDBU7jz/JT2yWh15A49Yj1RjZhK1Dnk0UsOd7KuaU
         7cppGJB5yXi6D+YvM4NkXJBijQ4iae6lUdWuWj+egZGcs9BtGB6ywunXIpF45JJl3DhS
         bxTu4KiKIoxq5HURj/HuCVscDeBIWuDKrJOCnKlNsFCR1HbjW3gkqRdp+5LsvkxVxz7F
         W11imRC3oOMWtQD2Mxb77TuWX6NL/g3llsfeBdjst2KyBbSXTdHlRAKTjbk8dAPJjmJR
         /g0r8/8qrcJBJGth9kldT8Orc9w3gxteIvEtw4sIQj8ci61oDHIL0UgNOOFluzr2nBa1
         HRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022916; x=1774627716;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hILqzC7MD7FbW4XOE96YtVaGbJfLwnag6+QDuuvsh58=;
        b=DjCuHK7Ce6RqC5HXHQofJuBXzA22zwl6j6E9XypjRA7t1IjnHOxtG2XQ/B8SbPeY6W
         b5e6lHznTJ/itp/n51JHDz7w3BIQZkntVpWpF2DQMKy9M222Ia1vZwv8xfksinlKFlA3
         7UK9JrG7fMRQOdbDPpEyZsTtWZjntV1OoBehjz1z4WweCg40S8y1ceVWLM7Qz/H1WA/g
         /JmqaWFVtlkgKMoKV/2EzvoaH1+ahb/++6mz35jk98KI+8lHc6qBlRa+RShnUMFrzQAA
         pabjFALgZMHgB810jJtYNfwQOh0rrVKUAbcrzcspQM/L5dQGWA4kCCmBPAqGPfNX0yHQ
         JNmA==
X-Forwarded-Encrypted: i=1; AJvYcCXC6iaF9i8M+sQn6NyjbvDV+htjnOHj+Yc2Pbr4M+HeMrMNM3GOYJaeJyU6LVsDI7FOuD/p8vL8shzkgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyucT1uWZLXP0W0Mt7X9VhRXDuOOJZcp7f6QvYu80w0EbTn3oMR
	1NOLWb7vC+mWIWXgfcY4DgJOgT6aurAK/XObUGHSH8fOk8q61Inc7CqRIxjOL3SThJN6hn0DU25
	p5wB/BBrnnf/y8BbEBQ==
X-Received: from wmoo17.prod.google.com ([2002:a05:600d:111:b0:485:4ce0:d98f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2d14:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48702b718demr12384625e9.33.1774022916077;
 Fri, 20 Mar 2026 09:08:36 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPlwvWkC/23Oy4oCMRCF4VeRrI1U5eZl5XvILHKptAE1kmhwk
 H73SQsDNro8Bd9PPVmlkqiy3eLJCrVUU770oZcL5o/2MhBPoW8mQGhEseHD9d7OvNzrjbs1br3
 1Ym2DYR1cC8X0eMUOP30fU73l8vtqN5yuXzMNOXBy0RgXhVQE+yHn4UQrn89s6jTxbw0gzK3oN rgAqAC0Bfdh5ZsVOLNysmGrPShLXuoPq96shJlV3W6kUQFBxajmP4/j+AfajeGXWQEAAA==
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=hBlKdMS6RYtRgGMEPDODjPhE5SmwLiL4EI9j5rPli5Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXD9hBnBy4v/N6Ooh3haSutKrTSCowEuWwZf9
 kZMSiNUnCOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1w/QAKCRAEWL7uWMY5
 Rr0QEACZwV9PxTgCruBbLTsHjzQgM11t+YsflqqbdcOgBS/GhczSHGBedviQkKyhzvAMab4HhUl
 mdsRWPVwejLNQigClprES3R4MULyJdPhYfR97xA9QffeRgfjgwzkupOrre6COplPPfZQ0xK8FQl
 THXBKbzpdG49Ew+gup/wCJasXqCdCGtaHQC41z+mk440fvmiP+jxAIKVxtjYV8v9u84QWMSzYec
 k533VjGC2VwMPYJp8k1wVToNSx/Qj1XFq/KdsEq7phQtFoLpUijN6ODhnM5E2d8cxYDpZD3Psz/
 lDDr2AkmbYPoa2ndyrLLFJHp6X6f9c4ikaLmm+akIlqAX06hhqrrqhatGFcvbP9C2EsY5q/QXg1
 Vu9dl6J7eZ+m/LOXI2MoaPfnHT5hxiK4nAzW5HSOQTpD9S+ypJmBPOdSbGT7837CsFTdan2mWy2
 cZdXgLqL7eO7HfuRmsj5FUVaken6OCRCe/RVYJX32Aw49NjesaVsDov+toyluRsmCB0T7E6ZTvq
 L9qfmg4gC4VKE8CKrzOQsWiviHe8sUljWf7BPDNZgSKMaQlTDkzRvxDFPJO2s77/5scbnd2F/1l
 sKMtkVddXR6A7NGJbsah41YY1WAFhxO/R0ZQ0UDzRJKP9m1UQZh3IKM5GafFsatzfCB1zhoCo+D C7ex9s8fEM/0HmQ==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Subject: [PATCH v5 0/6] Rust GPUVM immediate mode
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
	TAGGED_FROM(0.00)[bounces-56539-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.941];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 832FA2DD153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series provides an immediate mode GPUVM implementation.

Only immediate mode is provided for Rust code, as all planned Rust
drivers intend to use GPUVM in immediate mode.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
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

Asahi Lina (2):
      rust: drm: add base GPUVM immediate mode abstraction
      rust: helpers: Add bindings/wrappers for dma_resv_lock

 MAINTAINERS                     |   3 +
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  14 ++
 rust/helpers/drm_gpuvm.c        |  26 +++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm/mod.rs    | 306 +++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/sm_ops.rs | 417 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     | 150 +++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs  | 234 ++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 10 files changed, 1155 insertions(+)
---
base-commit: a19457958c3018783881c4416f272cd594f13049
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


