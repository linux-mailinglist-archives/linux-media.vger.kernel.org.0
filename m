Return-Path: <linux-media+bounces-40076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33229B2991D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25028204A1F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6F2727F4;
	Mon, 18 Aug 2025 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MkZXRORQ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1B27054C;
	Mon, 18 Aug 2025 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496324; cv=pass; b=hAKmvJsnk41dp06jRikg0I+KvJkvckDonEjKh57AAR25f5u1SPHKsLjYeBIl6+adhNUy3EzDK7jMssMGMKbyTdmbxGbgZMD2mNZUjKiZ9lZ3uixq9WEihiWgYTMNmAtqtT3nK3zIQMzqtk5d5HIX3/RWCd0+sIP0RCdtw//uckI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496324; c=relaxed/simple;
	bh=8CyA/td0aV46NCdPsJKlmycDN/4Xc49eWWynic7E30M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgQJkqQAdadAFqW2v2dDsZlny5QN/QF9gamE2BmDLkFITxJU8o9YMI1rujXsfGSx+i/HRoFp/C+MZm7c9bWa+y2DRDnOYMhSNO0pIrGvG5EhLG1jVA9QtHboqjEQY+/B3lhkZF6awFvzixQdBDc8FSq+gC9si/jR0Rymi8Jh/iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MkZXRORQ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496301; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HzhXIwVp8A2uKhu1i+YP+jboetj0ChACBqFd3xUVRYbpG2Nmf4E7otwD8DVAFbfc4fs+eeu3dmrHWMSjg6Q2L7/B0cyxbzfe2nKNg7Zw6Xy1PkuhD9NqKIncbyMmW2Er+afiujMum8Lr81OS3cwyyNMz/47fW/DHH77QJCv+vAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496301; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8dxBJI5g3fLuoB4rUsRh71vQ0CR/TagAO1Uci3c6LFc=; 
	b=FznTeQGoNT6TTdkxmLGQLLqO6wWf7g85PtnKfxos3x/LGQKc69a+ZAtzx6zVPz0PH8vABDiZ0U40yzCVEsaxmVb7EnsffQODUAB3puwjT2him71VYM7GoCuFmbqq2kXveWCR7AzY/xwEM+8y4YayLJp8Km2vt30RrmHR2uNxLSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496301;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8dxBJI5g3fLuoB4rUsRh71vQ0CR/TagAO1Uci3c6LFc=;
	b=MkZXRORQNj7ThsOlIQ+8CUGACyFZP1SsmnBkOP8lY6041BpnAlAWkg6tAgkMYRyp
	Nmj7e60xRkTRvGXiIdX2rPOw7YYOePTk4fQxRClHB0SONsjwWdAIsTrngFqF7INMqDV
	dZOcaIX5FP9IP9vCJEjAGylAvDqrRT/hwlI9Ct3w=
Received: by mx.zohomail.com with SMTPS id 1755496298214893.3470255323006;
	Sun, 17 Aug 2025 22:51:38 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:48 -0300
Subject: [PATCH 2/7] rust: v4l2: add support for v4l2_device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-2-6887e772aac2@collabora.com>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

struct v4l2_device is the entry-point for video4linux2 drivers. This
struct contains the device state and is the root for v4l2 subdevices
(i.e.: struct v4l2_subdev), which play an important part on how modern
video devices are modeled.

For now, add the bare-minimum support to allocate a v4l2::Device an
register it with the v4l2 framework. Subsequent patches will add support
for video devices and more.

This is one of the steps needed to get a sample v4l2 driver to probe.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/v4l2-device.c       |   8 ++
 rust/kernel/media/mod.rs         |   5 +-
 rust/kernel/media/v4l2/device.rs | 177 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/media/v4l2/mod.rs    |   9 ++
 6 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9baef1f1a1b2752dc0fa044f8542f..95651c4bc9e561d9f4949111961f41e65d8c1585 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -75,6 +75,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <media/v4l2-device.h>
 #include <trace/events/rust_sample.h>
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 7cf7fe95e41dd51717050648d6160bebebdf4b26..83d7e76294207a804f2ad95097a1e4da53fe66f1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -47,6 +47,7 @@
 #include "task.c"
 #include "time.c"
 #include "uaccess.c"
+#include "v4l2-device.c"
 #include "vmalloc.c"
 #include "wait.c"
 #include "workqueue.c"
diff --git a/rust/helpers/v4l2-device.c b/rust/helpers/v4l2-device.c
new file mode 100644
index 0000000000000000000000000000000000000000..d19b46e8283ce762b4259e3df5ecf8bb18e863e9
--- /dev/null
+++ b/rust/helpers/v4l2-device.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <media/v4l2-device.h>
+
+void rust_helper_v4l2_device_get(struct v4l2_device *v4l2_dev)
+{
+    v4l2_device_get(v4l2_dev);
+}
diff --git a/rust/kernel/media/mod.rs b/rust/kernel/media/mod.rs
index e4a28be7b484888a02965d0e8b5fd5d3c969840a..476ea673867121fb68fd4695c2cddc5380e86421 100644
--- a/rust/kernel/media/mod.rs
+++ b/rust/kernel/media/mod.rs
@@ -3,4 +3,7 @@
 
 //! Media infrastructure support.
 //!
-//! Reference: <https://www.kernel.org/doc/html/latest/driver-api/media/index.html>
\ No newline at end of file
+//! Reference: <https://www.kernel.org/doc/html/latest/driver-api/media/index.html>
+
+#[cfg(CONFIG_VIDEO_DEV = "y")]
+pub mod v4l2;
diff --git a/rust/kernel/media/v4l2/device.rs b/rust/kernel/media/v4l2/device.rs
new file mode 100644
index 0000000000000000000000000000000000000000..26096672e6f6d35711ff9bdabf4d7b20f697a4ab
--- /dev/null
+++ b/rust/kernel/media/v4l2/device.rs
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+//! Video for Linux 2 (V4L2) device support.
+//!
+//! A v4l2 [`Device] is the entry-point for video4linux2 drivers. It acts as a
+//! logical device that may back multiple video nodes.
+//!
+//! This struct contains the device state and is the root for v4l2 subdevices
+//! (i.e.: struct v4l2_subdev), which play an important part on how modern video
+//! devices are modelled.
+//!
+//! C headers: [`include/media/v4l2-dev.h`](srctree/include/media/v4l2-dev.h).
+
+use core::{mem::MaybeUninit, ptr::NonNull};
+
+use crate::{
+    alloc::{self, KBox},
+    device,
+    error::to_result,
+    init::InPlaceInit,
+    prelude::*,
+    types::{ARef, AlwaysRefCounted, Opaque},
+};
+
+/// A logical V4L2 device handle.
+///
+/// # Invariants
+///
+/// - `inner` points to a valid `v4l2_device` that has been registered.
+#[pin_data]
+#[repr(C)]
+pub struct Device<T: Driver> {
+    #[pin]
+    inner: Opaque<bindings::v4l2_device>,
+    #[pin]
+    data: T::Data,
+}
+
+impl<T: Driver> Device<T> {
+    /// Converts a raw pointer to a `Device<T>` reference.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to a `struct v4l2_device` that must
+    ///   remain valid for the lifetime 'a.
+    #[expect(dead_code)]
+    pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_device) -> &'a Device<T> {
+        // SAFETY: `ptr` is a valid pointer to a `struct v4l2_device` as per the
+        // safety requirements of this function.
+        unsafe { &*(ptr.cast::<Device<T>>()) }
+    }
+
+    /// Returns the raw pointer to the `struct v4l2_device`.
+    pub(crate) fn as_raw(&self) -> *mut bindings::v4l2_device {
+        self.inner.get()
+    }
+
+    /// # Safety
+    ///
+    /// This function must be called as the release callback of `struct v4l2_device`.
+    unsafe extern "C" fn release_callback(dev: *mut bindings::v4l2_device) {
+        // SAFETY: `dev` was set by calling `KBox::into_raw` on a
+        // `Pin<KBox<Device<T>>` in `Registration::new`. Now that the refcount
+        // reached zero, we are reassembling the KBox so it can be dropped.
+        let v4l2_dev: Pin<KBox<Device<T>>> =
+            unsafe { Pin::new_unchecked(Box::from_raw(dev.cast())) };
+
+        drop(v4l2_dev)
+    }
+}
+
+impl<T: Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: the invariants of `Device` state that the device is
+        // registered, and the `dev` field is set at registration time, so the
+        // returned reference is valid for the lifetime of self.
+        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
+    }
+}
+
+// SAFETY: V4L2 devices are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: Safe as per the invariants of `Device`.
+        unsafe { bindings::v4l2_device_get(self.as_raw()) }
+    }
+
+    unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+        // SAFETY: Safe as per the invariants of `Device`.
+        unsafe { bindings::v4l2_device_put(obj.cast().as_ptr()) };
+    }
+}
+
+/// SAFETY: It is safe to send `Device<T>` to another thread. In particular,
+/// `Device<T>` instances can be dropped from any thread.
+unsafe impl<T: Driver> Send for Device<T> {}
+
+// SAFETY: it is safe to share references to `Device<T>` between threads as it
+// is not possible to mutate the underlying `struct v4l2_device` through a
+// shared reference.
+unsafe impl<T: Driver> Sync for Device<T> {}
+
+/// The interface that must be implemented by structs that would otherwise embed
+/// a C [`struct v4l2_device`](srctree/include/media/v4l2-device.h).
+pub trait Driver {
+    /// The type of the data associated with the device.
+    type Data: Sync + Send;
+}
+
+/// Represents the registration of a [`Device`].
+///
+/// # Invariants
+///
+/// - The underlying device was registered via [`bindings::v4l2_device_register`].
+pub struct Registration<T: Driver>(ARef<Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Creates and registers a [`Device`] given a [`kernel::device::Device`] reference and
+    /// the associated data.
+    pub fn new(
+        dev: &device::Device,
+        data: impl PinInit<T::Data, Error>,
+        flags: alloc::Flags,
+    ) -> Result<Self> {
+        let v4l2_dev = try_pin_init!(Device {
+            inner <- Opaque::try_ffi_init(move |slot: *mut bindings::v4l2_device| {
+                let v4l2_dev = bindings::v4l2_device {
+                    release: Some(Device::<T>::release_callback),
+                    // SAFETY: All zeros is valid for this C type.
+                    ..unsafe { MaybeUninit::zeroed().assume_init() }
+                };
+
+                // SAFETY: The initializer can write to the slot.
+                unsafe { slot.write(v4l2_dev) };
+
+                // SAFETY: It is OK to call this function on a zeroed
+                // v4l2_device and a valid `device::Device` reference.
+                to_result(unsafe { bindings::v4l2_device_register(dev.as_raw(), slot) })
+            }),
+            data <- data,
+        });
+
+        let v4l2_dev = KBox::pin_init(v4l2_dev, flags)?;
+
+        // SAFETY: We will be passing the ownership of the increment to ARef<T>,
+        // which treats the underlying memory as pinned throughout its lifetime.
+        //
+        // This is true because:
+        //
+        // - ARef<T> does not expose a &mut T, so there is no way to move the T
+        // (e.g.: via a `core::mem::swap` or similar).
+        // - ARef<T>'s member functions do not move the T either.
+        let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(v4l2_dev) });
+
+        // SAFETY:
+        //
+        // - the refcount is one, and we are transfering the ownership of that
+        // increment to the ARef.
+        // - `ptr` is non-null as it came from `KBox::into_raw`, so it is safe
+        // to call `NonNulll::new_unchecked`.
+        Ok(Self(unsafe { ARef::from_raw(NonNull::new_unchecked(ptr)) }))
+    }
+
+    /// Returns a reference to the underlying [`Device`].
+    pub fn device(&self) -> &Device<T> {
+        &self.0
+    }
+}
+
+impl<T: Driver> Drop for Registration<T> {
+    fn drop(&mut self) {
+        // SAFETY: Safe as per the invariants of [`Registration`].
+        unsafe { bindings::v4l2_device_unregister(self.0.as_raw()) }
+    }
+}
diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
new file mode 100644
index 0000000000000000000000000000000000000000..63394d0322fa1f646f3b23a5fadf2ac34a9f666e
--- /dev/null
+++ b/rust/kernel/media/v4l2/mod.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! V4L2 support.
+//!
+//! See the [structure of the V4L2 framework] for more information.
+//!
+//! [structure of the V4L2 framework]: https://www.kernel.org/doc/html/latest/driver-api/media/v4l2-intro.html#structure-of-the-v4l2-framework
+/// Support for Video for Linux 2 (V4L2) devices.
+pub mod device;

-- 
2.50.1


