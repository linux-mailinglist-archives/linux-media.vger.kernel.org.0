Return-Path: <linux-media+bounces-53616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IuDFwakoGk9lQQAu9opvQ
	(envelope-from <linux-media+bounces-53616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:50:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 059371AEB07
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4DEB309579C
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D19451076;
	Thu, 26 Feb 2026 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WgS5S/ZO"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9867451057;
	Thu, 26 Feb 2026 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772135119; cv=none; b=VMGcKsxFvj2JnQt4lzs7UwRDy2d92Dbh5JFURDoMiPni5LZnKrndUU2ST53SeHGYJ2B31WR4Scc1JWHl3Q0vZIa731d5X85/kEZZURNqLY8mOk72DehI0cw7puvy6xI3b4TkRFkUvb3cKrWvY4eeX7jQbTGrtGmArd0V33YtrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772135119; c=relaxed/simple;
	bh=Htt6VCrCH3vnq7s4qMqPAlg58/6Hv1w1mILXYmV4QWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tzGGmBmTAMwZtBSDo7eEZrpiG9Bn6uOb0OQ848D+jFAqSxaW7OboY2wFYAh4b6Z6mDgths86Cox2ExnFmL13CXlk51SP2lCIPRruY446N+IPmWZ2dsWZlN8c5lcgo/9g5Pf7Ed4Iz+c+RUDa1x2pY13c62VRRX37QAKEfYPqt2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WgS5S/ZO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772135116;
	bh=Htt6VCrCH3vnq7s4qMqPAlg58/6Hv1w1mILXYmV4QWQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WgS5S/ZO7TSdqprtgR6bQsf4WDSFyI3gKW842oS+BDmb2aSoxhJ8bHRhe7gYSgD48
	 P9fRWTgB/6xaMAdt5rahzBB/Q6xzvZxKl9VNzettz97gPfSLwzFR6z4wlJeVhuJlUD
	 exJiPc/iFvlVB+sHms6+1RIf3D18aDqy330yz6+b2LFpDyvj/3FYjbjM5Q+RYSMySg
	 pIIj4sxpAD+QgtbpegyP9PUelLixra7m5Xjk+6M69sXi3md49fMZaZXlIu7JXHkRtN
	 tQUTUbm84a+z+MfeHpVtHkpbn73TY3IK1ygZN5rZpJDDtbMbJ3CDzAD2oCukD8EWt6
	 AZLkzEIWDFuLg==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFEED17E0948;
	Thu, 26 Feb 2026 20:45:13 +0100 (CET)
Message-ID: <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>, Cristian Ciocaltea
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
Date: Thu, 26 Feb 2026 14:45:11 -0500
In-Reply-To: <20260226-salute-threaten-a3eabb232396@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
	 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
	 <20260226-salute-threaten-a3eabb232396@spud>
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
	protocol="application/pgp-signature"; boundary="=-6UGd8Ri2+YJO1QGD5T1b"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53616-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 059371AEB07
X-Rspamd-Action: no action


--=-6UGd8Ri2+YJO1QGD5T1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 18:43 +0000, Conor Dooley a =C3=A9crit=
=C2=A0:
> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > With the introduction of the RK3588 SoC, and RK3576 afterwards, two mor=
e
> > register blocks have been provided for the video decoder unit.
> >=20
> > However, the binding does not properly describe the new hardware layout=
,
> > as it breaks the convention expecting the unit address to indicate the
> > start of the first register range, i.e. 'function' block is listed
> > before 'link' instead of the opposite.
>=20
> I don't understand this commit message or rationale for an ABI break.
> Changing the unit address seems like a "free" fix to your problem,
> especially when reg-names is not a required property that you can rely
> on. Actually, there may be a bug in the driver - it expects reg-names
> for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> presence for those devices.

If the bindings had been held instead of released early, the order would be=
 what
is done in this patch for sure, and no one would have complained. These bin=
ding
have never been used by anyone so far, and what you are asking is to create=
 a
DTS that deviate from the vendor provided documentation for the IP base add=
ress.
I know you have all technical fancy reasoning, but I like when things are
functional and effective to work with.

>=20
> Deprecating the order also makes little sense to me, given that some of
> these devices only have one reg entry, which as far as I can tell from
> looking at the driver *is* the "function" region, so it can never be
> entirely deprecated.

What I'd like to see, is a binding expression that behave like a set, not a
list, and leave the ordering open. As people keep repeating, there is nothi=
ng in
a binding that assist to define the right ordering (its not address or base
addres aware). That basically means, we can't as reviewer see that ordering=
 is
going to imposing using a base address in the unit name (which is a conveni=
ence,
not a rule I suppose) that differ from the vendor documented base address.

By explicitly removing the ordering in the binding, we create a strict rule=
 that
driver should retrieve this by name, and never assume the ordering, which I
personally like.

thoughts ?

Nicolas

>=20
> Confused,
> Conor.
>=20
> >=20
> > Since the binding changes have been already released and a fix would
> > bring up an ABI break, mark the current 'reg-names' ordering as
> > deprecated and introduce an alternative 'link,function,cache' listing
> > which follows the address-based ordering according to the TRM.
> >=20
> > Additionally, drop the 'reg' description items as the order is not fixe=
d
> > anymore, while the information they offer is not very relevant anyway.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 | 20 ++++++++++++-----
> > ---
> > =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > index 809fda45b3bd..c513b68d2c72 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -28,16 +28,20 @@ properties:
> > =C2=A0
> > =C2=A0=C2=A0 reg:
> > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > -=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function configurati=
on registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table configura=
tion registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configuration =
registers base
> > +=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0
> > =C2=A0=C2=A0 reg-names:
> > -=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: true
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Use link,funct=
ion,cache block order instead.
> > =C2=A0
> > =C2=A0=C2=A0 interrupts:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> >=20
> > --=20
> > 2.52.0
> >=20

--=-6UGd8Ri2+YJO1QGD5T1b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaCixwAKCRDZQZRRKWBy
9JiHAP4os7RdZaABz35jtFTqxJdGRCHiZ2JyeJsCH7Yj8wqZ1gEAs/hIPqsAIIGJ
I/RUZ0zI4YsAWeThrjFOkFlZA7v8NwE=
=jF9G
-----END PGP SIGNATURE-----

--=-6UGd8Ri2+YJO1QGD5T1b--

