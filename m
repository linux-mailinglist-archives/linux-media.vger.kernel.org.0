Return-Path: <linux-media+bounces-41366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FDAB3C550
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 00:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0FE188D0D8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60872D837B;
	Fri, 29 Aug 2025 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3ANcQ8+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C822D8DB7
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756507404; cv=none; b=NKrDu9VEmcKuf7Jf4VIgwISrR/00mUtnjDYLxQhQ6T25VuHi2P3NDjbnI/3U2pqLlY8VRkZ+4KJdi47ZMoBdJE8kz8vFXUuSOoJ8hC+sqU5L0upb+C1JzVRjNKrPb28UYjn7VxZIE0ueN1XBIQw+SHLS/kHpJYufPNaki8nUu8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756507404; c=relaxed/simple;
	bh=N8kxUBPd55YKdu/xSoioFdUgZRLBsIqnkmLbhSBJ8zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI5HjLwsdKzxZVumhGfOPwqCTR73VP6ITqhlgq/0xN+0yR1zUa+pPrWmmONcDXkE8vt5zKysVZ3qdP4hkj6zQvMeJPXonkIpSRvjXVzYglEOz1Y78fEg9+Nj3oNwC4M5z0lP+geL2EwksHXW8zIkmDVwWtrgbu2DgGiJspX8+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3ANcQ8+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756507400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eKMZA2jSOMS+3g9kP9wxgZR4GNqJmM76RSX3YLcOg0=;
	b=H3ANcQ8+99Qoxi34SYJOyUgW8aqQOdITeGvEfMPBa2d0hwV+H4X98jRaJubfOmtDG2KjtU
	1d8uVL97hEQlDmdZrQlgBINmIQdOZ+L+M/u+t3JatfWBTqT80Sly7GehlOLCdBobJioPDx
	pEJ9X14U6192NjqJLrQetI+KMLzJJJQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-cwbB1E0PNcKyrTfAt0tiVQ-1; Fri,
 29 Aug 2025 18:43:16 -0400
X-MC-Unique: cwbB1E0PNcKyrTfAt0tiVQ-1
X-Mimecast-MFC-AGG-ID: cwbB1E0PNcKyrTfAt0tiVQ_1756507393
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BF75195E914;
	Fri, 29 Aug 2025 22:43:13 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C6BC1800280;
	Fri, 29 Aug 2025 22:43:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST]),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3 13/14] rust: drm: gem: Add export() callback
Date: Fri, 29 Aug 2025 18:35:28 -0400
Message-ID: <20250829224116.477990-14-lyude@redhat.com>
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

This introduces an optional export() callback for GEM objects, which is
used to implement the drm_gem_object_funcs->export function.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/gem.rs  |  1 +
 rust/kernel/drm/gem/mod.rs   | 72 +++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/gem/shmem.rs |  6 ++-
 3 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 015cb56061a56..bbce6b0f4e6a4 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -16,6 +16,7 @@
 #[pin_data]
 pub(crate) struct NovaObject {}
 
+#[vtable]
 impl gem::DriverObject for NovaObject {
     type Driver = NovaDriver;
     type Object = gem::Object<Self>;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index f9f9727f14e4a..1ac25fc6d527b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -8,7 +8,7 @@
 
 use crate::{
     alloc::flags::*,
-    bindings,
+    bindings, dma_buf,
     drm::driver::{AllocImpl, AllocOps},
     drm::{self, private::Sealed},
     error::{to_result, Result},
@@ -45,6 +45,7 @@ fn as_ref(&self) -> &kernel::drm::gem::OpaqueObject<D> {
 pub(crate) use impl_as_opaque;
 
 /// GEM object functions, which must be implemented by drivers.
+#[vtable]
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
@@ -69,6 +70,11 @@ fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result {
 
     /// Close a handle to an existing object, associated with a File.
     fn close(_obj: &Self::Object, _file: &DriverFile<Self>) {}
+
+    /// Optional handle for exporting a gem object.
+    fn export(_obj: &Self::Object, _flags: u32) -> Result<DmaBuf<Self::Object>> {
+        unimplemented!()
+    }
 }
 
 /// Trait that represents a GEM object subtype
@@ -138,6 +144,21 @@ extern "C" fn close_callback<T: DriverObject>(
     T::close(obj, file);
 }
 
+extern "C" fn export_callback<T: DriverObject>(
+    raw_obj: *mut bindings::drm_gem_object,
+    flags: i32,
+) -> *mut bindings::dma_buf {
+    // SAFETY: `export_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
+    // that `raw_obj` is contained within a `Object<T>`.
+    let obj = unsafe { T::Object::from_raw(raw_obj) };
+
+    match T::export(obj, flags as u32) {
+        // DRM takes a hold of the reference
+        Ok(buf) => buf.into_raw(),
+        Err(e) => e.to_ptr(),
+    }
+}
+
 impl<T: DriverObject> IntoGEMObject for Object<T> {
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
         self.obj.get()
@@ -248,7 +269,11 @@ impl<T: DriverObject> Object<T> {
         open: Some(open_callback::<T>),
         close: Some(close_callback::<T>),
         print_info: None,
-        export: None,
+        export: if T::HAS_EXPORT {
+            Some(export_callback::<T>)
+        } else {
+            None
+        },
         pin: None,
         unpin: None,
         get_sg_table: None,
@@ -375,6 +400,49 @@ fn as_raw(&self) -> *mut bindings::drm_gem_object {
 
 impl<D: drm::Driver> Sealed for OpaqueObject<D> {}
 
+/// A [`dma_buf::DmaBuf`] which has been exported from a GEM object.
+///
+/// The [`dma_buf::DmaBuf`] will be released when this type is dropped.
+///
+/// # Invariants
+///
+/// - `self.0` points to a valid initialized [`dma_buf::DmaBuf`] for the lifetime of this object.
+/// - The GEM object from which this [`dma_buf::DmaBuf`] was exported from is guaranteed to be of
+///   type `T`.
+pub struct DmaBuf<T: IntoGEMObject>(NonNull<dma_buf::DmaBuf>, PhantomData<T>);
+
+impl<T: IntoGEMObject> Deref for DmaBuf<T> {
+    type Target = dma_buf::DmaBuf;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: This pointer is guaranteed to be valid by our type invariants.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: IntoGEMObject> Drop for DmaBuf<T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY:
+        // - `dma_buf::DmaBuf` is guaranteed to have an identical layout to `struct dma_buf`
+        //   by its type invariants.
+        // - We hold the last reference to this `DmaBuf`, making it safe to destroy.
+        unsafe { bindings::drm_gem_dmabuf_release(self.0.cast().as_ptr()) }
+    }
+}
+
+impl<T: IntoGEMObject> DmaBuf<T> {
+    /// Leak the reference for this [`DmaBuf`] and return a raw pointer to it.
+    #[inline]
+    pub(crate) fn into_raw(self) -> *mut bindings::dma_buf {
+        let dma_ptr = self.as_raw();
+
+        core::mem::forget(self);
+        dma_ptr
+    }
+}
+
 pub(super) const fn create_fops() -> bindings::file_operations {
     // SAFETY: As by the type invariant, it is safe to initialize `bindings::file_operations`
     // zeroed.
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 1437cda27a22c..b3a70e6001842 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -66,7 +66,11 @@ impl<T: DriverObject> Object<T> {
         open: Some(super::open_callback::<T>),
         close: Some(super::close_callback::<T>),
         print_info: Some(bindings::drm_gem_shmem_object_print_info),
-        export: None,
+        export: if T::HAS_EXPORT {
+            Some(super::export_callback::<T>)
+        } else {
+            None
+        },
         pin: Some(bindings::drm_gem_shmem_object_pin),
         unpin: Some(bindings::drm_gem_shmem_object_unpin),
         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
-- 
2.50.0


