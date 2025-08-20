Return-Path: <linux-media+bounces-40332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C026DB2D2E7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 06:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C21131C22C5D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBFE24293B;
	Wed, 20 Aug 2025 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="deC3mSIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D942A8C;
	Wed, 20 Aug 2025 04:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755663431; cv=none; b=nbuxO0MK09j2gHhVxEw21JKGSAsLRobkcPjHTV7bxN3wCew+J0q7BDuYb38SLeg9FYv2jq9+n/Rayw2gP5UPqtjl+LVXtuRSFGg2ibsSxt5GUN3HUftwgvFV6V4nDYn6Dfh+GyzHJ6KTRwu0T0zkJk56yfxqBnZ3b4CdUCQHUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755663431; c=relaxed/simple;
	bh=JIH47MdqPvT9I9EEq+FwIgb0VXneBD7CEQavuMrQeDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM+GU4ta9hYYfSFqFWJe2ETlCH2m3m/QsSmjd77+dSiMo87QL+9r9qTo7Rzx6E4tAh1Hqi/OHBawxMMfxX+0aymXLrR4cKqcztIZYouRB+HdvyfqlV0JM8MDPomzEnUDpbdQwZ4mUvoY6gCRU1XXGJFKsY3/YlJRjdu/A6n+NUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=deC3mSIO; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755663425; x=1755922625;
	bh=zBrxqwoHz+wPqifOnreinrV4oT0KPaen2rp6avZbmhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=deC3mSIOLMUh/iiTOUkS04wh9+p7qcuDqwh5Sif/SR5zE0dUHOdMvkBTFx3T5M3uD
	 ajPlA5nbMXj/CYacWRBX0t+TezrwuLglL0hU/3QW4zBOvuG8el1ArpPweuY52za8Ac
	 izmXDZDADoaZfGUsFjPcyZXmbqzxmwKmnvDJP754NjOTFBMttwa5tJw5jx4kwIenYJ
	 YnfAtKwTqRXMmR/GbhbxRtJ8d/nAwFlGU8LqPG4LN114Nb8KQAjgUUUqeZctrFpzyg
	 JkzzZFKjGUSQKcTPFiv1C/sAh6jZNhuH8HnDBl9q4cxifiFkfGr5QLryJ2a1CV90j9
	 ejfeeSxnyyjqg==
X-Pm-Submission-Id: 4c6Cp66l3kz2ScPM
Date: Wed, 20 Aug 2025 04:14:59 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	kernel@collabora.com, linux-media@vger.kernel.org
Subject: Re: [PATCH 5/7] rust: v4l2: add device capabilities
Message-ID: <aKVLw_ouLWezuWJF@archiso>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-5-6887e772aac2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-v4l2-v1-5-6887e772aac2@collabora.com>

On Mon, Aug 18, 2025 at 02:49:51AM -0300, Daniel Almeida wrote:
> All v4l2 devices must expose a given set of capabilities to the v4l2
> core and to userspace. Add support for that in v4l2::caps. This will be
> used by the next patch in order to add support for VIDIOC_QUERYCAP.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/media/v4l2/caps.rs  | 193 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/media/v4l2/mod.rs   |   2 +
>  rust/kernel/media/v4l2/video.rs |   6 +-
>  3 files changed, 200 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/media/v4l2/caps.rs b/rust/kernel/media/v4l2/caps.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b0164c58d13e83e728091228fae025dbce59bc8
> --- /dev/null
> +++ b/rust/kernel/media/v4l2/caps.rs
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +use crate::{prelude::*, str::CStr, types::Opaque};
> +use core::cmp::min;
> +
> +/// A wrapper over `struct v4l2_capability`.
> +///
> +/// # Invariants
> +///
> +/// - `self.0` is a valid instance of `struct v4l2_capability`.
> +/// - All strings in `struct v4l2_capability` are valid C strings.
> +///
> +/// TODO: This type would benefit from an #[derive(accessor)] macro to automate
> +/// the boilerplate below.
> +#[repr(transparent)]
> +pub struct Capabilities(Opaque<bindings::v4l2_capability>);
> +
> +impl Capabilities {
> +    /// Returns the raw pointer to the `struct v4l2_capability`.
> +    pub fn as_raw(&self) -> *const bindings::v4l2_capability {
> +        self.0.get()
> +    }
> +
> +    /// Converts a raw pointer to a `Capabilities` reference.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to a `struct v4l2_capability` that must
> +    ///   remain valid for the lifetime 'a.
> +    /// - the returned reference must obey Rust's reference rules.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_capability) -> &'a mut Self {
> +        // SAFETY: `ptr` is a valid pointer to a `struct v4l2_capability` as per the
> +        // safety requirements of this function.
> +        unsafe { &mut *(ptr.cast::<Self>()) }
> +    }
> +
> +    fn inner(&self) -> &bindings::v4l2_capability {
> +        // SAFETY: safe as per the invariants of `Capabilities`
> +        unsafe { &*self.0.get() }
> +    }
> +
> +    fn inner_mut(&mut self) -> &mut bindings::v4l2_capability {
> +        // SAFETY: safe as per the invariants of `Capabilities`
> +        unsafe { &mut *self.0.get() }
> +    }
> +
> +    /// Returns the `driver` field.
> +    pub fn driver(&self) -> &CStr {
> +        // SAFETY: safe as per the invariants of `Capabilities`
> +        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().driver) }
> +    }
> +
> +    /// Sets the `driver` field.
> +    pub fn set_driver(&mut self, name: &CStr) -> Result {
> +        if name.len_with_nul() > self.inner().driver.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        let cap = self.inner_mut();
> +        let src = name.to_bytes_with_nul();
> +        let n = min(src.len(), cap.driver.len());
> +        cap.driver[..n].copy_from_slice(&src[..n]);
> +
> +        Ok(())
> +    }
> +
> +    /// Returns the `card` field.
> +    pub fn card(&self) -> &CStr {
> +        // SAFETY: safe as per the invariants of `Capabilities`
> +        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().card) }
> +    }
> +
> +    /// Sets the `card` field.
> +    pub fn set_card(&mut self, card: &CStr) -> Result {
> +        if card.len_with_nul() > self.inner().card.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        let cap = self.inner_mut();
> +        let src = card.to_bytes_with_nul();
> +        let n = min(src.len(), cap.card.len());
> +        cap.card[..n].copy_from_slice(&src[..n]);
> +
> +        Ok(())
> +    }
> +
> +    /// Returns the `bus_info` field.
> +    pub fn bus_info(&self) -> &CStr {
> +        // SAFETY: safe as per the invariants of `Capabilities`
> +        unsafe { CStr::from_bytes_with_nul_unchecked(&self.inner().bus_info) }
> +    }
> +
> +    /// Sets the `bus_info` field.
> +    pub fn set_bus_info(&mut self, info: &CStr) -> Result {
> +        if info.len_with_nul() > self.inner().bus_info.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        let cap = self.inner_mut();
> +        let src = info.to_bytes_with_nul();
> +        let n = min(src.len(), cap.bus_info.len());
> +        cap.bus_info[..n].copy_from_slice(&src[..n]);
> +
> +        Ok(())
> +    }
> +
> +    /// Returns the `version` field.
> +    pub fn version(&self) -> u32 {
> +        self.inner().version
> +    }
> +
> +    /// Sets the `version` field.
> +    pub fn set_version(&mut self, v: u32) {
> +        self.inner_mut().version = v;
> +    }
> +
> +    /// Returns the `capabilities` field.
> +    pub fn capabilities(&self) -> u32 {
> +        self.inner().capabilities
> +    }
> +
> +    /// Sets the `capabilities` field.
> +    pub fn set_capabilities(&mut self, caps: u32) {
> +        self.inner_mut().capabilities = caps;
> +    }
> +
> +    /// Returns the `device_caps` field.
> +    pub fn device_caps(&self) -> Option<DeviceCaps> {
> +        if self.inner().device_caps == 0 {
> +            None
> +        } else {
> +            Some(DeviceCaps(self.inner().device_caps))
> +        }
> +    }
> +
> +    /// Sets the `device_caps` field.
> +    pub fn set_device_caps(&mut self, caps: DeviceCaps) {
> +        self.inner_mut().device_caps = caps.as_raw();
> +    }
> +}
> +
> +/// Device capabilities.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`device_caps`] module.
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct DeviceCaps(u32);
> +
> +impl DeviceCaps {
> +    /// Get the raw representation of the device capabilties.
> +    pub(crate) fn as_raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Check whether `cap` is contained in `self`.
> +    pub fn contains(self, cap: DeviceCaps) -> bool {
> +        (self & cap) == cap
> +    }
> +}
> +
> +impl core::ops::BitOr for DeviceCaps {
> +    type Output = Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for DeviceCaps {
> +    type Output = Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for DeviceCaps {
> +    type Output = Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// Device capabilities.
> +pub mod device_caps {
> +    use super::DeviceCaps;
> +
> +    /// The device is a video capture device.
> +    pub const VIDEO_CAPTURE: DeviceCaps = DeviceCaps(bindings::V4L2_CAP_VIDEO_CAPTURE);
> +
> +    /// The device is a video output device.
> +    pub const VIDEO_OUTPUT: DeviceCaps = DeviceCaps(bindings::V4L2_CAP_VIDEO_OUTPUT);
> +}

These can probably be implemented as associated constants:

```rust
impl DeviceCaps {
    pub const VIDEO_CAPTURE: Self = Self(bindings::V4L2_CAP_VIDEO_CAPTURE);
    pub const VIDEO_OUTPUT: Self = Self(bindings::V4L2_CAP_VIDEO_OUTPUT);
```

That would allow for a slightly more ergonomic usage:

```rust
let _ = DeviceCaps::VIDEO_CAPTURE;
```

> diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
> index 1195c18f1336891c4b9b194d4e7e5cd40989ace9..1d8241f8a2230954371965bb91b20e726f144dce 100644
> --- a/rust/kernel/media/v4l2/mod.rs
> +++ b/rust/kernel/media/v4l2/mod.rs
> @@ -11,5 +11,7 @@
>  /// Support for Video for Linux 2 (V4L2) video devices.
>  pub mod video;
>  
> +/// Support for Video for Linux 2 device capabilities.
> +pub mod caps;
>  /// Support for Video for Linux 2 (V4L2) file handles.
>  pub mod file;
> diff --git a/rust/kernel/media/v4l2/video.rs b/rust/kernel/media/v4l2/video.rs
> index 7ef2111c32ca55a2bced8325cd883b28204dc3ee..c0ac99a8234d2f7a8effd4701b9f7440236540c8 100644
> --- a/rust/kernel/media/v4l2/video.rs
> +++ b/rust/kernel/media/v4l2/video.rs
> @@ -20,7 +20,7 @@
>  use crate::{
>      alloc,
>      error::to_result,
> -    media::v4l2::{self, file::DriverFile, video},
> +    media::v4l2::{self, caps::DeviceCaps, file::DriverFile, video},
>      prelude::*,
>      types::{ARef, AlwaysRefCounted, Opaque},
>  };
> @@ -158,6 +158,9 @@ pub trait Driver: v4l2::device::Driver {
>  
>      /// The name to use when registering the device node.
>      const NAME: &'static CStr;
> +
> +    /// The capabilities offered by this device node.
> +    const CAPS: DeviceCaps;
>  }
>  
>  struct DeviceOptions<'a, T: Driver> {
> @@ -180,6 +183,7 @@ fn into_raw(self) -> bindings::video_device {
>              vfl_dir: T::DIRECTION as c_uint,
>              release: Some(Device::<T>::release_callback),
>              fops: super::file::FileVtable::<T::File>::build(),
> +            device_caps: T::CAPS.as_raw(),
>              // SAFETY: All zeros is valid for the rest of the fields in this C
>              // type.
>              ..unsafe { MaybeUninit::zeroed().assume_init() }
> 
> -- 
> 2.50.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

