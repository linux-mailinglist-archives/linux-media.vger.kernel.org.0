Return-Path: <linux-media+bounces-42384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC2B53EEC
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 01:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C1754E1F3C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 23:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346A92F90EF;
	Thu, 11 Sep 2025 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WodLG1be"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267532F83D9
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757631753; cv=none; b=oNt+O4P0IENhOpDuRVCDivRGZLt6/NfFpxcb2FUCmSljk84Kf5rX8F9rsi+eXpSOX4/kUBaG4f1pXDlcBTqi5QvQaGz/D34ZDpni2O3v7nCo8SXKej8ISvkwvwunMiSYAufKaxiZADdLt5pgoJwrP6MU5xyL9dbPPVBMvEIG4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757631753; c=relaxed/simple;
	bh=Fc+a+QzXc+TZBIolL7Y1Rn6e5z/KVffeLjbh9jDPAEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hil3hce/8Xee1AK+/pYGezHGcxOeTanzZTlz2XQDAdrzwdlFCA4xVujG6L3L4MetuZ9pVeqEgocAAWb4DIaSnP1evRVDlJNQOWOgDZDkilC92dNiu3bHUehBBPOVhbTTT1JsSyr6ARpLSLdYCUXtlQiBFaXCZRykFW2E+YHaNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WodLG1be; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757631751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpQfGQvyVQ9OG4v6u5HPL2iypq3YcMiRupYpuBp8hgk=;
	b=WodLG1beH0EoWG6r/s+UXzhKUs5TSuiJnVTGBXg+A8gOhL0cu0JpPf0QWSaOBOWI0QyO8X
	LsACeu1qFFqxIvyD/3ar9SuorIufBS7Vci/Z5ZuAIGRGs55n3EIRJuRugFRwT4GCXkrnh4
	ifgs4PEAwdxjFxiY5tvWJXyU8pQVNio=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-T_FfWwLHOvuT8_GjnlcWKw-1; Thu,
 11 Sep 2025 19:02:28 -0400
X-MC-Unique: T_FfWwLHOvuT8_GjnlcWKw-1
X-Mimecast-MFC-AGG-ID: T_FfWwLHOvuT8_GjnlcWKw_1757631745
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 156B5180028C;
	Thu, 11 Sep 2025 23:02:25 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.100])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B8E61944CCA;
	Thu, 11 Sep 2025 23:02:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v4 3/3] rust: Add dma_buf stub bindings
Date: Thu, 11 Sep 2025 18:57:40 -0400
Message-ID: <20250911230147.650077-4-lyude@redhat.com>
In-Reply-To: <20250911230147.650077-1-lyude@redhat.com>
References: <20250911230147.650077-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In order to implement the gem export callback, we need a type to represent
struct dma_buf. So - this commit introduces a set of stub bindings for
dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
currently implement any functionality for using the DmaBuf.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V3:
* Rename as_ref() to from_raw()
V4:
* Add missing period to rustdoc at top of file

 rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 rust/kernel/dma_buf.rs

diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
new file mode 100644
index 0000000000000..50be3e4dd4098
--- /dev/null
+++ b/rust/kernel/dma_buf.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMA buffer API.
+//!
+//! C header: [`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
+
+use bindings;
+use kernel::types::*;
+
+/// A DMA buffer object.
+///
+/// # Invariants
+///
+/// The data layout of this type is equivalent to that of `struct dma_buf`.
+#[repr(transparent)]
+pub struct DmaBuf(Opaque<bindings::dma_buf>);
+
+// SAFETY: `struct dma_buf` is thread-safe
+unsafe impl Send for DmaBuf {}
+// SAFETY: `struct dma_buf` is thread-safe
+unsafe impl Sync for DmaBuf {}
+
+#[expect(unused)]
+impl DmaBuf {
+    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
+    ///
+    /// # Safety
+    ///
+    /// The caller guarantees that `self_ptr` points to a valid initialized `struct dma_buf` for the
+    /// duration of the lifetime of `'a`, and promises to not violate rust's data aliasing rules
+    /// using the reference provided by this function.
+    pub(crate) unsafe fn from_raw<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
+        // SAFETY: Our data layout is equivalent to `dma_buf` .
+        unsafe { &*self_ptr.cast() }
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
+        self.0.get()
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fcffc3988a903..59242d83efe21 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -81,6 +81,7 @@
 pub mod device_id;
 pub mod devres;
 pub mod dma;
+pub mod dma_buf;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
-- 
2.51.0


