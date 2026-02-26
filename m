Return-Path: <linux-media+bounces-53637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLZHAZ3BoGlPmQQAu9opvQ
	(envelope-from <linux-media+bounces-53637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:56:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C91B01B3
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 928203012BFB
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A8478E56;
	Thu, 26 Feb 2026 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jsToz81n"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC442E012;
	Thu, 26 Feb 2026 21:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772142998; cv=none; b=ePgfmmmiGdXpaCJi7D8LdFZCcvgWPQ9twaR5escpf6Wo4HBxnB5UPLPxW64nkwvKn3y1Vdn4dgJAXRu1DL7XcZv6SJfJe4I+k/VYw4gjwLolDxSDicLGPugSwBYdozjyqRjMkRZgSCgpoS4XTfTxeJEID0Xsw0l7TVY3YyNbfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772142998; c=relaxed/simple;
	bh=2udLt71C70zO8HwqqWg4tuKPdKSe1YebcQMlw4g1cgo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+RFHpZL6OG8M6QMAsV5x9K0vLJBq1MM1bM7czhdL7T3mTdoTHFWQOiSercXfnel1f2Wf2naQrDXTs3Ercxr7g8pA7tlAV/Ini/NJXenNRINmpjEZ5jwmTJI2EuD3t6qqKyCmKAE0dlQ3bBWciJpoc+eVX69Rr4eFww9qJ5Qmm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jsToz81n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772142995;
	bh=2udLt71C70zO8HwqqWg4tuKPdKSe1YebcQMlw4g1cgo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jsToz81nff9ZavFqgVxX2DKnGC1vin0emEfyqgFeoI/8D9mzyLPdu8PrL4s0165rH
	 3gccNehXIcbBMuah6n+DnNLeM/oB0uhlhIV43o+2AwhnSmN2vaPheJ4xGuS5NBE0z6
	 24mlGPRBD1KJYlY/lXeDflgap9cuPCc3roUa2VUjJeknbGC7pmIrNQT3njDUUrDd2F
	 NBgKE3/gF1WBFzHArHdScbf9TyikgtEnmoCBBhWzIw2/GbKqaTj/GAT/3XoloCbZPl
	 NixOdz392NT4Dabvni4JD67hd+Q4gpkv2Ldpi5vrP7NWZWEn4EqTRzQSRgEOIOBVuq
	 4UaZTo/CAei1g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACB4617E0D90;
	Thu, 26 Feb 2026 22:56:32 +0100 (CET)
Message-ID: <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
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
Date: Thu, 26 Feb 2026 16:56:30 -0500
In-Reply-To: <20260226-snide-foil-a05e1aa156a8@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
	 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
	 <20260226-salute-threaten-a3eabb232396@spud>
	 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
	 <20260226-snide-foil-a05e1aa156a8@spud>
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
	protocol="application/pgp-signature"; boundary="=-a4Mqi0x0M7n7z1ly6Ilh"
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
	TAGGED_FROM(0.00)[bounces-53637-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 902C91B01B3
X-Rspamd-Action: no action


--=-a4Mqi0x0M7n7z1ly6Ilh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 20:59 +0000, Conor Dooley a =C3=A9crit=
=C2=A0:
> On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> > Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 18:43 +0000, Conor Dooley a =C3=A9=
crit=C2=A0:
> > > On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > > > With the introduction of the RK3588 SoC, and RK3576 afterwards, two=
 more
> > > > register blocks have been provided for the video decoder unit.
> > > >=20
> > > > However, the binding does not properly describe the new hardware la=
yout,
> > > > as it breaks the convention expecting the unit address to indicate =
the
> > > > start of the first register range, i.e. 'function' block is listed
> > > > before 'link' instead of the opposite.
> > >=20
> > > I don't understand this commit message or rationale for an ABI break.
> > > Changing the unit address seems like a "free" fix to your problem,
> > > especially when reg-names is not a required property that you can rel=
y
> > > on. Actually, there may be a bug in the driver - it expects reg-names
> > > for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> > > presence for those devices.
> >=20
> > If the bindings had been held instead of released early, the order woul=
d be what
> > is done in this patch for sure, and no one would have complained. These=
 binding
> > have never been used by anyone so far, and what you are asking is to cr=
eate a
>=20
> 20:35:32 conor /stuff/linux$ rg "rk3576-vdec"
>=20
> arch/arm64/boot/dts/rockchip/rk3576.dtsi
> 1283:			compatible =3D "rockchip,rk3576-vdec";
>=20
> 20:35:34 conor /stuff/linux$ rg rk3588-vdec
>=20
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> 1357:		compatible =3D "rockchip,rk3588-vdec";
> 1389:		compatible =3D "rockchip,rk3588-vdec";
>=20
> These look like users, at least at first look. Some elaboration on that
> would be good - impact on users definitely should be covered in the
> commit message of an ABI break.

Right, let me add some context. rk3576.dtsi/rk3588-base.dtsi became a user =
of
the binding in 7.0-rc1, which is a pre-release. In fact, I initially though=
t the
bindings was merged at the same time, which Krzysztof highlighted as my mis=
take.
And the driver modification that utilize multiple reg ranges was also intro=
duced
in 7.0-rc1. More clarification on that below.

>=20
> > DTS that deviate from the vendor provided documentation for the IP base=
 address.
> > I know you have all technical fancy reasoning, but I like when things a=
re
> > functional and effective to work with.
>=20
> FWIW, I don't think you were trying to be dismissive, just trying to
> make a valid point about usability being important, but providing clear
> justifications for why the order of properties should be changed (or
> other similar ABI breaks) is really important. This is v4, and the
> rationale you've given here about the documentation, which is the actual
> motivation for changing things around, doesn't appear in the commit
> message, even after a back and forth with Krzysztof in an earlier
> version.

Ack, I'm not the one doing the work (just a reviewer), but was involved in
picking the work, and trying to learn enough so I can perhaps catch this ne=
xt
time.

>=20
> > > Deprecating the order also makes little sense to me, given that some =
of
> > > these devices only have one reg entry, which as far as I can tell fro=
m
> > > looking at the driver *is* the "function" region, so it can never be
> > > entirely deprecated.
> >=20
> > What I'd like to see, is a binding expression that behave like a set, n=
ot a
> > list, and leave the ordering open. As people keep repeating, there is n=
othing in
> > a binding that assist to define the right ordering (its not address or =
base
> > addres aware). That basically means, we can't as reviewer see that orde=
ring is
> > going to imposing using a base address in the unit name (which is a con=
venience,
> > not a rule I suppose) that differ from the vendor documented base addre=
ss.
> >=20
> > By explicitly removing the ordering in the binding, we create a strict =
rule that
> > driver should retrieve this by name, and never assume the ordering, whi=
ch I
> > personally like.
> >=20
> > thoughts ?
>=20
> Yeah, you can do this, but to avoid potential breaks you have to do it
> from the start, not after the fact. Probably there's bindings that get
> acked every day that do do this. Even the retcon is okay to do when
> reg-names is mandated by the binding and the users use reg-names in my
> opinion.

I think from the above analyses, since the usage only starts in rc1, we hav=
e
room for improving it knowing we aren't creating problem for anyone. Note t=
hat I
have no idea what the syntax is to "do this", and I doubt either Detlev or
Cristian have a clue.

>=20
> In this case, the driver is currently buggy, because, as I mentioned, it
> uses reg-names without reg-names being required on the platforms with
> more than 1 reg property. Probably the binding should make reg-names
> mandatory for these platforms even without this patch, but it *has* to
> IMO for this proposed change to be applicable.

That forced me to check the driver. So for RK33xx and older, there is only =
one
range, and the driver will just pick the one entry expected:


	if (rkvdec->variant->has_single_reg_region) {
		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
		if (IS_ERR(rkvdec->regs))
			return PTR_ERR(rkvdec->regs);
	} else {
		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function");
		if (IS_ERR(rkvdec->regs))
			return PTR_ERR(rkvdec->regs);

		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
		if (IS_ERR(rkvdec->link))
			return PTR_ERR(rkvdec->link);
	}


Where for RK35xx variants, it only pick the resources by name. I don't see =
the
bug that you see, but I believe this was just a supposition, that you didn'=
t
check the code.

So what happened with the binding, is that in preparation for the new SoC, =
they
added the named range, but probably without really realizing that there was=
 an
ordering imposed, or realizing the order was far from ideal.

>=20
> But anyway, the takeaway from my original mail should be "Conor is not
> happy with the rationale the commit message provides for this change,
> as it doesn't explain why you want to do it". I necessarily object to
> the change itself.

Understood, I think Cristian is a bit sandwich between my rational to make
things match the doc, and Krzysztof requesting to preserve the ABI. I think
that's fixable, but again, if there is a syntax to just remove the ordering=
 from
there, knowing there is no user of that order in released kernel yet, that =
would
be my preference over deprecation syntax.

regards,
Nicolas

>=20
> Conor.
>=20
> > > > Since the binding changes have been already released and a fix woul=
d
> > > > bring up an ABI break, mark the current 'reg-names' ordering as
> > > > deprecated and introduce an alternative 'link,function,cache' listi=
ng
> > > > which follows the address-based ordering according to the TRM.
> > > >=20
> > > > Additionally, drop the 'reg' description items as the order is not =
fixed
> > > > anymore, while the information they offer is not very relevant anyw=
ay.
> > > >=20
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com=
>
> > > > ---
> > > > =C2=A0.../devicetree/bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 20 ++++++++++++-----
> > > > ---
> > > > =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.=
yaml
> > > > b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > > index 809fda45b3bd..c513b68d2c72 100644
> > > > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > > @@ -28,16 +28,20 @@ properties:
> > > > =C2=A0
> > > > =C2=A0=C2=A0 reg:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > > > -=C2=A0=C2=A0=C2=A0 items:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function configu=
ration registers base
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table confi=
guration registers base
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configurat=
ion registers base
> > > > +=C2=A0=C2=A0=C2=A0 maxItems: 3
> > > > =C2=A0
> > > > =C2=A0=C2=A0 reg-names:
> > > > -=C2=A0=C2=A0=C2=A0 items:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > > > +=C2=A0=C2=A0=C2=A0 oneOf:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: li=
nk
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: fu=
nction
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ca=
che
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: fu=
nction
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: li=
nk
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ca=
che
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: true
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Use link,f=
unction,cache block order instead.
> > > > =C2=A0
> > > > =C2=A0=C2=A0 interrupts:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > >=20
> > > > --=20
> > > > 2.52.0
> > > >=20
>=20

--=-a4Mqi0x0M7n7z1ly6Ilh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaDBjgAKCRDZQZRRKWBy
9JbHAQCU6SJ7CqGLKsmvoGs/oVP7a5LfDiZZ0TdMH725/g5K3QEAq2P0R+Dw4jT4
zyGM7NikAOWz5Ucrgc7Nnp09WxZEtg4=
=JbUn
-----END PGP SIGNATURE-----

--=-a4Mqi0x0M7n7z1ly6Ilh--

