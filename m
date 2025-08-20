Return-Path: <linux-media+bounces-40334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53AB2D2EE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 06:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238041C28314
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23929243367;
	Wed, 20 Aug 2025 04:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="lY2GCTmk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9623E32B
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755663897; cv=none; b=gB+7PjcxqwWNj9FaMcP7dYpBHK0j/BjubKsSUoPwxr1kyI0GcQFXmN/Zu918t8tuB0JmoHr73fHqbGvviEYtQODbDc7AQpo34EeW0hxB4Dx57/cOR+CI2FGTCCv3aMw2fSSWoOmcKK/Gw0BhqKfSgAy9z3fgULfsIeSx+tJS37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755663897; c=relaxed/simple;
	bh=86INfeqOfumVZ1BamH5eEpxeWtBAse6F5jxR+VSqTKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpWy93R4iyd6/3otHJa6qdkJ88RI5vB5OXfs6r+DOkeA0JYU5PkAZ+Q+E8jKyrEilzCr1RZm5S6GY1wUSqhfMVZFgCIpooqs66dCVQenEiJ723VCT20P3v/wX/0JSuwId89JpQlNEALUfKo6rnWOulhureSfo6CW+TKbKPMZ5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=lY2GCTmk; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755663892; x=1755923092;
	bh=kKgqwZvsNzF2JctvkwujV6LyTG531m1YAQmuNypBdos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lY2GCTmknx+UB3Ztg5WpZwoXyn8WZChzrFFy428DfD1UwTql5KDlUxK/SG3I95ECI
	 ajdzy/Fh79hGBmjcS9S4FtxBmHLk988OTaDlb9DKksK/PhdxOKTCZh0Uy/QEsqbGSn
	 VZdhn+fM8WjngXkS2ba7Sfhg8zhveoVkX8Pxn01fv0ah+vc5zJNaWbW+QQOLx7O8LW
	 MK85lAKqbiQX4yDtW3CCbsE1D7JAMRCBeGTn5zOGVkLwmOoP2vui81h2oh6kxAVMvm
	 OoSrjDjCrhLUryB+zY2Cs/IsoILRE+AcmrHhSZcM6Aidq5HNlZdZGrFGkYXGb52FCA
	 ocLgFA49dQWrA==
X-Pm-Submission-Id: 4c6Cz659Tdz2ScCj
Date: Wed, 20 Aug 2025 04:24:47 +0000
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
Subject: Re: [PATCH 7/7] rust: samples: add the v4l2 sample driver
Message-ID: <aKVOD-N1lEeHVjQs@archiso>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
 <20250818-v4l2-v1-7-6887e772aac2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-v4l2-v1-7-6887e772aac2@collabora.com>

On Mon, Aug 18, 2025 at 02:49:53AM -0300, Daniel Almeida wrote:
> This driver is the only user of the v4l2 abstractions at the moment. It
> serves as a means to validate the abstractions by proving that the
> device is actually registered as /dev/videoX, and it can be opened and
> queried by v4l2-ctl, while also serving as a display of the current v4l2
> support in Rust, as well as a blueprint for more elaborate Rust v4l2
> drivers in the future.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  MAINTAINERS                      |   1 +
>  samples/rust/Kconfig             |  11 +++
>  samples/rust/Makefile            |   1 +
>  samples/rust/rust_driver_v4l2.rs | 145 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 158 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6fc5d57950e474d73d5d65271a0394efc5a8960b..14521bc0585503992da582f2cee361666985e39f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15440,6 +15440,7 @@ L:	linux-media@vger.kernel.org
>  L:	rust-for-linux@vger.kernel.org
>  S:	Supported
>  F:	rust/media
> +F:	sample/rust/rust_driver_v4l2.rs
>  
>  MEDIATEK BLUETOOTH DRIVER
>  M:	Sean Wang <sean.wang@mediatek.com>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 7f7371a004ee0a8f67dca99c836596709a70c4fa..64422acf1e9da9d05f904e14fd423b3b4aef173a 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -105,6 +105,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
>  
>  	  If unsure, say N.
>  
> +config SAMPLE_RUST_DRIVER_V4L2
> +	tristate "Video4Linux2 driver"
> +	depends on MEDIA_SUPPORT && VIDEO_DEV
> +	help
> +	  This option builds the Rust V4L2 driver sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_driver_v4l2.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  	bool "Host programs"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index bd2faad63b4f3befe7d1ed5139fe25c7a8b6d7f6..57e21f0373938bb70b4cb400ea550010895b4c94 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
> +obj-$(CONFIG_SAMPLE_RUST_DRIVER_V4L2)		+= rust_driver_v4l2.o
>  obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
>  
>  rust_print-y := rust_print_main.o rust_print_events.o
> diff --git a/samples/rust/rust_driver_v4l2.rs b/samples/rust/rust_driver_v4l2.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3ef98a613f2fed9e8589f0761ce7e43029c02b6
> --- /dev/null
> +++ b/samples/rust/rust_driver_v4l2.rs
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +//! Rust V4L2 sample driver.
> +//!
> +//! This sample demonstrates how to:
> +//! - Register a V4L2 device (struct v4l2_device),
> +//! - Register a video node (struct video_device) using the Rust V4L2
> +//!   abstractions,
> +//! - Implement support for a V4L2 ioctl in a driver.
> +//!
> +//! It implements only `VIDIOC_QUERYCAP` and minimal open/close handling.
> +
> +use kernel::{
> +    c_str,
> +    device::Core,
> +    media::v4l2::{
> +        self,
> +        caps::{self, DeviceCaps},
> +        video,
> +    },
> +    of, platform,
> +    prelude::*,
> +    types::ARef,
> +    ThisModule,
> +};
> +
> +/// The private data associated with the V4L2 device.
> +#[pin_data]
> +struct Data {}
> +
> +/// The private data associated with a V4L2 device node, i.e. `struct
> +/// video_device`.
> +#[pin_data]
> +struct VideoData {}
> +
> +/// The private data associated with a V4L2 file, i.e. `struct v4l2_fh`.
> +#[pin_data]
> +struct File {}
> +
> +impl v4l2::file::DriverFile for File {
> +    type Driver = SampleDriver;
> +
> +    const MODULE: &'static ThisModule = &THIS_MODULE;
> +
> +    fn open(_vdev: &v4l2::video::Device<Self::Driver>) -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {})
> +    }
> +}
> +
> +struct SampleDriver {
> +    _pdev: ARef<platform::Device>,
> +    _v4l2_reg: v4l2::device::Registration<Self>,
> +    video_reg: video::Registration<Self>,
> +}
> +
> +impl v4l2::device::Driver for SampleDriver {
> +    type Data = Data;
> +}
> +
> +#[vtable]
> +impl video::Driver for SampleDriver {
> +    type Data = VideoData;
> +    type File = File;
> +
> +    const NODE_TYPE: video::NodeType = video::NodeType::Video;
> +    const DIRECTION: video::Direction = video::Direction::Rx;
> +    const NAME: &'static CStr = c_str!("rv4l2");
> +    const CAPS: DeviceCaps = caps::device_caps::VIDEO_CAPTURE;
> +
> +    fn querycap(
> +        _file: &v4l2::file::File<Self::File>,
> +        _data: &<Self as video::Driver>::Data,
> +        cap: &mut caps::Capabilities,
> +    ) -> Result {
> +        cap.set_driver(c_str!("rv4l2"))?;
> +        cap.set_card(c_str!("rv4l2"))?;
> +        cap.set_bus_info(c_str!("platform:rv4l2"))?;
> +
> +        cap.set_device_caps(Self::CAPS);
> +        Ok(())
> +    }
> +}
> +
> +kernel::of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <SampleDriver as platform::Driver>::IdInfo,
> +    [(of::DeviceId::new(c_str!("test, rust-v4l2")), ())]
> +);
> +
> +impl platform::Driver for SampleDriver {
> +    type IdInfo = ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        let dev = pdev.as_ref();
> +
> +        let v4l2_reg =
> +            v4l2::device::Registration::<Self>::new(dev, try_pin_init!(Data {}), GFP_KERNEL)?;
> +
> +        let video_reg = video::Registration::<Self>::new(
> +            v4l2_reg.device(),
> +            try_pin_init!(VideoData {}),
> +            GFP_KERNEL,
> +        )?;
> +
> +        let this = KBox::new(
> +            Self {
> +                _pdev: pdev.into(),
> +                _v4l2_reg: v4l2_reg,
> +                video_reg,
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        dev_info!(
> +            dev,
> +            "Registered /dev/video{}\n",
> +            this.video_reg.device().num()
> +        );
> +        Ok(this.into())
> +    }
> +
> +    fn unbind(pdev: &platform::Device<Core>, _this: Pin<&Self>) {
> +        dev_info!(pdev.as_ref(), "Unbinding Rust V4L2 sample driver\n");
> +    }
> +}
> +
> +impl Drop for SampleDriver {
> +    fn drop(&mut self) {
> +        dev_dbg!(self._pdev.as_ref(), "Rust V4L2 sample driver removed\n");
> +    }
> +}
> +
> +kernel::module_platform_driver! {
> +    type: SampleDriver,
> +    name: "rust_driver_v4l2",
> +    authors: ["Daniel Almeida"],
> +    description: "Rust V4L2 sample video driver",
> +    license: "GPL v2",
> +}
> 
> -- 
> 2.50.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

