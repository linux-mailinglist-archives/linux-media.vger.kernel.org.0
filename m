Return-Path: <linux-media+bounces-53300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ7qHGWsnWmgQwQAu9opvQ
	(envelope-from <linux-media+bounces-53300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:49:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D1187FD8
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543663142085
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 13:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5E39E6DE;
	Tue, 24 Feb 2026 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jK0AhPrl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729AC39A7F0;
	Tue, 24 Feb 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940913; cv=none; b=iuBAamfdXpA3lUNc+pYnmuwxgAB01mpvKKNu3hEJDHNuvxvrHe0/Mx+6MnjKFqc5RxF+osOyby/5fqSJMKRSENOK6JsHbCcCBok3jxCKt3zmJVb+xOAtMHob3ZAs1IDVrBZZ8vRTkv7Z4BVdGIsHyO3nsT9/0qkEbfR6OcCif+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940913; c=relaxed/simple;
	bh=XK3lnbLHp3F3TbLRCuI+YUBc8vSBWoCNj/X6pk8dVkc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKRsQ2P33FX31kn0O6cGamdpNkk/1jPl7/Vb2IfGMfVmL+jVPeSQo2bY0VUYNj/mwydyMbDo7w14QvSyLnmHrdsfm7l/8nqrvK5lJyNjEvu380q0Yg4s0d/SZGPmCHeWZuDsZ/Kk2a+YJcjm5ACSvvFRryX7riTMFHkHwUZAhUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jK0AhPrl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771940910;
	bh=XK3lnbLHp3F3TbLRCuI+YUBc8vSBWoCNj/X6pk8dVkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jK0AhPrl6tzyPGx/IPxrNIVlT1S8y+7dzRyJQ2Rxjg1y5uylL0ayRaWlW2dFUudW+
	 K775pjD9Stvb4jDTUT4uZkyf0scm5pUprsFo5tsVoSiGH/1K0WAPKIbXgMUy2LZNqQ
	 pPUl3aB/Z7YS8p0bEqGfZOWuewJc5wVg4PwJyluCJGvYdR1cibPi2tWuj0zhneG2rm
	 Ixjk7eKezwxhU6SmYwX5TQvkGX1dq6l972fvKk0+NEonTRSUV0mWcuFgH6/FXl1UAA
	 kIPT2JFrAQ4auARaW3QGOki7HXfuWJPDSiTtIY5vQzhH657ICu8pmoWSpDGDDoXvr8
	 UTwZ37MUOMA0Q==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C948717E0C21;
	Tue, 24 Feb 2026 14:48:28 +0100 (CET)
Message-ID: <e73da0713587ad5380344afa686a13431d07e232.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
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
Date: Tue, 24 Feb 2026 08:48:26 -0500
In-Reply-To: <0874bb3d-b38d-4ea3-a5b0-2da2484cc3e5@kernel.org>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
	 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
	 <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
	 <244b22d3be77047163b4e47c4ed33b5b1befb4b4.camel@collabora.com>
	 <0874bb3d-b38d-4ea3-a5b0-2da2484cc3e5@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-wqbx/pwaKIk3hdLCdlUe"
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
	TAGGED_FROM(0.00)[bounces-53300-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A5D1187FD8
X-Rspamd-Action: no action


--=-wqbx/pwaKIk3hdLCdlUe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 f=C3=A9vrier 2026 =C3=A0 14:18 +0100, Krzysztof Kozlowski a =C3=
=A9crit=C2=A0:
> On 24/02/2026 14:14, Nicolas Dufresne wrote:
> > > > =C2=A0
> > > > =C2=A0=C2=A0 reg-names:
> > > > -=C2=A0=C2=A0=C2=A0 items:
> > > > +=C2=A0=C2=A0=C2=A0 oneOf:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: li=
nk
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: fu=
nction
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ca=
che
> > >=20
> > > No, ABI break without point.
> >=20
> > Its not released yet, otherwise both order would need to be allowed.
> >=20
> Also, not true.
>=20
> git describe --contains=C2=A0 c6ffb7e1fb90
> v6.17-rc1~90^2~3

Ack, I thought this was part of 7.0, it would have been logical to be part =
of
7.0-rc1 I must say. Whatever happen, backward compat will unfortunatly be
needed.

Nicolas

>=20
> So clearly released.
>=20
> Best regards,
> Krzysztof

--=-wqbx/pwaKIk3hdLCdlUe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZ2sKgAKCRDZQZRRKWBy
9DjdAQC7PXhY6Nr/tOZ3xzAPxraz8WRtCF9zWoAIekH6dEkvWQEAsQmcLYG1cCa4
mITxqDZT+4fNpHh8CzpXP3D67Px23AA=
=A2Yx
-----END PGP SIGNATURE-----

--=-wqbx/pwaKIk3hdLCdlUe--

