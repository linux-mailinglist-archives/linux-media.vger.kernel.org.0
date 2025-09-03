Return-Path: <linux-media+bounces-41691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E0B4224F
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CBE01B2439C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE0630AACE;
	Wed,  3 Sep 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gygmG0je"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260B2749D9;
	Wed,  3 Sep 2025 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907102; cv=none; b=ASWWBnyaLPzCpouINo8mJK6NpirQrUcdZbGl647PEaBLfiga04RFHFGMBeWtreoWeW+N7pM9ZBwlKoyaARlYpbVIh0BORZEP06KSG1Sjxt0/Xw6W7TOY7YSShfDI6emYaXusILGwGbllT6nbxKJSb6oQMaaLxG/N+0KYjJJrGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907102; c=relaxed/simple;
	bh=ueWHIf9d79yBu/xoe2MyNyLUSaPK1ynnR4XQhYYYAAg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fk47kKBklz1wtqt8F13MAeY6gs5LebzYGS6rFr9ymXaG6ZoNcicmGAsjnCp4Yq99aCePbzxK9Y1cpH3MF3TMBgLwAE+dSjqUdd7QG45rnXVHKR0gpZ7gEd2+rkhuT+g5fQfCNKjy0KzdxC/g03V3Z8OdVLnafP9t8czrnWqmmQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gygmG0je; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756907098;
	bh=ueWHIf9d79yBu/xoe2MyNyLUSaPK1ynnR4XQhYYYAAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gygmG0jefBTVHTdvu7MTAa1kGNz0BtjW8x4yYTuee16ehpKx5198ZSqNRqXNH5ynr
	 fHvybg3f/PiNcsYz5nzjg7DKdlmoqUckBN9F8xB8IeADqDTCcHpWUFWEaRlKzR8yIP
	 bjIO5PVx4kKJpxOGi9yynyilLPxu9147ONUaURTyO/QCdc22pq0/Y1qhDyR0Iy4+TN
	 bBKFLj6kOhMOGhHreQM5+9mGdvAtBX8sYXqUDuTT5rHrsocV5mufSQS88mFOoSJ0FY
	 sZ2jNgRB3/RZQC54P6bIpfdDhVGmNpPtqsrgGgPgYvMbQYhuPVBY57VYaZrOttJqaX
	 J4mRJNaDDThuQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 262D717E0199;
	Wed,  3 Sep 2025 15:44:57 +0200 (CEST)
Message-ID: <d70c5113608c89fd79687a7669b0fa53140bea7b.camel@collabora.com>
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alex Bee
	 <knaerzche@gmail.com>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 09:44:54 -0400
In-Reply-To: <8394c12a-1e1e-44fc-9bb5-92a464dfe410@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-2-jonas@kwiboo.se>
	 <432ab63698b27ca5bce3a7a30d630685aff782b6.camel@collabora.com>
	 <8394c12a-1e1e-44fc-9bb5-92a464dfe410@kwiboo.se>
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
	protocol="application/pgp-signature"; boundary="=-01LGmJnWEk6ULtBixrzA"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-01LGmJnWEk6ULtBixrzA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 septembre 2025 =C3=A0 09:28 +0200, Jonas Karlman a =C3=A9cri=
t=C2=A0:
> Hi Nicolas,
>=20
> On 8/29/2025 10:22 PM, Nicolas Dufresne wrote:
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
> >=20
> > Re-reading myself, most of my comments were off or really "nitty". So l=
et's move
> > forward and spare you the v3. Detlev is happy to rebase and work on top=
 of your
> > series, so let's help everyone getting better RK codec support.
> >=20
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Just to be transparent, during testing, it was notice that some concurr=
ent
> > decoding resulted into failures. I tested Detlev port to structure regi=
sters,
> > and it didn't change anything (so probably not a stalled state, or one =
that we
> > control). This could easily be a HW issue with older chip. Since you ha=
ve used
> > this for years without major issue reported, I happy to move on.
>=20
> Thanks, I found some minor changes compared to the LibreELEC version
> that I am running some new tests on, plan to send out a v3 as soon as
> testing completes later today.

Ok, I will be patient then.

>=20
> In LibreELEC version we enable some error detection,
>=20
> 	// sw_cabac_error_e - cabac error enable
> 	writel(0xfdfffffd, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> 	// slice end error enable =3D BIT(28)
> 	// frame end error enable =3D BIT(29)
> 	writel(0x30000000, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
>=20
> and in this series it was fully disabled to closer match H264/VP9:
>=20
> 	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> 	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

In error detection mode, the IP will emit an IRQ on the first error. It doe=
s not
self reset, this is just to let you read the macroblock index that wasn't
decoded properly. The problem is that we don't know how to resume it. That =
lead
to HW lockup and timeout on packet lost during RTP streaming tests. It is l=
ikely
best to keep this off. It is meant to be used to do concealment of lost
macroblock in software.

>=20
> There is also an extra memset(0, ...) in rkvdec_hevc_start:
>=20
> 	memset(priv_tbl, 0, sizeof(*priv_tbl));
>=20
> This should not really be needed and was removed in this series.

Ack.

>=20
> Still unclear if any of these will result in a changed behavior. Enable
> of cabac/slice end/frame end error could possible activate some more
> states when block issue a self-reset, but I am only guessing.
>=20
> One thing to note for the flaky tests is that when they fail, they
> typically just end up with a different consistent checksum. I have not
> done any visual inspection of those frames, but will extract each frame
> and compare them both bitwise and visually.

Thanks, looking forward v3. Please note the fh changes, which I needed to
manually apply here.

Nicolas

>=20
> Regards,
> Jonas
>=20
> >=20
> > regards,
> > Nicolas
> >=20
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
c-hevc-data.c
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc.c
>=20
> [snip]

--=-01LGmJnWEk6ULtBixrzA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLhGVgAKCRDZQZRRKWBy
9FCIAQCI6CQzFHJa2ahw9v9vkMrM8rY/vHwc0Y9bQvtjN0ajggD+IDtToz6FywF5
f3aZ8Z6hHZTjgca9WG/TO6CEF2n7swQ=
=kQsS
-----END PGP SIGNATURE-----

--=-01LGmJnWEk6ULtBixrzA--

