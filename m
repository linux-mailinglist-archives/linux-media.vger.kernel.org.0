Return-Path: <linux-media+bounces-60007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePF3GWRL8mnNpQEAu9opvQ
	(envelope-from <linux-media+bounces-60007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:18:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D89498E43
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 627A8300B9C9
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442BA3368AF;
	Wed, 29 Apr 2026 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BzqUK7q/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F416341B36F;
	Wed, 29 Apr 2026 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486669; cv=none; b=lU5cHgJsPNMwnSYAmFP4llLujT+AkzBxxfwPyj9MLgDdNZyhSlTRA107sGUCK4UkKU2D5o/wK7s9JV2lr0NgpLUjKXsfkAxCg/RCPh3S+eG4Y9OTpgGw9vs0NSbr2fm3AM3K+8OKXYq/nQ7udREQjm2FJhNymLIKBOh5MthNbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486669; c=relaxed/simple;
	bh=f3X2sCykS3XjkcDUPz13DMo3K1nn3Ll6Ytr0HV222vA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DT2NKspAQ7QWwpjJ8FIDw+firAXhwVloqFC36fZM7vpEi2+Op4iX2QjZOhMHU4WIW1VRxEhpC06mIX3P6dkGEV3H1kKYZGlWPDMyYG2c7f19J/yfKDMRWrn1FcwWEh5pB44UWGag1k34m3BCBKPkxXRWF1JiZ47B7hMYGzocICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BzqUK7q/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486662;
	bh=f3X2sCykS3XjkcDUPz13DMo3K1nn3Ll6Ytr0HV222vA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BzqUK7q/gl2Kb0JE88v3rX78GCbNczyUnEhAYIv+P5Z8H9J5IczADQUAMJY7FSaJi
	 qj8n8X89wkD1w6YnX+ct+flH/M7o9uVofUM+Wr4Izwl+rVsi+vr/ls3gMDDsTdN43a
	 /u16p4sFIeb1gsC+Pxap0+sf1wCrZyR/wuBD97/S3nRkYwCu14a7InTxZenyeFm6v4
	 lIzAC3C0CEzywaNkacylIKxsc94aKFyHRGGiyurEg6w5qRiOfayUUpjW45XgKvqAaK
	 0VjtjRQXcMfD0PUWj0oesqwM00dJIhD/u8GBaJ26MPTZiBR8jul+t9v7ssSoQzijLg
	 gTR73FqJv8NHA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F07C17E05FC;
	Wed, 29 Apr 2026 20:17:41 +0200 (CEST)
Message-ID: <40b8ba9bd3ca1926d8550b9345a21851cbbb61ba.camel@collabora.com>
Subject: Re: [PATCH v3 1/4] media: rkvdec: Introduce a global bitwriter
 helper
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, kernel@collabora.com
Date: Wed, 29 Apr 2026 14:17:40 -0400
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
	 <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-ojEsNyi3XYjWjFdaxKBG"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 37D89498E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60007-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


--=-ojEsNyi3XYjWjFdaxKBG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 10:06 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> The use of structures with bitfields is good when the values are
> somewhat aligned.
> More mis-alignement means that compilers need to do more gymanstics
                                                           gymnastics
> to edit the fields values.
>=20
> Some cases have been reported with CLang on specific architectures
> like armhf and hexagon, where the compiler would allocate a bigger
> local stack than needed or even completely freeze during compilation.
>=20
> Some fixes have been provided to ease the issues, but the real fix
> here is to use a bitwriter instead of heavily unaligned bitfields.
>=20
> This is a preparation commit to provide a global bitwriter interface
> for the whole driver.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-bitwriter.h=C2=A0=C2=A0=C2=A0 |=
 39 ++++++++++++++++++++++
> =C2=A01 file changed, 39 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/=
drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> new file mode 100644
> index 000000000000..2a5c271ade91
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Video Decoder bit writer
> + *
> + * Copyright (C) 2026 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>

nit: indent it the same for for your name.

I will do the edits if I find now other issues=C2=A0in the series.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> + */
> +
> +#ifndef RKVDEC_BIT_WRITER_H_
> +#define RKVDEC_BIT_WRITER_H_
> +
> +#include <linux/types.h>
> +#include <linux/bits.h>
> +
> +struct rkvdec_bw_field {
> +	u16 offset;
> +	u8 len;
> +};
> +
> +#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len=
 })
> +
> +static inline void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field =
field, u32 value)
> +{
> +	u8 bit =3D field.offset % 32;
> +	u16 word =3D field.offset / 32;
> +	u64 mask =3D GENMASK_ULL(bit + field.len - 1, bit);
> +	u64 val =3D ((u64)value << bit) & mask;
> +
> +	buf[word] &=3D ~mask;
> +	buf[word] |=3D val;
> +	if (bit + field.len > 32) {
> +		buf[word + 1] &=3D ~(mask >> 32);
> +		buf[word + 1] |=3D val >> 32;
> +	}
> +}
> +
> +#endif /* RKVDEC_BIT_WRITER_H_ */

--=-ojEsNyi3XYjWjFdaxKBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJLRAAKCRDZQZRRKWBy
9CfpAQDqF14g5OufVsa2Fpra0HvendS7U/2GaNB0mAdxpVSheQD/VHfDT4/LbugD
q9xHQ7ZBhrVCWlO17vwUUH9yJW1KegE=
=4+T8
-----END PGP SIGNATURE-----

--=-ojEsNyi3XYjWjFdaxKBG--

