Return-Path: <linux-media+bounces-59863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICj0CZfG8GkqYgEAu9opvQ
	(envelope-from <linux-media+bounces-59863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:39:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA1487292
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A800630C1C34
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E666F37B033;
	Tue, 28 Apr 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dyey7wT3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6837998B;
	Tue, 28 Apr 2026 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386640; cv=none; b=myGkzlYW+jV6y3VtdryVdKClZAnTqkEBmtnvPeYf04cm+xmG06IZAMfJjqKf253fJRJDrSskAXmVAtxDdngDVY7lMeliXZyGU4O3novU8TN/iEoOxXOc49VAUH/PWgjFKFqOIJvmlELM/+htTRZPv7fVDhAI/hw8tg4VaPzAt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386640; c=relaxed/simple;
	bh=O1d8jK3KEsymM222o8UDBPpnkBrW80wRlhGqFv91dGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PS3KJusae7ar2HpN1lkl8GqwlzCJGt+M+/B4QQ3rKnT2cXJHertijFWzrqhFGZ0vudu7z+329MVLYt9UsnpeMCTRLCMeRmwuDNRktRt/13I2ha5IAi8dW5+wPq2rjjS6LlVNg3XeLACzK+GjmBBTrt3KeGjVVGwzDMwh7+0nbKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dyey7wT3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777386636;
	bh=O1d8jK3KEsymM222o8UDBPpnkBrW80wRlhGqFv91dGk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Dyey7wT3capCNy7S1aLuY9NyN8WtSPi39xVoU3y0AkWShbUKbk/hdvLH/a6uhSxnj
	 jAPKA+SQVyzE2skrLg92ZhNI6lYix02pQ3Ks43ELwHHGDrAUhoa7zArCWtM8HLI6LL
	 CEooSul6hqbptcddZIUh6en3TthoLvolbUz3LXkXjbDpn/hiTT42oLa2weM14022t3
	 JDj6jiZs9eXQJiNQY7U8C7ATLrOfMxBPlsQdz+duYL07IhEPc3qStCy6KORnbK0KAG
	 3Ui6c+O0pUhX6K9Ron+Yz/F1CJWRsQIO93ULPXaeQNbTmq389OZluqtOnG6xiQPsIJ
	 dupXDP9BakdGQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECA2317E0F33;
	Tue, 28 Apr 2026 16:30:35 +0200 (CEST)
Message-ID: <727f018e014b5965802f1b3369e1c118c487d0e6.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Fix format enumeration when
 post-processor is mandatory
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Date: Tue, 28 Apr 2026 10:30:34 -0400
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
	protocol="application/pgp-signature"; boundary="=-8Jpkvf0gMzcEeQQU4+Ih"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C4BA1487292
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59863-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-8Jpkvf0gMzcEeQQU4+Ih
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 10:37 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> When a post-processor pixel format is mandatory (i.e. when an AV1
> bitstream use film grain feature) the driver must only enumerate
> post-processed format.
> Use the context format to know what is suppose to be enumerated.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 80c7373a456e ("media: verisilicon: Conditionally ignore native for=
mats")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
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
> =C2=A0	for (i =3D 0; i < num_fmts; i++) {
> =C2=A0		bool mode_none =3D formats[i].codec_mode =3D=3D HANTRO_MODE_NONE;
> =C2=A0		fmt =3D &formats[i];

--=-8Jpkvf0gMzcEeQQU4+Ih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafDEigAKCRDZQZRRKWBy
9LkdAQD96Pf16DIobHW2seYVhEmFsDMuHmcO7zmAS3khX0ah6AEA2uEpp53yRK0B
bRSnnBTnA08gAb9NtlQUvvTibfEDdg0=
=hZwz
-----END PGP SIGNATURE-----

--=-8Jpkvf0gMzcEeQQU4+Ih--

