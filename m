Return-Path: <linux-media+bounces-33067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77429ABFE8C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 22:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F4107B900F
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381242C1E36;
	Wed, 21 May 2025 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XU85uqUm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446A2BFC6C
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860538; cv=none; b=f8pAwP3GMa3Uiw1v9HGtunnCYocmRtompQYrsKgHhvI0qJNeXmSJYaNfGvNgZ28qyq/CIKmoblVscY2a2rl7eow2bqe0Klho3kuAgDf4Egr59yw01MhEjPYKUDrDlYpn19lKdwRM8FGtEm/x/6zYH0yrr2LO3P4uJHPG0veo6F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860538; c=relaxed/simple;
	bh=NIe2Yj+2RnlxILb9wuK1MskpjvacdpCE0rjM8oanpyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rL+q+vLhd0ttfwvzzyzVpereCu3db8JMBbYCOchFe+gqsnW/X5+2hEfY3iUn3wQVPH5JkIUZ+2xFFGRU40H8RguMu6tyV2H8rDQ9cPMjK/7eyjH0Ew1wmnqyPxTzHiAOBl6fdhFS0XkBOHnL7ftM+xI7Ge6uyxK5mbnVm0IeAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XU85uqUm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfYUdTNb5Gc7ulEphuHVddFPp9Ry0HXZjmcMzmLE0DM=;
	b=XU85uqUma8eNs79PAKDi+xy6PuesvAuW5sbt5BahfDmKwE4y697fRYOPAl/GP+3FFZ3T5n
	9F8UPZEiz3HqHe8FO3IKK1lBYx4BTAmlxZMNAENnXD8zeG0fYCyD5eLxY1PzvpVAhdY6U7
	326Lv7tYSeigw84h3U48Lq9knCYtagc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-A5lh2k0lPK6iSSvRo02qvg-1; Wed,
 21 May 2025 16:48:51 -0400
X-MC-Unique: A5lh2k0lPK6iSSvRo02qvg-1
X-Mimecast-MFC-AGG-ID: A5lh2k0lPK6iSSvRo02qvg_1747860528
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92A671800368;
	Wed, 21 May 2025 20:48:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F37131956066;
	Wed, 21 May 2025 20:48:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 12/12] rust: drm: gem: Add BaseObject::prime_export()
Date: Wed, 21 May 2025 16:29:19 -0400
Message-ID: <20250521204654.1610607-13-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

We just added an export() callback that GEM objects can implement, but
without any way of actually exporting a DmaBuf<T>. So let's add one by
introducing bindings for drm_gem_prime_export().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index ef697f323e52c..ee74b9bdb7a1f 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -225,6 +225,29 @@ fn lookup_handle<D, F, O>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>
         Ok(unsafe { ARef::from_raw(obj.into()) })
     }
 
+    /// Export a [`DmaBuf`] for this GEM object using the DRM prime helper library.
+    ///
+    /// `flags` should be a set of flags from [`fs::file::flags`](kernel::fs::file::flags).
+    fn prime_export(&self, flags: u32) -> Result<DmaBuf<Self>> {
+        // SAFETY:
+        // - `as_raw()` always returns a valid pointer to a `drm_gem_object`.
+        // - `drm_gem_prime_export()` returns either an error pointer, or a valid pointer to an
+        //   initialized `dma_buf` on success.
+        let dma_ptr = from_err_ptr(unsafe {
+            bindings::drm_gem_prime_export(self.as_raw(), flags as _)
+        })?;
+
+        // SAFETY:
+        // - We checked that dma_ptr is not an error, so it must point to an initialized dma_buf
+        // - We used drm_gem_prime_export(), so `dma_ptr` will remain valid until a call to
+        //   `drm_gem_prime_release()` which we don't call here.
+        let dma_buf = unsafe { dma_buf::DmaBuf::as_ref(dma_ptr) };
+
+        // INVARIANT: We used drm_gem_prime_export() to create this dma_buf, fulfilling the
+        // invariant that this dma_buf came from a GEM object of type `Self`.
+        Ok(DmaBuf(dma_buf.into(), PhantomData))
+    }
+
     /// Creates an mmap offset to map the object from userspace.
     fn create_mmap_offset(&self) -> Result<u64> {
         // SAFETY: The arguments are valid per the type invariant.
-- 
2.49.0


