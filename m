Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04142D9778
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438295AbgLNLgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:36:13 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52745 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438254AbgLNLgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:36:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 287AE5804E5;
        Mon, 14 Dec 2020 06:35:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 06:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=7YLscnmdLB07H4eSAb1EiY9Lhzk
        Ym3A9190ioXjO2zM=; b=hyIN9wLS+hee293EsD3dSQLdBNpo9iSj+7a/QNpirgs
        xcRd4HXbJitSxqoYAtaVcU8L4+IbiHxrm74HX2r0dYrn0gAd+3Ouy0q+07SQ7yBA
        68mOut23yOReAWK0ch6309nw70Vv2MRbykwEMLz5GqPn7OwY1KcUkbQwRB1viNXj
        7zbChZd5tBgv6qc7eEz2B4ChBbIV+lx+Iu6dD0j/DBKvFw7HpjGapNUbcOF19o8t
        BbaRUDzSM4CfuvBLpLoELwQbyqhQmMIZGpfvlJXVH80+TZ0C4MfZ+3HMsetZBbEv
        98vtjzBGm9txya0oRci6gixlKnxmDrX5qAgCmrkqz1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7YLscn
        mdLB07H4eSAb1EiY9LhzkYm3A9190ioXjO2zM=; b=IQyw/uWOYWxd5+popsimjd
        Ep/V/lVb29Ngy1OGH3FFcSfI9ylZA84reFV+9ixBT7/DZUPpX0MoK9kHQKPr4xje
        UxkTSIG5myVPwS6MTv4rQE/XRtzn7GFypU1VOAUzejDsgk4dtuUcy+QX5WtYy+LI
        nZaFeH6GsnJFR4BlD/jSnYJvqwJiCxeMFOxM7cYoWsGQmnY8u80oGZxQ2QyVcUdc
        YOMfeXhgo99hnc8IWbrnJ9jrFjiTawSFXxWn2reSURJlag88vKVW1tigOzlCVhEE
        nyFcB4xnWhYsLBdhVVaAbVgy7iGd1fXZmxEz6M3zx7Vkt677+MfLWxJ91eGlQdxQ
        ==
X-ME-Sender: <xms:7k3XX1YPLKB1NAnhcxNCgkWEjb-n8_49gs84Or6TWTJ8O7wOKNebdg>
    <xme:7k3XX8bnx8csD2PiQ8DDnUjXDEog3XvuG1EO4QgIWdsIMo5VbUMWpl5sb7p9tn6YS
    ODhP1hdxlACrg0X6g4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
    ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7k3XX3_rQQCKSfhFS1gL6Z1FHY54wPZBu4MMgYEPm1mSmi5AkeycOA>
    <xmx:7k3XXzrLnNXa7swSD-C0H0w1flt3Vy-GlhQQBsgDXtJRSxMJkoO9Aw>
    <xmx:7k3XXwpoFLS2mF77X5-llnuILMGZtvKDEGLAmg0tmkLfOYKe6yTZUQ>
    <xmx:703XXwB-D6FRIbLGIMu4_hhcVRxIjpqM0baPwf9mwND61z5WyNfiyg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 88CEC108005B;
        Mon, 14 Dec 2020 06:35:10 -0500 (EST)
Date:   Mon, 14 Dec 2020 12:35:09 +0100
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
Subject: Re: [PATCH v3 08/15] dt-bindings: media: Add A31 MIPI CSI-2 bindings
 documentation
Message-ID: <20201214113509.gkzf42rtag5b4mcn@gilmour>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-9-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xr5od2srzjhkveva"
Content-Disposition: inline
In-Reply-To: <20201211155708.154710-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xr5od2srzjhkveva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 04:57:01PM +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A31 MIPI CSI-2
> controller.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
6i-a31-mipi-csi2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..4d0bab541da1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-cs=
i2.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allwinner,sun6i-a31-mipi-csi2.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 MIPI CSI-2 Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun6i-a31-mipi-csi2
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-csi2
> +          - const: allwinner,sun6i-a31-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  phys:
> +    items:
> +      - description: MIPI D-PHY

This should be written as

phys:
  description: ...

Maxime

--xr5od2srzjhkveva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9dN7QAKCRDj7w1vZxhR
xa/4AP4qKCMRkGVqlSFOB4YcEHRswHol+VlXlfGrq/lGFp1dQwEA8n97QlZQEEVj
E1GKI8U0SUu2bgpKb3Wu8JLaYGw1KAY=
=gA8y
-----END PGP SIGNATURE-----

--xr5od2srzjhkveva--
