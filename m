Return-Path: <linux-media+bounces-34956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50AADB50A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40B53AB677
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A58220F2D;
	Mon, 16 Jun 2025 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PX/3X52x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974331EA7E1;
	Mon, 16 Jun 2025 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086853; cv=none; b=c3i/AA3LvXPum3ucU59ALJBNrvj6dO4J4KlF3sbxu1rUHyPt6gUfdCr02iTsbR6zbk+mTWrssuH3Ma3IXst9aPSI7jJTupX+dJB9QX5sDGJACX9YuujLhZgrT2jIJnT79utjJL65pleXLI+7oNKcxid4L6UUTYxDYDTKsj2IBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086853; c=relaxed/simple;
	bh=oVNq1HKgH5AsdLLp2/oc3d/YzPzDQJprNg0ypJQvF5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJ267jELFd3zfl2fNAm3Ogv3rOzqVGlTsjn0OqUdTxv8DrnK37Lb6RA3+Qavm0dPa2mQ1Kz6cKHLGm85gIdGlObZOedHp7dHWUIF2EM1NUeLl+iOsB/QGQjUIHY5rLRSt7whQsBKby8VIl9SwAfYzFOwf3NW9jRWTorr/8hhaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PX/3X52x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D51C4CEED;
	Mon, 16 Jun 2025 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086853;
	bh=oVNq1HKgH5AsdLLp2/oc3d/YzPzDQJprNg0ypJQvF5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PX/3X52xu3kaMjy4O0uJXkY0H6d569uWQLxiivcPb8otZdkmozLr37/eGCZohQ17T
	 oFoOccSPG+bsR4FgnAe+PubjvwayN/Ks4Bxez77C+J1E9sArCYo02bUlZY1f3Ak2lI
	 MZZQctzQzyq9iMWROBGPEXG6ffe2ekqloegWqLh6gd2ThRxY40gocWRFxoBwo0eIPA
	 CAubRuQxNHcH2O1rCBpaj2oZ62ToeHGbFpmKzN66ez/+r1KVb1HvKKdA+GZbtjte3b
	 JiDdx7JsZI6Ly49Sr/bsk1R9Dujl1wNEAHvF+wMs9s4uEV5apub+euT2LSRC8SW//l
	 O9mX5WdLzDAsg==
Date: Mon, 16 Jun 2025 16:14:07 +0100
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
Message-ID: <20250616-winter-strict-db98f85db22d@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9fJcQZWqMIbTgGsZ"
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-3-benjamin.gaignard@collabora.com>


--9fJcQZWqMIbTgGsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
> Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
> in front of hardware encoder and decoder blocks on SoCs using Verisilicon=
 IP,
> such as the Rockchip RK3588.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,i=
ommu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.ya=
ml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> new file mode 100644
> index 000000000000..acef855fc61d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Verisilicon IOMMU
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
> +
> +description: |+
> +  A Versilicon iommu translates io virtual addresses to physical address=
es for
> +  its associated video decoder.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: verisilicon,iommu

You're missing a soc-specific compatible at the very least here, but is
there really no versioning on the IP at all? I'd be surprised if
verisilicon only produced exactly one version of an iommu IP.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Interface clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: iface

Why "aclk" rather than core, to match the description?

> +
> +  "#iommu-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#iommu-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      vsi_mmu: iommu@fdca0000 {

The "vsi_mmu" label can be dropped here, it has no users.

Cheers,
Conor.

> +        compatible =3D "verisilicon,iommu";
> +        reg =3D <0x0 0xfdca0000 0x0 0x600>;
> +        interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_AV1>, <&cru PCLK_AV1>;
> +        clock-names =3D "aclk", "iface";
> +        #iommu-cells =3D <0>;
> +      };
> +    };
> --=20
> 2.43.0
>=20

--9fJcQZWqMIbTgGsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA0vwAKCRB4tDGHoIJi
0vT6AQC6scfk381tN82ARmoQ+PHZMrSLuYi9ck4P/3vTospnlgEA8JzI7GkSRolM
exwAAerU1ffK1uHS3p3k6fwqqJumHgY=
=9xSJ
-----END PGP SIGNATURE-----

--9fJcQZWqMIbTgGsZ--

