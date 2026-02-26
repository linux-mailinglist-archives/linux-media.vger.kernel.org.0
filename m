Return-Path: <linux-media+bounces-53632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B8HEyy0oGmHlwQAu9opvQ
	(envelope-from <linux-media+bounces-53632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:59:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B4D1AF595
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02CA1303F44E
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358A644D034;
	Thu, 26 Feb 2026 20:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC2QrcXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EF330B2C;
	Thu, 26 Feb 2026 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139554; cv=none; b=gZRAoSI/pG5UxAfIgtHagMog5xH23Cy96KGDIY2vtB9tk9bfZmPXo8LNKHJNk4JQN7PULocvy//Jw5etqRwiBx1PHZgf/+bdwMbC8jdJkmaZOEskZsQXFycOyjh/Hzcr+pdi3Ycg+UU/L/VbYapFGzcv4R7ymUk6SQBI11ey6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139554; c=relaxed/simple;
	bh=cKcN2V29V13koNaaY/Nhem64w71cAay19I8PFL1jhi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHbUwD3UXcvgO/cpg08iIMxJNDIjqageCdyzEBo971NxqOef8bfaFB4FfMW1tPsniP0/QVZn/uUYzKj5tinJcbN3m8eiFIFrudM7GwxLjyqVpVJZHsV1RVoWDwFlwvLr6p2ERmJtJ0HRY2l2P+rBl89erWdeXFO29ewNI0M+Qrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC2QrcXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D0C116C6;
	Thu, 26 Feb 2026 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772139554;
	bh=cKcN2V29V13koNaaY/Nhem64w71cAay19I8PFL1jhi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC2QrcXJ1AQanIDOsmn+YKZ7wGHFs9oPx6b9VwtF0WgjGtvbgicPwBaatIuAGGPS7
	 +KqX0TAHuV5Qd9ZdHpmM/ZvbTReoXZqWLmOi/rT5QoSMD7WheVJIZ6JOtUdtkNsWrj
	 yRifcLVIJDbJ0Gk5/bRyvfXNGM1DLTFC7qzCrAE5NqbjhNQ1aBkwrA/EJnu58b8BAL
	 EaLA0DaAPhFA8RH3pTyMnVSw+FaZgIIutFVJ0hKeoVgY4cU4rPEIqeUSALZK2h00A/
	 vZopphsOuJJKk3Y2R5R5OBSYwh2+G8NkoyibQg3JlrSAk/tLkJfQbqdvfCX99fexAa
	 EYDmeCaCARX4Q==
Date: Thu, 26 Feb 2026 20:59:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-snide-foil-a05e1aa156a8@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TI6MRG6jfhf7gfkz"
Content-Disposition: inline
In-Reply-To: <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53632-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8B4D1AF595
X-Rspamd-Action: no action


--TI6MRG6jfhf7gfkz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=A0:
> > On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > > With the introduction of the RK3588 SoC, and RK3576 afterwards, two m=
ore
> > > register blocks have been provided for the video decoder unit.
> > >=20
> > > However, the binding does not properly describe the new hardware layo=
ut,
> > > as it breaks the convention expecting the unit address to indicate the
> > > start of the first register range, i.e. 'function' block is listed
> > > before 'link' instead of the opposite.
> >=20
> > I don't understand this commit message or rationale for an ABI break.
> > Changing the unit address seems like a "free" fix to your problem,
> > especially when reg-names is not a required property that you can rely
> > on. Actually, there may be a bug in the driver - it expects reg-names
> > for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> > presence for those devices.
>=20
> If the bindings had been held instead of released early, the order would =
be what
> is done in this patch for sure, and no one would have complained. These b=
inding
> have never been used by anyone so far, and what you are asking is to crea=
te a

20:35:32 conor /stuff/linux$ rg "rk3576-vdec"

arch/arm64/boot/dts/rockchip/rk3576.dtsi
1283:			compatible =3D "rockchip,rk3576-vdec";

20:35:34 conor /stuff/linux$ rg rk3588-vdec

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
1357:		compatible =3D "rockchip,rk3588-vdec";
1389:		compatible =3D "rockchip,rk3588-vdec";

These look like users, at least at first look. Some elaboration on that
would be good - impact on users definitely should be covered in the
commit message of an ABI break.

> DTS that deviate from the vendor provided documentation for the IP base a=
ddress.
> I know you have all technical fancy reasoning, but I like when things are
> functional and effective to work with.

FWIW, I don't think you were trying to be dismissive, just trying to
make a valid point about usability being important, but providing clear
justifications for why the order of properties should be changed (or
other similar ABI breaks) is really important. This is v4, and the
rationale you've given here about the documentation, which is the actual
motivation for changing things around, doesn't appear in the commit
message, even after a back and forth with Krzysztof in an earlier
version.

> > Deprecating the order also makes little sense to me, given that some of
> > these devices only have one reg entry, which as far as I can tell from
> > looking at the driver *is* the "function" region, so it can never be
> > entirely deprecated.
>=20
> What I'd like to see, is a binding expression that behave like a set, not=
 a
> list, and leave the ordering open. As people keep repeating, there is not=
hing in
> a binding that assist to define the right ordering (its not address or ba=
se
> addres aware). That basically means, we can't as reviewer see that orderi=
ng is
> going to imposing using a base address in the unit name (which is a conve=
nience,
> not a rule I suppose) that differ from the vendor documented base address.
>=20
> By explicitly removing the ordering in the binding, we create a strict ru=
le that
> driver should retrieve this by name, and never assume the ordering, which=
 I
> personally like.
>=20
> thoughts ?

Yeah, you can do this, but to avoid potential breaks you have to do it
=66rom the start, not after the fact. Probably there's bindings that get
acked every day that do do this. Even the retcon is okay to do when
reg-names is mandated by the binding and the users use reg-names in my
opinion.

In this case, the driver is currently buggy, because, as I mentioned, it
uses reg-names without reg-names being required on the platforms with
more than 1 reg property. Probably the binding should make reg-names
mandatory for these platforms even without this patch, but it *has* to
IMO for this proposed change to be applicable.

But anyway, the takeaway from my original mail should be "Conor is not
happy with the rationale the commit message provides for this change,
as it doesn't explain why you want to do it". I necessarily object to
the change itself.

Conor.

> > > Since the binding changes have been already released and a fix would
> > > bring up an ABI break, mark the current 'reg-names' ordering as
> > > deprecated and introduce an alternative 'link,function,cache' listing
> > > which follows the address-based ordering according to the TRM.
> > >=20
> > > Additionally, drop the 'reg' description items as the order is not fi=
xed
> > > anymore, while the information they offer is not very relevant anyway.
> > >=20
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> > > =A0.../devicetree/bindings/media/rockchip,vdec.yaml=A0=A0=A0=A0 | 20 =
++++++++++++-----
> > > ---
> > > =A01 file changed, 12 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.ya=
ml
> > > b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > index 809fda45b3bd..c513b68d2c72 100644
> > > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > @@ -28,16 +28,20 @@ properties:
> > > =A0
> > > =A0=A0 reg:
> > > =A0=A0=A0=A0 minItems: 1
> > > -=A0=A0=A0 items:
> > > -=A0=A0=A0=A0=A0 - description: The function configuration registers =
base
> > > -=A0=A0=A0=A0=A0 - description: The link table configuration register=
s base
> > > -=A0=A0=A0=A0=A0 - description: The cache configuration registers base
> > > +=A0=A0=A0 maxItems: 3
> > > =A0
> > > =A0=A0 reg-names:
> > > -=A0=A0=A0 items:
> > > -=A0=A0=A0=A0=A0 - const: function
> > > -=A0=A0=A0=A0=A0 - const: link
> > > -=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0 oneOf:
> > > +=A0=A0=A0=A0=A0 - items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: link
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: function
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0=A0=A0 - items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: function
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: link
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0=A0=A0=A0=A0 deprecated: true
> > > +=A0=A0=A0=A0=A0=A0=A0 description: Use link,function,cache block ord=
er instead.
> > > =A0
> > > =A0=A0 interrupts:
> > > =A0=A0=A0=A0 maxItems: 1
> > >=20
> > > --=20
> > > 2.52.0
> > >=20



--TI6MRG6jfhf7gfkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaC0HAAKCRB4tDGHoIJi
0jkhAQCTkpi7tlZesS47tglTMIqrlcicor6nxmHd+4N/0T2JAgEAjirK8v2PqsXy
RSXj7VKrwxp+VuNFypnzfUONfv11Wgc=
=jxXf
-----END PGP SIGNATURE-----

--TI6MRG6jfhf7gfkz--

