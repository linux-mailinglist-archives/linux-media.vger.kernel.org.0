Return-Path: <linux-media+bounces-62163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPllHNqADGprigUAu9opvQ
	(envelope-from <linux-media+bounces-62163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185758164B
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F1D8309A566
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9075C403E9D;
	Tue, 19 May 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BIzGmVZX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9F403E8A;
	Tue, 19 May 2026 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203785; cv=none; b=kDaVImfk28xx2sPkB85uy+DRefJ138M7o8GGJr7IlcrrNhNncMd719pW1d1oRIEs7HnFx0G2KSg2UrpVaHDvQ+YpkLCHnlePKrT1fpVGARtayulNMkJddwhiR54U/ZZaSKrxa5idA8CWnnE8K0b4+JBoYcAY3LeHzJp49wbTBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203785; c=relaxed/simple;
	bh=LeeRjDKdU98xs9zRHyVlw4Dxq1DWY3AOHyqzA6RQyk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A94j0qKslE0baB+lYZcsFoXU9CiUM0nmBSQ+92B8iUsBtWm5sRRvw2oKRbs9dgXXOBzZrx2RiHNiqURSoqy+UO5PVK2mJwJZ7UAsfZCctJtZ16EBwYYPhghzwc0+iAXdaXDfhB+9lpCo1H/UtOWeWqoNMWODPQ0iLJQ0yt6wFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BIzGmVZX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779203780;
	bh=LeeRjDKdU98xs9zRHyVlw4Dxq1DWY3AOHyqzA6RQyk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BIzGmVZX7WuoGCBqs8TVvfe6IAiXzAbgNzXkT5K/YhBIwLJwSni7btMn9SumAwHRd
	 yYMxK+FlNvhcL5reNzbEaqTVpwYwJMAn6mvoi86ru++B1H1wUBohGelADL4ThXNazp
	 kcQ7ARc9mdtezse4LnovGMYXMcFZAfyeXmJSDv9Q31YkIq6Hfn3dcHmujAdWagpViT
	 NnI9aZpdq6Vq57u7E9gC4ZWAXpXKep7D4xIRnxtEDOkZMUa5r4L7cTmzfLezpmOj2h
	 RmDVZMINMEcFZkD8jeIj5MsoxAIs4UT/N/oXazgSSObDkVfO+d6jwxeWDJ/9ojYlNE
	 DBUftxHB1ZJGg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB6A017E1299;
	Tue, 19 May 2026 17:16:18 +0200 (CEST)
Message-ID: <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>
Subject: Re: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info
 block height
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 19 May 2026 11:16:17 -0400
In-Reply-To: <20260518102451.417971-6-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
	 <20260518102451.417971-6-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-GJ5iBdhdx0UoTc8uYpG1"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62163-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:email]
X-Rspamd-Queue-Id: 0185758164B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-GJ5iBdhdx0UoTc8uYpG1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=C2=
=A0:
> The NV15_4L4 format is specified as a 4x4 format, not 4x1.
> In addition the block size should not take subsampling in account,
> so specify it as 4x4 for both luma and chroma.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e1113..77a0daa92c2b 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -309,7 +309,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		/* Tiled YUV formats */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bp=
p_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> -		=C2=A0 .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 1, 1, 0, 0 }},
> +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

Only the block_h is broken. The block_w is in "pixels" which for the UV pla=
ne is
component pairs. So both set of tiles have 5bytes stride. But since the sec=
ond
set, the UV tiles, are interleaved, they only have 2 pairs of UV per row. S=
o to
me the correct fix is:

+		  .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

If its not the case for the camera pipeline, then a new format is needed, s=
ince
this format should perfectly match NV15 + VIVANTE_TILED in the DRM world.

regards,
Nicolas

> =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */

--=-GJ5iBdhdx0UoTc8uYpG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagx+wQAKCRDZQZRRKWBy
9H3cAQCZckjwaH4Ua7bFNH0TlIe7qNnm4JBXewMsZ3UzDAKbHAD+MzI3Pek25YiV
cuO2+w5f3DUEwgpRmjCUKnqmGO9WqQ4=
=HPXQ
-----END PGP SIGNATURE-----

--=-GJ5iBdhdx0UoTc8uYpG1--

