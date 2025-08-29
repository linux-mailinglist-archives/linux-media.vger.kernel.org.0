Return-Path: <linux-media+bounces-41367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F9B3C554
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 00:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99EA3B49AD
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4152DCF41;
	Fri, 29 Aug 2025 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3H6Orqg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D62D8382
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756507413; cv=none; b=Aoo038RQebrtNQxOamiaMorJycWmOoatw3NJt3TmkRF67GljNfKCp1uRmWJKQKmUjLzUYScXZqTEjnREWEZkhMxf8t+ExAqWRmWW2g0UzWfyiVYJ7OBZ+QJ5AJrfFkg+SShPt6ws2LhAkfc3CjR1VrnM7OsMkzKF5VHoYOyosRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756507413; c=relaxed/simple;
	bh=v7GAqsPgMWB93HEjuq9XkbeHGGs3gLpuJrD8ZVFOITc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtwWu69bOUq8vdHzs/0J4Lm1PKsO2iggDcidjZoHAEfX0CEtimKh5Jolvx68DaToNcNdKEp3dyrZi3X2DDqB3zUQ1b+Knr+nEU3lFH5lclRjIRWDjgzrtNfsAknJ0/usZWrtAyAkTBmZWgba5S6wE7A4ue+wM5w+GayyAlUUijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3H6Orqg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756507408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/CGc5IYCcldED/cw1fL3e87GMHcob6lNDfrF2dVSZ4=;
	b=U3H6OrqgzyXr8IPnnzgzzEr7YeVrMvJ8BRILirLyR18S6/tDgt0e9zC/XIVsxPwHznVuce
	TFiNUznqE1C1Mrn5ii8bD9NvvYUxHTRyrIKwDq0GkFwIpC8LsIyT48afa6szFnKpLRXXRd
	FI5/je9yr6B4j1fQDnABmN5QceXxf4k=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-_Ln9jEUpPEmpud-bgdS2Tg-1; Fri,
 29 Aug 2025 18:43:25 -0400
X-MC-Unique: _Ln9jEUpPEmpud-bgdS2Tg-1
X-Mimecast-MFC-AGG-ID: _Ln9jEUpPEmpud-bgdS2Tg_1756507402
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A32E1956048;
	Fri, 29 Aug 2025 22:43:22 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 998A2180028A;
	Fri, 29 Aug 2025 22:43:17 +0000 (UTC)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3 14/14] rust: drm: gem: Add BaseObject::prime_export()
Date: Fri, 29 Aug 2025 18:35:29 -0400
Message-ID: <20250829224116.477990-15-lyude@redhat.com>
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

We just added an export() callback that GEM objects can implement, but
without any way of actually exporting a DmaBuf<T>. So let's add one by
introducing bindings for drm_gem_prime_export().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/dma_buf.rs     |  1 -
 rust/kernel/drm/gem/mod.rs | 24 +++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
index a66829afcd129..a2086918efd17 100644
--- a/rust/kernel/dma_buf.rs
+++ b/rust/kernel/dma_buf.rs
@@ -20,7 +20,6 @@ unsafe impl Send for DmaBuf {}
 // SAFETY: `struct dma_buf` is thread-safe
 unsafe impl Sync for DmaBuf {}
 
-#[expect(unused)]
 impl DmaBuf {
     /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
     ///
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 1ac25fc6d527b..75ffd5541e84c 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -11,7 +11,7 @@
     bindings, dma_buf,
     drm::driver::{AllocImpl, AllocOps},
     drm::{self, private::Sealed},
-    error::{to_result, Result},
+    error::{from_err_ptr, to_result, Result},
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
@@ -225,6 +225,28 @@ fn lookup_handle<D, F, O>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>
         Ok(unsafe { ARef::from_raw(obj.into()) })
     }
 
+    /// Export a [`DmaBuf`] for this GEM object using the DRM prime helper library.
+    ///
+    /// `flags` should be a set of flags from [`fs::file::flags`](kernel::fs::file::flags).
+    fn prime_export(&self, flags: u32) -> Result<DmaBuf<Self>> {
+        // SAFETY: `as_raw()` always returns a valid pointer to an initialized `drm_gem_object`.
+        let dma_ptr = unsafe { bindings::drm_gem_prime_export(self.as_raw(), flags as i32) };
+
+        // `drm_gem_prime_export()` returns either an error pointer, or a valid pointer to an
+        // initialized `dma_buf` on success.
+        let dma_ptr = from_err_ptr(dma_ptr)?;
+
+        // SAFETY:
+        // - We checked that dma_ptr is not an error, so it must point to an initialized dma_buf
+        // - We used drm_gem_prime_export(), so `dma_ptr` will remain valid until a call to
+        //   `drm_gem_prime_release()` which we don't call here.
+        let dma_buf = unsafe { dma_buf::DmaBuf::from_raw(dma_ptr) };
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
2.50.0


