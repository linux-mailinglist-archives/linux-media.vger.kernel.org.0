Return-Path: <linux-media+bounces-65571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJOqA6EKPGpmjAgAu9opvQ
	(envelope-from <linux-media+bounces-65571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 18:49:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4D6C0169
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 18:49:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QwKumWc6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65571-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65571-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B0C5310C7C1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAD3335064;
	Wed, 24 Jun 2026 16:41:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A4D332604;
	Wed, 24 Jun 2026 16:41:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319313; cv=none; b=pud5OvLXGzsCnKN8oV0uMole1NB/oNbKtkrOaWWe6X5s+iPikbxL255KIg0hTSiGtoVMvBxFY7cWSW6JKtczHBRr/I3znAWKTK0JtxCzfer2liPe+9l+zfb44lT6X7mURGLI9Z5+V1HOtO7DxefJc7LipqR1yvLKgiSAuzseCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319313; c=relaxed/simple;
	bh=UHG6ION9IQY/Op697uvbTCZ+NPm6/gdzScwdl30+W5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPKOhATiauLyU+peZVuj+3CZ+ZXXvVjK8oU2o9s4td8taiZEacIePwlf92RGhjB+28KXorQABRIvtfBERDv+alsjQ1/ZAvGux++8G++oHbvoLzoR27ZjPUmscgaKw+HkhHf5+nR9mHs8VK6OCAdY86ZLWgn4ZM3gl9ZURghEKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwKumWc6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41A31F000E9;
	Wed, 24 Jun 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319311;
	bh=otQirIYEL+4pOPb37/VuxVw2CRpKpkcqiKSoH0mogEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QwKumWc6qMER8bZl/4IoZjiK3D/x6E+PM851PSKiSVHS/qJ+JeFE1BSmlIIBLBqi2
	 9uUvGvU4ggWMr0CHci2HhRqolfv3LkWb72fU02Hkg7RIAmAXB9ilg+t+Es5TLvQ7O2
	 ybMhO3lwuiVpV0D1pcsAvx1lRplG/+572aBz5ICNSWcBZZ3JSfSjYaQ4JPnnn2JTpJ
	 9oX+tqt4OcgAjrg1agQWqgcH3W1engiiBJyZ3eSelRLwqtct3bYkFdpc1npXky5e85
	 rSHvA8xVyiOo3KusSOOEF7pUFOdZ1FuyKrF2nyMp6q4N5bcgI8u/RML1HYHo1fPoxG
	 zaKbk0LT0pf1A==
Date: Wed, 24 Jun 2026 17:41:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260624-junkyard-sensuous-fcd43189b593@spud>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4Wxqievs7Jbih5g"
Content-Disposition: inline
In-Reply-To: <20260624072043.238-3-nas.chung@chipsnmedia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:nas.chung@chipsnmedia.com,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65571-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,pengutronix.de,vger.kernel.org,nxp.com,lists.infradead.org,chipsnmedia.com,mailbox.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,intel.com:email,vger.kernel.org:from_smtp,spud:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CF4D6C0169


--T4Wxqievs7Jbih5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 04:20:36PM +0900, Nas Chung wrote:
> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.
>=20
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The control region
> manages shared resources such as firmware memory, while each interface
> region has its own MMIO range and interrupt.
>=20
> The control region and each interface region are distinct DMA requesters
> and can be associated with separate IOMMU stream IDs. Represent the
> control region as the parent node and the interface register regions as
> child nodes to describe these resources.
>=20
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/nxp,imx95-vpu.yaml         | 163 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b=
/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> new file mode 100644
> index 000000000000..9a5ca53e15a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decod=
er.
> +  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register regi=
on and
> +  four interface register regions for a shared video processing engine.
> +  The parent node describes the control region, which has its own MMIO r=
ange and
> +  manages shared resources such as firmware memory. The child nodes desc=
ribe the
> +  interface register regions. Each interface region has its own MMIO ran=
ge and
> +  interrupt.
> +  The control region and the interface regions are distinct DMA requeste=
rs.
> +  The control region and each interface region can be associated with se=
parate
> +  IOMMU stream IDs, allowing DMA isolation between them.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-vpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VPU core clock
> +      - description: VPU associated block clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: vpublk
> +
> +  power-domains:
> +    items:
> +      - description: Main VPU power domain
> +      - description: Performance power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: vpu
> +      - const: perf
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the SRAM node used to store reference data, reducing DMA
> +      memory bandwidth.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^interface@[0-9a-f]+$":

I have to wonder if this interface business is required at all.
Why can this not go into the parent, with each region fetchable via
reg-names, interrupt-names and iommu-names?

Cheers,
Conor.

> +    type: object
> +    description:
> +      An interface register region within the Chips&Media Wave6 codec IP.
> +      Each region has its own MMIO range and interrupt and can be associ=
ated
> +      with a separate IOMMU stream ID for DMA isolation.
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - memory-region
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      video-codec@4c4c0000 {
> +        compatible =3D "nxp,imx95-vpu";
> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
> +        clocks =3D <&scmi_clk 115>,
> +                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names =3D "core", "vpublk";
> +        power-domains =3D <&scmi_devpd 21>,
> +                        <&scmi_perf 10>;
> +        power-domain-names =3D "vpu", "perf";
> +        memory-region =3D <&vpu_boot>;
> +        sram =3D <&sram1>;
> +        iommus =3D <&smmu 0x32>;
> +        #cooling-cells =3D <2>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        ranges;
> +
> +        interface@4c480000 {
> +          reg =3D <0x0 0x4c480000 0x0 0x10000>;
> +          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus =3D <&smmu 0x33>;
> +        };
> +
> +        interface@4c490000 {
> +          reg =3D <0x0 0x4c490000 0x0 0x10000>;
> +          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus =3D <&smmu 0x34>;
> +        };
> +
> +        interface@4c4a0000 {
> +          reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
> +          interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus =3D <&smmu 0x35>;
> +        };
> +
> +        interface@4c4b0000 {
> +          reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
> +          interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +          iommus =3D <&smmu 0x36>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..77ea3a1a966b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28688,6 +28688,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>  F:	drivers/media/platform/chips-media/wave5/
> =20
> +WAVE6 VPU CODEC DRIVER
> +M:	Nas Chung <nas.chung@chipsnmedia.com>
> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> +
>  WHISKEYCOVE PMIC GPIO DRIVER
>  M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
>  L:	linux-gpio@vger.kernel.org
> --=20
> 2.31.1
>=20

--T4Wxqievs7Jbih5g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwIygAKCRB4tDGHoIJi
0hLXAP9TCYtIsHivj/hFDLRtffpnrKQkTYchnDONTv0kgDdKhwEAsu6uG/yFM8qH
7l2PHAhAXypNeHKokg9enaqHgtSVBgI=
=F17r
-----END PGP SIGNATURE-----

--T4Wxqievs7Jbih5g--

