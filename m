Return-Path: <linux-media+bounces-53293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNSfAmOknWmZQwQAu9opvQ
	(envelope-from <linux-media+bounces-53293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:15:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44D187712
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 007F53136C83
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FD939C62A;
	Tue, 24 Feb 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fnnGBmGL"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBC38BF8C;
	Tue, 24 Feb 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938883; cv=none; b=t+lkc9RnQ08OlFNYu0KWZ8NCtTBO8U3ANt6nyXUhnpgNLJy1XTLoW8pqYFoeDiy38J9EBVZ22r4RDZhtsy+iZ2LHP3G9GPE969WWkXTwYNciDJRKDUrvZBl6gyMxvlmJImo7gl4Gg+2RvR8QCH2406TofWoz2qXL3xgp/Gnvje4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938883; c=relaxed/simple;
	bh=QDBlBOY6T+mWEXrv/m/BROi/PGkVajgTbGo7PUZjJMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDAxJut7GzAqparrJDiWeVBfBb8j107dNln8dXQWl98YOjvlzySTpa7oMoMdNesrcvs+epKD77IpeKa7OBKuLUEy7/6NzZLZbu2L/8J7Vy0SZPdSOaiO3k6i1bNg3M9PRfu17ZDuDFnkUG/CpUbup5oGrMc5m9v38aQsDtbZb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fnnGBmGL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771938880;
	bh=QDBlBOY6T+mWEXrv/m/BROi/PGkVajgTbGo7PUZjJMg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fnnGBmGLTE4IUyu2V2/CREu3eVMNtGRq2xiualZ+Noh87rNDNu780b8X71o4+5WlO
	 3aq3coOJY30fPW6222dYPTxbgAgwx3i+mur/r/bVV53BCOLTf97bYh2OvJNSq64zkb
	 s5PD1f4BGMwVQ6Dms1ufK+Bl/tsKlpwwX5dUU2kHmmpHJ/41JP7h2OiLeDdr8tERUt
	 hkXmQzilMM87TiRc2J1tytsMgGsE/6bQUgBgRF4/ad6Fpv1TwxPbhjDgYeqD2Ih4rT
	 T9zU4ywLdh/Po2ukB9jVWdgTmok9pBdCxwixg8ebEKrRjwXhyqdNPNqcX2SnXCSD7/
	 onO/oj0bRcuRg==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B671617E03E5;
	Tue, 24 Feb 2026 14:14:37 +0100 (CET)
Message-ID: <244b22d3be77047163b4e47c4ed33b5b1befb4b4.camel@collabora.com>
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
Date: Tue, 24 Feb 2026 08:14:35 -0500
In-Reply-To: <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
	 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
	 <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
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
	protocol="application/pgp-signature"; boundary="=-6vdVUmvCeNcE+MD7yuOO"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53293-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,27b00000:email,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 7F44D187712
X-Rspamd-Action: no action


--=-6vdVUmvCeNcE+MD7yuOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 24 f=C3=A9vrier 2026 =C3=A0 08:17 +0100, Krzysztof Kozlowski a =C3=
=A9crit=C2=A0:
> On Mon, Feb 23, 2026 at 09:49:49PM +0200, Cristian Ciocaltea wrote:
> > Update 'reg-names' property to allow providing the register blocks in
> > the expected address-based order for RK3576 & RK3588 video decoder and,
>=20
> What? The register blocks SHOULD NOT be provided in address-based order.
> There was never such coding style, never ever we gave such hint and if
> you found Qcom discussions you would see me and Rob objecting to it.

Would be nice to make a suggestion to how to fix this warning differently.

rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b0=
0000: simple-bus unit address format error, expected "27b00100"


>=20
> > consequently, fix some DTC warnings.
> >=20
> > Additionally, drop the 'reg' description items as the order is not fixe=
d
> > anymore, while the information they offer is not very relevant anyway.
> >=20
> > Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Vid=
eo Decoder bindings")
> > Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video De=
coder bindings")
>=20
> No, nothing to be fixed here. Describe the bug, because missing order
> to address-based is for sure not a bug.

The warning should be part of this this commit message, since the cover let=
ter
is not going into git.

>=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 +=
+++++-------
> > =C2=A01 file changed, 6 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml=
 b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > index 809fda45b3bd..2d3164a2882b 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -28,16 +28,15 @@ properties:
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
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
>=20
> No, ABI break without point.

Its not released yet, otherwise both order would need to be allowed.

Nicolas

>=20
> > =C2=A0
> > =C2=A0=C2=A0 interrupts:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> >=20
> > --=20
> > 2.52.0
> >=20

--=-6vdVUmvCeNcE+MD7yuOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZ2kOwAKCRDZQZRRKWBy
9BqXAP0WLFO+Ad1TiY32B/5I/dn3cBQsJKE069cW8NysidEIsgEAh/wL1hMjh63+
oRsi0fbu/sIfKsL636Wv6YG3zrhkKQY=
=HW9Q
-----END PGP SIGNATURE-----

--=-6vdVUmvCeNcE+MD7yuOO--

