Return-Path: <linux-media+bounces-57089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM+RAWsvxGkAxQQAu9opvQ
	(envelope-from <linux-media+bounces-57089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:54:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9B32AD99
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE39B30391C4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25434B676;
	Wed, 25 Mar 2026 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sic//J/e"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6832D0DE;
	Wed, 25 Mar 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464872; cv=none; b=MkuXcKdLyBuPr8dz/jQvAkY9y6N6Tpoi50Ro25zSnVH2CQlY1++PX0Fhe8HFyQhgmdB59chi6rZ/e48mXkJw5hqxg0ZS+k2GmjA8VTQjK156x8Uhn1uKa72n+NBynoJW8M0QZ+UxuZ3Fthz2N/gr83UB/nJf5poLKKdf+6wwWTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464872; c=relaxed/simple;
	bh=hWtp3wvsDME4tyn+HULSzB4qXGkVkDYOwOrTsILOGec=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVQ+arSuNnUAbQVXZehtuk6RGvK4oFtLEyOdeCppLiDrTDOq2xdVfFTY70Vj0llGxf0Svw7mbx63etfHTiyQnrnD5sgVG9sUpNrQcdP4osXFX4Sb686s9rcRfrJAwVwFnUSUzlYC77WU5jsrFabzb1JkJQzmTftDYt+zDCkiaxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sic//J/e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774464869;
	bh=hWtp3wvsDME4tyn+HULSzB4qXGkVkDYOwOrTsILOGec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Sic//J/e9I1kJM7KLL90V02zQNZFsW9pYGq7bSP8iae/5wqCz2BtFZPb7K4PpzF6f
	 mjVc+YpUWR7Lh8rmjhEopq6Rr65G8M0aLjj9phH6vI0Sm/o00KQuXgK9aWJP7reKvw
	 IEW3wJZ8pSf8/+y+JI603vhrTpVYp4vd/8qMnVspn3V9CMt+hH3jNJNjnrdoykmMkx
	 05zGmzqa/XUrhWOnlFQ9OKXpaPNIBoTWJYLsgunC/kTnlwgHzvw6nqE3S9+vNGT8gj
	 D201Bi6ZVmwbV6ewi8v9RuENbwCq8JCOfeghMvL9eyFet3V4lbHrcw6FAZE/BxTFjS
	 L9zpy+ENNBKLA==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B77C17E5CC8;
	Wed, 25 Mar 2026 19:54:28 +0100 (CET)
Message-ID: <b947d46de2f6587a1feb79641b469493173496f9.camel@collabora.com>
Subject: Re: [PATCH] v4l2: common: Fix P010 format definition
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Sven
 =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 14:54:26 -0400
In-Reply-To: <20260325-v4l2-common-p010-v1-1-4427779dda56@collabora.com>
References: <20260325-v4l2-common-p010-v1-1-4427779dda56@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-d90o5mHe0rOGHbEA/D9E"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57089-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 9CF9B32AD99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-d90o5mHe0rOGHbEA/D9E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 mars 2026 =C3=A0 14:42 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Correct the subsampling divider and unpack the bytes per pixel values. P0=
10
> is a 4:2:0 subsampled format but was previously encoded as 4:2:2, and the
> bytes per pixel value was being hacked to compensate.
>=20
> Fixes: 5374d8fb75f3132 ("media: Add P010 video format")

Should have:
Reported-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e1113310fd8926ebc2cbc4e124bd9f109..1764502cbcb2072c91e0dd002=
0c4a844281f092e 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -295,7 +295,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV20,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 1=
0, 0, 0 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV24,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV42,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_P010,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 2, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_P010,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D V4L2=
_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, =
0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_P012,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV410,=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
>=20
> ---
> base-commit: ebeec2b000a90cd8aae86d1931ff5ef23af8284e
> change-id: 20260325-v4l2-common-p010-9b364a87a679
>=20
> Best regards,

--=-d90o5mHe0rOGHbEA/D9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacQvYgAKCRDZQZRRKWBy
9MzTAQCb50wPPl/p5dvh65hWi/OiQjFkSx3VkJffBbr0Bbo8DwEAqngEA1oYE1T8
GA0p50pn5q5A9tDknOhs5cKvJqBxnA0=
=9cl6
-----END PGP SIGNATURE-----

--=-d90o5mHe0rOGHbEA/D9E--

