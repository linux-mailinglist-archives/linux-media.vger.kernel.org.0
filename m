Return-Path: <linux-media+bounces-34975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134FADB5B3
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352D316917B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20491265287;
	Mon, 16 Jun 2025 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5Ka/c3P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72E25291B;
	Mon, 16 Jun 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088567; cv=none; b=pdw8aTacMItpHTYdPOAVPXNeXbeQqdxApATqFxUdJH3Ai4zvZvpHfkQdHYbFLuZxNg2Ga+FWLspWff0JT87maP303jWF6C7cdj5yktAdofpdckNw7xynK+yNfQm6EreRdWV3htLmC1MueWusy391MvqZp/o3+wivYqiB8qI6K8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088567; c=relaxed/simple;
	bh=EL96VpQZzhoPtchVrd8NRiz8LeFclfDJXhz0xUwdWEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAqwHzuGe9ICFzizMBlF1EvvFAxgM/xMAbGTNHaFh0e2/wtRJsslnOAuVc199SgIEujR1MGJRJBa/7ED6NcO1OYtkzHIFS4F3Vov26yiRlI8aFVnVtHRqHIJNfQNKxy9Ug4qFyh+C6z0u9nJzIPxusi89sY0S+qRF+bZnOABreM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5Ka/c3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831C7C4CEF0;
	Mon, 16 Jun 2025 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750088566;
	bh=EL96VpQZzhoPtchVrd8NRiz8LeFclfDJXhz0xUwdWEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5Ka/c3Pxo+O35mhlGpQYbsO72F4TNYunYxC9sAiN0UEZIa60ATRi78eLQwlw6bgB
	 raQRDb4JhgkjOV9Kd45dAKE7FK72iXYWxdfRy6mU5bbXypwMbRt+FYr6wtiovTqWBm
	 Vu4A21c35saGJ9Z5JbcT88hX6baMyaLHvGwaXMhVmNEmzWYBAk2ach3q9DRvZ2Ipsk
	 Rnk+vVVByYuFwlCBHF++frBXTaZ2UZla0C7b0GBjD7rQ78CCtpTLdNH7dnJQwuckV7
	 9TM8VTo/DTm9qcr1yC3+gpJKSzqCAGG/3ZABybuPDdfteDDxOygw6B+lJwdmr3iPDa
	 Y3UKalyDBFfvw==
Date: Mon, 16 Jun 2025 16:42:41 +0100
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
Message-ID: <20250616-contempt-remix-5af2b7281cbd@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
 <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uegz8X9AMqKgIIC"
Content-Disposition: inline
In-Reply-To: <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>


--3uegz8X9AMqKgIIC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 05:30:44PM +0200, Benjamin Gaignard wrote:
>=20
> Le 16/06/2025 =E0 17:14, Conor Dooley a =E9crit=A0:
> > On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
> > > Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU=
 sits
> > > in front of hardware encoder and decoder blocks on SoCs using Verisil=
icon IP,
> > > such as the Rockchip RK3588.
> > >=20
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > >   .../bindings/iommu/verisilicon,iommu.yaml     | 71 ++++++++++++++++=
+++
> > >   1 file changed, 71 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/iommu/verisili=
con,iommu.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iomm=
u.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > > new file mode 100644
> > > index 000000000000..acef855fc61d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Verisilicon IOMMU
> > > +
> > > +maintainers:
> > > +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > +
> > > +description: |+
> > > +  A Versilicon iommu translates io virtual addresses to physical add=
resses for
> > > +  its associated video decoder.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: verisilicon,iommu
> > You're missing a soc-specific compatible at the very least here, but is
> > there really no versioning on the IP at all? I'd be surprised if
> > verisilicon only produced exactly one version of an iommu IP.
>=20
> I only aware this version of the iommu for the moment.

"for the moment", yeah. Is there any information that could be used to
version this available?

> Does adding verisilicon,rk3588-iommu sound good for you ?

It'd be "rockchip,rk3588-iommu", but sure.

--3uegz8X9AMqKgIIC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA7cQAKCRB4tDGHoIJi
0iCzAP9YCsHKGIYiBpnknc4NXqsdt+3vAksXP7lkL3rhV72dnAD/V+ZJlq0CxEGR
YIn/c1CTX5YI8+iwECvQSNErsd1qHAo=
=gnvG
-----END PGP SIGNATURE-----

--3uegz8X9AMqKgIIC--

