Return-Path: <linux-media+bounces-60003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KxpNcxI8mm1pQEAu9opvQ
	(envelope-from <linux-media+bounces-60003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:07:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E649895D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F6083020EF8
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4A93FFAC1;
	Wed, 29 Apr 2026 18:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cmMDF5t+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6238D688;
	Wed, 29 Apr 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485936; cv=none; b=CqLnLoxYAOeek6l75TlykvZq92qm38bsOQ6Mh/UkROjWkuyMoErac6HeUvxV0Wui43phBFCCQ5YqI8HA1sPVi2oqsXUh7hMKhwZgNdXC8l3DACaucsl+3hvE6JrJcU3CfY4S1wxvS+8MW5rBQ22QAKGkeA3EqowLU42FjeXARnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485936; c=relaxed/simple;
	bh=yYtyo1irNYuef2+r6HTLsL49yeZR6MZaKC6kSkaB3RM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OIWcv1ffNUPCJR+1gYxcw1LrV3vzUPgb9cP51R0nYN7wESeRrBl4xCsHe6drNucEHZKdmXyuQkLXuClVjtW9KcE8flTBd5yFcO+Tjvsp34kLMWEFxkf3b13tH3/bO7XDeauVm/rjPXQ8BaS8FaeX9QcI1y+jiPC9JwDjsfg8S0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cmMDF5t+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777485933;
	bh=yYtyo1irNYuef2+r6HTLsL49yeZR6MZaKC6kSkaB3RM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cmMDF5t+m5AgXJiOh6WpknkB03Q9k3AFiN0DClyDNQOTHQwfoz9hZSxa227JmWFZS
	 EuertQdseT8TUYWb6TzOw4Q9gEJ7jmavgFyYQZC3B4toDhtEhhHPscZLB0ulmUQ7OF
	 dPioRGpSgaEMbXmuT78vmAk4q0OFNteegrc/eMwrRYCjbvZyQI8zOyuQCE8DaFdiOj
	 Lvq0GU4wTWjmWEQKJ4CH0ymcRdaXeUMr0D8c+x5yI0VxEZBtiiEkA0LzG/T8y2NQcD
	 jRWglcK1zXGqrN+F29C7Sfa3BSxKea+Vb55qgi/+fZloaeblraTcw0ynOh9brvYI+2
	 p1igoz6A3oi6g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BA4F17E0EBB;
	Wed, 29 Apr 2026 20:05:32 +0200 (CEST)
Message-ID: <425069f4bd9f79c5f5d094044cd291d4067b2157.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Fix format enumeration when
 post-processor is mandatory
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Wed, 29 Apr 2026 14:05:30 -0400
In-Reply-To: <20260428083723.54314-1-benjamin.gaignard@collabora.com>
References: <20260428083723.54314-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-aLojBfI2sik/16q3qWnM"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 606E649895D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60003-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]


--=-aLojBfI2sik/16q3qWnM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

Le mardi 28 avril 2026 =C3=A0 10:37 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> When a post-processor pixel format is mandatory (i.e. when an AV1
> bitstream use film grain feature) the driver must only enumerate
> post-processed format.
> Use the context format to know what is suppose to be enumerated.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 80c7373a456e ("media: verisilicon: Conditionally ignore native
> formats")
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index fcf3bd9bcda2..f538d4562744 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -242,7 +242,7 @@ static int vidioc_enum_fmt(struct file *file, void *p=
riv,
> =C2=A0	 */
> =C2=A0	skip_mode_none =3D capture =3D=3D ctx->is_encoder;
> =C2=A0
> -	formats =3D hantro_get_formats(ctx, &num_fmts, HANTRO_AUTO_POSTPROC);
> +	formats =3D hantro_get_formats(ctx, &num_fmts, ctx->need_postproc);

Looks like this is a subset of another of your patch, which was pending a c=
ommit
message fix.

https://patchwork.linuxtv.org/project/linux-media/patch/20250624122938.6200=
4-1-benjamin.gaignard@collabora.com/

I've picked the other patch and applied my commit message suggestion.

Nicolas

> =C2=A0	for (i =3D 0; i < num_fmts; i++) {
> =C2=A0		bool mode_none =3D formats[i].codec_mode =3D=3D HANTRO_MODE_NONE;
> =C2=A0		fmt =3D &formats[i];

--=-aLojBfI2sik/16q3qWnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJIagAKCRDZQZRRKWBy
9CqzAP92uIQfrIIY/o0QVJ3lKYVfsBXuEtxg5zYf2BYhLZ4UEwD9E6kLYjD61Nzw
fWTI22ZchZIg3qgYXNrB4rGqhOHfCwA=
=dFmo
-----END PGP SIGNATURE-----

--=-aLojBfI2sik/16q3qWnM--

