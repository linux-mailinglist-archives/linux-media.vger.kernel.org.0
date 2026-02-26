Return-Path: <linux-media+bounces-53639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPKBNzPMoGmlmgQAu9opvQ
	(envelope-from <linux-media+bounces-53639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:41:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964671B07C4
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 737673054CB9
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ACB429830;
	Thu, 26 Feb 2026 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gjbHlz8+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122E3AE6F4;
	Thu, 26 Feb 2026 22:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145687; cv=none; b=Q7MbeUWQF1uh5dy8NYIdeOT1F9LFbz6ReK+pYgzTTgmP3naYvbcKJXOqmNGr+CdCpQcKlDiaYwUZXa3SihrSOy4Kmx7ewzj1PU68lqaRaqbZp60f17tSuyoxZ0qlHum0UyEw779AzX/vki2jop6VNWWib7lC5yZtmYgWcjBkyE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145687; c=relaxed/simple;
	bh=8qI83zGvdJ8aCzsFj2jHkPE3OSgD7zlBFk/sa+h+2G8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wywq15338+50urY9KX7p0RNE64OqqJ95lkZfNsa/2awmBfb+XLd8AK7msa1DaV0P2hrLYFcrKVjJ/CE0wi2r31n9qThjt4eyImaA8hUpK2jMPwN6qpogna0poKy52vOn/VkjBJZX1erNfeRoLO0p8tP2LXVGzUF1MQ9QRQmEHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gjbHlz8+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772145684;
	bh=8qI83zGvdJ8aCzsFj2jHkPE3OSgD7zlBFk/sa+h+2G8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gjbHlz8+ivSHsLj9rNGB2zF93SkUpQT2E+OpxeCK+Edh8oYUvOAWmWhH+C3w5pEjq
	 kMaBqfu5xT9pjh86XKrdzgwFfyfEeRiZ1HzKfHxn0lgJvA8Cvs2YrsU4W+wjpkizj2
	 L+Ir/66LNl7rA0jcO6UbGMv5/RwCG/6QbnsDm+lKfNnO7QMy1B8HY51PSkLbOwgd12
	 frNZKl5BhbUU66ViCjgUk6W5gkQ/ZcJM408JUb9fLYMlP+KLaUMb2GECbMDitCgI2l
	 m2Ped3yrRnckUKFtPgZe/M/8wvFBcJeswPhZ46zKOx2X3yl4uGQihAbVpK/ZgX/ciZ
	 lmSyO8xwAdXXA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA5BD17E0029;
	Thu, 26 Feb 2026 23:41:22 +0100 (CET)
Message-ID: <328f330b4316f60241eb8a9935a46cc148fb4ae8.camel@collabora.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 kernel@collabora.com, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley	 <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Date: Thu, 26 Feb 2026 17:41:20 -0500
In-Reply-To: <20260226-ferocious-saturday-0e1f9bb28ec5@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
	 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
	 <20260226-salute-threaten-a3eabb232396@spud>
	 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
	 <20260226-snide-foil-a05e1aa156a8@spud>
	 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
	 <20260226-ferocious-saturday-0e1f9bb28ec5@spud>
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
	protocol="application/pgp-signature"; boundary="=-4Y4hasR1gEd+E/ddVt4V"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53639-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 964671B07C4
X-Rspamd-Action: no action


--=-4Y4hasR1gEd+E/ddVt4V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 22:15 +0000, Conor Dooley a =C3=A9crit=
=C2=A0:
> On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> > Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 20:59 +0000, Conor Dooley a =C3=A9=
crit=C2=A0:
> > > On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> > > > Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 18:43 +0000, Conor Dooley a =
=C3=A9crit=C2=A0:
> > > In this case, the driver is currently buggy, because, as I mentioned,=
 it
> > > uses reg-names without reg-names being required on the platforms with
> > > more than 1 reg property. Probably the binding should make reg-names
> > > mandatory for these platforms even without this patch, but it *has* t=
o
> > > IMO for this proposed change to be applicable.
> >=20
> > That forced me to check the driver. So for RK33xx and older, there is o=
nly
> > one
> > range, and the driver will just pick the one entry expected:
> >=20
> >=20
> > 	if (rkvdec->variant->has_single_reg_region) {
> > 		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > 		if (IS_ERR(rkvdec->regs))
> > 			return PTR_ERR(rkvdec->regs);
> > 	} else {
> > 		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev,
> > "function");
> > 		if (IS_ERR(rkvdec->regs))
> > 			return PTR_ERR(rkvdec->regs);
> >=20
> > 		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev,
> > "link");
> > 		if (IS_ERR(rkvdec->link))
> > 			return PTR_ERR(rkvdec->link);
> > 	}
> >=20
> >=20
> > Where for RK35xx variants, it only pick the resources by name. I don't =
see
> > the
> > bug that you see, but I believe this was just a supposition, that you d=
idn't
> > check the code.
>=20
> Busy reading path of exile patch notes, so sniping this comment only...
>=20
> This is a bug, not a supposition, and it's that snippet from the
> driver that prompted my comment.. That code requires that if
> ->has_single_reg_region is set that the dts provides reg-names, but the
> binding does not mandate reg-names for rk3576-vdec and rk3588-vdec, so
> the driver will fail to probe on a dts that the binding says is valid.

Got it, to me nothing in the binding is intentional, just a big lack of
understanding what the syntax meant. So if we agree to make the binding enf=
orce
having names for rk3576-vdec and rk3588-vdec (and keep RK33 and older the s=
ame),
It would make me more happy to maintain it.

It also better highlight why adding a second order simply creates an ambigu=
ity.

Let me know, if we can go forward with that, I'll help documenting known us=
ers,
their introduction into 7.0-rc1 only and why this incident and fix should h=
ave
no impact on anyone.

Nicolas

--=-4Y4hasR1gEd+E/ddVt4V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaDMEAAKCRDZQZRRKWBy
9NBKAQClyqb+9nOYzRNJx8qMWWPMGjst8feZTaXkF2MxsSbhrAEA/83RqiaTJO9w
VGV5b7smraEoxWFECJxsBiy9Uek1WgY=
=Fr9Z
-----END PGP SIGNATURE-----

--=-4Y4hasR1gEd+E/ddVt4V--

