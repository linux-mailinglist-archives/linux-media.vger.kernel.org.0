Return-Path: <linux-media+bounces-40403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3233B2DCDE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B0E33B84F5
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC1C31813E;
	Wed, 20 Aug 2025 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfoXGp5d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0886311C16;
	Wed, 20 Aug 2025 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755693555; cv=none; b=kTwEocrOUqSM/5sxlcD42hyxIpnieZMhPdNgGyb/KV4nDq+o5kDYFMMlxFDXp2osikGnbq0aCAZDOlnzf0UZne2sBPlZy9zTpGOSXUtCleVmhofYKBWm9BnqwRde7g69gW7eEuaudXm+n/i8bzlQh7Fa/hvuRJty5eG9OT+yeNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755693555; c=relaxed/simple;
	bh=xco3Udl1suekPK0UFddEJ38lh+tXRE7xtaAHP4EtBMs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=SfwpHrzaklhSt/HAkGVmQlz+v9rEHp1quo6TjPD+/gGnEZ/mQHpT3rLJCgaXO/TMNLDYXMMor4Z0BCWq/uDGSxhgXcZHWccpS4Nk1FSlTUmm9ok3xVpQ1PJGqvbLxmDbn54AE0D0n4Ac+SPuySmZ+ggBDnlnf9zEDih2C3/CCXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfoXGp5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF4C4CEEB;
	Wed, 20 Aug 2025 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755693555;
	bh=xco3Udl1suekPK0UFddEJ38lh+tXRE7xtaAHP4EtBMs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=dfoXGp5dAFeT2tenVtZplTmd5+uez1aNLHEAj/jMh48hAzl6pUw3cb2J6Zet++xXi
	 WyDVsNiFb7Lrms3XjFz8WtzRQm+EdjS463OMa4U7oxbeYH+KZA817Efe/8rzv25PXR
	 p2x9ucMR/EhEMgwIRn59f8FHrGm9JKV+bXMTwj60KhyvS6gG3/x9aN+nwQD9xaKvXd
	 MjZxb1vTyWWwDoMZIOpgq3cTc1if9F2S6VouM/2EWpwul69OTKibuLeT3Vl+6zwSvv
	 C4e0wfbEDEnqJ2/wfa8XG7sjNlZWLtdMaxHWwvYFSFDMPG1m9wqQy94VfLLzt18Vgs
	 2agjPEQhNOaHA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 14:39:10 +0200
Message-Id: <DC79F6AXATLL.JWGLJC42CXAN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 7/7] rust: samples: add the v4l2 sample driver
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
 <20250818-v4l2-v1-7-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-7-6887e772aac2@collabora.com>

On Mon Aug 18, 2025 at 7:49 AM CEST, Daniel Almeida wrote:
> +/// The private data associated with the V4L2 device.
> +#[pin_data]
> +struct Data {}

I think you don't need #[pin_data] on this and the other empty structs. The=
re
should be a blanket implementation for PinInit that got you covered.

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
> +    type Driver =3D SampleDriver;
> +
> +    const MODULE: &'static ThisModule =3D &THIS_MODULE;
> +
> +    fn open(_vdev: &v4l2::video::Device<Self::Driver>) -> impl PinInit<S=
elf, Error> {
> +        try_pin_init!(Self {})
> +    }
> +}
> +
> +struct SampleDriver {
> +    _pdev: ARef<platform::Device>,
> +    _v4l2_reg: v4l2::device::Registration<Self>,
> +    video_reg: video::Registration<Self>,

Is the drop order of those registrations relevant? (If so, it shouldn't be =
on
the driver to get that right.)

> +}
> +
> +impl v4l2::device::Driver for SampleDriver {
> +    type Data =3D Data;
> +}
> +
> +#[vtable]
> +impl video::Driver for SampleDriver {
> +    type Data =3D VideoData;
> +    type File =3D File;
> +
> +    const NODE_TYPE: video::NodeType =3D video::NodeType::Video;
> +    const DIRECTION: video::Direction =3D video::Direction::Rx;
> +    const NAME: &'static CStr =3D c_str!("rv4l2");
> +    const CAPS: DeviceCaps =3D caps::device_caps::VIDEO_CAPTURE;
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
> +    type IdInfo =3D ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&OF_TA=
BLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        let dev =3D pdev.as_ref();
> +
> +        let v4l2_reg =3D
> +            v4l2::device::Registration::<Self>::new(dev, try_pin_init!(D=
ata {}), GFP_KERNEL)?;

As mentioned on the struct already, you shouldn't need try_pin_init!() here=
,
since there should be a blanket implementation for PinInit.

> +
> +        let video_reg =3D video::Registration::<Self>::new(
> +            v4l2_reg.device(),
> +            try_pin_init!(VideoData {}),
> +            GFP_KERNEL,
> +        )?;
> +
> +        let this =3D KBox::new(
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
> +        dev_dbg!(self._pdev.as_ref(), "Rust V4L2 sample driver removed\n=
");

A driver being unbound / removed is the same thing.

unbind() is the correct callback for this. SampleDriver::drop() is for
additional cleanup needed for the driver's private data. It's just that thi=
s
cleanup also happens on driver unbind.

(I think I need to fix up the existing sample drivers that date from before=
 we
had unbind() in place.)

I'd just remove this drop() implementation and the ARef<platform::Device> f=
rom
SampleDriver.

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
> --=20
> 2.50.1


