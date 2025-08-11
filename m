Return-Path: <linux-media+bounces-39458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F68B2166A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 822B1177229
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 20:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026E52DFF3F;
	Mon, 11 Aug 2025 20:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V7mApP9g"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1872D9EDD;
	Mon, 11 Aug 2025 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944057; cv=none; b=lSM1CB5zcZgRETPbzcUd/2ORpN6rSDS8L0o+uI5m889cx+K4gxPg4eDf8G9icY1lzeowj2Z7mJDmxCr/0xoiTN6JnM1EAhpQcojwVhmPlhnUj6aucIveYeVafama7cJVbCSqLT8JVz57UDtkvxzWlHOqKcTjSUyR39Cds8U9/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944057; c=relaxed/simple;
	bh=97/FktGL1WOXce4gBvBtsbBUHJjxPvrKCEWOXUD7x0A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HRjy3RWm3Z8OcDaEIN152fHAIFSkwzKlsosUrZFKLoaBrCgVVRA7/Bz8KnD9B/i6JbSWuyu2fBdxhqdPR+lYTsLqwyYJNZwdM9q9FfJRh4PooNczC+K6IlbXRfcYj5zlx/XOszMHHLiZMwDqx5TVeZ+ma1xxYnH6G4HH8yTRaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V7mApP9g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754944053;
	bh=97/FktGL1WOXce4gBvBtsbBUHJjxPvrKCEWOXUD7x0A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V7mApP9gHD2h8fQ/FCG0mp2/K5QdXJNnbdr4X1Dm5Ny53ABy3jt6WwcwFdGDJ0AG+
	 9oaiI43faZxshCNzTAgHMDzGGfiHkRctvSaoBwDaL7YU76QCHPxICQTuT9jWxScDvw
	 D/ujR0cMQCRBhUEr8R7v5D0XpEKfCm1LSkYg94fIe3L3reaq/zybv0JZEtPym8BxdX
	 Czx3xfeLm4LthxppoH4sdImmoHGyPuJOgqPBullyVQ6/P9nG0NYHl+4+6UuGLCtSw0
	 VPKgmDPiKuWwYD6pDNwq7vIzd51BwzsHVkANfL7BeQESSudlXTg1BnHk8R0xVUNyhe
	 uXUT5iUdP13LA==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA64817E0C87;
	Mon, 11 Aug 2025 22:27:31 +0200 (CEST)
Message-ID: <017fee1a5aa36205430d0e32c84629375523f5ff.camel@collabora.com>
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Sebastian Fricke	 <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 16:27:29 -0400
In-Reply-To: <d0d50da8-f8bb-4a6f-bd44-5199d26b7a86@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-2-jonas@kwiboo.se>
	 <9c8cb837d10d3cdd54fe34dedfe40c10e848f648.camel@collabora.com>
	 <d0d50da8-f8bb-4a6f-bd44-5199d26b7a86@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-i9Oq4aZo3lZiAeIGW3ru"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-i9Oq4aZo3lZiAeIGW3ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 11 ao=C3=BBt 2025 =C3=A0 21:46 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 8/11/2025 9:12 PM, Nicolas Dufresne wrote:
> > Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=
=A9crit=C2=A0:
> > > The Rockchip VDEC supports the HEVC codec with the Main and Main10
> > > Profile up to Level 5.1 High tier: 4096x2304@60 fps.
> > >=20
> > > Add the backend for HEVC format to the decoder.
> > >=20
> > > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > ---
> > > Changes in v2:
> > > - Use new_value in transpose_and_flatten_matrices()
> > > - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> > > - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> > > ---
> > > =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +-
> > > =C2=A0.../rockchip/rkvdec/rkvdec-hevc-data.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1848 +++++++++++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 817 ++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 2 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0=
=C2=A0 76 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> > > =C2=A06 files changed, 2745 insertions(+), 1 deletion(-)
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc-
> > > data.c
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc.c
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile
> > > b/drivers/media/platform/rockchip/rkvdec/Makefile
> > > index cb86b429cfaa..a77122641d14 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> > > +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> > > @@ -1,3 +1,3 @@
> > > =C2=A0obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) +=3D rockchip-vdec.o
> > > =C2=A0
> > > -rockchip-vdec-y +=3D rkvdec.o rkvdec-h264.o rkvdec-vp9.o
> > > +rockchip-vdec-y +=3D rkvdec.o rkvdec-h264.o rkvdec-hevc.o rkvdec-vp9=
.o
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.=
c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
> > > new file mode 100644
> > > index 000000000000..eac4ea604949
> > > --- /dev/null
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
> > > @@ -0,0 +1,1848 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Rockchip Video Decoder driver
> > > + *
> > > + * Copyright (C) 2023 Collabora, Ltd.
> > > + *	Sebastian Fricke <sebastian.fricke@collabora.com>
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#define RKV_CABAC_TABLE_SIZE		27456
> > > +
> > > +/*
> > > + * This file is #include from rkvdec-hevc.c and not compiled.
> > > + */
> > > +static const u8 rkvdec_hevc_cabac_table[RKV_CABAC_TABLE_SIZE] =3D {
> > > +	0x07, 0x0f, 0x48, 0x58, 0x58, 0x40, 0x40, 0x40, 0x40, 0x40, 0x0f,
> > > 0x40, 0x40, 0x40, 0x0f,
> >=20
> > Nit, in H.264 case, we managed to fill the CABAC based on the spect wit=
h
> > macros,
> > didn't we figure-out this one ? I didn't check in Detlev tree, I'm just
> > asking
> > here.
>=20
> As hinted at in the cover letter: in the initial implementation used for
> LibreELEC I just shamelessly copied the cabac data 1:1 from the Rockchip
> mpp library, for this series it was replaced with the cabac table from
> Sebastian Fricke prior series to add a HEVC backend [1]. Sebastian
> mentioned following regarding the cabac table:
>=20
> """
> Notable design decisions:
> - The giant static array of cabac values is moved to a separate c file,
> I did so because a separate .h file would be incorrect as it doesn't
> expose anything of any value for any other file than the rkvdec-hevc.c
> file. Other options were:
> =C2=A0 - Calculating the values instead of storing the results (No clear =
pattern
> =C2=A0=C2=A0=C2=A0 found for the calculation using the static array and t=
he formulas from the
> =C2=A0=C2=A0=C2=A0 specification)
> =C2=A0 - Supply them via firmware (Adding firmware makes the whole softwa=
re
> =C2=A0=C2=A0=C2=A0 way more complicated and the usage of the driver less =
obvious)
> """
>=20
> I have not explored any other way to handle the cabac table based on
> these design decisions.
>=20
> [1]
> https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0=
-fa1897efac14@collabora.com/

I see, I guess if we don't know how it was generated, there isn't much we c=
an do
about it.

cheers,
Nicolas

>=20
> Regards,
> Jonas
>=20
> >=20
> > Nicolas
>=20
> [snip]

--=-i9Oq4aZo3lZiAeIGW3ru
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJpSMQAKCRBxUwItrAao
HOTrAKChQb418dF5D1psffW41seij+dvEgCgmJmwxhVAqiRs4EdF46/syDW1+7w=
=5k7o
-----END PGP SIGNATURE-----

--=-i9Oq4aZo3lZiAeIGW3ru--

