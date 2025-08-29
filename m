Return-Path: <linux-media+bounces-41365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA2B3C547
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 00:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2A2189A873
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC92DA759;
	Fri, 29 Aug 2025 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MZKY2ooG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5402D9EF8
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756507389; cv=none; b=BIawNnr3p/A9ya9bDZzoHMcM3G6XfsspR865LNqW2/0xTEHa7T6/G3ZcQ/mUeTVfETxD0pFjhxD72lNoWuShTXV8mX4FfR5h+9XsCIgyFJjS4UqprigKnDdapPaGqyuZTDsiHE3UnGtFl57ukxW794aprUsfd3B75t7No2wfenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756507389; c=relaxed/simple;
	bh=TAHkk+DHc4JvZqTuooUCu7rvxP0alLpYlxkiJmeOPBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0sU643k963GvzxZQ1ShnpcDhfrUZMs67j/KX9Tg/BpL9cmfocqkrj7AG6GcLs3Ae2hyx3K9zn8JpnnKHHaYUWP0Kv+D7D1YaMkiSDRP2F8cqqMpNNZDgH8yteYFPgyYjva0k7xmAUnSYOt56dQNPgvPpoq9CX3u71UyFz8XUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MZKY2ooG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756507386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2F8pTf5YP3aNkFLN54qB5DgCyFojIIWqrlzr2JxhFU=;
	b=MZKY2ooGq7htjcpX93eXd9gCN1sEAIHMxuPSMMCE8gRx67x1hGSn3fPsNj0pfiIfWRMVq0
	oxvD+OxwWtNdbpYFvmAgPzSirmBTQtXSkV4YZbmpgaQkn3h+9TW6G6icRu+jn3HkcqZQUo
	x4HHXT9TB6DV1XeIU7iFdgPDGkQ3qf4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-sNZ_ShMXOKG6hwSDIMw1iQ-1; Fri,
 29 Aug 2025 18:43:03 -0400
X-MC-Unique: sNZ_ShMXOKG6hwSDIMw1iQ-1
X-Mimecast-MFC-AGG-ID: sNZ_ShMXOKG6hwSDIMw1iQ_1756507381
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1D6E195604F;
	Fri, 29 Aug 2025 22:43:00 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DFF3E1800280;
	Fri, 29 Aug 2025 22:42:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3 12/14] rust: Add dma_buf stub bindings
Date: Fri, 29 Aug 2025 18:35:27 -0400
Message-ID: <20250829224116.477990-13-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-1-lyude@redhat.com>
References: <20250829224116.477990-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

In order to implement the gem export callback, we need a type to represent
struct dma_buf. So - this commit introduces a set of stub bindings for
dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
currently implement any functionality for using the DmaBuf.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename as_ref() to from_raw()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 rust/kernel/dma_buf.rs

diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
new file mode 100644
index 0000000000000..a66829afcd129
--- /dev/null
+++ b/rust/kernel/dma_buf.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DMA buffer API
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
2.50.0


