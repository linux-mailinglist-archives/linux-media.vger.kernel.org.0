Return-Path: <linux-media+bounces-27196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 659AAA49280
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482A43B765C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454551CAA74;
	Fri, 28 Feb 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pSqybkae"
X-Original-To: linux-media@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CBC276D12
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729332; cv=none; b=uBydykTA0dIWgoEtHbEncu2zg6NNBDqTOVlXyUL8x5e5wDJ7paVFbQBTMaJE+uJlPm3Fv2t3qYjIq5VZTxCC1qqyUDELFqT+6q1SfKoEmMeUqHDHMwFUkj+nf3D7PtVOjF+aV/hJKOHZQYXhaVWr6w5GAoraisIElMKiUUUoDRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729332; c=relaxed/simple;
	bh=6PdmsSO1BI5Z6V3wr7coLkzxxGzPEdCgMUotoEVoD4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBp3Ovir6o55eSh6zFbItv7hkJuiKBR47McV6yAvmSZ8J3Am2PXC7GlBvWItIMX/MYo+wexbk3dWgOWfqinrFU/xDwKQfDNZcgRdxmS9CnSygkxPQiiNHBoTlUGaXuXhJ1qMt8VwbK/ismwNTzIBr6XLNw2RmJkshsDaZSQinto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pSqybkae; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 28 Feb 2025 13:25:11 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740729318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9di/5YKWkXMpmrcJBjiPkEMKyrNmHmU26fwjOOihFU=;
	b=pSqybkaemOpma83fuRyyJDdNkqxh30++IBpd1kyepHh+SfnS8R4710Sb76xYHg3drNQw1z
	kxe6dcM4GqHsLE/9CUHBo6GT2Ct1j2PAb/96/opL2F0oeHELOoRUlycxogw7/HWNBJn4dm
	HVlH1ocgAYwG7/shTYzXO6fHPCSyza0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, r-donadkar@ti.com, 
	u-kumar1@ti.com
Subject: Re: [PATCH v4 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Message-ID: <24y6ggufmhmjkfxymhhxslthpbrsthfp67hkvq36dmnewpnv5c@dbs3hhhpme4w>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
 <20250227082920.744908-2-y-abhilashchandra@ti.com>
 <20250228-sandy-nightingale-of-improvement-6eef5a@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q2o2fulec7ph3r2v"
Content-Disposition: inline
In-Reply-To: <20250228-sandy-nightingale-of-improvement-6eef5a@krzk-bin>
X-Migadu-Flow: FLOW_OUT


--q2o2fulec7ph3r2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
MIME-Version: 1.0

Hi Krzysztof,

On Fri, Feb 28, 2025 at 08:34:22AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 27, 2025 at 01:59:19PM +0530, Yemike Abhilash Chandra wrote:
> > diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b=
/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > index 2008a47c0580..054ed4b94312 100644
> > --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> > @@ -24,6 +24,16 @@ properties:
> >    reg:
> >      maxItems: 1
> > =20
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - const: error_irq
> > +      - const: irq
>=20
> And how is this second interrupt in existing integrations?
>=20

TI SoCs integrate both of these if I understood the TRM correctly.

Not sure about StarFive, maybe Changhuang can confirm that both irq and=20
error_irq are integrated.

> This is supposed to be constrained per variant... which probably will
> tell you that these are not optional now.
>=20

To make sure I understand, we mark them both as non-optional in the binding=
s=20
by default. And if some particular SoC chooses to not integrate the second =
irq=20
they may add a constraint based on compatible?

That seems perfectly reasonable. With that change,

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> Best regards,
> Krzysztof
>=20

--q2o2fulec7ph3r2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfBa98ACgkQQ96R+SSa
cUUokQ/+K9rL8/asTsSDEg51WsTNzFpEskQ9MtuW5z/tgKHTXufIo02aReD4+7OF
auow1IVymqv9knHffGrDt54mK3zQja/uZXR8B4rJvtUuGG05DY56ZWINIYsFtr34
nTasO0/pTvcxAyluZg8I5nigARSvehdPlHPGfrmEWVRygq/zVzdUS2jDFFvXUVP6
MYTbXVmDlIlQiO+BBWa1yKsxmr0Z7yFRMJkKKFDIvSqPwHCwg6iCOmUDkBY6pVjW
v3jYQYXEd5zKSBdxdur2/KXRHePWv2YT543u3GbRX9RcaJaZ325rR4h+rKwsIKXw
6ozMB4L1jfpH28wnvtmjxkGNGiwnMu1zTnggnrb1YRi45+C6Cb0IxsAYn7By8TCQ
hA4Mit73AYEKIWk2m+Inq3N41yFSLYtr9/QCWrjtBdZP78GrA7TbiAkY/PZCU+A9
9s+f/UZzTRaUteN/nrG0llvezQ7tl279xa1mY0stBu4wziDQ9p4abQ1mQuP/C17Z
YjH2in0YrJ8bDFeVom+NSArAF9ISmGdsDIjRZbVYRL+lAd+QoAL9XJurqTwtiMxI
V5kqu6roqA6pdYdYvMp2/HLJrfQ+faLgvTvIYYZeaJKZSLAs+qvK/4YwitcOvqB2
HzlnaKd5BmQhVqhCrAzPB16iBNbv1YnFWGONcAD1ko111yw/3AA=
=ArG9
-----END PGP SIGNATURE-----

--q2o2fulec7ph3r2v--

