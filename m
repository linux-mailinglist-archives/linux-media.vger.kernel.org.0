Return-Path: <linux-media+bounces-43853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AABC2519
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F1EB3BC594
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3E7218ACA;
	Tue,  7 Oct 2025 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="tmwKodxh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7A2116E9
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860372; cv=none; b=qrwPk+tRwOqn9yuwCYmDXR8FNMnYJwPWo2GRzFl3lyAPhK44PKWvhFe4kX98r69GiRSP9jWv91ZJ6IImiZqU1EkFvgraKNkrwXU+N3vmQiQ8ETDJReSIYxRS+u9Z7vMa1X9jME0sNGHeWjL4BLfxULuT6he9gADpjxpiJ8Bnk28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860372; c=relaxed/simple;
	bh=jtt1r2V4Z3YHNsWmjgCrTd5nGu1x0RVKYwRh9BZVydc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PWQw3XceCIV4RAACvABV+a0rpRSBaaCl8F8jaZnNPCcu9HFptjI9S8CdWeSGHhnO9eCKcGngvM3p7aIBU/nCLgfPvoUt+fpxqDpLapcrxuiyvuzeztBZ0gOMvsQve3gGjx0I2RUqzHEg7PX0f8Xk0/8moCBnI9THDbHV9hxpNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=tmwKodxh; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-854fcb187b2so757995385a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759860369; x=1760465169; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ch7TyWwa1EZJeBseqB4xaWFqVYs5eXriLyyqsfuTad8=;
        b=tmwKodxhKLxCZYU1bKztQUiQvW1cN6JGv7MOO3JkEdQs1C+FQJqcViflu7dLNkfKk2
         8HW3Xcd6twaeiFgZrtXl71m+j6f+fPzdfYcQdQXrKF4/HaqvDkSprtvnHGAp+xyRxq+1
         MetEVc4zmm32KSLjqsz8ND4DGb1uNcqdYVQi1zyHF8nTz0d8dE5/iU+YSDHxWAcY/vcl
         30jXkF84yC5I5hMJvkUmfu3Ol3JCxvh/x8HAt1FXbw3yvJCd5g4K2Elts3oSjTdE3Tf6
         ZFvbI3B5mwI6zoXNTNN5fEBA4YvmMPSbRDm62R7bHH700uX7gW1COfzBiMMiymi0FktA
         3zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860369; x=1760465169;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch7TyWwa1EZJeBseqB4xaWFqVYs5eXriLyyqsfuTad8=;
        b=plLd8pvj7DFGx7OrNEZf/lfQRLV+9BtbtpO7xCFQkg0dZuZifJAUwX1Vo2hGl3bRRv
         vLUhiR+zWjEVh8C9r3J4CelaL1gEg6GkWi3wW4v+BN/RchjehVoMdmK4zStB2EqlRAiA
         EkowB493DEus6YVTNY2OfnkWqVdDTWF3J6UXas+xs+o6KHw50co7SBbo9jL6CRY+ijY5
         B6zDNk/q1tcYNHQU4sZafm2Jpqx6cLdNy4/weNvZkFNtI3+FtnxX/Ax8G6Znj1Rkf/Zn
         Yq5xdQuOiQxISzWKWAO3Xx+O8BYioM8rW+kDR+hxP+ZMP+BcFZX2cZXClNfwUZJAIGOt
         JWzw==
X-Gm-Message-State: AOJu0Ywn0z7dCIWs/0UQOprUt7UMKKgaoACpkAfSR91YczY1AVb2lc8C
	VGr87dfpMeN6OgSq6Hd29Q1bjReAVu0blynUSBVYTk5rA1/h+ucvucusyp5FVQy/niw=
X-Gm-Gg: ASbGncvixIY2tEhEAZLEfYvpUMKpLEAtqyo6SuuvFR0jvBHMjYuA2zbb+DdRUrOoLPp
	hVSm+R9FbJl+PzLCPU3V33S7Zb/AkPiasBHw+oNnxUXhB2Oz8Z3mUO+S2CprLsBGM/M8aFbHIZi
	OU5nnSrTBQttLCQTA5ECbVtk7z5F/NZUPirOjPjnVdV68xcgMvahlDkR8BgAM9G6JZtsp/DvTuP
	7hAQtgN7NtHcvmUmtNO75kP5Ty6fWUZxb9cVqY0zLMmTzBYHPG4fy/gy1urYPRBXaDEC2q2lKLt
	h2ixlTIy13Qk3W9tk5OVOF6HDp6dWfOOMCf5sngPj2U8KuqqsrO1yuBCmTDyXvFQ9j7OYqhZGmw
	nS1/nce8HFlm93c+1YyaJ1Pt7ps1pzBK5vh23iWUG0hy1BY/QnxfESumVKSRM/C4=
X-Google-Smtp-Source: AGHT+IEd8+PaBlkFCf4TWlgW17RetR7onOYSu6eacanLHMSo1S6DckxwyV/Bqe+3v64BuZQrTcO0Vg==
X-Received: by 2002:a05:620a:4891:b0:860:a923:c114 with SMTP id af79cd13be357-8835088d4e8mr120315085a.26.1759860369140;
        Tue, 07 Oct 2025 11:06:09 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877796a1de6sm1488995285a.49.2025.10.07.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:06:08 -0700 (PDT)
Message-ID: <3c62e3c837d534ef5bc21a95ec1dc408c38cb8a0.camel@ndufresne.ca>
Subject: Re: [PATCH 00/16] media: platform: rga: Add RGA3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:06:06 -0400
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-IcsCjmyMK96ZjT/TchVY"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-IcsCjmyMK96ZjT/TchVY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 10:31 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
> can use the existing rockchip-iommu-v2 driver to handle iommu mappings.
> Also the RK3588 contains two independent RGA3 cores.

Thanks for working on this.

>=20
> Only scaling and format conversions between common 8bit RGB/YUV formats
> are implemented. Also the color space conversion is fixed to BT601F.
> This already allows a practical usage of the RGA3.

This seems quite limiting, can we expect an update on this, can't be that h=
ard
to fully implement.

>=20
> This was tested on a Radxa Rock 5T. With the increased clock speeds in
> the devicetree around 160 fps were measured when scaling and converting

This is quite vague, I've checked the patch and you didn't extend either th=
ere.
Is that an overclock or was it miss-configured ? Does RK implement a devfre=
q ?
Should that be moved with a voltage adjustement ? Is there any thermal near=
by we
should monitor ?

> from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling a
> default clock division factor of 2 is used and only around 80 fps are
> reached with one core. The v4l2-compliance tests only complain about
> the already failing colorspace propagation:


Did you do any more format testing to validation all supported combinations=
 ?
This is a tool [0] you can use to test this using GStreamer and how to use =
it
[1].


[0] https://gitlab.collabora.com/mediatek/aiot/lava-test-definitions/-/tree=
/main/avvideocompare?ref_type=3Dheads
[1] https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-next/.=
gitlab-ci.yml?ref_type=3Dheads#L282
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> =C2=A0 v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
> =C2=A0 ...
> =C2=A0=C2=A0		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() !=
=3D
> col
> =C2=A0=C2=A0	test VIDIOC_S_FMT: FAIL
> =C2=A0 ...
> =C2=A0 Total for rockchip-rga device /dev/video2: 47, Succeeded: 46, Fail=
ed: 1,
> Warnings: 0
>=20
> Each RGA core is a separate /dev/video device. To distinguish the RGA2
> core from the RGA3 cores the Card type is set accordingly. Combining all
> cores into a single device and scheduling tasks to the best core might
> be a future improvement, if it is desired by upstream to handle the
> scheduling and selection in kernel space.

It took me some time to understand why you spoke about multicore here. You
forgot to say here that you add RGA3 into RGA2 driver. Some information on =
why
you went that path instead of a separate driver.

=46rom high level view, I don't think its a good idea to multi-plex over
heterogeneous core. They may not even produce the exact same pixels for the=
 same
operation. They also don't share the same MMU, and at first glance, the use=
 of
rkiommu in RGA3 means it can no longer handle CPU cache (though I don't kno=
w if
this is implemented/supported in upstream RGA2 driver).

>=20
> Patch 1-2 are general cleanups
> Patch 3-12 prepare the rga driver for the RGA3
> Patch 13 documments the RGA3 compatible value
> Patch 14 adds the RGA3 cores to the rk3588 dtsi
> Patch 15 increases the RGA3 core clock speeds
> Patch 16 adds RGA3 support to the rga driver
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> Sven P=C3=BCschel (16):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use clk_bulk api
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use stride for offse=
t calculation
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: align stride to 16 b=
ytes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move hw specific par=
ts to a dedicated struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: use card type to spe=
cify rga type
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: change offset to dma=
_addresses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: support external iom=
mus
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove size from rga=
_frame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: remove stride from r=
ga_frame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: move rga_fmt to rga-=
hw.h
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add iommu restore fu=
nction
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: handle error interru=
pt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: dt-bindings: media: rockchip-rga: a=
dd rockchip,rk3588-rga3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: add rga3 dt nodes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: rockchip: increase rga3 clock =
speed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: rockchip: rga: add rga3 support
>=20
> =C2=A0.../devicetree/bindings/media/rockchip-rga.yaml=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0arch/arm64/boot/dts/rockchip/rk3588-base.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 50 +++
> =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 78 ++--
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 356 ++++++++++++---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 404 ++++++-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++--
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 490
> +++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 186 ++++++++
> =C2=A010 files changed, 1246 insertions(+), 410 deletions(-)
> ---
> base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
> change-id: 20251001-spu-rga3-8a00e018b120
>=20
> Best regards,

--=-IcsCjmyMK96ZjT/TchVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVWjgAKCRDZQZRRKWBy
9MYwAQDAFCIsXy2vnCz1b/y+9mKp3XI/R9oRTPcTXia35pLGywD/SLpU/azQOYuj
Eq4VTAEBMAbKxVFBtmRPL+5Gb/F4cAg=
=pSPZ
-----END PGP SIGNATURE-----

--=-IcsCjmyMK96ZjT/TchVY--

