Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE39F408617
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbhIMIKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:10:53 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37727 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234684AbhIMIKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:10:52 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id A4E95580B92;
        Mon, 13 Sep 2021 04:09:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 13 Sep 2021 04:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=taTDVVgNHDmxrDI6auoBpwRlTeV
        9nCDLqv3i8d33BxY=; b=IGzL8uXiUHJvU4ElPo2UTotQSCdYJodtrUCmQzGxwjp
        mdVwMcEPzcmsnj5SFfxsj0eLESNAU1mx9pZL3gbnJfilNMK2XFw+Mx8tQjOvYJAB
        HQS7+8WanabvwpkIOyxucn+lGIEwA8ks11lx3sY7unSFsJdaJDMKB2c4AiutuEKV
        MPLwacvmqwDuy+sEPO1CDLG7emoKIByIDDkFE6uNmDgxIvjsK+gcniBK/z0ZUJ54
        OxvD6J3rEaK+okvbcNeuK6KBRSDIxmc+R8equbb54wOGmh+jGqGWWJBQnGrMLYhN
        Hm4Ct70kgnXh/0u5J9MZXunokWwKYyJIOWV/x+1dKkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=taTDVV
        gNHDmxrDI6auoBpwRlTeV9nCDLqv3i8d33BxY=; b=rk8FOzd7VEkTxSSi3R6HL1
        ABEIcR2qjr8ifv0r32ZRJRkcTHa5BoFClOUqBbDdpiyHT2VscnEKCavciWg4E91Q
        6KlL4GCULyhuq2WX1yUFhIKxdAOXQb9jtt3F6nGDFAHX8uB44uIxpqkbWUfhq7bz
        WbDjwQZ79Tsfkvy+xn0RaC06GF/RB1YwQiNMJ2Qm4Uo4fXctOTyZulnUhn+D9/hh
        maA4oHof99Tc2yB3CT5F0Uun2SKoyhiCnLvlOD3PlcyY2k982AVg/cGqTozlX29O
        HKQ0Xed/bTcjQrdU1AekKqEIwAloAnrjtuJeBAryQ5APUgBFD/Me5W+BHc9g0Jrw
        ==
X-ME-Sender: <xms:PQc_YSTQtcIjV2_ZfcZJwSps85cN4OM9X9qiIVDnjq326Kp5Xclp8Q>
    <xme:PQc_YXwTkKEC0juq2cq4ICaAvdsF9xvcGeFa335Z8ctY6_pc7_I7uBrCVlWwPgbE6
    sgBnjd1dut7AniTgIw>
X-ME-Received: <xmr:PQc_Yf0LirGJRGp-USmNCkWvg9p3dHFMCHgMHra5l4R5MfKb_TS3EcN2CfPBWXWypOKJSQ3SGzwp0kjSxxRtS8l8Oi1n7aBse275>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeguden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
    hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PQc_YeDUq1Y6mGRnuOcfa-r1FhJBCZdr7Pz1AHTKDr9ZZnZ1DuSYEA>
    <xmx:PQc_YbinLgNC1M1pzP0_rDM2gS_nroIjGFODlQ913fQeVRukaSnNIQ>
    <xmx:PQc_YapVE_Q7VE3OvMdFP9NQ3KbLwX-nXpWvAsf_2poMqi0rtrqRgg>
    <xmx:QAc_YY0rzQCz3_zmrtV5nTMmxXxhQ3eEV9SatvZ0JMKxiZP360kkWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:09:33 -0400 (EDT)
Date:   Mon, 13 Sep 2021 10:09:31 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/22] dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2
 input port
Message-ID: <20210913080931.opbtx45sxqu52jxe@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-6-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="upsk4eai2egrf6nm"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--upsk4eai2egrf6nm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:41:30PM +0200, Paul Kocialkowski wrote:
> The A31 CSI controller supports two distinct input interfaces:
> parallel and an external MIPI CSI-2 bridge. The parallel interface
> is often connected to a set of hardware pins while the MIPI CSI-2
> bridge is an internal FIFO-ish link. As a result, these two inputs
> are distinguished as two different ports.
>=20
> Note that only one of the two may be present on a controller instance.
> For example, the V3s has one controller dedicated to MIPI-CSI2 and one
> dedicated to parallel.
>=20
> Update the binding with an explicit ports node that holds two distinct
> port nodes: one for parallel input and one for MIPI CSI-2.
>=20
> This is backward-compatible with the single-port approach that was
> previously taken for representing the parallel interface port, which
> stays enumerated as fwnode port 0.
>=20
> Note that additional ports may be added in the future, especially to
> support feeding the CSI controller's output to the ISP.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        | 75 +++++++++++++++----
>  1 file changed, 62 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.=
yaml
> index 8b568072a069..f4a686b77a38 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -61,6 +61,49 @@ properties:
> =20
>      additionalProperties: false
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Parallel input port, connect to a parallel sensor
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                enum: [ 8, 10, 12, 16 ]
> +
> +              pclk-sample: true
> +              hsync-active: true
> +              vsync-active: true
> +
> +            required:
> +              - bus-width
> +
> +        additionalProperties: false

You don't have to duplicate the entire definition there, you can just
reference port:

$ref: #/properties/port

> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: MIPI CSI-2 bridge input port
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +        additionalProperties: false
> +

port@0 is required?

And at the top-level, either ports or port are required too

>  required:
>    - compatible
>    - reg
> @@ -89,19 +132,25 @@ examples:
>                        "ram";
>          resets =3D <&ccu RST_BUS_CSI>;
> =20
> -        port {
> -            /* Parallel bus endpoint */
> -            csi1_ep: endpoint {
> -                remote-endpoint =3D <&adv7611_ep>;
> -                bus-width =3D <16>;
> -
> -                /*
> -                 * If hsync-active/vsync-active are missing,
> -                 * embedded BT.656 sync is used.
> -                 */
> -                 hsync-active =3D <0>; /* Active low */
> -                 vsync-active =3D <0>; /* Active low */
> -                 pclk-sample =3D <1>;  /* Rising */
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                /* Parallel bus endpoint */
> +                csi1_ep: endpoint {
> +                    remote-endpoint =3D <&adv7611_ep>;
> +                    bus-width =3D <16>;
> +
> +                    /*
> +                     * If hsync-active/vsync-active are missing,
> +                     * embedded BT.656 sync is used.
> +                     */
> +                     hsync-active =3D <0>; /* Active low */
> +                     vsync-active =3D <0>; /* Active low */
> +                     pclk-sample =3D <1>;  /* Rising */
> +                };
>              };
>          };
>      };

I'd keep the original example and add one with the CSI bridge

Maxime

--upsk4eai2egrf6nm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8HOwAKCRDj7w1vZxhR
xVPgAQCQRGZo6oa4WL9v6n8HncVFzdZFDZEb8Opb0Dfte4y9OAEAtplvq/ByItS7
9+yO+N8K3cQCS/R7oD/8qvWHosfT/AM=
=t9Py
-----END PGP SIGNATURE-----

--upsk4eai2egrf6nm--
