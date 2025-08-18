Return-Path: <linux-media+bounces-40115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB581B29DD6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1BC177F86
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE5E30E0DD;
	Mon, 18 Aug 2025 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZHvCZFN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BB25D527;
	Mon, 18 Aug 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509199; cv=none; b=IYohavx9dZY9yCUmyY6MzRkHNCkiFyrszw3KZmQ24BK3gLpeFAwmPoKk8sYRxW2jPbXpWW0nktvkFTiJ5QiOIJa1/96tDoYCdIqkt40+9pQ4gTFKnVfm3IO9NaD+0H0oyH543u3UFM9BWCvIOKr3qrr0cAe/UY2K/T1j+6QBNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509199; c=relaxed/simple;
	bh=xwaCdGIqBv3ZIaCKo+UTW/RslRxiy5n/C8Mi33WHmJo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=RnG474KFqXmTMjkZotbKi5E7FXAJZhZrYZtaqQzmoIcLyXXzIbO//i4n0IoK7Dk3fBdKQk5tKipSSFoqMDGoQcU84Uv+CaysGDqeth88R3ycK2V6n9u0msA22SMJrBY/Mxj65pBCxAEXtGebcFPUg+fh8l8lWjMlGUtIYC8Rjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZHvCZFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6658C4CEF1;
	Mon, 18 Aug 2025 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755509196;
	bh=xwaCdGIqBv3ZIaCKo+UTW/RslRxiy5n/C8Mi33WHmJo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=mZHvCZFNs0FFE8bEjXjdTQN35k9IBTUhXjpU3XkKtLRtma4AbYpnbKRuDXWRbo6eY
	 sxY9/VZKhOTXuRXZx3iWOfaQh95CKa1B3wSJSDl/0CuVk3jM5/OpQLLT1HpoftRKHl
	 boyqNaTQjFSNVCgI+jphezovgBMpf/pwptgWIri/4MGea9giY57RGHbwn3PxXNRrfW
	 5ofxbdLFvLsMGHP+CeIFxAVyz16k5IWPNT3lAKi1F0XOwS3gTd0FS8gNzTdUYPWJe/
	 vW3qXYyhdMKhZtOHmcM1HlQyviK3n2C56YyMh6/2nz7UHXMzofJoQuEjROgb70pX9a
	 SYHkef0boQPbg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 11:26:32 +0200
Message-Id: <DC5G2LJGBN3D.8JSJY9U25IAW@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/7] rust: v4l2: add support for video device nodes
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <kernel@collabora.com>,
 <linux-media@vger.kernel.org>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-3-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-3-6887e772aac2@collabora.com>

On Mon Aug 18, 2025 at 7:49 AM CEST, Daniel Almeida wrote:
> Video device nodes back the actual /dev/videoX files. They expose a rich
> ioctl interface for which we will soon add support for and allow for
> modelling complex hardware through a topology of nodes, each modelling a
> particular hardware function or component.
>
> V4l2 drivers rely on video device nodes pretty extensively, so add a
> minimal Rust abstraction for them. The abstraction currently does the
> bare-minimum to let users register a V4L2 device node. It also
> introduces the video::Driver trait that will be implemented by Rust v4l2
> drivers. This trait will then be refined in future patches.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/helpers/v4l2-device.c       |  16 +++
>  rust/kernel/media/v4l2/device.rs |   1 -
>  rust/kernel/media/v4l2/mod.rs    |   3 +
>  rust/kernel/media/v4l2/video.rs  | 251 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 270 insertions(+), 1 deletion(-)
>
> diff --git a/rust/helpers/v4l2-device.c b/rust/helpers/v4l2-device.c
> index d19b46e8283ce762b4259e3df5ecf8bb18e863e9..0ead52b9a1ccc0fbc4d7df635=
78b334b17c05b70 100644
> --- a/rust/helpers/v4l2-device.c
> +++ b/rust/helpers/v4l2-device.c
> @@ -6,3 +6,19 @@ void rust_helper_v4l2_device_get(struct v4l2_device *v4l=
2_dev)
>  {
>      v4l2_device_get(v4l2_dev);
>  }
> +
> +void rust_helper_video_get(struct video_device *vdev)
> +{
> +    get_device(&vdev->dev);

Rust helpers shouldn't encode semantics. I think you want to use video_get(=
)
instead.

> +}
> +
> +void rust_helper_video_put(struct video_device *vdev)
> +{
> +    put_device(&vdev->dev);

video_put()

> +/// Represents the registration of a V4L2 device node.
> +pub struct Registration<T: Driver>(ARef<Device<T>>);
> +
> +impl<T: Driver> Registration<T> {
> +    /// Returns a new `Registration` for the given device, which guarant=
ees that
> +    /// the underlying device node is properly initialized and registere=
d, which
> +    /// means that it can be safely used.
> +    pub fn new(
> +        dev: &v4l2::device::Device<T>,
> +        data: impl PinInit<<T as Driver>::Data, Error>,
> +        flags: alloc::Flags,
> +    ) -> Result<Self> {

Same comment regarding Device having its own constructor as for
v4l::device::Registration. I don't see a reason why Registration::new() sho=
uld
serve as constructor for Device.

Additionally, I think we should use devres::register() for the Registration=
, such
that you can provide &Device<Bound> cookies in the video callbacks / ioctls=
.

As far as I can see, video devices are synchronized when unregistered [1]
-- let's take advantage of that.

We do the same thing in the PWM abstractions [2], which is a great optimiza=
tion.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/media/v4l2-core/v4l2-dev.c?h=3Dv6.16#n1105
[2] https://lore.kernel.org/linux-pwm/20250806-rust-next-pwm-working-fan-fo=
r-sending-v13-3-690b669295b6@samsung.com/

> +        let video_dev =3D try_pin_init!(Device {
> +            inner <- Opaque::try_ffi_init(move |slot: *mut bindings::vid=
eo_device| {
> +                let opts: DeviceOptions<'_, T> =3D DeviceOptions {
> +                    dev,
> +                    _phantom: PhantomData
> +                };
> +
> +                // SAFETY: `DeviceOptions::into_raw` produces a valid
> +                // `bindings::video_device` that is ready for registrati=
on.
> +                unsafe { slot.write(opts.into_raw()) };
> +
> +
> +                // SAFETY: It is OK to call this function on a zeroed
> +                // `video_device` and a valid `v4l2::Device` reference.
> +                to_result(unsafe { bindings::video_register_device(slot,=
 T::NODE_TYPE as c_uint, -1) })
> +            }),
> +            data <- data,
> +        });
> +
> +        let video_dev =3D KBox::pin_init(video_dev, flags)?;
> +
> +        // SAFETY: We will be passing the ownership to ARef<T>, which tr=
eats the
> +        // underlying memory as pinned throughout its lifetime.
> +        //
> +        // This is true because:
> +        //
> +        // - ARef<T> does not expose a &mut T, so there is no way to mov=
e the T
> +        // (e.g.: via a `core::mem::swap` or similar).
> +        // - ARef<T>'s member functions do not move the T either.
> +        let ptr =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(vi=
deo_dev) });
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
> +    /// Returns a reference to the underlying video device.
> +    pub fn device(&self) -> &video::Device<T> {
> +        &self.0
> +    }
> +}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: `self.0` is a valid `video_device` that was registere=
d in
> +        // [`Registration::new`].
> +        unsafe { bindings::video_unregister_device(self.0.as_raw()) };
> +    }
> +}
>
> --=20
> 2.50.1


