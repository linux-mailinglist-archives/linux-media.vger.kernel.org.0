Return-Path: <linux-media+bounces-55751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ1sOyxDtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:02:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D06287BB5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B89A131365DA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE873CAE99;
	Fri, 13 Mar 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciA1TzPq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484C39A04F;
	Fri, 13 Mar 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420995; cv=none; b=YyYYAqM9a4qb1UsTyduh0f8oCkYgVWyHSD7k4l9JBMlVaqI3Yyx9ef6gJqF07dwnsIpIlB2ATzxGktl62Va9gxwjjL9KmjsMBQYRwHs/n8icCR6aTBvtR2B7Oj5jQ0ssmf0I8v3GlKgvVYZ7o133lZPUtbVN/FrmvpGB78H4gFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420995; c=relaxed/simple;
	bh=hDVKbG9Yf6odh85cCwvUzR7BAHuhgj1Ew2MEys6Trsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjYZrzqqMkGi7n2FOTjL7T8nUho0Ae78X7sLB9tqHcqbkAxwccjdX4CIcpzcDvYdegzIHosaI+cn3txyH2cpqSmz1+63vZjU7oH3S/NJvY9M/nXdBtv+hgTjdYJLjZlVNRfAw2/B4ykEKZdIjj4cZaVqdo3e13NmH9e9UkOY9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciA1TzPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733FCC19421;
	Fri, 13 Mar 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773420995;
	bh=hDVKbG9Yf6odh85cCwvUzR7BAHuhgj1Ew2MEys6Trsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciA1TzPqOu8BMfC8IHLbAebnVNcj7qsJeA4HLeopB9SF5bZuUpH12FIl1lsWRk6fT
	 sduRD5oZ773+hAT6bizbdxuZNmhDrS6lXoW6lWKQ4FKvU+s4N7NsFx6z6iIp2wH2AQ
	 Mq3j+AyrFMpJ6swAM3l0n6KJPBbH7dH17H9FbmbunEOHQ0so4amK1cKVklGLmf82Bt
	 zHgy9zcr2lUG2pDmsAIxvNuaUA0+Du3orJCN4UUZIK6P01Mp/p26yzCood5Fcuzf99
	 1ADNliAvl7tUqjRnvG8z1E2k8Y6e5yRFIv23/MwS8ew8JYEeYDAvF60yENQT6ARiSE
	 vJpDvtnZCpKeA==
Date: Fri, 13 Mar 2026 16:56:29 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260313-quickly-imperial-47638c9f0d4f@spud>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U7yuErg2Ck8ZSJQ1"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55751-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6D06287BB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--U7yuErg2Ck8ZSJQ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 257 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
> new file mode 100644
> index 000000000000..7fd4214921cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
> @@ -0,0 +1,256 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3588 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital vid=
eo
> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. It re=
ceives
> +  the data from camera sensors, video decoders, or other companion ICs a=
nd
> +  transfers it into system main memory by AXI bus and/or passes it to th=
e image
> +  signal processing (ISP) blocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-vicap

Curious why this cannot share a binding with the existing 3568-vicap.
Looks pretty similar binding wise at least.
If it's an entirely different architecture or whatever, please mention
that in your commit message.

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK0
> +      - description: ICLK1
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk_host0
> +      - const: iclk_host1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 9
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to general register file used for video input b=
lock control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The digital video port (DVP, a parallel video inter=
face).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 5 # MEDIA_BUS_TYPE_PARALLEL
> +                  - 6 # MEDIA_BUS_TYPE_BT656
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 0 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 1 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 2 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 3 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 4 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@6:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the MIPI CSI-2 receiver 5 output.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@10:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the ISP0 input.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@11:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Port connected to the ISP1 input.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        vicap: video-capture@fdce0000 {
> +            compatible =3D "rockchip,rk3588-vicap";
> +            reg =3D <0x0 0xfdce0000 0x0 0x800>;
> +            interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks =3D <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +                     <&cru DCLK_VICAP>, <&cru ICLK_CSIHOST0>,
> +                     <&cru ICLK_CSIHOST1>;
> +            clock-names =3D "aclk", "hclk", "dclk", "iclk_host0", "iclk_=
host1";
> +            iommus =3D <&vicap_mmu>;
> +            power-domains =3D <&power RK3588_PD_VI>;
> +            resets =3D <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +                     <&cru SRST_D_VICAP>, <&cru SRST_CSIHOST0_VICAP>,
> +                     <&cru SRST_CSIHOST1_VICAP>, <&cru SRST_CSIHOST2_VIC=
AP>,
> +                     <&cru SRST_CSIHOST3_VICAP>, <&cru SRST_CSIHOST4_VIC=
AP>,
> +                     <&cru SRST_CSIHOST5_VICAP>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                vicap_dvp: port@0 {
> +                    reg =3D <0>;
> +
> +                    vicap_dvp_input: endpoint {
> +                        bus-type =3D <MEDIA_BUS_TYPE_BT656>;
> +                        bus-width =3D <16>;
> +                        pclk-sample =3D <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +                        remote-endpoint =3D <&it6801_output>;
> +                    };
> +                };
> +
> +                vicap_mipi0: port@1 {
> +                    reg =3D <1>;
> +
> +                    vicap_mipi0_input: endpoint {
> +                        remote-endpoint =3D <&csi0_output>;
> +                    };
> +                };
> +
> +                vicap_mipi1: port@2 {
> +                    reg =3D <2>;
> +
> +                    vicap_mipi1_input: endpoint {
> +                        remote-endpoint =3D <&csi1_output>;
> +                    };
> +                };
> +
> +                vicap_mipi2: port@3 {
> +                    reg =3D <3>;
> +
> +                    vicap_mipi2_input: endpoint {
> +                        remote-endpoint =3D <&csi2_output>;
> +                    };
> +                };
> +
> +                vicap_mipi3: port@4 {
> +                    reg =3D <4>;
> +
> +                    vicap_mipi3_input: endpoint {
> +                        remote-endpoint =3D <&csi3_output>;
> +                    };
> +                };
> +
> +                vicap_mipi4: port@5 {
> +                    reg =3D <5>;
> +
> +                    vicap_mipi4_input: endpoint {
> +                        remote-endpoint =3D <&csi4_output>;
> +                    };
> +                };
> +
> +                vicap_mipi5: port@6 {
> +                    reg =3D <6>;
> +
> +                    vicap_mipi5_input: endpoint {
> +                        remote-endpoint =3D <&csi5_output>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 237397f18f07..a972cd38c13d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22874,6 +22874,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/media/rkcif*
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>  F:	drivers/media/platform/rockchip/rkcif/
> =20
>  ROCKCHIP CRYPTO DRIVERS
>=20
> --=20
> 2.39.5
>=20
>=20

--U7yuErg2Ck8ZSJQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRBvQAKCRB4tDGHoIJi
0r13AQCoM3uVNwIVEjtjwPRLuvb1Q7eV3oSbdVL/cG8OYj5qbwD+NdwtNy7/0O2I
quuV/nSJm2mqBUbcVELHXceOgTCGmQU=
=bxXo
-----END PGP SIGNATURE-----

--U7yuErg2Ck8ZSJQ1--

