Return-Path: <linux-media+bounces-56540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP8HDUJxvWmt9wIAu9opvQ
	(envelope-from <linux-media+bounces-56540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:09:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA122DD15B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 302733014F7E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8124F3CF027;
	Fri, 20 Mar 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e5xcxSrf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E83B3C15
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022922; cv=none; b=lwLygsFsmTb1jiaNr3BAEBPBuA1tff5Sy7Ku9IblRqI2TgYrPfEl3fVcb1csQs3HoJCpcNz5gVI0tKFQruR8fZV5znHcPvv9N1Oil5pIBqiXL8yaaS89x1AuJrYm8kQZ95XzuLzs2cXCY3N2al0+tBGfAYXgSTx/sVRWDvNtm0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022922; c=relaxed/simple;
	bh=AJRJTv/XOisCZhGoR/KWyXEIpjM4Z+W4S7cWxvUzqFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p0IuxaNVf1h9SF8S0uohQAUOpErd4L0ySzrt/Q7/Jb/v5ET7yVbmpAI+LsgavvJ8iRqn0FKxT7w5ule17g+kGXqUnsBPH/DEa5M0aiLB5/gX3bb5QMu67gzUYLt008IF3fSYyuVfh1IcDhCquwlgPDKejsTXoRxq7AS4nrh7wUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e5xcxSrf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483786a09b1so22560455e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022918; x=1774627718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D80I3HU5KXLVyy3+ihLGNZqqUhmHdLXC6rbmWz73MZU=;
        b=e5xcxSrf2eEbNum3hXRXCyBezFhA+QDLgbH/dOiZH8azvfIul74O6n+8i78ODyv6Mk
         BKhvdk9JJesmYpIcaXToC5uw2c+sEmbqz32HpbOW9yRfPYwAyx9rAxLNWqk7VNFMDHs4
         kyLUhc6N4dDmrvvUA6ft0MkC+J5KMGhX4R49PgcPpZyNHl/d/UpLymaWe7dzI/v5fBVr
         7gEwBdw8pO7m9S9ozOfy/PZNYfwnCiIt5bVjlTQYfaDG8KL7kgOest3LLEDoxKxbfmUH
         QKmB5ehVY2RAzcrKjLq+ieW7XyqgwgMIpdGtqySMYd5EFFoE8GCPLpySKKIk/4L3AdGB
         YQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022918; x=1774627718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D80I3HU5KXLVyy3+ihLGNZqqUhmHdLXC6rbmWz73MZU=;
        b=XtDUQaQ3Txb4sNeSVgCxyx6HOEXxK8UPvquTE9qQ3FNwAKWbiEjgjnffZVSTXfUrU1
         /e5XMjTBiRf4XZ5QThXs80V0ERiptKB0iaN2Dp9OiW9rijqP3UFGwUaW5cpHNWT8i2io
         Z1BrEb/++IS7Pyyxovgqohb5ntCSmlzl7iwKp9lR65xyDRdoZT1j/ltAwu38AhM5MF8l
         EIhmVFfd94/QLXHO0/+lmydpkgZDZApb0FnpyDWJnkVRxWFvJXn+bzEdqtzYuRsJpHGF
         UiylOu1Zewj9AFbmf15ALWgGwhw1RFYTWW6LI0yn+hymzi5FRZPXdD+gRin6oGOkvpWF
         gbcA==
X-Forwarded-Encrypted: i=1; AJvYcCWv7PE/2jwmtELtTKAOVRLq6ZRp9iJFor/yiYuITolMUFuG/6HQHwbbWleQZW29UUuwvM3a85+w4pPpCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGovjZuLEv8b6YXatvnggXoOSNwwot7QPl/7FLkKJIvfROwjE
	DFlmbAScorOrs8JHrpRh5IjCH6cSHA5O4hhK2PSOeAZG0L/gYhztUST3JV1QBYRxwPHg8fEe+6j
	4JvJCd6wDNv455NtV3A==
X-Received: from wmhf4.prod.google.com ([2002:a7b:cc04:0:b0:485:4553:1a97])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820e:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-486fee12c91mr61265695e9.20.1774022918097;
 Fri, 20 Mar 2026 09:08:38 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:25 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=12069; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v76ZDsVu/1UhrfrTDjVTthU39HTgj1OywVri4dMpLAI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXECKNj6DDNTpdZlxRIIfK0jSM9yRVe4EMwB/
 JorY6eecOOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RkCTD/9FXSVp1evaQIeZX0cKFxjUKpczWbdFVWT4FDltEfkX+a/LDt7nLB3YGtjZ2EN+ZNJmoAe
 D74hTAedjF0viHW+qAZ6tLwojd0oKCJCc6A84ypDPQlEtt+OUZTQHgGxA3vwultRxSWfViGTl24
 oyD7EjobvJ3nq6wsUVDHLAjZaczji2lEfZqK7zX0DwwsG3pbVlPtn+LSBdnM4CG4+S2eMWG/5Eo
 rT13Np5cAMvMQrfPpIb2vqJtfR3rAB1NY9ULDbnapPqUxv5jJcGMgh4dsDhyqv9uwelsMNEF4wc
 3+Vl2PeG7WnRk/h5pvneeFwX8tGuyTSKwcaeTI8rlz6OZrb6l10kD6Wo1j/4h0ISQ0ynh7SNvOm
 QMVAoUsMUHD23BBvgjJjh7DwCXZaCPa6B6mhaKt7CxtwAmcrdN+lSWBO3PKnfZHFqjgjB/v8BNF
 +ykw4yY3mDGJngTe9kA4stQKjMmoE72hYu2KjQ0ZfSFsRAdSQ07T6TI6kAZQGiP3JGz4Y/Q1cZ7
 n/oG4QTNUViUZ4EHa71AzOS4Xmb3PlS+hHjeMkkhJJuvF8hg8EJzIL2qwMpXjBCvAhvnV33bfn1
 y+8xHDu9jOjEWbZfOml+HbCVJR943SXY6U4dC5uonoHr4HzlvwP3L0//hL33CbvytrH9UlYYo/r PkazWuR3u2RWS+w==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-1-76fd44f17a87@google.com>
Subject: [PATCH v5 1/6] rust: drm: add base GPUVM immediate mode abstraction
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
	TAGGED_FROM(0.00)[bounces-56540-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.935];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,asahilina.net:email,collabora.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 2CA122DD15B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Asahi Lina <lina+kernel@asahilina.net>

Add a GPUVM abstraction to be used by Rust GPU drivers.

GPUVM keeps track of a GPU's virtual address (VA) space and manages the
corresponding virtual mappings represented by "GPU VA" objects. It also
keeps track of the gem::Object<T> used to back the mappings through
GpuVmBo<T>.

This abstraction is only usable by drivers that wish to use GPUVM in
immediate mode. This allows us to build the locking scheme into the API
design. It means that the GEM mutex is used for the GEM gpuva list, and
that the resv lock is used for the extobj list. The evicted list is not
yet used in this version.

This abstraction provides a special handle called the UniqueRefGpuVm,
which is a wrapper around ARef<GpuVm> that provides access to the
interval tree. Generally, all changes to the address space requires
mutable access to this unique handle.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/drm_gpuvm.c        |  20 ++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gpuvm/mod.rs    | 238 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 6 files changed, 263 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..b40923a18066 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8840,6 +8840,8 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_gpuvm.c
 F:	include/drm/drm_gpuvm.h
+F:	rust/helpers/drm_gpuvm.c
+F:	rust/kernel/drm/gpuvm/
 
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..ef0f010c268b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -33,6 +33,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
new file mode 100644
index 000000000000..18cf104a8bc7
--- /dev/null
+++ b/rust/helpers/drm_gpuvm.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#ifdef CONFIG_DRM_GPUVM
+
+#include <drm/drm_gpuvm.h>
+
+__rust_helper
+struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
+{
+	return drm_gpuvm_get(obj);
+}
+
+__rust_helper
+bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
+				     struct drm_gem_object *obj)
+{
+	return drm_gpuvm_is_extobj(gpuvm, obj);
+}
+
+#endif // CONFIG_DRM_GPUVM
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..a83060f8500c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,6 +29,7 @@
 #include "device.c"
 #include "dma.c"
 #include "drm.c"
+#include "drm_gpuvm.c"
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
new file mode 100644
index 000000000000..5086625bbbe7
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+#![cfg(CONFIG_DRM_GPUVM = "y")]
+
+//! DRM GPUVM in immediate mode
+//!
+//! Rust abstractions for using GPUVM in immediate mode. This is when the GPUVM state is updated
+//! during `run_job()`, i.e., in the DMA fence signalling critical path, to ensure that the GPUVM
+//! and the GPU's virtual address space has the same state at all times.
+//!
+//! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
+
+use kernel::{
+    alloc::AllocError,
+    bindings,
+    drm,
+    drm::gem::IntoGEMObject,
+    prelude::*,
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    types::Opaque, //
+};
+
+use core::{
+    cell::UnsafeCell,
+    ops::{
+        Deref,
+        Range, //
+    },
+    ptr::NonNull, //
+};
+
+/// A DRM GPU VA manager.
+///
+/// This object is refcounted, but the locations of mapped ranges may only be accessed or changed
+/// via the special unique handle [`UniqueRefGpuVm`].
+///
+/// # Invariants
+///
+/// * Stored in an allocation managed by the refcount in `self.vm`.
+/// * Access to `data` and the gpuvm interval tree is controlled via the [`UniqueRefGpuVm`] type.
+#[pin_data]
+pub struct GpuVm<T: DriverGpuVm> {
+    #[pin]
+    vm: Opaque<bindings::drm_gpuvm>,
+    /// Accessed only through the [`UniqueRefGpuVm`] reference.
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: The GPUVM api does not assume that it is tied to a specific thread.
+unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
+// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel.
+unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
+
+// SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
+    fn inc_ref(&self) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+        unsafe { bindings::drm_gpuvm_put((*obj.as_ptr()).vm.get()) };
+    }
+}
+
+impl<T: DriverGpuVm> GpuVm<T> {
+    const fn vtable() -> &'static bindings::drm_gpuvm_ops {
+        &bindings::drm_gpuvm_ops {
+            vm_free: Some(Self::vm_free),
+            op_alloc: None,
+            op_free: None,
+            vm_bo_alloc: None,
+            vm_bo_free: None,
+            vm_bo_validate: None,
+            sm_step_map: None,
+            sm_step_unmap: None,
+            sm_step_remap: None,
+        }
+    }
+
+    /// Creates a GPUVM instance.
+    #[expect(clippy::new_ret_no_self)]
+    pub fn new<E>(
+        name: &'static CStr,
+        dev: &drm::Device<T::Driver>,
+        r_obj: &T::Object,
+        range: Range<u64>,
+        reserve_range: Range<u64>,
+        data: T,
+    ) -> Result<UniqueRefGpuVm<T>, E>
+    where
+        E: From<AllocError>,
+        E: From<core::convert::Infallible>,
+    {
+        let obj = KBox::try_pin_init::<E>(
+            try_pin_init!(Self {
+                data: UnsafeCell::new(data),
+                vm <- Opaque::ffi_init(|vm| {
+                    // SAFETY: These arguments are valid. `vm` is valid until refcount drops to
+                    // zero.
+                    unsafe {
+                        bindings::drm_gpuvm_init(
+                            vm,
+                            name.as_char_ptr(),
+                            bindings::drm_gpuvm_flags_DRM_GPUVM_IMMEDIATE_MODE
+                                | bindings::drm_gpuvm_flags_DRM_GPUVM_RESV_PROTECTED,
+                            dev.as_raw(),
+                            r_obj.as_raw(),
+                            range.start,
+                            range.end - range.start,
+                            reserve_range.start,
+                            reserve_range.end - reserve_range.start,
+                            const { Self::vtable() },
+                        )
+                    }
+                }),
+            }? E),
+            GFP_KERNEL,
+        )?;
+        // SAFETY: This transfers the initial refcount to the ARef.
+        let aref = unsafe {
+            ARef::from_raw(NonNull::new_unchecked(KBox::into_raw(
+                Pin::into_inner_unchecked(obj),
+            )))
+        };
+        // INVARIANT: This reference is unique.
+        Ok(UniqueRefGpuVm(aref))
+    }
+
+    /// Access this [`GpuVm`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must reference the `struct drm_gpuvm` in a valid [`GpuVm<T>`] that remains
+    /// valid for at least `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Self {
+        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`. Caller ensures the
+        // pointer is valid for 'a.
+        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self, vm) }
+    }
+
+    /// Returns a raw pointer to the embedded `struct drm_gpuvm`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
+        self.vm.get()
+    }
+
+    /// The start of the VA space.
+    #[inline]
+    pub fn va_start(&self) -> u64 {
+        // SAFETY: The `mm_start` field is immutable.
+        unsafe { (*self.as_raw()).mm_start }
+    }
+
+    /// The length of the GPU's virtual address space.
+    #[inline]
+    pub fn va_length(&self) -> u64 {
+        // SAFETY: The `mm_range` field is immutable.
+        unsafe { (*self.as_raw()).mm_range }
+    }
+
+    /// Returns the range of the GPU virtual address space.
+    #[inline]
+    pub fn va_range(&self) -> Range<u64> {
+        let start = self.va_start();
+        // OVERFLOW: This reconstructs the Range<u64> passed to the constructor, so it won't fail.
+        let end = start + self.va_length();
+        Range { start, end }
+    }
+
+    /// Clean up buffer objects that are no longer used.
+    #[inline]
+    pub fn deferred_cleanup(&self) {
+        // SAFETY: This GPUVM uses immediate mode.
+        unsafe { bindings::drm_gpuvm_bo_deferred_cleanup(self.as_raw()) }
+    }
+
+    /// Check if this GEM object is an external object for this GPUVM.
+    #[inline]
+    pub fn is_extobj(&self, obj: &T::Object) -> bool {
+        // SAFETY: We may call this with any GPUVM and GEM object.
+        unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), obj.as_raw()) }
+    }
+
+    /// Free this GPUVM.
+    ///
+    /// # Safety
+    ///
+    /// Called when refcount hits zero.
+    unsafe extern "C" fn vm_free(me: *mut bindings::drm_gpuvm) {
+        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`.
+        let me = unsafe { kernel::container_of!(Opaque::cast_from(me), Self, vm).cast_mut() };
+        // SAFETY: By type invariants we can free it when refcount hits zero.
+        drop(unsafe { KBox::from_raw(me) })
+    }
+}
+
+/// The manager for a GPUVM.
+pub trait DriverGpuVm: Sized {
+    /// Parent `Driver` for this object.
+    type Driver: drm::Driver<Object = Self::Object>;
+
+    /// The kind of GEM object stored in this GPUVM.
+    type Object: IntoGEMObject;
+}
+
+/// The core of the DRM GPU VA manager.
+///
+/// This object is a unique reference to the VM that can access the interval tree and the Rust
+/// `data` field.
+///
+/// # Invariants
+///
+/// Each `GpuVm` instance has at most one `UniqueRefGpuVm` reference.
+pub struct UniqueRefGpuVm<T: DriverGpuVm>(ARef<GpuVm<T>>);
+
+impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
+    /// Access the core data of this GPUVM.
+    #[inline]
+    pub fn data(&mut self) -> &mut T {
+        // SAFETY: By the type invariants we may access `core`.
+        unsafe { &mut *self.0.data.get() }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for UniqueRefGpuVm<T> {
+    type Target = GpuVm<T>;
+
+    #[inline]
+    fn deref(&self) -> &GpuVm<T> {
+        &self.0
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf..a4b6c5430198 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -6,6 +6,7 @@
 pub mod driver;
 pub mod file;
 pub mod gem;
+pub mod gpuvm;
 pub mod ioctl;
 
 pub use self::device::Device;

-- 
2.53.0.959.g497ff81fa9-goog


