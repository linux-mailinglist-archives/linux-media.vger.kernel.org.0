Return-Path: <linux-media+bounces-40078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6112B2991B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78141963EE6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351EE2737F9;
	Mon, 18 Aug 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PELjnkcN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266C272E7A;
	Mon, 18 Aug 2025 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496334; cv=pass; b=com/KiK7enC+ngoAfmZc1NDHFvadEFbqZYA5nxLompH9fXCRG7EIChXoQbI5EwKpLAonzueqHesD/ctv5e9B9DpSIuhItt57Np3Nku5c/SjPR++nUvjcPcLGAs3xf+xCGO7ZXC1QfR/95uQQCXazTooaxjPTGJZrEqq+3eVdqnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496334; c=relaxed/simple;
	bh=L/2KyPxOpZB6Rom7rVXTTsgrhWw+wi+XFk+cV1QYgYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tulWtPx5yccoQ5epzF3063aGze0nai9+fUgzyWp+oZh4tS3ghi6wQTlPyBfYNkh9KvUTXJYwgVPTnxsHSMHmZE0beFqDtnJ7S25Rf5iSY7QzsPFgnnn9+A26DP1KGURz5zDVBibkyVmvmAe4hl33Gbh1VJbHvk/sKonWFermSSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=PELjnkcN; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fHF9EBfemOSFS0n/Zn29xF2sRXbiEUtDorFXDND7IftjG/OnPrJkdD8FaBBhf6W6IG+DV2JpjYtD8NWBnDf4q8AT8HKuxZSHufE2J/zo84u6yir+TbJYHPV93IPT3F3PmRajXR6Cv+gJIcppyosbQJsuf+P8NQEmRfm3aELNFko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P0lNsew9CZa+TTrY7NxMZyTBfYHLLalCKPkfOAbfnh4=; 
	b=RDPuwNt96XP1T5+tXMiwewscOGNxCGb2pquOrEIcHpISOa8B9/UqDiq5q5+2o2Qx3NXs2nb8feHlioZjBY7+EvMS9QuTCmEcEspWBrP1I84Ik/4SHB70nNJOez/bUVU/fe87Pqo2s7DWdpu9G1PkFJw6y2rGmZuIYolHKIqgKXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496313;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=P0lNsew9CZa+TTrY7NxMZyTBfYHLLalCKPkfOAbfnh4=;
	b=PELjnkcNhoWoErNKDlauwSgLrvYdGfFOnl3LfnOLD2gw+G2nA+S0eHuhp3Nl38/e
	kpyZJY+m6O2vsk5evKmZl3ojOEqzrPUJxjohTOlq+M1kBfHkuJ+VgFc9MNZaiAXr2i6
	ESnpLAqIwsRsYPVBvL6B8qPjSvQ3kv0yQSt0Qxjg=
Received: by mx.zohomail.com with SMTPS id 1755496311664689.9369492276834;
	Sun, 17 Aug 2025 22:51:51 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:51 -0300
Subject: [PATCH 5/7] rust: v4l2: add device capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-5-6887e772aac2@collabora.com>
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

All v4l2 devices must expose a given set of capabilities to the v4l2
core and to userspace. Add support for that in v4l2::caps. This will be
used by the next patch in order to add support for VIDIOC_QUERYCAP.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/media/v4l2/caps.rs  | 193 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/media/v4l2/mod.rs   |   2 +
 rust/kernel/media/v4l2/video.rs |   6 +-
 3 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/media/v4l2/caps.rs b/rust/kernel/media/v4l2/caps.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4b0164c58d13e83e728091228fae025dbce59bc8
--- /dev/null
+++ b/rust/kernel/media/v4l2/caps.rs
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+use crate::{prelude::*, str::CStr, types::Opaque};
+use core::cmp::min;
+
+/// A wrapper over `struct v4l2_capability`.
+///
+/// # Invariants
+///
+/// - `self.0` is a valid instance of `struct v4l2_capability`.
+/// - All strings in `struct v4l2_capability` are valid C strings.
+///
+/// TODO: This type would benefit from an #[derive(accessor)] macro to automate
+/// the boilerplate below.
+#[repr(transparent)]
+pub struct Capabilities(Opaque<bindings::v4l2_capability>);
+
+impl Capabilities {
+    /// Returns the raw pointer to the `struct v4l2_capability`.
+    pub fn as_raw(&self) -> *const bindings::v4l2_capability {
+        self.0.get()
+    }
+
+    /// Converts a raw pointer to a `Capabilities` reference.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to a `struct v4l2_capability` that must
+    ///   remain valid for the lifetime 'a.
+    /// - the returned reference must obey Rust's reference rules.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_capability) -> &'a mut Self {
+        // SAFETY: `ptr` is a valid pointer to a `struct v4l2_capability` as per the
+        // safety requirements of this function.
+        unsafe { &mut *(ptr.cast::<Self>()) }
+    }
+
+    fn inner(&self) -> &bindings::v4l2_capability {
+        // SAFETY: safe as per the invariants of `Capabilities`
+        unsafe { &*self.0.get() }
+    }
+
+    fn inner_mut(&mut self) -> &mut bindings::v4l2_capability {
+        // SAFETY: safe as per the invariants of `Capabilities`
+        unsafe { &mut *self.0.get() }
+    }
+
+    /// Returns the `driver` field.
+    pub fn driver(&self) -> &CStr {
+        // SAFETY: safe as per the invariants of `Capabilities`
+        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().driver) }
+    }
+
+    /// Sets the `driver` field.
+    pub fn set_driver(&mut self, name: &CStr) -> Result {
+        if name.len_with_nul() > self.inner().driver.len() {
+            return Err(EINVAL);
+        }
+
+        let cap = self.inner_mut();
+        let src = name.to_bytes_with_nul();
+        let n = min(src.len(), cap.driver.len());
+        cap.driver[..n].copy_from_slice(&src[..n]);
+
+        Ok(())
+    }
+
+    /// Returns the `card` field.
+    pub fn card(&self) -> &CStr {
+        // SAFETY: safe as per the invariants of `Capabilities`
+        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().card) }
+    }
+
+    /// Sets the `card` field.
+    pub fn set_card(&mut self, card: &CStr) -> Result {
+        if card.len_with_nul() > self.inner().card.len() {
+            return Err(EINVAL);
+        }
+
+        let cap = self.inner_mut();
+        let src = card.to_bytes_with_nul();
+        let n = min(src.len(), cap.card.len());
+        cap.card[..n].copy_from_slice(&src[..n]);
+
+        Ok(())
+    }
+
+    /// Returns the `bus_info` field.
+    pub fn bus_info(&self) -> &CStr {
+        // SAFETY: safe as per the invariants of `Capabilities`
+        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().bus_info) }
+    }
+
+    /// Sets the `bus_info` field.
+    pub fn set_bus_info(&mut self, info: &CStr) -> Result {
+        if info.len_with_nul() > self.inner().bus_info.len() {
+            return Err(EINVAL);
+        }
+
+        let cap = self.inner_mut();
+        let src = info.to_bytes_with_nul();
+        let n = min(src.len(), cap.bus_info.len());
+        cap.bus_info[..n].copy_from_slice(&src[..n]);
+
+        Ok(())
+    }
+
+    /// Returns the `version` field.
+    pub fn version(&self) -> u32 {
+        self.inner().version
+    }
+
+    /// Sets the `version` field.
+    pub fn set_version(&mut self, v: u32) {
+        self.inner_mut().version = v;
+    }
+
+    /// Returns the `capabilities` field.
+    pub fn capabilities(&self) -> u32 {
+        self.inner().capabilities
+    }
+
+    /// Sets the `capabilities` field.
+    pub fn set_capabilities(&mut self, caps: u32) {
+        self.inner_mut().capabilities = caps;
+    }
+
+    /// Returns the `device_caps` field.
+    pub fn device_caps(&self) -> Option<DeviceCaps> {
+        if self.inner().device_caps == 0 {
+            None
+        } else {
+            Some(DeviceCaps(self.inner().device_caps))
+        }
+    }
+
+    /// Sets the `device_caps` field.
+    pub fn set_device_caps(&mut self, caps: DeviceCaps) {
+        self.inner_mut().device_caps = caps.as_raw();
+    }
+}
+
+/// Device capabilities.
+///
+/// They can be combined with the operators `|`, `&`, and `!`.
+///
+/// Values can be used from the [`device_caps`] module.
+#[derive(Clone, Copy, PartialEq)]
+pub struct DeviceCaps(u32);
+
+impl DeviceCaps {
+    /// Get the raw representation of the device capabilties.
+    pub(crate) fn as_raw(self) -> u32 {
+        self.0
+    }
+
+    /// Check whether `cap` is contained in `self`.
+    pub fn contains(self, cap: DeviceCaps) -> bool {
+        (self & cap) == cap
+    }
+}
+
+impl core::ops::BitOr for DeviceCaps {
+    type Output = Self;
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl core::ops::BitAnd for DeviceCaps {
+    type Output = Self;
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
+impl core::ops::Not for DeviceCaps {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        Self(!self.0)
+    }
+}
+
+/// Device capabilities.
+pub mod device_caps {
+    use super::DeviceCaps;
+
+    /// The device is a video capture device.
+    pub const VIDEO_CAPTURE: DeviceCaps = DeviceCaps(bindings::V4L2_CAP_VIDEO_CAPTURE);
+
+    /// The device is a video output device.
+    pub const VIDEO_OUTPUT: DeviceCaps = DeviceCaps(bindings::V4L2_CAP_VIDEO_OUTPUT);
+}
diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
index 1195c18f1336891c4b9b194d4e7e5cd40989ace9..1d8241f8a2230954371965bb91b20e726f144dce 100644
--- a/rust/kernel/media/v4l2/mod.rs
+++ b/rust/kernel/media/v4l2/mod.rs
@@ -11,5 +11,7 @@
 /// Support for Video for Linux 2 (V4L2) video devices.
 pub mod video;
 
+/// Support for Video for Linux 2 device capabilities.
+pub mod caps;
 /// Support for Video for Linux 2 (V4L2) file handles.
 pub mod file;
diff --git a/rust/kernel/media/v4l2/video.rs b/rust/kernel/media/v4l2/video.rs
index 7ef2111c32ca55a2bced8325cd883b28204dc3ee..c0ac99a8234d2f7a8effd4701b9f7440236540c8 100644
--- a/rust/kernel/media/v4l2/video.rs
+++ b/rust/kernel/media/v4l2/video.rs
@@ -20,7 +20,7 @@
 use crate::{
     alloc,
     error::to_result,
-    media::v4l2::{self, file::DriverFile, video},
+    media::v4l2::{self, caps::DeviceCaps, file::DriverFile, video},
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
@@ -158,6 +158,9 @@ pub trait Driver: v4l2::device::Driver {
 
     /// The name to use when registering the device node.
     const NAME: &'static CStr;
+
+    /// The capabilities offered by this device node.
+    const CAPS: DeviceCaps;
 }
 
 struct DeviceOptions<'a, T: Driver> {
@@ -180,6 +183,7 @@ fn into_raw(self) -> bindings::video_device {
             vfl_dir: T::DIRECTION as c_uint,
             release: Some(Device::<T>::release_callback),
             fops: super::file::FileVtable::<T::File>::build(),
+            device_caps: T::CAPS.as_raw(),
             // SAFETY: All zeros is valid for the rest of the fields in this C
             // type.
             ..unsafe { MaybeUninit::zeroed().assume_init() }

-- 
2.50.1


