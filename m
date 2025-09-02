Return-Path: <linux-media+bounces-41581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5BB401C0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D6AA2C54FF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509E42D6406;
	Tue,  2 Sep 2025 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U2JovNOM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A73595B
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817732; cv=none; b=NKKP7Kz3mqnahxYy3VojoxwK7a1Hj1nR28bFag4Q+OytwQOJA5YL5CgGBWBF5/qfqqSFbPgTRwvWakTps2IlqjVfta3iz5NJbxTO5w2nU3Begv6Zcn1/EHCiSBRGYqCDhHFqM2UyyLqUvMZX8n17WQWRBbgxMkuMDe13EBGckaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817732; c=relaxed/simple;
	bh=g1VDvUS/mApR0wH45aNKXhrw4QIn/CPzoUiBirJt+Wk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nh3BNjXuKT6KzF3emvNo5Uul/GQQAaYjG7sqYF1UWtTnaDDy2QgREf5N7IDwHTCji3RpgkJ4oUb4OhQ8gAyRlJ4IzdKcSa4i96TozSLwP6/hDxczdmSN4q/9AXaan3eFSD/XsjsaP9bLShEEAyBtXC5d9QZvTxDXpGOzsIZoNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U2JovNOM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756817728;
	bh=g1VDvUS/mApR0wH45aNKXhrw4QIn/CPzoUiBirJt+Wk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U2JovNOM4naAV9FqRov2KUCjBX//mBzl49nFprTbCoKRm1j9Ej6zxG+0WJRF04CFz
	 CWhh5bcuCy+3g4nNGxOO74H/Ci0+GBDD/jHoybH8ngZ0M2IMEf5765eElaYiH3T+Ue
	 tx079G9tvSnWuIP+qCawM213bCGj1+Ltv/+Ok+EuElPuHb90k2IO2st8CjQZCuYJGB
	 KqdWUBJIVze0wGYh2TbYR+m/dVYdziOKOKuC0Lu4NO/ZwYCk3a4gotxhquNlrTpgnx
	 AIWlVFlN7072RfGngMtuwuFErZZmiNmMemlvh5SPnzXE6sjyRvGFysExQoHhbm/d7d
	 oY/ykwv6RoZaw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1ADFD17E10B7;
	Tue,  2 Sep 2025 14:55:28 +0200 (CEST)
Message-ID: <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, linux-media
	 <linux-media@vger.kernel.org>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Date: Tue, 02 Sep 2025 08:55:25 -0400
In-Reply-To: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
References: 
	<CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mrbjJNuUH/wWXt43KlJK"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mrbjJNuUH/wWXt43KlJK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 septembre 2025 =C3=A0 11:50 +0200, Michael Nazzareno Trimarchi =
a =C3=A9crit=C2=A0:
> Hi all
>=20
> I'm working starting from downstream jpeg decoder to properly support
> the usb camera to decode mjpg. After look at the header I found out
> how to decode the RSTx block and have a correct image that I can show
> on wayland display using:
>=20
> gst-launch-1.0=C2=A0 v4l2src device=3D/dev/video2 ! image/jpeg,
> framerate=3D30/1,width=3D640,height=3D480,format=3DMJPEG ! v4l2jpegdec !
> video/x-raw, framerate=3D30/1, width=3D640, height=3D480, format=3DNV16 !
> videoconvert ! waylandsink sync=3Dfalse
>=20
> Now the problem moves to videoconvert that is software based. Anyway:
>=20
> The patch was only to consider:
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (header.restart_interval)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (header.restart_interval) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg |=3D G1_REG_DEC_CTRL2_SYNC_MARKER_E;
> -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vdpu_write_relaxed(vpu,
> G1_REG_DEC_CTRL5_IDR_PIC_ID(header.restart_interval),
> G1_REG_DEC_CTRL5);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> The interval and program it in the corresponding register.
>=20
> All the USB cameras I have tested have 422 subsampling that let the
> decoder decode to
> a NV16 image. Now to show on the screen and present the image, the
> hantro needs to have
> NV16 dst image buffer but anyway the decoding produces the NV16

Di you make a typo here ? You are saying that the display needs NV16 and th=
e the
decoder produces NV16, which would mean nothing is needed. Can you clarify =
?
Note that G1 pos-processor does not support NV16. It can only output YUY2 a=
s 422
format. Other formats are NV12 and RGB + some excape format that are barely
documented.

> format. I'm trying to figure out how to work on hantro postprocess,
> that if I understand correctly, try to go to the requested
> output format but expecting NV12 as input format hardcoded. I have tried =
to:
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (ctx->vpu_src_fmt->fourcc) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV12:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 src_pp_fmt =3D VPU_PP_IN_NV12;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV16:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 src_pp_fmt =3D VPU_PP_IN_NV16;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WARN(1, "input format %d not supported by the
> post-processor, use NV12 ",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->vpu_src_fmt->fourcc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 src_pp_fmt =3D VPU_PP_IN_NV12;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break;
>=20
> and add the NV16 that should correspond to
> +#define VPU_PP_IN_NV16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4

Yes, NV16 seem to match 100b.=20

>=20
> What is a bit not clear to me is how should I proper handle this
> difference in postprocess and how buffer are properly pass to the
> decoder and then to the userspace. Apart from that what
> I have read from [1] is that if the pipeline is enable the
> G1_REG_DEC_CTRL0_DEC_OUT_DIS should be set to 1, but I did not see any
> driver to it. What I need to continue is a better understanding of how
> the post process manages buffering. I think that then I can directly
> pass
> the only color supported by post-process as caps to gstreamer. Am I right=
?

If you only have one format support, you don't need to force anything in
GStreamer. Some extra information about Hantro post-processor. When used, y=
ou
need to provide 2 sets of buffers. The decoder will still produce NV16, and=
 a
secondary set of buffers is (in parallel, pipeline mode) written back into =
the
format you have configured on the PP register set.

The post-processor can also be used in standalone mode, but this feature is
often fused out. In that mode, in can input interleaved YUV, as often produ=
ced
as raw format by USB cameras (and most cameras using serial links).

hope some of this is useful,
Nicolas

>=20
> Michael
>=20
> [1] https://github.com/linux4sam/g1_decoder.git

--=-mrbjJNuUH/wWXt43KlJK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLbpPgAKCRDZQZRRKWBy
9Fq5AQDQk/qCm7nAe5yGCJeSV+ymoPb+EgZc7rlZ2eYSWWmPmgEA3X0OBqkt/JVM
BT0K/6HoXGUYrGh2xA5odkEC48Rp+wo=
=1NAH
-----END PGP SIGNATURE-----

--=-mrbjJNuUH/wWXt43KlJK--

