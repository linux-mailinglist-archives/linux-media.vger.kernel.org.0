Return-Path: <linux-media+bounces-53612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKnIGWqhoGlVlAQAu9opvQ
	(envelope-from <linux-media+bounces-53612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:39:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE01AE852
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 918F231D6EFA
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E86044BCB6;
	Thu, 26 Feb 2026 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GcbB9sEt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D036CDE9;
	Thu, 26 Feb 2026 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134341; cv=none; b=e23UpJNntVJJS4PCoeaUkzEk8+vMmmPWSHq5zzlL2atFJ9IBlzfZkO46BG0thhP9fiHr9DA8K3oAvPzQbyGwn1Q2KeNlMME4q8hr6eqollm3MJLgPGTV/64ygiF6fjEbBrW9TEPa35o0q+I0QnwG7G1NZ1fkiZxVvG/F/ehGqr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134341; c=relaxed/simple;
	bh=9MBr5ZPC2TE/CDy6F2FbkOZokAWc7FQXeYBCGXJxNM4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=omRDp/O/Deppf0oXtd6RZJgmGbY/BPZHZ8PiK68lsUjZvjCD+9lwKfMjePEsh+JItBcMvcbWY/nH0KYCmbJpI2FdXTDHYYI7mlBVntOaJz3M21g/jv0ZoEMzb6ZEufYIiFVIysK2hJpNqquoyEAxw49ZjFlFWbFRVoyrCTdhNuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GcbB9sEt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772134336;
	bh=9MBr5ZPC2TE/CDy6F2FbkOZokAWc7FQXeYBCGXJxNM4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GcbB9sEt4Bx/JKfh6yi5lpJSxUjdin5mim370TLL/pXYmlKpkZJuLx6vey2IObdx0
	 fLuW+TZ7Wm4fQBIlFsnvA4fBnRgrFRnKUuGms5mH9qAxmBkYyuaTY9LJ/c5tzOCXJO
	 thyOCV1mX9ioU9xCJSdsObxwr16ylyi55T09zERdgCTuJ8g6nfFY7EXg4NtQe2U//V
	 ktys/7HcgU93cnKRx6KnMHKAdvT0zcRqY06UK3YybJATWRPJjFQhdjxC9mZgq1XVmg
	 XeXzgI8v0UpjUiWAxplEfSRFQNdZ7rxtnt46GjwAxXxTYgNQRiDFrsV1EB5mVSiC7l
	 ok8115Ft+RcJA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE3BF17E005F;
	Thu, 26 Feb 2026 20:32:13 +0100 (CET)
Message-ID: <7ebcdc0200ad9ac0802e4839207e52d72f9af9aa.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Cristian Ciocaltea	
 <cristian.ciocaltea@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Detlev Casanova
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-media@vger.kernel.org
Date: Thu, 26 Feb 2026 14:32:11 -0500
In-Reply-To: <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
	 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
	 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-GomJ4AQ9DRoD/qLotM0n"
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
	TAGGED_FROM(0.00)[bounces-53612-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 05FE01AE852
X-Rspamd-Action: no action


--=-GomJ4AQ9DRoD/qLotM0n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 f=C3=A9vrier 2026 =C3=A0 13:26 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 25/02/2026 13:19, Cristian Ciocaltea wrote:
> > With the introduction of the RK3588 SoC, and RK3576 afterwards, the
> > 'link' and 'cache' register blocks have been provided for the video
> > decoder unit in addition to the existing 'function' one, which now show=
s
> > up in between them (from address-based ordering point of view).
> >=20
> > However, the binding does not properly describe this hardware layout, a=
s
> > the new blocks are listed after the old one.=C2=A0 Therefore it breaks =
the
> > convention expecting the unit address to indicate the first register
> > range.
> >=20
> > Since the binding changes have been already released and a fix would
> > bring up an ABI break, mark the current 'reg-names' listing as
> > deprecated and introduce an alternative 'link,function,cache' one.
> >=20
> > Additionally, drop the 'reg' description items as the order is not fixe=
d
> > anymore, while the information they offer is not very relevant anyway.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 19 ++++++++++++-------
> > =C2=A01 file changed, 12 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml=
 b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > index 809fda45b3bd..3f6072e8baa5 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -28,16 +28,21 @@ properties:
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
>=20
> This is confusing, I think I missed that in previous patch because it
> did not leave that part or I misread the diff hunk - why do you allow
> one entry?
>=20
> If the first entry is function, then all others MUST built on top, thus
> this:
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
>=20
> is not correct.
>=20
> No, you don't change the orders. So again, if you have such binding,
> then you just fix the unit address leaving the binding as is.

We need a better solution, its really helpful for the base address in these=
 unit
name matches the documentation. And specially with this version of the hard=
ware,
the link register is where you program the IP, the function registers are f=
illed
by the IP when the previous job completes (but can be access when there is =
no
running jobs for various reason too, hence exposing it).

Nicolas

p.s. I didn't read this message first, don't read by Rb as offending, I'll =
hold
as long as needed.
>=20
>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
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
> Best regards,
> Krzysztof

--=-GomJ4AQ9DRoD/qLotM0n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaCfvAAKCRDZQZRRKWBy
9HpqAQDbpHxivpnNbaiKNBB2Wj7baGgUmfo4W5g7rJEyVOf2KwEArpUAgEYU4HGR
tS7JVtGMiecpsCfIcEQ5zFoUMXMvFwQ=
=7ewP
-----END PGP SIGNATURE-----

--=-GomJ4AQ9DRoD/qLotM0n--

