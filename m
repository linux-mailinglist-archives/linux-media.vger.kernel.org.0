Return-Path: <linux-media+bounces-34978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A47ADB5FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF9B3B3D20
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81791283FFB;
	Mon, 16 Jun 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXuopUs8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE12238C25;
	Mon, 16 Jun 2025 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089497; cv=none; b=rDgQ8+eBZtQ+vO34b4C9JDdAQ8FhU7dZwDfWqBvKqKKV7g7ajq+Dtmbvvy1MA6tBOeodzePR3wNfPK+BpSYsk4cELK60XwZrZCFN7tKLIJ/o10c2cfdXJ7I4ugGl7mhjATdNfyaOGSm+JqCg+PpQuiCgyKmXJNvQzsL5c8Yz7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089497; c=relaxed/simple;
	bh=LuhQSb+DK+8zQUn35OeyQUEtiFm17Yx6iJkF9jT6jAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUIQHBYDjicJdYftgnCziKEuw5cU++uxXawiwHhifTWXeVUXF/XRMy9BU2I82/9cAPbt7XqjINzqM5YT+CryIYQmo8esDFPXJcC4UhwULF1gmcbaJrQXipXo4LiVybRD4afX0BOUrBpErLNz6QohoaSR3D8OfuxQi36yTjCj9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXuopUs8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E588C4CEEA;
	Mon, 16 Jun 2025 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089497;
	bh=LuhQSb+DK+8zQUn35OeyQUEtiFm17Yx6iJkF9jT6jAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXuopUs8dZg+nW4ulZ3NCybN4E/fYmTKA3fG5vdNipDSwoMSw9v0GNdk9sHuMTgk8
	 7zEkBsHS609cRj2ocvQqoaRYiQYrkQqFHmnc4IyoA5nUX0U5GEfLt4DpQV7lGSALSx
	 IEbxO+EC/PWMviGLSOjSkMPCccA6CPwTwZNp5FJra76eEtwT0itnitLfln/5tAKCEx
	 O0B8v020LKb+AAm1AuMcyyi1pqEJevNe+RnC+VSDE/IjdV6Og84wboQlUun8Ipw+79
	 NE7txRrswhZNSLPD1I0SeYZPZOWoimaKVXGCMWKY/0QTIb1RAAW2TP/0XCT1JeD8Pd
	 oNTZIZ69riAiQ==
Date: Mon, 16 Jun 2025 16:58:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
Message-ID: <20250616-capped-rehab-6e7fd24d23ae@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
 <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
 <20250616-contempt-remix-5af2b7281cbd@spud>
 <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="seyiFdYL5UYYiB4P"
Content-Disposition: inline
In-Reply-To: <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>


--seyiFdYL5UYYiB4P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 05:50:50PM +0200, Benjamin Gaignard wrote:
>=20
> Le 16/06/2025 =E0 17:42, Conor Dooley a =E9crit=A0:
> > On Mon, Jun 16, 2025 at 05:30:44PM +0200, Benjamin Gaignard wrote:
> > > Le 16/06/2025 =E0 17:14, Conor Dooley a =E9crit=A0:
> > > > On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
> > > > > Add a device tree binding for the Verisilicon (VSI) IOMMU. This I=
OMMU sits
> > > > > in front of hardware encoder and decoder blocks on SoCs using Ver=
isilicon IP,
> > > > > such as the Rockchip RK3588.
> > > > >=20
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > ---
> > > > >    .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++=
++++++++
> > > > >    1 file changed, 71 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/iommu/ver=
isilicon,iommu.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,=
iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..acef855fc61d
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.y=
aml
> > > > > @@ -0,0 +1,71 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Verisilicon IOMMU
> > > > > +
> > > > > +maintainers:
> > > > > +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > +
> > > > > +description: |+
> > > > > +  A Versilicon iommu translates io virtual addresses to physical=
 addresses for
> > > > > +  its associated video decoder.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: verisilicon,iommu
> > > > You're missing a soc-specific compatible at the very least here, bu=
t is
> > > > there really no versioning on the IP at all? I'd be surprised if
> > > > verisilicon only produced exactly one version of an iommu IP.
> > > I only aware this version of the iommu for the moment.
> > "for the moment", yeah. Is there any information that could be used to
> > version this available?
>=20
> The hardware block isn't documented in the TRM so I don't know if there i=
s a version
> field or something like that.
>=20
> >=20
> > > Does adding verisilicon,rk3588-iommu sound good for you ?
> > It'd be "rockchip,rk3588-iommu", but sure.
>=20
> "rockchip,rk3588-iommu" is already use for other MMUs in rk3588.

"rockchip,rk3588-video-iommu" then? Instances of an IP in an SoC get a
specific compatible with the SoC vendor's prefix, so having verisilicon
there isn't suitable unless they made the SoC.

--seyiFdYL5UYYiB4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA/EwAKCRB4tDGHoIJi
0kI2AP9KzlLbf7P4rTL1jmXCfJUvvM/YIgPfj9+baZXHSXGhrAEAjEfA2e8F23cf
LiiZ9+IgE8h/RFOqP0RqrYnEJHimugI=
=bE0w
-----END PGP SIGNATURE-----

--seyiFdYL5UYYiB4P--

