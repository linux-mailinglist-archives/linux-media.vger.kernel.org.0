Return-Path: <linux-media+bounces-56543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFrDFPxxvWmt9wIAu9opvQ
	(envelope-from <linux-media+bounces-56543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:12:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B825F2DD20E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28E303095235
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1698E3D0903;
	Fri, 20 Mar 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KKewb4S4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AA53CF67A
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022926; cv=none; b=GvI4NIwPWhh8VDe2+ac5PoGQZ9AKTNe1iKD69vkttHLHPdhSfGxkvZdrHdlgHFvUZyfZMLgbhBxQktvWjyKZqQZQ1WHZd2Oi5zHuWJC3zL2bctJDHHezuXxUZT2JcfKqU5GPd0ZzxAeaqWT08sQ9XHsaaz8b+Cg6f2eHKa3POvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022926; c=relaxed/simple;
	bh=fADi6ter3jMPbMHo9dDtabnQY4l2WMhxMN/lP/zhOhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWXSop0ygBs2W+zjkDdlkUHek8BlkD3ENc6B7cBnuB9pewtjbgKV1ztI1AWq2uuR1m2YDNRkwHMfu7RGYNQQ9AfDGyvX4D1/D2I2HGlOYiV/cIMcsl/POHHXVkwABHKjAXH5LESmelokCDpsPM+ZB8fW35ara/mPGIokKv8F2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KKewb4S4; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6687ddbbddbso2739929a12.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022923; x=1774627723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jqhplbxZwVhhYVaVxWgCf5aaHOc0xQLlVk0KfnrtVUA=;
        b=KKewb4S4G1G+23HeQZj7IYviCIN/3hXFS6mz7NL0CN3uLokl0n3BMJtfb8E9t6M5rk
         AkJxjpKw1XUi22mHCsV1HI+mN25KrpMsK9LRW7Ph0Gr/gv14T6X/ZDMhIov6EXwRHZLc
         nNVF30vrSa32Ot/qQGnwq81H9oVqRKjufQtEWkD9MFGSTq0eJ31OUW9H7dOi92UvFdob
         tgFt0CcDk9FdiSDWIRYfHZGOqWy9sj4tTmXGZMO5JE5jIdA24nYc5dUrfF0iXwMhnGZk
         IV1dARe2ctUIa6GvXvLenn2BMWRcjam2zgD1omuaUasY1VBpAKbv8K+Aa9Pl8L0uKXCi
         rVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022923; x=1774627723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqhplbxZwVhhYVaVxWgCf5aaHOc0xQLlVk0KfnrtVUA=;
        b=WMEI++tJqTLQVqctynMk6eGXHWGDZl4Apge1/QWr+Tuhl/yrY5wfg5XMCx7HXOttUb
         LtmGdHvkZ/QdASJo8LDSKF2dA82YK43kxL0hpuq2BPXoRt+LgLs9TEfWsOR6RwiYGKSg
         feY01CmU4/4LNgGqXASRjndKnrxcNVCqpn+fcu8rRNZfirHRztNvLzzqyGmr3DcbTjdH
         9qqu3BXrreT1i6QSkW9dlNctkSbKPlSMMtWoEW40Qf68KJl6e3sOi1L+UNimgUv0wSul
         xZBH0lRdhl3cOriJLZmgbWvOHR7A/XuceMtgfzW09xUVtjXvzPogI+5j8upmf8aZc0wA
         c4vA==
X-Forwarded-Encrypted: i=1; AJvYcCUMEtWv1kZ+YpHoqFta7jraS/WKqCu2/taIIW3Vc5/SRtWsBjIlfatB+7q+uG5uei8gb7SLthLhDULf2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfwatQ7MXHdFaG5uH5pKIRa51TNU7kjXeYE3NoRgauyuof3Ar
	bf1jQ8kUhA6s73KOJiMG3o4J5NBKiqtZ4mdydpFciBdoLwx4VxDsXMwXvyvm6tHJzYs2QBHKOlu
	wEPYPS8ffYKtSvUC5Hg==
X-Received: from edxi7.prod.google.com ([2002:a05:6402:547:b0:663:a62b:3359])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a50:ec98:0:b0:669:226a:1259 with SMTP id 4fb4d7f45d1cf-669226a2079mr1041411a12.13.1774022922558;
 Fri, 20 Mar 2026 09:08:42 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:28 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7532; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fADi6ter3jMPbMHo9dDtabnQY4l2WMhxMN/lP/zhOhA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXECys/Z9rTmCwrkx59VTk1IXxqskMfwTQVQy
 5ufSs2LtiSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RtqgEACdA9tVleu5vZrva3QP1MV7UkB6PgqjgLT4Jr2ZpnZmd+Tv7kc+q8KWYkJzFIxpn0xyGe9
 NAOLl61R7RWASl10i/14Db1c7J/JO2bqwo9aqlttALoFfl9Dbv2KOqzWL5IrQ2Y2zrwly4nG80O
 QAoS+qjin8xsP3jLnCIzGdZIpZmo8b+4qQDMbFuPYVVqDd4XtnyTwcrDxAxwMnwAQaL4rAGrJLc
 yMNSc1nEUNtMVXyEtSo3TOFet8YGpAFyphVOa6ZC++tJ3ogwzlLytWzLtXycoytgyTb+hkbBr42
 fQ0gwDt23jWBH3xNsfXxEs0rXSFMEpQTx9fUVpN4uRUW4nWuxzcwDFAGYyCpSsr/2KhHCZXs6DP
 vac0aZX5VGErvRKsnWpsxiefrgvqG8Hmu/sqn9K02zP2mjUDNv/av7gulbfgMPGz2o3r1jqKY6m
 AlMoobmcrjMs0AHb1647Ssyqi7bBFunlYuT4rnRyAoljGHuObtmtFRoFgKYHkoQ5zpbF204oq1f
 8wJ8xV95BiGt8cmi+M6EjQ3bKhpVlkqE3hQUZ5t4QmlcNGFCKhUR31y9WgPsIGNGR/T+oCg1C4G
 5EhoNyiu7e3k2r6Uq9UBxrLXWJxI67rCUJ4C6h7HPrYLtVnJ9lQKW0rpWg5RoEkttntJJM6qGgR Lp+EJH8QAzA5x8A==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-4-76fd44f17a87@google.com>
Subject: [PATCH v5 4/6] rust: gpuvm: add GpuVa struct
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
	TAGGED_FROM(0.00)[bounces-56543-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.945];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,asahilina.net:email]
X-Rspamd-Queue-Id: B825F2DD20E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This struct will be used to keep track of individual mapped ranges in
the GPU's virtual memory.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs   |  17 ++++-
 rust/kernel/drm/gpuvm/va.rs    | 151 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs |   1 -
 3 files changed, 166 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 40446e679844..2eb4fb0f9839 100644
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
 
@@ -231,6 +241,9 @@ pub trait DriverGpuVm: Sized {
     /// The kind of GEM object stored in this GPUVM.
     type Object: IntoGEMObject;
 
+    /// Data stored with each `struct drm_gpuva`.
+    type VaData;
+
     /// Data stored with each `struct drm_gpuvm_bo`.
     type VmBoData;
 }
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
new file mode 100644
index 000000000000..540f525bb56d
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -0,0 +1,151 @@
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
+/// This is a valid `drm_gpuva` that is resident in the [`GpuVm`] instance. The associated
+/// [`GpuVmBo`] is part of the GEM list.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVa<T: DriverGpuVm> {
+    #[pin]
+    inner: Opaque<bindings::drm_gpuva>,
+    #[pin]
+    data: T::VaData,
+}
+
+impl<T: DriverGpuVm> GpuVa<T> {
+    /// Access this [`GpuVa`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuva` associated with a
+    /// [`GpuVm<T>`]. Its parent [`GpuVmBo`] must be in the GEM list.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a Self {
+        // SAFETY: `drm_gpuva` is first field and `repr(C)`.
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
+        // SAFETY: The `gem.offset` field of `drm_gpuva` is immutable.
+        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
+    }
+
+    /// Returns the underlying [`GpuVmBo`] object that backs this [`GpuVa`].
+    #[inline]
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        // SAFETY: The `vm_bo` field has been set and is immutable for the duration in which this
+        // `drm_gpuva` is resident in the VM. By the type invariants, the BO is part of the GEM
+        // list.
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
+    /// Must have been removed from a [`GpuVm<T>`].
+    pub(super) unsafe fn from_raw(ptr: *mut bindings::drm_gpuva) -> Self {
+        // SAFETY: Since it has been removed we can take ownership of allocation.
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
index b51c6f106185..7fd1d301fd41 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -106,7 +106,6 @@ impl<T: DriverGpuVm> GpuVmBo<T> {
     /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
     /// a [`GpuVm<T>`]. The BO must also be present in the GEM list.
     #[inline]
-    #[expect(dead_code)]
     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
         // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
         unsafe { &*ptr.cast() }

-- 
2.53.0.959.g497ff81fa9-goog


