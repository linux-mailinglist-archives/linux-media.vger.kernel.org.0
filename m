Return-Path: <linux-media+bounces-58357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AkxJrXF12mdSQgAu9opvQ
	(envelope-from <linux-media+bounces-58357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:28:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A923CCAC1
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97C5C3036BCD
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEB73E0253;
	Thu,  9 Apr 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aGUiliMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23333DCD81
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748385; cv=none; b=S6D+NtEP2wmfL4rg1w5VpDBcsKbXrfDq9suShHTzvdGkgPypV7Cehm2m2oYLlDYFp2Bq7kztZ/YkpQziAlFC4Rg/ctM7SJuwy7hq0ImLMxdufEymXYfz52Y8q/eqZEwtk5pYiNTZ+qzR2EjJY5zxw8Nbs0/iSZWMqRIjFpPnbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748385; c=relaxed/simple;
	bh=yxjLLW+eyiG9le+2ww647p7emAqKkJd9fk+bDVYvWVY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ncB+0DDxhl+lpkKB59zE9YIriarO8gsrhYxFsqp8JcVn72C98L4RX4iUHl/leF+3n5dxopw4LQc8RxFP3KTdt9BWb9dz1KO3Rosc5Kr0O5mqo8NE8bLTdFzmZCLAvHPQqRqtFMniyG/r3OT8N510EDFFzEwVT0XkG8q5wRD0nrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aGUiliMP; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b9c4d00d361so117750166b.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775748381; x=1776353181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmCMVFn7A8FBsU7JrtIy9Z3tXezUBNiPB/QWhv76Fgw=;
        b=aGUiliMPHtt/y0LpnPU2uheom9LTpPwXk6nhISE7FjuHpvaZH26k78AAV1432iGluj
         Xl2Tptin90U/xAjDTrb5xcX299BchB28/DTHqMd7gIpzbMr96J1E/1br49HduCpT69p6
         JIC5Cd9Y0QKrTIyI16sAS6UnJvrwcjpvix6MRqt/RxCHxjrENX1Wr5OoUBYgU8L5M4uy
         ZEHRhaPfknTiSGtmIQkE2662Srw0Hq16FiznMWqQf+mKgBT+OZFdXDtI2pxreVnVps40
         JH1XcSyCTsjNZcO0a9gFZ10XGcJgIk3Rro6zC/b3+Rbrww27CNXhS6y0vVjv6AQsoDyB
         hDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748381; x=1776353181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmCMVFn7A8FBsU7JrtIy9Z3tXezUBNiPB/QWhv76Fgw=;
        b=o0/chp2EfQt2Uv0tcXo7XHsdayYgqkc9MytQNF0WaRja1PsbPqyjtq0CqtrbCAlXWU
         Y+LVwKxNVPvGeVHsO9MWbzU8M75hpnZnraQVg4Ro9d+H2x2T7bhlW/oAE2sbhz7nZ8wO
         ODa8Qt2qjQCZ0pTNXjVe1ze+cbcLHbGOrFwLaNfxiFq+/Z8MtuwWWz4Qli6s1rNCN74+
         4qO41+cUSPCXVPGpV6tuPc5ko61R5e8vdHB6H8bFtvZQMH11R2hfNFplnHYrDXyOHErv
         pC3CaLa6glFmknhTjfj5yZyrVrzKW46Dz22uFs3dMKjdx3lmXQtTdsSkDUHIGRT8sqPV
         BPCA==
X-Forwarded-Encrypted: i=1; AJvYcCXbJJrAPXGyv8L68zRSUxMuV+a01UT0mOC0rJvV561CR7n2rp2pJDdt7ajcXu270UDlBfgITqKY94PdCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqalRBgFEX1gIRXNiEzKDNF3CE/Ku9OPI3c7nURaY5Sl/nVWnG
	Zt8ax74jsOaJpJkDcSclhQoBtt/49pauIh+3IloPtbDULUuYNpXxqXKUIATCGuXJi9RJbInFmaR
	CcdbYQh9O8waRhLLlKg==
X-Received: from ejcqk37.prod.google.com ([2002:a17:907:7fa5:b0:b9b:ff97:4914])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d1d:b0:b87:7485:b4a8 with SMTP id a640c23a62f3a-b9c66ed856emr1315762866b.0.1775748380848;
 Thu, 09 Apr 2026 08:26:20 -0700 (PDT)
Date: Thu, 09 Apr 2026 15:26:08 +0000
In-Reply-To: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8866; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=yxjLLW+eyiG9le+2ww647p7emAqKkJd9fk+bDVYvWVY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp18UX8ZfyFfn7kV5FI2v7kmz+lyzYgsLoVvsdo
 ec1Rqwau+CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadfFFwAKCRAEWL7uWMY5
 RtKfD/9Td4e1lxNHzVDyLZ2crdh03mOpA7vi/oiLGOvuTfyMYIUm8WjP3XSS8wIKFOXeboACYv1
 w3xQWohNglCVF7GQ3qjjDxjSPeSN3/mILQJS1580LkrVOGgItflxtCz/NEBvo4A8PPyKpnNAqJd
 MVda24R3CgHN3EGnAtJcVeYdEavX36CX/vsU8xNmVCNhHvlHtPLRbMRPlcYZBXURJRkuHvouZjn
 0xTcacguzXr+eibS7bVDcKxs/CLYDFuNBKTd4grproUybNheMlYjbRg2Dn04MMMrdQklw1qtywK
 lkDF7QH6hMoaQP+UIDU45zTbhTFV7Y0RYjk7OrKZDuNnuzQcJzm6r8F8pug1ASi8MjsAniK/lrn
 kh4YApgYpm58a5c2TYkfwF+TpaPgi3xpXcNjaeA4XJjoX6GxXZzt+ToPtXZfNLMtW4jdBw+aS6T
 JfWaoJ7xGDsJ8hjCFBm9/xwv2+UpcK5LCW7cZ85eQ17HtPGrTEMPwXrYNeRONS0ORWNk7jGy3ki
 EwDf0enr5TE7TcejQZTxvaEiVNAzJmGuwz+knoRrqfAqwhxvL3LD1NpP1jj479ApuoMrB+y66v1
 OXUrIGDEXlHpS7vklhgzTiXPtmphzw0ri6R9z1SSzh3s8+7jXdfnYOxkWHiwk5lvcR4gG8IZYER D6XBwRtlsUIeTCA==
X-Mailer: b4 0.14.3
Message-ID: <20260409-gpuvm-rust-v6-3-b16e6ada7261@google.com>
Subject: [PATCH v6 3/5] rust: gpuvm: add GpuVa struct
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58357-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gpuvmbo:email,asahilina.net:email,0.data:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90A923CCAC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This struct will be used to keep track of individual mapped ranges in
the GPU's virtual memory.

Sparse VAs are not yet supported.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs   |  19 ++++-
 rust/kernel/drm/gpuvm/va.rs    | 169 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs |   1 -
 3 files changed, 185 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 56e02b49a581..78951e8aa5d3 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -11,7 +11,10 @@
 //! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
 
 use kernel::{
-    alloc::AllocError,
+    alloc::{
+        AllocError,
+        Flags as AllocFlags, //
+    },
     bindings,
     drm,
     drm::gem::IntoGEMObject,
@@ -25,9 +28,13 @@
 
 use core::{
     cell::UnsafeCell,
-    mem::ManuallyDrop,
+    mem::{
+        ManuallyDrop,
+        MaybeUninit, //
+    },
     ops::{
         Deref,
+        DerefMut,
         Range, //
     },
     ptr::{
@@ -36,6 +43,9 @@
     }, //
 };
 
+mod va;
+pub use self::va::*;
+
 mod vm_bo;
 pub use self::vm_bo::*;
 
@@ -48,7 +58,7 @@
 ///
 /// * Stored in an allocation managed by the refcount in `self.vm`.
 /// * Access to `data` and the gpuvm interval tree is controlled via the [`UniqueRefGpuVm`] type.
-/// * Does not contain any sparse `GpuVa` instances.
+/// * Does not contain any sparse [`GpuVa<T>`] instances.
 #[pin_data]
 pub struct GpuVm<T: DriverGpuVm> {
     #[pin]
@@ -242,6 +252,9 @@ pub trait DriverGpuVm: Sized + Send {
     /// The kind of GEM object stored in this GPUVM.
     type Object: IntoGEMObject;
 
+    /// Data stored with each [`struct drm_gpuva`](struct@GpuVa).
+    type VaData;
+
     /// Data stored with each [`struct drm_gpuvm_bo`](struct@GpuVmBo).
     type VmBoData;
 }
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
new file mode 100644
index 000000000000..227c259f7db9
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+#![expect(dead_code)]
+use super::*;
+
+/// Represents that a range of a GEM object is mapped in this [`GpuVm`] instance.
+///
+/// Does not assume that GEM lock is held.
+///
+/// # Invariants
+///
+/// * This is a valid `drm_gpuva` object that is resident in a [`GpuVm<T>`] instance.
+/// * It is associated with a [`GpuVmBo<T>`]. Or in other words, it's not an
+///   `gpuvm->kernel_alloc_node` and `DRM_GPUVA_SPARSE` is not set.
+/// * The associated [`GpuVmBo<T>`] is part of the GEM list.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVa<T: DriverGpuVm> {
+    #[pin]
+    inner: Opaque<bindings::drm_gpuva>,
+    #[pin]
+    data: T::VaData,
+}
+
+impl<T: DriverGpuVm> PartialEq for GpuVa<T> {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self.as_raw(), other.as_raw())
+    }
+}
+impl<T: DriverGpuVm> Eq for GpuVa<T> {}
+
+impl<T: DriverGpuVm> GpuVa<T> {
+    /// Access this [`GpuVa`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// * For the duration of `'a`, the pointer must reference a valid `drm_gpuva` associated with
+    ///   a [`GpuVm<T>`].
+    /// * It must be associated with a [`GpuVmBo<T>`].
+    /// * The associated [`GpuVmBo<T>`] is part of the GEM list.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a Self {
+        // CAST: `drm_gpuva` is first field and `repr(C)`.
+        // SAFETY: The safety requirements match the invariants of `GpuVa`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuva {
+        self.inner.get()
+    }
+
+    /// Returns the address of this mapping in the GPU virtual address space.
+    #[inline]
+    pub fn addr(&self) -> u64 {
+        // SAFETY: The `va.addr` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).va.addr }
+    }
+
+    /// Returns the length of this mapping.
+    #[inline]
+    pub fn length(&self) -> u64 {
+        // SAFETY: The `va.range` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).va.range }
+    }
+
+    /// Returns `addr..addr+length`.
+    #[inline]
+    pub fn range(&self) -> Range<u64> {
+        let addr = self.addr();
+        addr..addr + self.length()
+    }
+
+    /// Returns the offset within the GEM object.
+    #[inline]
+    pub fn gem_offset(&self) -> u64 {
+        // SAFETY: The `gem.offset` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).gem.offset }
+    }
+
+    /// Returns the GEM object.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `gem.obj` field of `drm_gpuva` is immutable. We know that it's not null
+        // because this VA is associated with a `GpuVmBo<T>`.
+        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
+    }
+
+    /// Returns the underlying [`GpuVmBo`] object that backs this [`GpuVa`].
+    #[inline]
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        // SAFETY: The `vm_bo` field of `drm_gpuva` is immutable. We know that it's not null
+        // because this VA is associated with a `GpuVmBo<T>`. The BO is in the GEM list by the type
+        // invariants.
+        unsafe { GpuVmBo::from_raw((*self.as_raw()).vm_bo) }
+    }
+}
+
+/// A pre-allocated [`GpuVa`] object.
+///
+/// # Invariants
+///
+/// The memory is zeroed.
+pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
+
+impl<T: DriverGpuVm> GpuVaAlloc<T> {
+    /// Pre-allocate a [`GpuVa`] object.
+    pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, AllocError> {
+        // INVARIANTS: Memory allocated with __GFP_ZERO.
+        Ok(GpuVaAlloc(KBox::new_uninit(flags | __GFP_ZERO)?))
+    }
+
+    /// Prepare this `drm_gpuva` for insertion into the GPUVM.
+    #[must_use]
+    pub(super) fn prepare(mut self, va_data: impl PinInit<T::VaData>) -> *mut bindings::drm_gpuva {
+        let va_ptr = MaybeUninit::as_mut_ptr(&mut self.0);
+        // SAFETY: The `data` field is pinned.
+        let Ok(()) = unsafe { va_data.__pinned_init(&raw mut (*va_ptr).data) };
+        KBox::into_raw(self.0).cast()
+    }
+}
+
+/// A [`GpuVa`] object that has been removed.
+///
+/// # Invariants
+///
+/// The `drm_gpuva` is not resident in the [`GpuVm`].
+pub struct GpuVaRemoved<T: DriverGpuVm>(KBox<GpuVa<T>>);
+
+impl<T: DriverGpuVm> GpuVaRemoved<T> {
+    /// Convert a raw pointer into a [`GpuVaRemoved`].
+    ///
+    /// # Safety
+    ///
+    /// * Must have been removed from a [`GpuVm<T>`].
+    /// * It must not be a `gpuvm->kernel_alloc_node` va.
+    pub(super) unsafe fn from_raw(ptr: *mut bindings::drm_gpuva) -> Self {
+        // SAFETY: Since it used to be a VA in a `GpuVm<T>` and it's not a kernel_alloc_node, this
+        // pointer references a `GpuVa<T>` with a valid `T::VaData`. Since it has been removed, we
+        // can take ownership of the allocation.
+        GpuVaRemoved(unsafe { KBox::from_raw(ptr.cast()) })
+    }
+
+    /// Take ownership of the VA data.
+    pub fn into_inner(self) -> T::VaData
+    where
+        T::VaData: Unpin,
+    {
+        KBox::into_inner(self.0).data
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVaRemoved<T> {
+    type Target = T::VaData;
+    fn deref(&self) -> &T::VaData {
+        &self.0.data
+    }
+}
+
+impl<T: DriverGpuVm> DerefMut for GpuVaRemoved<T>
+where
+    T::VaData: Unpin,
+{
+    fn deref_mut(&mut self) -> &mut T::VaData {
+        &mut self.0.data
+    }
+}
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 65f03f93bd21..05fd7998f4bd 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -114,7 +114,6 @@ impl<T: DriverGpuVm> GpuVmBo<T> {
     /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
     /// a [`GpuVm<T>`]. The BO must also be present in the GEM list.
     #[inline]
-    #[expect(dead_code)]
     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
         // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
         unsafe { &*ptr.cast() }

-- 
2.53.0.1213.gd9a14994de-goog


