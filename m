Return-Path: <linux-media+bounces-62186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAzWGBrKDGrAlwUAu9opvQ
	(envelope-from <linux-media+bounces-62186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:37:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ED584C68
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9970C301668A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABF03BE175;
	Tue, 19 May 2026 20:37:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915BA3B3C00;
	Tue, 19 May 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223055; cv=none; b=As6yv6TmAAUR/IWkfIv7YzvSmONJiHjSY3d1Et74g8f9zbjXYiRnKXQWjM5jxfoIQY9QFPOeSUn4Pio3iYOUM72K8fVMxGaQXb1i114LhrPSEwFJu+bGHORr4HTc5CfwFud8w9BfhmYHtGcocRSM8pEUSENkfyzVYa3nfEpTbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223055; c=relaxed/simple;
	bh=U3uMzGCgQitddBZmz3MDenkZIrSIJ6ND7ntkRyu6z+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6hvsYoOtLxvr1FvnkRHJUWgU0ojOuALTpS3EgAaBuHushwTe/qIigkgmkQdZvXyKx0/w9hcEVS4oGtJr4DX2hqqzkAVggkk6zgacYWvTvDOYiBVzpim/Bf1I7JBcIYjFa13/fgMu+oFGaf2r92eGVNF1fXoDLB1lwUO0sj1vVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1F65A1F8005F;
	Tue, 19 May 2026 20:37:28 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 99DABB40839; Tue, 19 May 2026 20:37:26 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 11335B40839;
	Tue, 19 May 2026 20:37:25 +0000 (UTC)
Date: Tue, 19 May 2026 22:37:23 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 06/16] media: v4l2-common: Add missing tiled format info
 block sizes
Message-ID: <agzKA11feGZExvEP@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-7-paulk@sys-base.io>
 <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDQIAplM8RyG3VNl"
Content-Disposition: inline
In-Reply-To: <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62186-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:url,sys-base.io:email,paulk.fr:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 631ED584C68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qDQIAplM8RyG3VNl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Tue 19 May 26, 11:18, Nicolas Dufresne a =C3=A9crit :
> Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > Some YUV420 tiled format info definitions are missing block sizes.
> > Add the missing block sizes (they are all 4x4).
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 77a0daa92c2b..e142d40c71b9 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -307,10 +307,12 @@ const struct v4l2_format_info *v4l2_format_info(u=
32 format)
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_GREY,=C2=A0=C2=A0=C2=A0 .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> > =C2=A0
> > =C2=A0		/* Tiled YUV formats */
> > -		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .=
bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }=
},
> > -		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> This one is speecial, this format does not exists. I believe Jernej made =
that
> one based on assumptions, the actual HW should produce NV15 4L4, but I do=
n't own
> that hardware, and so I never managed remove that last "user" of it, whic=
h is I
> believe H6 VP9 decoder.

I don't think I've ever tried it but do I have some H6 hardware around,
so maybe I could test it eventually and figure out if it really uses
this format or not.

I guess it doesn't hurt to keep the definition either way.

All the best,

Paul

>=20
> Nicolas
>=20
> > =C2=A0
> > =C2=A0		/* YUV planar formats, non contiguous variant */
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qDQIAplM8RyG3VNl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoMygMACgkQhP3B6o/u
lQyhfQ/+OihZP1pX+KtLZHb5PzSuHG0dNVPtJqPXxuifAq/+8LDU7nVA4PnCrecI
XgxCEuVL34zttetOPT6eEv3bS5ggk83M/Cc5rB4eQqvmJvEF9CtPH42w0oTphKY3
+0tdM1crZVVxMOZAWf0h0/vPcxU0u8k/9fiNhXGxZoHebaJKRYDsM/GRmdx00sRG
NZhyZda+siMNnD8U8GHh5BYC8jJaGXdNRfVbybTSy4gy6lfxHGjCNXyPUip2CuVl
aorL2mN5Tn6u2k2CeVsiNtFY88piEoKPNCj3qPrBwpfJus1shJT6KzG7hV0VkmWJ
q4X6AifqLw2xKTrXKr2bn8ZuoPTU+1NXRW2AAZSjJZ3UEULyc2FMPeyl63PRx5mu
5qFLO6oODog4myIXxRgX5I+348Woyk2fJlkiuQtwgropwM7IQsANfngK6NlJtK5+
SGIu6RpmqaRsok/80menkJHVbe9eVWY5s9dFE7hOtZDIuuJzit5Iaa1u6659MKcN
+2Q5z/EsdeMfSWtN58hhpCP+i/pv7K/tmswIjFl8/tFAMLld6dtQbUYDaDtnF26f
K0CBJjm6GCtl9JgcCUAgXgHsKbxe0tAYL89dciy4Gurl0tRbUfEDr5NgUHQ5UtON
EY4XD09tRKRV2RUt8y2S64q6kzTRZ999rAOoOveEj79GOO7AYNs=
=PJVw
-----END PGP SIGNATURE-----

--qDQIAplM8RyG3VNl--

