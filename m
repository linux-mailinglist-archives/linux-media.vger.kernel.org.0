Return-Path: <linux-media+bounces-58355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGFuL8TF12mdSQgAu9opvQ
	(envelope-from <linux-media+bounces-58355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:29:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9BF3CCAD7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DF81304A9F5
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F5C3DFC74;
	Thu,  9 Apr 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B98zoEHv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5853DCD81
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748381; cv=none; b=exOMRVPuo2It3/fGK8g2j9GrJJkl3LnRC8TYiBqFp9t0ETVSm4HlOkjbEYRkkUyce6N0PXp0xoUuVr9T6xx1/XfvRY/qqD2IFXd/d8TPYHtbSPCh5SbWks3Pcq2wFgmC6r0TyMSeEPvizE+eChP3I+UmeSmdTJs+X0Ip6e6Gwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748381; c=relaxed/simple;
	bh=75xT4EhvuyyBgND7ILMt5vIpFsiKQkSdox6nj9cDzZs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YUDOg6KMEOmjzY6T0NZsLhsj0xA1MA/5yt2zxHQsWZbVsdR0ToHydiQfMAPnPSNKrC1PnYMwSKSFnDxu/QWTEDSKROKIZ59PCfIeZPynSUipqwTcE2XQriXYHj/hfa5M+iYuqT3th2vMSPfUZsF80TeP9gakI4D9LZg/+vYBVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B98zoEHv; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d02fa5860so926499f8f.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775748378; x=1776353178; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CGxI1M6g+bTxGU/K2fWjBUXBZCiS9bZDpSTFAuLq/U=;
        b=B98zoEHvlfu41OpPIe+T1PEFRhQbRB8Gi6jLaP9K2qSw4OWtYpC01m8McZy3szdWli
         Ko3ol+dlFNz+icqODxPnfxar1eRC2M5rWjY7DIuYPBRBjyTsqoPecNMXATqB3CLJ7rT8
         HCXPeqcQcVHGFBS7sDV5ApSRnahaf5RLvPIQeWFuAbDviQVqlTMml/+2HDEVIv0OoesH
         b/h2abrh8tkgNkY9tWysQ2/krgvIjTEVhL0uD7rvibvNUh5HBE8MUnsG9znhVpi52AD9
         pIWss0HEcwSe8otvSKw7qy9jdOUOb/z1XfC2nrj2ljoyWSmQqUWqSm5IZRGk66NDv0m/
         hOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748378; x=1776353178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CGxI1M6g+bTxGU/K2fWjBUXBZCiS9bZDpSTFAuLq/U=;
        b=rSth2Sp31Xi0nZQoKP6l9zzbCEZ/C7AmwJ+kImXDQK2p/LBVqQsD2LdRvHp0M9mrnn
         VITvgNUgagis1GNeYm9HazwFB53zRtZYqm1Pzu6keJvbxo+q4r+ah4IPRPUjRwaARM3r
         Wd8ACwn5EjuxciwZEWckPW7tKhaQE2Kqmvj6R9zX9uSlCQDB/W/+h8v7N/046mq4oBAg
         bP2YTQg6vJsAcx+Ebz3hNVQsGhLICDtWmTRSUUZE8cQwmMSAs1yCx06Z5GgQOVJtrELM
         2TVMMj03cQYtLjbldR3kCYxMOUeY8CaZ78skRy/aosdZ1x+JQPyNPAi77Ad8h6WwmYKy
         WigA==
X-Forwarded-Encrypted: i=1; AJvYcCWGAIRKzIWSOg4auR6xemjJsGpMxFkulM/CA0ENgHqyBsX2OUWTP2Ff0K71jfToZ2NCUXI1L7e9eIvjhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8hSukb5T8U0TV7FZGhyzw8a583XfoV20CCw40NByC+JC0oI7z
	52SG2ZhdD6Efs0C5BuH0D59Hm264mNt/Li3oDf3m+lTdO8ge2lAxj7Yw8QFg44n9zQx5ZJGr3MS
	dy+LRVU0tuhbOgXVaug==
X-Received: from wrtr6.prod.google.com ([2002:a5d:4e46:0:b0:439:b72a:2e5c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:611:b0:43b:5231:e94a with SMTP id ffacd0b85a97d-43d292c7b56mr39913943f8f.30.1775748378002;
 Thu, 09 Apr 2026 08:26:18 -0700 (PDT)
Date: Thu, 09 Apr 2026 15:26:06 +0000
In-Reply-To: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=13096; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Yfede79I4aPzGAgrGu8z8A6J0rlO49xK92FjHzZrVAs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp18UXaIZpOFob+lqnC/VdmqbNIZSqGBZrApMqb
 2UGl8xpwu6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadfFFwAKCRAEWL7uWMY5
 RjAHD/4/VrBe/IoHXZOJWxKskD9LHc4MTAtQqkUnLz5KffFmMVrpkFdkyUP1B8SpW5Ftt+I/vA4
 11NIH2JTk+iwcpX0lOhju2mSvb2IihDvTojaf/bnBxpsnX6G6tWbRw/ANA5JOYiGDd+lAzVEtzp
 eU2tKUu81OqY6jzw3dq2YFYDGKjT9re/PhnN1CKzMsbqGsArSjyzVmq5cAXfu2W2n2xjUtK/COg
 uYAZL5pLD74bGwo2HaU06BVW0h/q4RcgyFVBArc34uX2Q8CSoTcYW6I78TaESQZ0A5zEIPIwzXd
 TxVniRHohbPmUGCYUPxQ9zvuBGEwITu5Q2s8sMHI6SU/L1XCZM6M9eojg7tzKDvwA9p47ddhq0t
 IyWIOx9GrfUk/e1qLfRHYjWYOQrblElTBSKsP3CtI6BC8OijUYPbqF87URqityhHOVXnH76sD05
 baMKTKnxtO8ZVHRoVl25w+e+YvRXcrC+0ePy29KOO2oco8ANjdK5o6bkcVdfAxda0qFlGdsVGmU
 W1gyq+vw7h9vt9s5z4WjsXBUaBYKrphGnIB5LVKayK8KZcPJ5PIZlK9OcuFh3C/erOAjsnsE47j
 IrWjkdht7+BfGen33fiPM7ppOzFqamB3n0epbKg7LlVhXE5phFi0uHMbPaf6MF97VX25NIE7lgt GWgYWUflHMWTIsA==
X-Mailer: b4 0.14.3
Message-ID: <20260409-gpuvm-rust-v6-1-b16e6ada7261@google.com>
Subject: [PATCH v6 1/5] rust: drm: add base GPUVM immediate mode abstraction
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
	TAGGED_FROM(0.00)[bounces-58355-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 2C9BF3CCAD7
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
 rust/kernel/drm/gpuvm/mod.rs    | 260 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 6 files changed, 285 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b01791963e25..9c93fa23654c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8858,6 +8858,8 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_gpuvm.c
 F:	include/drm/drm_gpuvm.h
+F:	rust/helpers/drm_gpuvm.c
+F:	rust/kernel/drm/gpuvm/
 
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index eda8f50d3a3c..cb06a7ff795b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -35,6 +35,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
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
index b6b20ad2e0e6..875a9788ad40 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -30,6 +30,7 @@
 #include "dma.c"
 #include "dma-resv.c"
 #include "drm.c"
+#include "drm_gpuvm.c"
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
new file mode 100644
index 000000000000..1d9138d989b3
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -0,0 +1,260 @@
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
+/// * Does not contain any sparse `GpuVa` instances.
+#[pin_data]
+pub struct GpuVm<T: DriverGpuVm> {
+    #[pin]
+    vm: Opaque<bindings::drm_gpuvm>,
+    /// Accessed only through the [`UniqueRefGpuVm`] reference.
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: The GPUVM api does not assume that it is tied to a specific thread. The destructor will
+// drop the `data` field, which is okay because it is guaranteed `Send` by the `DriverGpuVm` trait.
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
+impl<T: DriverGpuVm> PartialEq for GpuVm<T> {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self.as_raw(), other.as_raw())
+    }
+}
+impl<T: DriverGpuVm> Eq for GpuVm<T> {}
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
+                    // zero. The `vm` is zeroed before calling this method by `__GFP_ZERO` flag
+                    // below.
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
+            GFP_KERNEL | __GFP_ZERO,
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
+pub trait DriverGpuVm: Sized + Send {
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
+// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel, and
+// concurrent access to `data` is safe due to the `T: Sync` requirement.
+unsafe impl<T: DriverGpuVm + Sync> Sync for UniqueRefGpuVm<T> {}
+
+impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
+    /// Access the data owned by this `UniqueRefGpuVm` immutably.
+    #[inline]
+    pub fn data_ref(&self) -> &T {
+        // SAFETY: By the type invariants we may access `data`.
+        unsafe { &*self.0.data.get() }
+    }
+
+    /// Access the data owned by this `UniqueRefGpuVm` mutably.
+    #[inline]
+    pub fn data(&mut self) -> &mut T {
+        // SAFETY: By the type invariants we may access `data`.
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
2.53.0.1213.gd9a14994de-goog


