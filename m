Return-Path: <linux-media+bounces-28438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E97A67D16
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 20:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E26C88593A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 19:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B32213E9E;
	Tue, 18 Mar 2025 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ISq/xUWV"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773EB154425;
	Tue, 18 Mar 2025 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325830; cv=pass; b=LZ3DdqNnVz1RZVgbQ6LBqTjs4nTBGprBSse3BC8fQasPbOAQZIdHmHe3nyzfBUP5zdH0uzYnTCWW2wPRAyn3qKy22iRJ4UjqMd4ZEf6GaSus8mw/MFJXhpEOhb2+uo6V6NfYwUYjyeVBOa6k3rQ0MvGvj+dPIuvf3z411tMXcEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325830; c=relaxed/simple;
	bh=QCQpNwOESIM11vLvVUirJhIiLdrmDQgF5PJMKWi7dSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ooaeoGnZhsOs+BaPciNJQFOi+GNoblBHDje9yX9//z7vgXIPGrOs1rrXVh4Vc1rXZmtcY5IkcGLSnIeUx6+rIeZlKnOjhfLO26UZxgg/bV+MFsQ1a/kuLoNBC+L1qPcmGjiFVQcFnOUSHX1ZSdJ27wYTnMQSjfu276Z0p2Ug73Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ISq/xUWV; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1742325776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YN3yBo7fSY6NtgndMEoltJs5TFH03pgIF/PKO1UCJqseBIzZE/CIaPrQKLxSTFLA0x/hIcAsZmHuyoKYSd4yhJYu9DsbHoG0wYA/ERz4RFJwJVeIqBSLmfAU1BxTzsVgRn7pJ3zXdIZ8WutcpFLIBgm4cuYkx7tqY2mQODkN+ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742325776; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rz6R4RVDyxCD4ijy0dJnSvOrF4NkRk+ghOw9yCNP7Hg=; 
	b=CbT7wfUmf5zuX6X7gMqj9ZTv65dSM3aFyxkp5P1jjfC1g1kVVPkgjbqZn5cN9jHIYGRyJVtYEgstwSCtzkXn9LFShMhqJdxvkqbuXKxRPh7uiTcFVstMFlD9KT+IsJUfuxpbrKZjz0YWjaNF53pFZOmb4VMSsfQuBbsPtlOEClY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325776;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=rz6R4RVDyxCD4ijy0dJnSvOrF4NkRk+ghOw9yCNP7Hg=;
	b=ISq/xUWVsYkrLhJ7g4KMNX6TvL5jONcig7h+YUaygwRPZPjSMlEzT8NfFGaiOnk6
	+hL+BDFdfvsX7O6cvfe8WtBMu4Y3SES5tsC6BNKmT/1Sjb4OtNA5fDZ+Y6bmWGJLhJa
	xrAWlRFBeVNfxzu+t3p80FPJXPh7WsWYXlaigOk0=
Received: by mx.zohomail.com with SMTPS id 174232577443424.905915853504553;
	Tue, 18 Mar 2025 12:22:54 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/7] Rust abstractions for shmem-backed GEM objects
Date: Tue, 18 Mar 2025 16:22:34 -0300
Message-Id: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrH2WcC/yWMQQqDMBBFryKzbsCMmai9SnEx0YlmEW0TWwri3
 Rvq5sP78N4BWVKQDPfqgCSfkMO2FtC3CsaF11lUmAoD1kh1ozs1pahmiSovsWznnDWts9bpEYr
 zTOLD9997DBcneb1Ldr9OcJxFjVuMYb9XdYvIjTdeExliw0h+0mic7YmYSrvvBBuG4Tx/+sGlE
 KsAAAA=
X-Change-ID: 20250318-drm-gem-shmem-8bb647b66b1c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Hi all,

This series picks up the work carried out by the Asahi project for
shmem-backed GEM objects. This initial version is meant to kickstart the
discussion on this topic, as the bindings will be clearly needed by Tyr
and other drivers.

It has been tested on both AGX and Tyr successfully.

I did provide a minor fix for a missing #include, but I did not touch
this code otherwise so far. Even the rebase was done by Janne Grunnau.

Applies on top of

commit 0722a3f4f15545a4a25fd124b6955a5b6498e23a
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Tue Oct 15 17:19:27 2024 +0200

    nova: add initial driver stub
    

---
Asahi Lina (7):
      drm/shmem-helper: Add lockdep asserts to vmap/vunmap
      drm/gem-shmem: Export VM ops functions
      rust: helpers: Add bindings/wrappers for dma_resv_lock
      rust: drm: gem: shmem: Add DRM shmem helper abstraction
      drm/gem: Add a flag to control whether objects can be exported
      rust: drm: gem: Add set_exportable() method
      rust: drm: gem: shmem: Add share_dma_resv() function

 drivers/gpu/drm/drm_gem.c              |   1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c |  13 +-
 drivers/gpu/drm/drm_prime.c            |   5 +
 include/drm/drm_gem.h                  |   8 +
 include/drm/drm_gem_shmem_helper.h     |   3 +
 rust/bindings/bindings_helper.h        |   4 +
 rust/helpers/dma-resv.c                |  13 +
 rust/helpers/drm.c                     |  46 ++++
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/scatterlist.c             |  13 +
 rust/kernel/drm/gem/mod.rs             |  15 ++
 rust/kernel/drm/gem/shmem.rs           | 457 +++++++++++++++++++++++++++++++++
 12 files changed, 577 insertions(+), 3 deletions(-)
---
base-commit: 0722a3f4f15545a4a25fd124b6955a5b6498e23a
change-id: 20250318-drm-gem-shmem-8bb647b66b1c

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>


