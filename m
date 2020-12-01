Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFD42CA030
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 11:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgLAKoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 05:44:12 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38149 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbgLAKoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 05:44:11 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 444B558030A;
        Tue,  1 Dec 2020 05:43:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 01 Dec 2020 05:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=cE2/BhUuBTM/tBl05gTg+SiiGeu
        zIsoIfzMBf7YnS2Y=; b=TTSDNj5Qz3HwMQkFp0pu8knvWV5N4sqPq/sKHPYdf2c
        GbUL4xSRcIs9uDGNX96An8+73C3033lk7Bwt6sCE9SyhaJMrGHq3B6OgY9DVvLIj
        fHSNRpIxflg4K5fr5u8L9vNZ4zKZ1bfRkW4nPpYxOHswd1/RPBU3EfZgHNRZKqFn
        /QfKRLQ+ohU+uoxvDHCmZQbHIankuJd5g1DlAVEKLD92ofrbd5czoKXbFjAwQSzk
        kt0TJW8eNpLwYev4kBEEPSAwnm/kdf6noJcDaNcfZ6j2Hux1GFzTuU/vbfKL/L5z
        ertYyPmsHN9wfiWubFYKWZ5PHNnsmdLgFruRrAO9Zyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cE2/Bh
        UuBTM/tBl05gTg+SiiGeuzIsoIfzMBf7YnS2Y=; b=lo/pEgHKY7eaZMbyFdSjVg
        /T1tVKX4yGE+SbCd3lP+ekKyKYfmIjdb5hGTG+axT3YcPp7/DaXeVK3KTUjI8QRt
        lppm3VR7e8aoj4wmlmpzCZyGyIgM9+fEv5IY+Vkv/t29rTtH2A7Q/weI57CGhTV6
        ImZbmxn5S4M82K0kmk++GaKdbM8GdquO7ry6oP6lE+Qw4zk9BUr0N3tuj/0LT9ID
        KmpERhe/ksxC3Fw1/IKWEBg60YlVWNgKsmR2kcOp9so8NOudRCkHJx+Ma0Pjr/Ti
        q4hT7aheDlfunj2/KOSIAPim1Vudl8hc6xy7RkThzC+RQx5NLQsx8smA33OuwaBA
        ==
X-ME-Sender: <xms:Sh7GX4fUb4HLP2grPqfsRgouiXGhx_pjHaTIBXGuJMreb1OB1aj0zg>
    <xme:Sh7GX6Pj-Nv2fLMg_ZvPSfjdtr5-EKsT1sm2wAZ37_vW0j6puhey8XmgIty9RvtR3
    OVMP_-w27njo2_WgWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Sx7GX5i2IXEV5HwjDQj-0KCck85FZj_OgrRWWH8QxQy9y-u7uFKdYA>
    <xmx:Sx7GX9-6at4TcrUQMwGL9jJ9aodWqOrOheclBBf-B4Wtxp7HmXXszw>
    <xmx:Sx7GX0uvLXvtUW-43_DPBbSTLwTzxtDaaXj6xquwhpf5AZyVuZOTKA>
    <xmx:TR7GX9U75SJsrrkaeP6KBamtMTjBOo8ym628enLPf-Nbs_Wpcb78VA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AA12108005E;
        Tue,  1 Dec 2020 05:43:22 -0500 (EST)
Date:   Tue, 1 Dec 2020 11:43:21 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v2 06/19] dt-bindings: media: sun6i-a31-csi: Add MIPI
 CSI-2 input port
Message-ID: <20201201104321.rl3ujt5pjre6xlmm@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-7-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lun5d3kfon2axx3z"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-7-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lun5d3kfon2axx3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 03:28:26PM +0100, Paul Kocialkowski wrote:
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
> stays enumerated as fwnode port 0. However, it is now marked as
> deprecated and the multi-port approach should be preferred.
>=20
> Note that additional ports may be added in the future, especially to
> support feeding the CSI controller's output to the ISP.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        | 86 ++++++++++++++++---
>  1 file changed, 73 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.=
yaml
> index 1fd9b5532a21..3bcee2d44f3c 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -43,6 +43,7 @@ properties:
>    # See ./video-interfaces.txt for details
>    port:
>      type: object
> +    deprecated: true

I'm not sure we want to deprecate it. There's some SoCs with the same
controller but without the MIPI-CSI block where this would be completely
valid

>      properties:
>        endpoint:
> @@ -67,6 +68,59 @@ properties:
> =20
>      additionalProperties: false
> =20
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Parallel input port, connect to a parallel sensor
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +              bus-width:
> +                enum: [ 8, 10, 12, 16 ]
> +
> +              pclk-sample: true
> +              hsync-active: true
> +              vsync-active: true
> +
> +            required:
> +              - bus-width
> +              - remote-endpoint
> +
> +        required:
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +      port@1:
> +        type: object
> +        description: MIPI CSI-2 bridge input port
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +        additionalProperties: false

There's a schema for the OF-graph now, you'll want to use it.

Maxime

--lun5d3kfon2axx3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8YeSQAKCRDj7w1vZxhR
xYT9AP0Uber0QsvWLD/B/ipxiWtm7WnSzo8VBPN3jw6D/qe1nQEAg9cRv6wvzoR4
aKRHG2EGIYA4/0s/XpYOYyVY5HBrwwg=
=udSm
-----END PGP SIGNATURE-----

--lun5d3kfon2axx3z--
