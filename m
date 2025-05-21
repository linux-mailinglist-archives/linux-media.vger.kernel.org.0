Return-Path: <linux-media+bounces-33062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6340AABFE70
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 22:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B4C2501248
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD222BCF6B;
	Wed, 21 May 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X2wufTc0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BC28FA8B
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860444; cv=none; b=I/sLQPiwCCC/T7bCVsVVsp+xPhm+h2KlYEH9EXjh++xCg2b2P5du9KBoCOISXe0bCLN8+Suc6Mu9mgtq4tGDhDF8dM2vKCmWY57NoCfz5H6eH/lah9rS9NjMSChkwqvMxtF5R6oeN/AK88DJFon51N+/jjgQCYWixfoGZ4RYK8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860444; c=relaxed/simple;
	bh=tTrqFtKgFyfWmG/8ZckfcJJSYF4f6jrsg8m0/dT/gEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f3s8xZX91bDjpGZi4o9Nm0DYDHSYEVQ+ZBoocxBtZrFFiQuUaGi4usVjB+hYKCnZ8VvP6V7I3EOutVcKcWUyHJdGyVVFxkT3hp2iELh91VjlqUsVHYXY8s1YqhizQf4ZvEIYhypZN2e7O/6xP0zu1SKn6Y8bEia43QrPwRCES5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X2wufTc0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gFQBf3kZxhcw4apyjcJ1zWnId76v45p2hqlMqonSnO8=;
	b=X2wufTc0/DOKO4MXQShEK3zj0VfjgfbBKhUOOu3XfrA87WbhXtyORkB0VzeQkDrA1t479L
	xTW3o5DkJw9SQn+HewPk5dlgKPI8PrvaYHOVydHIfjOiF6pyU6ub8bSUL+SA+lV50Ra5uN
	4NOH5TrY07ZyJ2XPx/YjWSCnBC62bEw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-w1o_npdaN4S7qmHN0LBCVg-1; Wed,
 21 May 2025 16:47:17 -0400
X-MC-Unique: w1o_npdaN4S7qmHN0LBCVg-1
X-Mimecast-MFC-AGG-ID: w1o_npdaN4S7qmHN0LBCVg_1747860435
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CF7B1800361;
	Wed, 21 May 2025 20:47:15 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0F3019560B7;
	Wed, 21 May 2025 20:47:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 00/12] Rust abstractions for shmem-backed GEM objects
Date: Wed, 21 May 2025 16:29:07 -0400
Message-ID: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida. Along with
bindings for shmem backed GEM objects, it also adds a few features that
various users like Tyr and Asahi are interested in:

* The ability to pass custom arguments to new GEM objects (needed by
  Tyr)
* OpaqueObject (to enable the use of custom private GEM objects, which I
  believe asahi wanted)

And replaces some of the hand-rolled API bindings (sg_table mainly) with
some of the WIP patch series for adding kernel-wide bindings. It also
addresses the comments from the code review of the last version of this
patch series.

Currently doesn't apply on an upstream branch, but should very soon as
all of the dependencies in this series are on a mailing list already.

The current branch this can be applied on top of is here:
  https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust%2Fgem-shmem-base

Which is based on top of nova/nova-next with the following patch series
applied:
  * My (hopefully final) gem bindings cleanup:
    https://lkml.org/lkml/2025/5/20/1541
  * Benno's derive Zeroable series:
    https://lkml.org/lkml/2025/5/20/1446
  * Abdiel's sg_table series:
    https://lwn.net/Articles/1020986/
    Also, there is one FIXES patch on top of Abdiel's work to fix some
    iterator bugs. These fixes have already been mentioned on the
    mailing list and should not be needed for their V2 version

Asahi Lina (3):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction
  rust: drm: gem: shmem: Add share_dma_resv to ObjectConfig

Lyude Paul (9):
  rust: drm: gem: Add raw_dma_resv() function
  drm/gem/shmem: Extract drm_gem_shmem_init() from
    drm_gem_shmem_create()
  drm/gem/shmem: Extract drm_gem_shmem_release() from
    drm_gem_shmem_free()
  rust: gem: Introduce BaseDriverObject::Args
  rust: drm: gem: Add OpaqueObject
  rust: drm: gem: Introduce OwnedSGTable
  rust: Add dma_buf stub bindings
  rust: drm: gem: Add export() callback
  rust: drm: gem: Add BaseObject::prime_export()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  98 +++++--
 drivers/gpu/drm/nova/gem.rs            |   6 +-
 include/drm/drm_gem_shmem_helper.h     |   2 +
 rust/bindings/bindings_helper.h        |   4 +
 rust/helpers/dma-resv.c                |  13 +
 rust/helpers/drm.c                     |  48 +++-
 rust/helpers/helpers.c                 |   1 +
 rust/kernel/dma_buf.rs                 |  39 +++
 rust/kernel/drm/gem/mod.rs             | 187 ++++++++++++-
 rust/kernel/drm/gem/shmem.rs           | 370 +++++++++++++++++++++++++
 rust/kernel/lib.rs                     |   1 +
 11 files changed, 727 insertions(+), 42 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/kernel/dma_buf.rs
 create mode 100644 rust/kernel/drm/gem/shmem.rs

-- 
2.49.0


