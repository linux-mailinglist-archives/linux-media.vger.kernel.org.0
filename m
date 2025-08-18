Return-Path: <linux-media+bounces-40080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FDBB2992A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2D7204979
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DF92741C3;
	Mon, 18 Aug 2025 05:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OlJCJkr/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337A271476;
	Mon, 18 Aug 2025 05:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496346; cv=pass; b=U1o5PeCYHRwZ3IJXP53N8Sht2px4M25M7DebFzCeZNbTVnwBSMUJK6tLgpMisa1oLYpOEONtbd55KxVzcWHGG9EEO3e/+NHxkUyvaC7486giZBZMXP2eHIinKBRlTQn7kZTd0LHT2Wa17pk3ywD4NL2T8cm+CqgJWE/W/E+bUKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496346; c=relaxed/simple;
	bh=RBZwr7i7mu4f81XKdVBGd1PjZ1NQ30apiDuf3T4SOBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dM2jtQ71yVwWirzLHaM2kIKuBfqn7afjQb9sTP73AZfF66womcPW2EHX4kUGzrE+4XIcPQL2low85bDI7ZgNQyEsNaZowbW7UUf599IBqlmg3h6sIvVef/LO0YOqcXNcG++/SH5eFKMIvpb7nTR8HE4l+evFIqkJ+XTXge10ht8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OlJCJkr/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XgAmQ2x20QJmKuhtXxRgnDvXcQyEXFzqbtQbU7bBZaF5xW6nhK+U/+pMoYECj2SOMekykWkDPnUDXgCEcyUOOA7Z1fWu2zEl5wtGhUORJ2f5Mxy7Jvc2F4cKqkBrRJI5siyw2Zd+5TK5tij73DfnvClH6S/Fk+BhCtceIjoekj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496309; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dmuZuxPv44ha8AiyUg7rl9Ghj4JlB91sUyy/1+MmJjQ=; 
	b=j9TJmnQIsgy/aidtlutqtgOwdJlmvOXE85kUkhZhPRUiqKJ12mbH/GpWwv2lNrzPfO5aL391BqQSCA+eRVkul259gDX8pbhuz8+lEJszT14Uq36jOYO/1Qqa839i2eV7HtvFZ3oHGJf3AXDvkZOJ1/rGM/ZATwxJeUAIbZatmIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496309;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=dmuZuxPv44ha8AiyUg7rl9Ghj4JlB91sUyy/1+MmJjQ=;
	b=OlJCJkr/76o806UYpE3tN5VQTBE/CAKxaYgJzr1xRF5LVE01/Hnp05xlxVZJloq9
	edQ8AsF6P9pmE4kRIj2YziGFMAJPe5CqcGYGI2sHIkxgTO/D+WvfMB4XsAEuwgOBtPp
	eu/T4f5JjnwNUpjrY3kzDBBYTwNAtdRyOU747bTE=
Received: by mx.zohomail.com with SMTPS id 1755496307449714.2271839560013;
	Sun, 17 Aug 2025 22:51:47 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:50 -0300
Subject: [PATCH 4/7] rust: v4l2: add support for v4l2 file handles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-4-6887e772aac2@collabora.com>
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

V4L2 allow multiple opens for a variety of use-cases, where the actual
meaning of opening a node more than once is defined by the driver.

Each open call is associated with its own v4l2_fh instance, and these
instances are collected at the struct video_device level, making up a
private context that can be retrieved at later calls, like ioctl()s
performed on the node's file descriptor.

Add basic support for v4l2_fh and a corresponding DriverFile trait to
help model it. This will be needed in future patches in order to add
v4l2 ioctl support, among other things.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/v4l2-device.c      |   6 ++
 rust/kernel/media/v4l2/file.rs  | 165 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/media/v4l2/mod.rs   |   3 +
 rust/kernel/media/v4l2/video.rs |   7 +-
 5 files changed, 180 insertions(+), 2 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 95651c4bc9e561d9f4949111961f41e65d8c1585..11ff2c018515e99c8af9ad91ab09f8f15ae224c1 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -76,6 +76,7 @@
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
 #include <trace/events/rust_sample.h>
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
diff --git a/rust/helpers/v4l2-device.c b/rust/helpers/v4l2-device.c
index 0ead52b9a1ccc0fbc4d7df63578b334b17c05b70..24fa41fe570d1263313e70325c4b39f819cb4177 100644
--- a/rust/helpers/v4l2-device.c
+++ b/rust/helpers/v4l2-device.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 
 void rust_helper_v4l2_device_get(struct v4l2_device *v4l2_dev)
@@ -22,3 +23,8 @@ int rust_helper_video_register_device(struct video_device *vdev,
 {
     return video_register_device(vdev, type, nr);
 }
+
+struct video_device *rust_helper_video_devdata(struct file *filp)
+{
+    return video_devdata(filp);
+}
diff --git a/rust/kernel/media/v4l2/file.rs b/rust/kernel/media/v4l2/file.rs
new file mode 100644
index 0000000000000000000000000000000000000000..37b34f8e6f251fafde5f7e6b4bd654519d8247a5
--- /dev/null
+++ b/rust/kernel/media/v4l2/file.rs
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+//! V4L2 file handle support.
+//!
+//! V4L2 allow multiple opens for a variety of use-cases, where the actual
+//! meaning of opening a node more than once is defined by the driver.
+//!
+//! Each open call is associated with its own v4l2_fh instance, and these
+//! instances are collected at the struct video_device level, making up a
+//! private context that can be retrieved at later calls, like ioctl()s
+//! performed on the node's file descriptor.
+
+use core::{marker::PhantomData, mem::MaybeUninit, ops::Deref};
+
+use pin_init::PinInit;
+
+use crate::{alloc::KBox, init::InPlaceInit, media::v4l2::video, prelude::*, types::Opaque};
+
+/// Trait that must be implemented by V4L2 drivers to represent a V4L2 file.
+pub trait DriverFile {
+    /// The parent `Driver` implementation for this `DriverFile`.
+    type Driver: video::Driver;
+
+    /// A reference to the module that this driver belongs to.
+    const MODULE: &'static ThisModule;
+
+    /// Called when a client opens a V4L2 node.
+    fn open(vdev: &video::Device<Self::Driver>) -> impl PinInit<Self, Error>;
+}
+
+/// An open V4L2 file handle.
+///
+/// # Invariants
+///
+/// `inner` is a valid instance of a `struct v4l2_fh`.
+#[repr(C)]
+#[pin_data]
+pub struct File<T: DriverFile> {
+    #[pin]
+    inner: Opaque<bindings::v4l2_fh>,
+    #[pin]
+    driver_file: T,
+}
+
+impl<T: DriverFile> File<T> {
+    /// Converts a raw pointer to a `File<T>` reference.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to a `struct v4l2_file`.
+    /// - `ptr` must be valid for 'a.
+    #[expect(dead_code)]
+    pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_fh) -> &'a File<T> {
+        // SAFETY: `ptr` is a valid pointer to a `struct v4l2_file` as per the
+        // safety requirements of this function.
+        unsafe { &*(ptr.cast::<File<T>>()) }
+    }
+
+    /// Returns the raw pointer to the `struct v4l2_fh`.
+    pub(super) fn as_raw(&self) -> *mut bindings::v4l2_fh {
+        self.inner.get()
+    }
+
+    /// The open callback of a `struct video_device`
+    ///
+    /// # Safety
+    ///
+    /// - this function must be called as the open callback of a `struct video_device`.
+    /// - `raw_file` must be a valid pointer to a `struct file`.
+    pub(super) unsafe extern "C" fn open_callback(raw_file: *mut bindings::file) -> c_int {
+        // SAFETY: `raw_file` is a valid pointer to a `struct file` and this is
+        // the open callback for a `struct video device` as per the safety
+        // requirements. This means that the `struct video_device` can be
+        // retrieved by this FFI call.
+        let vdev = unsafe { bindings::video_devdata(raw_file) };
+
+        let file = try_pin_init!(File::<T> {
+            inner <- Opaque::ffi_init(move |slot: *mut bindings::v4l2_fh| {
+                // SAFETY:
+                // - it is safe for the initializer to write to the slot,
+                // - zeroed() is a valid value for `struct v4l2_fh`.
+                unsafe { *slot = MaybeUninit::zeroed().assume_init() };
+
+                // SAFETY: `slot` was zero-initialized and `vdev` is a valid
+                // video device that was retrieved by `video_devdata`.
+                unsafe { bindings::v4l2_fh_init(slot, vdev) }
+            }),
+            driver_file <- {
+                // SAFETY: `vdev` is a valid pointer to a `struct video_device` that was
+                // retrieved using `video_devdata`. The underlying `struct video_device`
+                // remains valid for the lifetime 'a, i.e.: for the entire scope of this
+                // function.
+                let vdev = unsafe { video::Device::from_raw(vdev) };
+                T::open(vdev)
+            }
+        });
+
+        let file = match KBox::pin_init(file, GFP_KERNEL) {
+            Ok(file) => file,
+            Err(e) => return e.to_errno(),
+        };
+
+        let v4l2_fh = file.as_ref().as_raw();
+
+        // SAFETY: We are passing ownership of the `File<T>` to the kernel,
+        // which treats the underlying memory as pinned throughout its lifetime.
+        let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(file) });
+
+        // SAFETY: `raw_file` points to a valid `struct file` as per the safety
+        // requirements, so it is safe to dereference it.
+        unsafe { (*raw_file).private_data = ptr.cast() };
+
+        // SAFETY: `v4l2_fh` was initialized above in `v4l2_fh_init`.
+        unsafe { bindings::v4l2_fh_add(v4l2_fh) };
+
+        0
+    }
+
+    /// The release callback of a `struct v4l2_fh`.
+    ///
+    /// # Safety
+    ///
+    /// - this function must be called as the release callback of a `struct v4l2_fh`.
+    /// - `raw_file` must be a valid pointer to a `struct file`.
+    pub(super) unsafe extern "C" fn release_callback(raw_file: *mut bindings::file) -> c_int {
+        // SAFETY: `raw_file::private_data` was set to `Pin<KBox<File<T>` in
+        // `open_callback`.
+        let file: Pin<KBox<File<T>>> =
+            unsafe { Pin::new_unchecked(Box::from_raw((*raw_file).private_data.cast())) };
+
+        // SAFETY: `file.inner` is a valid pointer to a `struct v4l2_fh`.
+        unsafe { bindings::v4l2_fh_del(file.as_raw()) };
+        // SAFETY: `file.inner` is a valid pointer to a `struct v4l2_fh`.
+        unsafe { bindings::v4l2_fh_exit(file.as_raw()) };
+
+        0
+    }
+}
+
+impl<T: DriverFile> Deref for File<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.driver_file
+    }
+}
+
+pub(super) struct FileVtable<T: DriverFile>(PhantomData<T>);
+
+impl<T: DriverFile> FileVtable<T> {
+    const VTABLE: bindings::v4l2_file_operations = bindings::v4l2_file_operations {
+        open: Some(File::<T>::open_callback),
+        release: Some(File::<T>::release_callback),
+        owner: T::MODULE.as_ptr(),
+        unlocked_ioctl: Some(bindings::video_ioctl2),
+        // SAFETY: All zeros is valid for the rest of the fields in this C
+        // type.
+        ..unsafe { MaybeUninit::zeroed().assume_init() }
+    };
+
+    pub(super) const fn build() -> &'static bindings::v4l2_file_operations {
+        &Self::VTABLE
+    }
+}
diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
index ba1d4b7da8d8887b1604031497c300d7e0609cd2..1195c18f1336891c4b9b194d4e7e5cd40989ace9 100644
--- a/rust/kernel/media/v4l2/mod.rs
+++ b/rust/kernel/media/v4l2/mod.rs
@@ -10,3 +10,6 @@
 
 /// Support for Video for Linux 2 (V4L2) video devices.
 pub mod video;
+
+/// Support for Video for Linux 2 (V4L2) file handles.
+pub mod file;
diff --git a/rust/kernel/media/v4l2/video.rs b/rust/kernel/media/v4l2/video.rs
index e6954d3e6ac65201bd40a0215babb354ae10cd12..7ef2111c32ca55a2bced8325cd883b28204dc3ee 100644
--- a/rust/kernel/media/v4l2/video.rs
+++ b/rust/kernel/media/v4l2/video.rs
@@ -20,7 +20,7 @@
 use crate::{
     alloc,
     error::to_result,
-    media::v4l2::{self, video},
+    media::v4l2::{self, file::DriverFile, video},
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
@@ -73,7 +73,6 @@ pub(super) fn as_raw(&self) -> *mut bindings::video_device {
     ///
     /// - `ptr` must be a valid pointer to a `struct video_device` that must
     ///   remain valid for the lifetime 'a.
-    #[expect(dead_code)]
     pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::video_device) -> &'a Device<T> {
         // SAFETY: `ptr` is a valid pointer to a `struct video_device` as per the
         // safety requirements of this function.
@@ -148,6 +147,9 @@ pub trait Driver: v4l2::device::Driver {
     /// The type of the driver's private data.
     type Data;
 
+    /// The driver's file type.
+    type File: DriverFile;
+
     /// The [`NodeType`] to use when registering the device node.
     const NODE_TYPE: NodeType;
 
@@ -177,6 +179,7 @@ fn into_raw(self) -> bindings::video_device {
             },
             vfl_dir: T::DIRECTION as c_uint,
             release: Some(Device::<T>::release_callback),
+            fops: super::file::FileVtable::<T::File>::build(),
             // SAFETY: All zeros is valid for the rest of the fields in this C
             // type.
             ..unsafe { MaybeUninit::zeroed().assume_init() }

-- 
2.50.1


