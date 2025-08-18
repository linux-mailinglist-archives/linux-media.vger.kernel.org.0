Return-Path: <linux-media+bounces-40113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD2B29D61
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0BE17E79F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B69330DD32;
	Mon, 18 Aug 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnYVEOiO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B6302CB9;
	Mon, 18 Aug 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508447; cv=none; b=TrPDCyYqrBvcDfN/LN/TcYiaBYudP4sfVN+ahxVEOnhH8hZavG2KY6PUZFUnNPZrgGkTrSqQ2RDo5FCJLSQtP9cgvP99kzZZjqU+D8nCaeOe+8bfs6fUy95gXz2+OacyWIZ+ZITuNqB7a4+yPKmHOlRUhHe+k911g1sME3kU2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508447; c=relaxed/simple;
	bh=JAPc9uyIRalo+ADWFrsMcLG/NhCXBlPWfWD8cLyQzFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=L4CQWoeURdahNukI7nKU6UIFyPRWU6H4HzqougXT93BdbDI8xEkvuH54N1EAmsk9saDDoo4+mFbzYFPCoNr1CHpFwsplzvklxyM+RG0D1xVA8ybXqT6duWVcJ6RIdWcSulktaRfDndoJiNYqRoU3zAmvSRhROaooMXmhXTP1WHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnYVEOiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347CCC4CEED;
	Mon, 18 Aug 2025 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755508447;
	bh=JAPc9uyIRalo+ADWFrsMcLG/NhCXBlPWfWD8cLyQzFU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=CnYVEOiOya6CbXD/prfTWqb6blgEaNy7nK8xZqMNT9W24TBzZnwyvjt061SS8JHe1
	 i66rVhsQgn0lsCI+3Cy/M33tYNNCAOUINAiaArYGtOhHLjQ7i5K5CS5xKUFZQrkCFi
	 c3t5FdaE4SVToMZXkYECkOV/BvfwqOghJoQA1yRqCnNvYDaev8BD28u7HGj+uWkz/x
	 H7DNbNkGSmlpL+PMhsSJX79x4EdfgyrUXNssDS3DuJjjmP6OmVvZA06xp+7jUTHcRG
	 09dWTXMyy1lyQQOb/wGcmdvXqE5s+F8LimY8WCzDFrDyRaBGXeTgo2bC61/VCvL9QZ
	 doA1sI6SbqIMg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 11:14:02 +0200
Message-Id: <DC5FT0XAFW59.VN0EKI1LYNKW@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/7] rust: v4l2: add support for v4l2_device
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <kernel@collabora.com>,
 <linux-media@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-2-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-2-6887e772aac2@collabora.com>

On Mon Aug 18, 2025 at 7:49 AM CEST, Daniel Almeida wrote:
> +/// A logical V4L2 device handle.
> +///
> +/// # Invariants
> +///
> +/// - `inner` points to a valid `v4l2_device` that has been registered.
> +#[pin_data]
> +#[repr(C)]
> +pub struct Device<T: Driver> {
> +    #[pin]
> +    inner: Opaque<bindings::v4l2_device>,
> +    #[pin]
> +    data: T::Data,
> +}
> +
> +impl<T: Driver> Device<T> {
> +    /// Converts a raw pointer to a `Device<T>` reference.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to a `struct v4l2_device` that m=
ust
> +    ///   remain valid for the lifetime 'a.

"valid pointer to a `struct v4l2_device`" is not sufficient for casting it =
to
Device<T>.

> +    #[expect(dead_code)]
> +    pub(super) unsafe fn from_raw<'a>(ptr: *mut bindings::v4l2_device) -=
> &'a Device<T> {
> +        // SAFETY: `ptr` is a valid pointer to a `struct v4l2_device` as=
 per the
> +        // safety requirements of this function.
> +        unsafe { &*(ptr.cast::<Device<T>>()) }
> +    }

<snip>

> +/// Represents the registration of a [`Device`].
> +///
> +/// # Invariants
> +///
> +/// - The underlying device was registered via [`bindings::v4l2_device_r=
egister`].
> +pub struct Registration<T: Driver>(ARef<Device<T>>);
> +
> +impl<T: Driver> Registration<T> {
> +    /// Creates and registers a [`Device`] given a [`kernel::device::Dev=
ice`] reference and
> +    /// the associated data.
> +    pub fn new(
> +        dev: &device::Device,
> +        data: impl PinInit<T::Data, Error>,
> +        flags: alloc::Flags,
> +    ) -> Result<Self> {

Why does Registration::new() create the Device<T> instance?

I think Device<T> should have its own constructor. It is confusing that the
Device<T> is silently created by the Registration and to get a reference on=
e has
to call `reg.device().into()` afterwards.

> +        let v4l2_dev =3D try_pin_init!(Device {
> +            inner <- Opaque::try_ffi_init(move |slot: *mut bindings::v4l=
2_device| {
> +                let v4l2_dev =3D bindings::v4l2_device {
> +                    release: Some(Device::<T>::release_callback),
> +                    // SAFETY: All zeros is valid for this C type.
> +                    ..unsafe { MaybeUninit::zeroed().assume_init() }
> +                };
> +
> +                // SAFETY: The initializer can write to the slot.
> +                unsafe { slot.write(v4l2_dev) };
> +
> +                // SAFETY: It is OK to call this function on a zeroed
> +                // v4l2_device and a valid `device::Device` reference.
> +                to_result(unsafe { bindings::v4l2_device_register(dev.as=
_raw(), slot) })
> +            }),
> +            data <- data,
> +        });
> +
> +        let v4l2_dev =3D KBox::pin_init(v4l2_dev, flags)?;
> +
> +        // SAFETY: We will be passing the ownership of the increment to =
ARef<T>,
> +        // which treats the underlying memory as pinned throughout its l=
ifetime.
> +        //
> +        // This is true because:
> +        //
> +        // - ARef<T> does not expose a &mut T, so there is no way to mov=
e the T
> +        // (e.g.: via a `core::mem::swap` or similar).
> +        // - ARef<T>'s member functions do not move the T either.
> +        let ptr =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(v4=
l2_dev) });
> +
> +        // SAFETY:
> +        //
> +        // - the refcount is one, and we are transfering the ownership o=
f that
> +        // increment to the ARef.
> +        // - `ptr` is non-null as it came from `KBox::into_raw`, so it i=
s safe
> +        // to call `NonNulll::new_unchecked`.
> +        Ok(Self(unsafe { ARef::from_raw(NonNull::new_unchecked(ptr)) }))
> +    }
> +
> +    /// Returns a reference to the underlying [`Device`].
> +    pub fn device(&self) -> &Device<T> {
> +        &self.0
> +    }
> +}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as per the invariants of [`Registration`].
> +        unsafe { bindings::v4l2_device_unregister(self.0.as_raw()) }
> +    }
> +}

