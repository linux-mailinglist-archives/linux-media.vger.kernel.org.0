Return-Path: <linux-media+bounces-57634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMXQEs+Hymn09gUAu9opvQ
	(envelope-from <linux-media+bounces-57634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:25:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEA35CC55
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5BE7303BB0B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F7A3D9DD4;
	Mon, 30 Mar 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fK97Qm2w"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E763D812F;
	Mon, 30 Mar 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880254; cv=none; b=bJuZT7xWh60UwK9/U+fy3xsjhCHQ3QIEHqMzolPsMeMP/irksJsBpqgBXM4yqve1HPJ0AxnjKQXTFBBVHHs/2I/vvfQU72dZzrVCBdzirKeytOEviCc8sBK9/TCAAz+K4igq2OpyvuUIlefXWwT/C89Dv0Z7VfyKR2WH13UFsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880254; c=relaxed/simple;
	bh=YXD0cPHX7FzEdOQwXJrWO33JjySneVnOOD3EPxs1EoY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k7DaMEFQMQkzjFJdB5W5VKHU6KtvwNbDG4iVyCkSE8r2FD8Crpl9I3gxVG+sovWpzzvNy1kc+td0S+cNEwYt1uHt8D9ow2b6yLkO+di6bL9P34Eb9Y1yP7UP0EY3wmnxvFvscARIAshvQHvVh/3FXg9oFl8ozqstwaVj/H55E1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fK97Qm2w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774880251;
	bh=YXD0cPHX7FzEdOQwXJrWO33JjySneVnOOD3EPxs1EoY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fK97Qm2wvpdCOdiM3bHzyQ6O171iALrqVd43ZjNhW1jyvVmbT5I2RTOj0tnLJagSV
	 4MkeRWKdMR+dW9/OKSUj14m+CWW+PV365Lw1Gg/Zq6HZEWavUKd7olgJ9PjjBMWzQG
	 dO0iRxrgC1xuq1+ocvuqQXe8sQ+K7UH00ZJWvakonhpJY0IwXQ/lNHFW1LKz+URXLR
	 qzOW5CSpjvfQNTxT4y46Np1DpriMNxgdwWjjUZhLsH23HZE4Glv9bXGby8SwFCmvJA
	 X8lRcLyGeL4IMgwPJItaqhdTgVH4W0RAVR3ny+Z0CYMm57iv+yqRfj/jl0Z2GsmMUU
	 DBHrpsOJkhzAg==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1671317E4686;
	Mon, 30 Mar 2026 16:17:28 +0200 (CEST)
Message-ID: <c177cd8ffb59ea63a26906577ba737677551cd0d.camel@collabora.com>
Subject: Re: [PATCH 1/4] media: rkvdec: Introduce a global bitwriter helper
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
Date: Mon, 30 Mar 2026 10:17:26 -0400
In-Reply-To: <20260327-rkvdec-use-bitwriter-v1-1-982cf872b590@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
	 <20260327-rkvdec-use-bitwriter-v1-1-982cf872b590@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-yBgy0sQvaoJVzhLo4NBc"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57634-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: A0FEA35CC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-yBgy0sQvaoJVzhLo4NBc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 mars 2026 =C3=A0 11:16 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> The use of structures with bitfields is good when the values are
> somewhat aligned.
> More mis-alignement means that compilers need to do more gymanstics
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
> =C2=A0drivers/media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-bitwriter.c=C2=A0=C2=A0=C2=A0 |=
 30 ++++++++++++++++++++++
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-bitwriter.h=C2=A0=C2=A0=C2=A0 |=
 25 ++++++++++++++++++
> =C2=A03 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index e629d571e4d8..11e2122bcbbf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -2,6 +2,7 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) +=3D rockchip-vdec.o
> =C2=A0
> =C2=A0rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec.o \
> +		=C2=A0=C2=A0 rkvdec-bitwriter.o \

Its just one function, with 10 lines of code, can we inline it in the heade=
r and
drop the object ?

> =C2=A0		=C2=A0=C2=A0 rkvdec-cabac.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264-common.o \
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c b/=
drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
> new file mode 100644
> index 000000000000..673ebb89002b
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Video Decoder bit writer
> + *
> + * Copyright (C) 2026 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/bits.h>
> +
> +#include "rkvdec-bitwriter.h"
> +
> +void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 val=
ue)
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
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/=
drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> new file mode 100644
> index 000000000000..44154f1ebc65
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Video Decoder bit writer
> + *
> + * Copyright (C) 2026 Collabora, Ltd.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detlev Casanova <detlev.casanova@collab=
ora.com>
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + */
> +
> +#ifndef RKVDEC_BIT_WRITER_H_
> +#define RKVDEC_BIT_WRITER_H_
> +
> +#include <linux/types.h>
> +
> +struct rkvdec_bw_field {
> +	u16 offset;
> +	u8 len;
> +};
> +
> +#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len=
 })
> +
> +void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 val=
ue);
> +
> +#endif /* RKVDEC_BIT_WRITER_H_ */

--=-yBgy0sQvaoJVzhLo4NBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqF9gAKCRDZQZRRKWBy
9NNPAP9m/C7TMvFwXyQT8rK+UCGFvzuLY32by5+QAQwsH+fP4wEAoC19z0cPX+2k
voSc2sk6B5FI6fzPOJXJX9z9XlPO0go=
=/Y4+
-----END PGP SIGNATURE-----

--=-yBgy0sQvaoJVzhLo4NBc--

