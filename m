Return-Path: <linux-media+bounces-40333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9CB2D2EA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 06:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090B72A8851
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35B323E33D;
	Wed, 20 Aug 2025 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="ds/ef7GW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271D24A047
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 04:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755663775; cv=none; b=pjLFcZyelr3PhVy5sChgEJyBQMS3G1CFxizlQXstvF+imLg5Ds2VSMSz9WP5zR8ICN88mMLlBRzMKNXj289e5S1FLQ8Z5V8FUzGwwqRe+3bHbvU/eGdqIzo8LcVtGsc5igkahrhQpmHNzokUht4M+r/OsxYy0G0eKOixxA2PlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755663775; c=relaxed/simple;
	bh=POKrwrXMUFGbyMgq6x00LUl9LtKZOLm12oosPS0CXn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqFal8YVqeoLuvaOZc5FQTOsKDG9zt7JWS4mstHM+zS8LZnRuZEqzsNhZfV77Di+/PSUblAdeilrDkVWs0DM/A5mQQjHkLX/RaqYGb4gR+ZX79C0CIQhunQZBYUC+ea3+6EYbqXLRJrdgx7/U/dZLsDv3owRrPJdb09W6PYCprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=ds/ef7GW; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755663756; x=1755922956;
	bh=hrRdoxvoknyaJIODsfEwrN/7kQbq3dgh98L2KyJklXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ds/ef7GWMVdZAyvEkcFAOoezcFwimBYjF1DV5/c7CVqJng2qe+mHiXmV27Kym3NdZ
	 eXrkNmpUsnlE9iQoDYHW7yEs+pWZ1o93urVUynlFosp8PNRIaIB7COGm80Y+1qnVoU
	 XiI/KHzTsgGwWxLCK1Vu2mOuSkjnw1vjbzZJgUcF5UMIzgeAonDkBxLmOScrta1lNL
	 S+p6jqi3PyIicxO5alBSMVwNWooKvq5VtuA8hmdgeT7R5tel/JOjjja4EgfOjrdNhn
	 gESGfVplwj19p9OZKhOPePbY17ODfgLL7QKthGTAeCvv19MNyoa2tEYhj/purnfNBf
	 Q9vesOZ1VZSDg==
X-Pm-Submission-Id: 4c6CwV17lFz1DDs1
Date: Wed, 20 Aug 2025 04:22:31 +0000
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
Subject: Re: [PATCH 6/7] rust: v4l2: add basic ioctl support
Message-ID: <aKVNh8HRe5ADbiSZ@archiso>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-6-6887e772aac2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-v4l2-v1-6-6887e772aac2@collabora.com>

On Mon, Aug 18, 2025 at 02:49:52AM -0300, Daniel Almeida wrote:
> Most of the v4l2 API is implemented through ioctl(), so adding support
> for them is essential in order to be able to write v4l2 drivers.
> 
> Hook up ioctl support by filling up an instance of v4l2_ioctl_ops. For
> now, we only support the most basic v4l2 ioctl: VIDIOC_QUERYCAPS. This
> is used by userspace to retrieve information about the device, and is
> considered enough to implement a simple v4l2 sample Rust driver.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/media/v4l2/file.rs  |  1 -
>  rust/kernel/media/v4l2/ioctl.rs | 92 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/media/v4l2/mod.rs   |  3 ++
>  rust/kernel/media/v4l2/video.rs | 13 +++++-
>  4 files changed, 107 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/media/v4l2/file.rs b/rust/kernel/media/v4l2/file.rs
> index 37b34f8e6f251fafde5f7e6b4bd654519d8247a5..8817051268323866f41fd56a0c7e8fa4b7537858 100644
> --- a/rust/kernel/media/v4l2/file.rs
> +++ b/rust/kernel/media/v4l2/file.rs
> @@ -50,7 +50,6 @@ impl<T: DriverFile> File<T> {
>      ///
>      /// - `ptr` must be a valid pointer to a `struct v4l2_file`.
>      /// - `ptr` must be valid for 'a.
> -    #[expect(dead_code)]
>      pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_fh) -> &'a File<T> {
>          // SAFETY: `ptr` is a valid pointer to a `struct v4l2_file` as per the
>          // safety requirements of this function.
> diff --git a/rust/kernel/media/v4l2/ioctl.rs b/rust/kernel/media/v4l2/ioctl.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8d20d4cb70f5722c0109ea5bad36041355fc7a1
> --- /dev/null
> +++ b/rust/kernel/media/v4l2/ioctl.rs
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +//! V4L2 device node ioctl support.
> +//!
> +//! Most of the V4L2 API is implemented through the ioctl system call. This
> +//! module provides support for ioctl operations on V4L2 device nodes.
> +
> +use core::{marker::PhantomData, mem::MaybeUninit};
> +
> +use crate::{
> +    media::v4l2::{
> +        self,
> +        video::{self, Driver},
> +    },
> +    prelude::*,
> +};
> +
> +/// The vtable for the ioctls of a registered Rust [`video::Device`].
> +///
> +/// # Invariants
> +///
> +/// - All the callbacks in [`IoctlVtable`] are called after the underlying
> +///   [`video::Device`] has been registered.
> +pub(super) struct IoctlVtable<T: Driver>(PhantomData<T>);
> +
> +impl<T: Driver> IoctlVtable<T> {
> +    /// # Safety
> +    ///
> +    /// This should only be called from the ioctl callbacks and the returned
> +    /// reference should not outlive the callback itself.
> +    unsafe fn data<'a>(file: *mut bindings::file) -> &'a <T as Driver>::Data
> +    where
> +        T: 'a,
> +    {
> +        // SAFETY: This was set during the video device registration process.
> +        let vdev = unsafe { bindings::video_devdata(file) };
> +
> +        // SAFETY: `video_device` is a valid pointer to a `struct video_device`
> +        // returned by `bindings::video_devdata` and it is valid while the
> +        // reference is alive.
> +        unsafe { video::Device::<T>::from_raw(vdev) }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// This should only be used as the `videoc_querycap` callback.
> +    unsafe extern "C" fn vidioc_querycap_callback(
> +        file: *mut bindings::file,
> +        _fh: *mut c_void,
> +        cap: *mut bindings::v4l2_capability,
> +    ) -> core::ffi::c_int {
> +        // SAFETY: this is being called from an ioctl callback and the returned
> +        // reference does not outlive it.
> +        let data = unsafe { Self::data(file) };
> +
> +        // SAFETY: the fact that this is being called from an ioctl callback means that:
> +        //
> +        // - the video device has been registered.
> +        // - `open()` has been called (as you cannot call ioctl() on a file that
> +        // has not been previously opened).
> +        // - as a result from the statement above, a valid `v4l2_fh` was
> +        // installed in `bindings::file::private_data`, which we then convert
> +        // into `File<T>` here.
> +        // - `ptr` is valid for 'a, i.e.: for the scope of this function.
> +        let file = unsafe { v4l2::file::File::<T::File>::from_raw((*file).private_data.cast()) };
> +
> +        // SAFETY: the safety requirements ensure that `cap` is a valid pointer
> +        // to a `struct v4l2_capability`, which fulfills the requirements of the
> +        // `Capabilities::from_raw`.
> +        let cap = unsafe { v4l2::caps::Capabilities::from_raw(cap) };
> +
> +        match T::querycap(file, data, cap) {
> +            Ok(()) => 0,
> +            Err(err) => err.to_errno(),
> +        }
> +    }
> +
> +    const VTABLE: bindings::v4l2_ioctl_ops = bindings::v4l2_ioctl_ops {
> +        vidioc_querycap: if T::HAS_QUERYCAP {
> +            Some(Self::vidioc_querycap_callback)
> +        } else {
> +            None
> +        },
> +        // SAFETY: All zeros is a valid value for `bindings::v4l2_ioctl_ops`.
> +        ..unsafe { MaybeUninit::zeroed().assume_init() }
> +    };
> +
> +    pub(super) const fn build() -> &'static bindings::v4l2_ioctl_ops {
> +        &Self::VTABLE
> +    }
> +}
> diff --git a/rust/kernel/media/v4l2/mod.rs b/rust/kernel/media/v4l2/mod.rs
> index 1d8241f8a2230954371965bb91b20e726f144dce..4caa9fdc1ff3ed2bd6145cc653b49a84873ecac2 100644
> --- a/rust/kernel/media/v4l2/mod.rs
> +++ b/rust/kernel/media/v4l2/mod.rs
> @@ -15,3 +15,6 @@
>  pub mod caps;
>  /// Support for Video for Linux 2 (V4L2) file handles.
>  pub mod file;
> +
> +/// Support for Video for Linux 2 (V4L2) ioctls.
> +pub mod ioctl;
> diff --git a/rust/kernel/media/v4l2/video.rs b/rust/kernel/media/v4l2/video.rs
> index c0ac99a8234d2f7a8effd4701b9f7440236540c8..2390a93a39925dbff3f809bc65adfac1d881309c 100644
> --- a/rust/kernel/media/v4l2/video.rs
> +++ b/rust/kernel/media/v4l2/video.rs
> @@ -19,7 +19,7 @@
>  
>  use crate::{
>      alloc,
> -    error::to_result,
> +    error::{to_result, VTABLE_DEFAULT_ERROR},
>      media::v4l2::{self, caps::DeviceCaps, file::DriverFile, video},
>      prelude::*,
>      types::{ARef, AlwaysRefCounted, Opaque},
> @@ -143,6 +143,7 @@ unsafe impl<T: Driver> Sync for Device<T> {}
>  
>  /// The interface that must be implemented by structs that would otherwise embed
>  /// a C [`struct video_device`](srctree/include/media/v4l2-dev.h).
> +#[vtable]
>  pub trait Driver: v4l2::device::Driver {
>      /// The type of the driver's private data.
>      type Data;
> @@ -161,6 +162,15 @@ pub trait Driver: v4l2::device::Driver {
>  
>      /// The capabilities offered by this device node.
>      const CAPS: DeviceCaps;
> +
> +    /// Driver implementation for the `querycap` ioctl.
> +    fn querycap(
> +        _file: &v4l2::file::File<<Self as Driver>::File>,
> +        _data: &<Self as Driver>::Data,
> +        _cap: &mut v4l2::caps::Capabilities,
> +    ) -> Result {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
>  }
>  
>  struct DeviceOptions<'a, T: Driver> {
> @@ -184,6 +194,7 @@ fn into_raw(self) -> bindings::video_device {
>              release: Some(Device::<T>::release_callback),
>              fops: super::file::FileVtable::<T::File>::build(),
>              device_caps: T::CAPS.as_raw(),
> +            ioctl_ops: super::ioctl::IoctlVtable::<T>::build(),
>              // SAFETY: All zeros is valid for the rest of the fields in this C
>              // type.
>              ..unsafe { MaybeUninit::zeroed().assume_init() }
> 
> -- 
> 2.50.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

