Return-Path: <linux-media+bounces-26295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFCBA3A17A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9E33B21A4
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5905726D5D9;
	Tue, 18 Feb 2025 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nXqiVTDN"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F126D5B2
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893081; cv=none; b=OMva7G/8MB0twetT+isb27R9vL82T8l5fmVb5M2uUt8J6X+Df7PJmzCODK1QMXi+y/NzzvM8tm+flmFnndNpnVsXqRC5fXZ7eki9gcDlhdCkFg07KZfTefeii4sWwmu3vZBlPqRRRnzTtp37vOU4zdvUPFOoLvvBL7dRkkDZjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893081; c=relaxed/simple;
	bh=0aD6ufK/vC5tUbx+0/mu6k4fhbXKSczIRmW2JTUH1Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A64DRLm4mt5D1foC4U4+7SEm1B28dXhqkXidtFbCmaXId4RQMUeUzUNIiiZ1R0kITehv7ZvcOgIEMglt0CPEZNnD+jpC8VubuUu/zbGJcbZVgcplk4Gnt0XBr2pWdP/oZN0j0n7cn11qMukBRhPzcg4GZ2z7nmV9XFOigh65d/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nXqiVTDN; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 18 Feb 2025 21:07:31 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739893076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NhAs/+alc8iOs1QMRuJFdglVREAEu5m/W/RgQbql3+k=;
	b=nXqiVTDNSQwRJUS6oQyCJjjCvqgFPeh581yPRfXMfaW6dEhwuEZ7resmRcaG6VyJ1fxAKA
	osrk0LTmA16VdgqgyQy2GQrmMvGSOYpbUYWSWapsGIFzLsp5ybTIbZBTgZ1aHIjPhm7v4a
	zYFrtiL5GrkI4CZJVnLcU00SHZ0FXEc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devarsht@ti.com" <devarsht@ti.com>, 
	"vaishnav.a@ti.com" <vaishnav.a@ti.com>, "r-donadkar@ti.com" <r-donadkar@ti.com>, 
	"u-kumar1@ti.com" <u-kumar1@ti.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczog?=
 =?utf-8?Q?media?= =?utf-8?Q?=3A?= cdns,csi2rx.yaml: Add optional interrupts
 for cdns-csi2rx
Message-ID: <swqtud4ohcsjjt4ofgrovsa5h7koriuvpmxb3hdemnndwems2a@nwiny4dvuzwg>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-2-y-abhilashchandra@ti.com>
 <m6ijg5colbev6lyhiobblecb4wlvwezpccibnso26gd3dadrfh@twgul4eel6hg>
 <ZQ0PR01MB13022FE965643879D8794733F2FAA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ngdnlsgngwdiatpe"
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB13022FE965643879D8794733F2FAA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
X-Migadu-Flow: FLOW_OUT


--ngdnlsgngwdiatpe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczog?=
 =?utf-8?Q?media?= =?utf-8?Q?=3A?= cdns,csi2rx.yaml: Add optional interrupts
 for cdns-csi2rx
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 09:35:50AM +0000, Changhuang Liang wrote:
> Hi Jai, Abhilash
>=20
> > Hi Abhilash,
> >=20
> > On Mon, Feb 17, 2025 at 06:30:12PM +0530, Yemike Abhilash Chandra wrote:
> > > The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
> > > Enabling these interrupts will provide additional information about a
> > > CSI packet or an individual frame. So, add support for optional
> > > interrupts and interrupt-names properties.
> > >
> > > [0]: http://www.ti.com/lit/pdf/spruil1
> > >
> > > Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Address Krzysztof's review comment to remove flexibility while addi=
ng
> > >   interrupts.
> > >
> > >  .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10
> > ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > > b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > > index 2008a47c0580..f335429cbde9 100644
> > > --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > > +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > > @@ -24,6 +24,16 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  interrupts:
> > > +    minItems: 3
> > > +    maxItems: 3
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: info
> > > +      - const: error
> > > +      - const: monitor
> > > +
> >=20
> > How many interrupt lines are actually exposed by the Cadence IP?
>=20
> I only see that the Cadence IP exposes two interrupt lines: irq and err_i=
rq. If there are any mistakes,=20
> please help correct them.
>=20

Thank you Changhuang for the quick confirmation.
This seems to match CSI_ERR_IRQ and CSI_IRQ in TI's integration.

> > It is not clear to me from the TRM [0]. From the "Table 12-1524. CSI_RX=
_IF
> > Hardware Requests" it looks like there are three separate interrupt lin=
es
> > CSI_ERR_IRQ, CSI_IRQ and CSI_LEVEL, which are routed to the Arm core/GI=
C.
> > And four lines for the ASF submodule (?) that are not routed to GIC.
> >=20

Abhilash,

What is unclear to me is where the third CSI_LEVEL interrupt line is coming=
=20
=66rom?

The TRM description of the CSI_LEVEL interrupt says it is for PSI_L overflo=
w=20
or VP0/VP1 frame/line mismatch, both of which are outside the Cadence CSI2R=
X,=20
instead belonging to the TI wrapper hardware, which has its own driver.

> > This does not match with the error, info and monitor line names mention=
ed
> > here.
> >=20
> > In my understanding which interrupt lines are actually integrated will =
vary
> > from SoC to SoC, so please check what are the actual interrupt line nam=
es
> > exposed by the Cadence IP. Maybe Maxime knows more.
> >=20
> > But I don't think it is correct to make all 3 mandatory together, as so=
me
> > vendors may only integrate the error interrupt ignoring the rest.
>=20
> Agreed.
>=20

I think by default there should only be two optional interrupt lines for=20
cdns-csi2rx, "irq" and "err_irq" which is common across vendors.

If this third TI-specific CSI_LEVEL interrupt *has* to be handled by=20
cdns-csi2rx driver, it would be better to create conditional bindings and=
=20
match data in the driver such that the irq is only requested if=20
"ti,j721e-csi2rx" compatible is present.

> Best Regards,
> Changhuang

Thanks,
Jai

--ngdnlsgngwdiatpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme0qTsACgkQQ96R+SSa
cUV6YxAAhNSjyeqRNGXC5vnrDW2XCuer0HIH05/FELfhTHKMJ1j+iLVI4G27/76Z
ZqPiLRl06wAG1IBx1sG4HqA/JLRCDx8UNAXkmulIqD9esZ7/aEglJlqwUv8qYcok
L663Ie+8JS699GyKEsJd55atAJgE4s7Sez4kPBYq7PxOn8saSlHYPpExaWDwfrxI
48m2uAQV6K7oUKiScFvZ73e2Spp6bHs8kzfZ1nVG3mGjSpfvxzsWQfgLhsXLwCbr
9NMY3JNwC++0xNS/koraurUyTLQEH7N+7hFsY7vWz5FGSobyK1PPCMSHA7hl3T1I
2OxiQ5ZIcdGB/lgjaucZ+DdFrM5Vh4ZYdjnNKcHNfGx8rUtZ00O7DJybbUKeUzoS
sXLWVCbE7TUg6WT22FWOZZDV5cbMoIBTcY3sxnSWDYs3Rny9mOTr3SuVcX0YkC8J
L6pOmUUShpq8wy6AUSK0OKoMK/7z+H6j2/EyCdJlIRn52jK0bO/XDZrdeXrKEjWT
HpiVm1wOhdK3D3LPg60etT0JH/P4nLcUdeiZcE5knVZO6hwCLI3Hb1CISWFaxiwd
baTbG+54Fh08aIH+2peyYN00X+PYWXSujVs9OM4wzytOZw0bqtjD5albJT5IOJVy
oqXPkXawH87SbNOTbIbuHQLqRbv82SERtacdnsVAjf7gKhHE/eM=
=ZqEt
-----END PGP SIGNATURE-----

--ngdnlsgngwdiatpe--

