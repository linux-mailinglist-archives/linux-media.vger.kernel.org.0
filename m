Return-Path: <linux-media+bounces-40077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E7B2991E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5104205F4D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEB127054C;
	Mon, 18 Aug 2025 05:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FZ0b4ep3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5C272805;
	Mon, 18 Aug 2025 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496329; cv=pass; b=Uof1Fj/Q3HXev5R8gP2TFl0CL8jsGag3byuiR9sCzC2jsksTeX72oPdqpt41IcZ6o0i3ycETJ6Vu0haBM83ix+mc1MqP0gMfHB5gdA+SnnBlKOyErIh0tg3tqhgHIaP4TpURJg/DXGw7CS7/QK0nWeDWZQYGmwOX/FSVLgGJeaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496329; c=relaxed/simple;
	bh=SYuPpLWJH24VNko7yCziTLKZcoq2a+nA2/azwEKaO9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbW5fJ8xbTuwjlUZucRTyF+NaoUb5Y+aJw2uHnFjpQNTBHuwN2iMJvOzIXLgueLBKU18M7n19ZpOXFYoYN+NXwgKjYs9bbTEWhaBSWkJFkL8MajvzeEWJKfxrUBJPw7lmlGzk7csTaNWsvjLrAmXwlVESir3ZmEGSjTcL81rc1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FZ0b4ep3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nVwbwGEjZ/iMECajzajsl7A+xyN+1KdNl1VxT803+BIsaWZnyNZyB16kJkrtgnmLbNRdOMfUd5KNN0aKGWrMBZUqV/dT1DrPlg3kN5Sf+betKw7k6romkKGibMN6K2pCoxpsNT2D+DBOdKqyVjD++ZDH8fvdk9/Wt+1J4SNVUJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496305; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XhrjeSrRtk4sckOYF9Gg78Pr/Ohbjo4YpRHB3aSpaa4=; 
	b=GNjDB8x5m5HtWGWK3gL6kDytURbI3PJAW0hztFIIhQbXh6LzXmvGLDc8DqToMuV0+kwg+ThUKWyxT75SvMrpKNoe0bmzKO86Vrex0KJAhIwOWaiGqEVtJhuLP7oh3tmALig50sCjRP3Ex2S4qol1rGjfzLnxAtuiv+IGSy3m2cI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496305;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XhrjeSrRtk4sckOYF9Gg78Pr/Ohbjo4YpRHB3aSpaa4=;
	b=FZ0b4ep3zEd/la/ID57ft5H/nyzeaijGy0SEImeRtrn69h/oC70lJadWqi3Y52/Y
	oEGLLe3XGlTip0t5lf60qH5T4dp8o3T4dKuuuIhbS5V1Zt5GCyFSGv5HcFtx8TZikG3
	uT4mVIH9IvokcDLXjMV/YuGe7ppatewASZLr1k4Q=
Received: by mx.zohomail.com with SMTPS id 175549630245781.41696240548583;
	Sun, 17 Aug 2025 22:51:42 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:49 -0300
Subject: [PATCH 3/7] rust: v4l2: add support for video device nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-3-6887e772aac2@collabora.com>
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

Video device nodes back the actual /dev/videoX files. They expose a rich
ioctl interface for which we will soon add support for and allow for
modelling complex hardware through a topology of nodes, each modelling a
particular hardware function or component.

V4l2 drivers rely on video device nodes pretty extensively, so add a
minimal Rust abstraction for them. The abstraction currently does the
bare-minimum to let users register a V4L2 device node. It also
introduces the video::Driver trait that will be implemented by Rust v4l2
drivers. This trait will then be refined in future patches.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/v4l2-device.c       |  16 +++
 rust/kernel/media/v4l2/device.rs |   1 -
 rust/kernel/media/v4l2/mod.rs    |   3 +
 rust/kernel/media/v4l2/video.rs  | 251 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/v4l2-device.c b/rust/helpers/v4l2-device.c
index d19b46e8283ce762b4259e3df5ecf8bb18e863e9..0ead52b9a1ccc0fbc4d7df63578b334b17c05b70 100644
--- a/rust/helpers/v4l2-device.c
+++ b/rust/helpers/v4l2-device.c
@@ -6,3 +6,19 @@ void rust_helper_v4l2_device_get(struct v4l2_device *v4l2_dev)
 {
     v4l2_device_get(v4l2_dev);
 }
+
+void rust_helper_video_get(struct video_device *vdev)
+{
+    get_device(&vdev->dev);
+}
+
+void rust_helper_video_put(struct video_device *vdev)
+{
+    put_device(&vdev->dev);
+}
+
+int rust_helper_video_register_device(struct video_device *vdev,
+                                      enum vfl_devnode_type type, int nr)
+{
+    return video_register_device(vdev, type, nr);
+}
diff --git a/rust/kernel/media/v4l2/device.rs b/rust/kernel/media/v4l2/device.rs
index 26096672e6f6d35711ff9bdabf4d7b20f697a4ab..cbbf07ab63b7725cafecb89eb93c497e749287e7 100644
--- a/rust/kernel/media/v4l2/device.rs
+++ b/rust/kernel/media/v4l2/device.rs
@@ -44,7 +44,6 @@ impl<T: Driver> Device<T> {
     ///
     /// - `ptr` must be a valid pointer to a `struct v4l2_device` that must
     ///   remain valid for the lifetime 'a.
-    #[expect(dead_code)]
     pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_device) -> &'a Device<T> {
         // SAFETY: `ptr` is a valid pointer to a `struct v4l2_device` as per the
         // safety requirements of this function.
diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
index 63394d0322fa1f646f3b23a5fadf2ac34a9f666e..ba1d4b7da8d8887b1604031497c300d7e0609cd2 100644
--- a/rust/kernel/media/v4l2/mod.rs
+++ b/rust/kernel/media/v4l2/mod.rs
@@ -7,3 +7,6 @@
 //! [structure of the V4L2 framework]: https://www.kernel.org/doc/html/latest/driver-api/media/v4l2-intro.html#structure-of-the-v4l2-framework
 /// Support for Video for Linux 2 (V4L2) devices.
 pub mod device;
+
+/// Support for Video for Linux 2 (V4L2) video devices.
+pub mod video;
diff --git a/rust/kernel/media/v4l2/video.rs b/rust/kernel/media/v4l2/video.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e6954d3e6ac65201bd40a0215babb354ae10cd12
--- /dev/null
+++ b/rust/kernel/media/v4l2/video.rs
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+//! Video for Linux 2 (V4L2) video device support.
+//!
+//! Video device nodes back the actual /dev/videoX files and provide an
+//! interface for userspace to interact with the device, usually via the `ioctl`
+//! syscall.
+//!
+//! They expose a rich ioctl interface and allow for modelling complex hardware
+//! through a topology of nodes, each modelling a particular hardware function
+//! or component.
+//!
+//! C headers: [`include/media/v4l2-dev.h`](srctree/include/media/v4l2-dev.h).
+
+use core::{marker::PhantomData, mem::MaybeUninit, ops::Deref, ptr::NonNull};
+
+use pin_init::PinInit;
+
+use crate::{
+    alloc,
+    error::to_result,
+    media::v4l2::{self, video},
+    prelude::*,
+    types::{ARef, AlwaysRefCounted, Opaque},
+};
+
+/// The type of node that will be exposed to userspace.
+#[repr(u32)]
+pub enum NodeType {
+    /// For video input/output devices.
+    Video = bindings::vfl_devnode_type_VFL_TYPE_VIDEO,
+}
+
+/// Identifies if the video device corresponds to a receiver, a transmitter or a
+/// mem-to-mem device.
+#[repr(u32)]
+pub enum Direction {
+    /// The device is a receiver.
+    Rx,
+    /// The device is a transmitter.
+    Tx,
+    // TODO: m2m. We do not support this at the moment, so it is not possible to
+    // specify it here as well.
+}
+
+/// A V4L2 device node.
+///
+/// V4L2 devices nodes are backed by a [`v4l2::Device`]. Each instance is
+/// associated with a specific video device in the filesystem. A logical device
+/// can be represented by multiple instances of this struct.
+///
+/// # Invariants
+///
+/// - `inner` is a valid pointer to a `struct video_device`.
+#[pin_data]
+#[repr(C)]
+pub struct Device<T: Driver> {
+    #[pin]
+    inner: Opaque<bindings::video_device>,
+    #[pin]
+    data: <T as Driver>::Data,
+}
+
+impl<T: Driver> Device<T> {
+    pub(super) fn as_raw(&self) -> *mut bindings::video_device {
+        self.inner.get()
+    }
+
+    /// Converts a raw pointer to a `Device<T>` reference.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to a `struct video_device` that must
+    ///   remain valid for the lifetime 'a.
+    #[expect(dead_code)]
+    pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::video_device) -> &'a Device<T> {
+        // SAFETY: `ptr` is a valid pointer to a `struct video_device` as per the
+        // safety requirements of this function.
+        unsafe { &*(ptr.cast::<Device<T>>()) }
+    }
+
+    /// Returns the video device number, i.e.: /dev/videoX.
+    pub fn num(&self) -> u16 {
+        // SAFETY: Safe as per the invariants of `Device`.
+        unsafe { (*self.as_raw()).num }
+    }
+
+    /// # Safety
+    ///
+    /// This function must be called as the release callback of `struct
+    /// video_device`.
+    unsafe extern "C" fn release_callback(dev: *mut bindings::video_device) {
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
+impl<T: Driver> AsRef<v4l2::device::Device<T>> for Device<T> {
+    fn as_ref(&self) -> &v4l2::device::Device<T> {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct video_device`
+        // as per the invariants of `Device<T>`.
+        unsafe { v4l2::device::Device::from_raw((*self.as_raw()).v4l2_dev) }
+    }
+}
+
+impl<T: Driver> Deref for Device<T> {
+    type Target = <T as Driver>::Data;
+
+    fn deref(&self) -> &Self::Target {
+        &self.data
+    }
+}
+
+/// SAFETY: V4L2 device nodes are always reference counted and the get/put
+/// functions satisfy the requirements.
+unsafe impl<T: Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: it is safe to call `bindings::video_get` because
+        // `self.inner` is a valid pointer to a `struct video_device` as per
+        // the invariants of `Device<T>`.
+        unsafe { bindings::video_get(self.inner.get()) }
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is
+        // non-zero.
+        unsafe { bindings::video_put(obj.cast().as_ptr()) };
+    }
+}
+
+// SAFETY: it is safe to send a [`Device`] to another thread. In particular, a
+// [`Device`] can be dropped by any thread.
+unsafe impl<T: Driver> Send for Device<T> {}
+
+// SAFETY: It is safe to send a &Device<T> to another thread, as we do not allow
+// mutation through a shared reference.
+unsafe impl<T: Driver> Sync for Device<T> {}
+
+/// The interface that must be implemented by structs that would otherwise embed
+/// a C [`struct video_device`](srctree/include/media/v4l2-dev.h).
+pub trait Driver: v4l2::device::Driver {
+    /// The type of the driver's private data.
+    type Data;
+
+    /// The [`NodeType`] to use when registering the device node.
+    const NODE_TYPE: NodeType;
+
+    /// The [`Direction`] to use when registering the device node.
+    const DIRECTION: Direction;
+
+    /// The name to use when registering the device node.
+    const NAME: &'static CStr;
+}
+
+struct DeviceOptions<'a, T: Driver> {
+    dev: &'a v4l2::device::Device<T>,
+    _phantom: PhantomData<T>,
+}
+
+impl<'a, T: Driver> DeviceOptions<'a, T> {
+    /// Creates a `video_device` ready for registration.
+    fn into_raw(self) -> bindings::video_device {
+        bindings::video_device {
+            v4l2_dev: self.dev.as_raw(),
+            name: {
+                let mut name: [c_char; 64] = [0; 64];
+                let src = T::NAME.as_bytes();
+                let len = core::cmp::min(src.len(), name.len());
+                name[..len].copy_from_slice(&src[..len]);
+                name
+            },
+            vfl_dir: T::DIRECTION as c_uint,
+            release: Some(Device::<T>::release_callback),
+            // SAFETY: All zeros is valid for the rest of the fields in this C
+            // type.
+            ..unsafe { MaybeUninit::zeroed().assume_init() }
+        }
+    }
+}
+
+/// Represents the registration of a V4L2 device node.
+pub struct Registration<T: Driver>(ARef<Device<T>>);
+
+impl<T: Driver> Registration<T> {
+    /// Returns a new `Registration` for the given device, which guarantees that
+    /// the underlying device node is properly initialized and registered, which
+    /// means that it can be safely used.
+    pub fn new(
+        dev: &v4l2::device::Device<T>,
+        data: impl PinInit<<T as Driver>::Data, Error>,
+        flags: alloc::Flags,
+    ) -> Result<Self> {
+        let video_dev = try_pin_init!(Device {
+            inner <- Opaque::try_ffi_init(move |slot: *mut bindings::video_device| {
+                let opts: DeviceOptions<'_, T> = DeviceOptions {
+                    dev,
+                    _phantom: PhantomData
+                };
+
+                // SAFETY: `DeviceOptions::into_raw` produces a valid
+                // `bindings::video_device` that is ready for registration.
+                unsafe { slot.write(opts.into_raw()) };
+
+
+                // SAFETY: It is OK to call this function on a zeroed
+                // `video_device` and a valid `v4l2::Device` reference.
+                to_result(unsafe { bindings::video_register_device(slot, T::NODE_TYPE as c_uint, -1) })
+            }),
+            data <- data,
+        });
+
+        let video_dev = KBox::pin_init(video_dev, flags)?;
+
+        // SAFETY: We will be passing the ownership to ARef<T>, which treats the
+        // underlying memory as pinned throughout its lifetime.
+        //
+        // This is true because:
+        //
+        // - ARef<T> does not expose a &mut T, so there is no way to move the T
+        // (e.g.: via a `core::mem::swap` or similar).
+        // - ARef<T>'s member functions do not move the T either.
+        let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(video_dev) });
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
+    /// Returns a reference to the underlying video device.
+    pub fn device(&self) -> &video::Device<T> {
+        &self.0
+    }
+}
+
+impl<T: Driver> Drop for Registration<T> {
+    fn drop(&mut self) {
+        // SAFETY: `self.0` is a valid `video_device` that was registered in
+        // [`Registration::new`].
+        unsafe { bindings::video_unregister_device(self.0.as_raw()) };
+    }
+}

-- 
2.50.1


