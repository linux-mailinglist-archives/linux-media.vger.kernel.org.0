Return-Path: <linux-media+bounces-42383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE62B53EE8
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 01:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 625187A93E9
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 23:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941822F5328;
	Thu, 11 Sep 2025 23:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DY1vZauC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D293635
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757631739; cv=none; b=fera3V26Pt288xv2EiA7k4Cgdkqpwk6JcSpIFAcjplpHOR9IaRYbBIdqh/GJjIOwJ9xvSKnRoZzHIFyUQSujxHp6VzPe33Kq44NbzUYh33JnmvW+3MUCiSJNQS5VwGGIGd1fbjNjJp9OtO0++q8FJkoSX2QwVtUoKmBc+q3rY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757631739; c=relaxed/simple;
	bh=51+j2G3jX1/iwGsa3g5HjuCNaEHNhi9fYTSqPl/nCho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUEofAEIM4Lj0Mg9201qGzBmZPmbUDcA6SAOwuCWxsybR+HkoLQpGR8B9k3jxBr7FvZE5mvEBfmG9XplaSJ9FmvUee4tfjCUT7JXRDsKAu62ERNHvTg7+wp4EpfXaMY59a6SdV62tDYLi7bQ7pJioyDN0BU1oAyYsc/0et+J8Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DY1vZauC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757631736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jX539gy4ga1WpoOhYjw4dFCHXo3YsCbMfzCE1qBcZAA=;
	b=DY1vZauCK3oHYvq5xq/zVVwGznupeWCKllpRVo7rOp3RE+Q4AmkUjk8csQJeHX0HTbx+Jg
	lCQZmsQgYxmMSuhv9OQ2uanCJUUF9j/RMSUxP5JrRb+COhWQonU/q3JG9RFa2r8e07ZJaZ
	cQgWpfRI/L81BN1J0FVkrGMRv+2E6zg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-1Fv0UuF0PEavtQJteIAALQ-1; Thu,
 11 Sep 2025 19:02:11 -0400
X-MC-Unique: 1Fv0UuF0PEavtQJteIAALQ-1
X-Mimecast-MFC-AGG-ID: 1Fv0UuF0PEavtQJteIAALQ_1757631728
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D33C1955D86;
	Thu, 11 Sep 2025 23:02:08 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.100])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9DE721944CCA;
	Thu, 11 Sep 2025 23:02:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v4 0/3] Batch 2 of rust gem shmem work
Date: Thu, 11 Sep 2025 18:57:37 -0400
Message-ID: <20250911230147.650077-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Now that we're getting close to reaching the finish line for upstreaming
the rust gem shmem bindings, we've got another batch of patches that
have been reviewed and can be safely pushed to drm-rust-next
independently of the rest of the series.

These patches of course apply against the drm-rust-next branch, and are
part of the gem shmem series, the latest version of which can be found
here:

https://patchwork.freedesktop.org/series/146465/

Lyude Paul (3):
  drm/gem/shmem: Extract drm_gem_shmem_init() from
    drm_gem_shmem_create()
  drm/gem/shmem: Extract drm_gem_shmem_release() from
    drm_gem_shmem_free()
  rust: Add dma_buf stub bindings

 drivers/gpu/drm/drm_gem_shmem_helper.c | 98 ++++++++++++++++++--------
 include/drm/drm_gem_shmem_helper.h     |  2 +
 rust/kernel/dma_buf.rs                 | 40 +++++++++++
 rust/kernel/lib.rs                     |  1 +
 4 files changed, 111 insertions(+), 30 deletions(-)
 create mode 100644 rust/kernel/dma_buf.rs


base-commit: cf4fd52e323604ccfa8390917593e1fb965653ee
-- 
2.51.0


