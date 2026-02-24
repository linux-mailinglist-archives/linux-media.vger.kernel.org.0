Return-Path: <linux-media+bounces-53294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEGUKbSlnWmvQwQAu9opvQ
	(envelope-from <linux-media+bounces-53294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:20:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A31878B6
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 153CA306ACC5
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 13:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2918339E18C;
	Tue, 24 Feb 2026 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hg0MsWYR"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE439E186;
	Tue, 24 Feb 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939070; cv=none; b=I1gE0e8ldHeWOA9RGjQvB+lp8NDCYYMstOjT9IYHeolyO5ZdDg6iE2ON2DRcb28TEGL3l+ABs8K4ZzjiT+Q78O9qyTYvAgTO8ufGiHfca5dR2MBuxnNGiWlF/aJVdGpBfXi4AOd0QgkUT2vP6MyZl3xuRsp5ON7354sfTONKnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939070; c=relaxed/simple;
	bh=2VI6nOomYDX8EwYV4/q49oHhrG90jmgi4U/LV+aBRts=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uq239b4HoUShgAS3mpsNmJacu7RN6lpVwHuuDfyZEMYCH8OkL0+xJPPm9lXbW2PIT6+Osuf2UaMfTy3yo9ckMfs9mz6O1wuvYNGqpCvC7x6hXTYICIbGDODNRWAjI4/sDnD4/qq1B7tBTjjoEsIsB3fekJfxS5Qg3QSgEefIkbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hg0MsWYR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771939067;
	bh=2VI6nOomYDX8EwYV4/q49oHhrG90jmgi4U/LV+aBRts=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Hg0MsWYRo/nnvj4o5r/xu7+v8czkfssXjeEjlmBwtEvjGLSCITtFB7giuIOjn9eWs
	 1WKxIduihoa/Nr7zJHkcEWGIxCPOngp3qlkCOO4lp2yjdAmD5E5DElXdkY+plHdVVQ
	 vEFaYBO6mhoRqEaDQ67LYNSZcy9ypHUKn3WVEmePzShqasb61nrfSBczdTHue/Ie7S
	 WdYZ6DzZMmjc0WR9jNT8wCgvNf7as9K0Z/KNC93vMymfmbTs5KDYOYkXuvwN4bzBkY
	 fQWjGvAbYHFnduLhlBf2+EQFCKPfJLEiONB0zF+Ltpma4vsX8IZ8xexAlSFaLlbnzh
	 d9q4/vrK5Rqew==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C976517E01E7;
	Tue, 24 Feb 2026 14:17:45 +0100 (CET)
Message-ID: <366daf706b5dc3942e3340f29151ece1f49460e0.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Cristian Ciocaltea
	 <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 kernel@collabora.com, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley	 <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Date: Tue, 24 Feb 2026 08:17:44 -0500
In-Reply-To: <20260224-glaring-poetic-goshawk-b44d7b@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
	 <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
	 <20260224-glaring-poetic-goshawk-b44d7b@quoll>
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
	protocol="application/pgp-signature"; boundary="=-cvvz0gfg/4oyTxCxnCsz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53294-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1.168.49.192:email,collabora.com:mid,collabora.com:dkim,collabora.com:email,27b00000:email]
X-Rspamd-Queue-Id: 829A31878B6
X-Rspamd-Action: no action


--=-cvvz0gfg/4oyTxCxnCsz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 24 f=C3=A9vrier 2026 =C3=A0 08:22 +0100, Krzysztof Kozlowski a =C3=
=A9crit=C2=A0:
> On Mon, Feb 23, 2026 at 09:49:50PM +0200, Cristian Ciocaltea wrote:
> > When building device trees for the RK3576 based boards, DTC shows the
> > following complaint:
> >=20
> > =C2=A0 rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video=
-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>=20
> So you need to fix the unit address. This is what the warning tells you.

The unit address is where the register range starts. Picking a random point
inside the range is just bad idea. For anyone that uses spec to develop the=
se
drivers and device tree, its just plain difficult and error prone.

>=20
> >=20
> > Provide the register blocks in the expected address-based order.
> >=20
> > Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decod=
er on rk3576")
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
> > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3576.dtsi
> > index 49ccdf12ef7e..45eb0d053a6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
> > =C2=A0
> > =C2=A0		vdec: video-codec@27b00000 {
> > =C2=A0			compatible =3D "rockchip,rk3576-vdec";
> > -			reg =3D <0x0 0x27b00100 0x0 0x500>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00000 0x0 0x100>,
> > +			reg =3D <0x0 0x27b00000 0x0 0x100>,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00100 0x0 0x500>,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00600 0x0 0x100>;
>=20
> The main block, so probably the lowest address as in unit address,
> should be used, but this ship has sailed. You shipped this DTS, because
> the order of items is FIXED. Your binding change is clearly incorrect
> and ABI break without explanation and without reason, so you cannot use
> such as an argument here.

Its not released yet.


> You cannot change it without impact, so just fix the unit address.

I completely disagree with that.

Nicolas


--=-cvvz0gfg/4oyTxCxnCsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZ2k+AAKCRDZQZRRKWBy
9B7vAP47G+wCvT4HAirrFY7mJS0pSbKTNPlDGG+sbMVBZF5jogD/aFs4ud4Gi6SX
DRuI6CS3MlRp1ywT1oYN5ozDVKoBig4=
=UcYd
-----END PGP SIGNATURE-----

--=-cvvz0gfg/4oyTxCxnCsz--

