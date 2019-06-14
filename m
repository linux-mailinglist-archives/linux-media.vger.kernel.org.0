Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C5245938
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 11:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfFNJuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 05:50:01 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52005 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfFNJuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 05:50:01 -0400
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2184FC000A;
        Fri, 14 Jun 2019 09:49:45 +0000 (UTC)
Date:   Fri, 14 Jun 2019 11:50:58 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 01/10] media: dt-bindings: marvell,mmp2-ccic: Add
 Marvell MMP2 camera
Message-ID: <20190614094921.tf4nqgszhg7pxzft@uno.localdomain>
References: <20190505140031.9636-1-lkundrak@v3.sk>
 <20190505140031.9636-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kj5s4had2x4icus2"
Content-Disposition: inline
In-Reply-To: <20190505140031.9636-2-lkundrak@v3.sk>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kj5s4had2x4icus2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Lubomir,

On Sun, May 05, 2019 at 04:00:22PM +0200, Lubomir Rintel wrote:
> Add Marvell MMP2 camera host interface.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> ---
> Changes since v4:
> - s/Nust/Must/
> - Documented required endpoint properties; bus-type, hsync-active,
>   vsync-active and pclk-sample.
>
> Changes since v3:
> - Dropped the video-interfaces.txt reference
> - Clarify "clocks", "clock-names" and "clock-output-names" descriptions
> - Refer to other documentation by full path
>
> Changes since v2:
> - Added #clock-cells, clock-names, port
>
>  .../bindings/media/marvell,mmp2-ccic.txt      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
>
> diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> new file mode 100644
> index 0000000000000..7ec2c8c8a3b98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> @@ -0,0 +1,50 @@
> +Marvell MMP2 camera host interface
> +
> +Required properties:
> + - compatible: Should be "marvell,mmp2-ccic".
> + - reg: Register base and size.
> + - interrupts: The interrupt number.
> + - #clock-cells: Must be 0.
> +
> +Optional properties:
> + - clocks: Reference to the input clock as specified by
> +           Documentation/devicetree/bindings/clock/clock-bindings.txt.
> + - clock-names: Names of the clocks used; "axi" for the AXI bus interface,
> +                "func" for the peripheral clock and "phy" for the parallel
> +                video bus interface.
> + - clock-output-names: Optional clock source for sensors. Shall be "mclk".
> +
> +Required subnodes:
> + - port: The parallel bus interface port with a single endpoint linked to
> +         the sensor's endpoint as described in
> +         Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Required endpoint properties:
> + - bus-type: data bus type, <5> or <6> for Parallel or Bt.656 respectively
> + - pclk-sample: pixel clock polarity
> + - hsync-active: horizontal synchronization polarity (only required for
> +   parallel bus)
> + - vsync-active: vertical synchronization polarity (only required for
> +   parallel bus)

Minor nit: if you don't want to specify what maps to 0/1 in the
properties, could you add "as defined in video-interfaces.txt" after
each property?

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +
> +Example:
> +
> +	camera0: camera@d420a000 {
> +		compatible = "marvell,mmp2-ccic";
> +		reg = <0xd420a000 0x800>;
> +		interrupts = <42>;
> +		clocks = <&soc_clocks MMP2_CLK_CCIC0>;
> +		clock-names = "axi";
> +		#clock-cells = <0>;
> +		clock-output-names = "mclk";
> +
> +		port {
> +			camera0_0: endpoint {
> +				remote-endpoint = <&ov7670_0>;
> +                                bus-type = <5>;      /* Parallel */
> +                                hsync-active = <1>;  /* Active high */
> +                                vsync-active = <1>;  /* Active high */
> +                                pclk-sample = <0>;   /* Falling */
> +			};
> +		};
> +	};
> --
> 2.21.0
>

--kj5s4had2x4icus2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DbgIACgkQcjQGjxah
Vjyzcg//clH4UtRYjsI86mItIoXCvJcGZTdFoZ/gLPd5Di9SslN9R2iMjN3VAY2f
48IBTCCE9shwey6dCHak6yLlgvlH2DUaXG6o9E7t92ryxnYt3ydTEG4Jtq6X97MU
xNRHPWcdBxpt3UNFUgkPol2iXX9mjltw9QhR+SNb2pBrOwHfU3JXQI1tTWvUkw8S
7M1ajKUW3/fAVhaOKWKTfwU5Tov0IZaDBXLS7wRuQ5CI06ebk//yCjy/2dNTE1q4
EWoXD/Fl/S0Z7nAmtn2eQG3H2ezlkIrEIi0wZXckgBOXHUe8D+8pqQE8Q6PQeFhA
CxVXquKIa7MQfqY1Mybu7Wa9o99Xt0Jjaxtfp9Sy+mEb4gABA2WALwFn2SOscJbY
YdN2wJmbr7+cwJ1720dDEA21/Vwc95S/UEiZji3BxnU+oEFOL1NUbxlDS6E8HMfp
F0R7xUrCkjU1bcTfigzOJ/uGC4Mnm/vbgft18mK+uZSj4U6+sDvfMNYGMSLFzjmK
7nA+8uOALWCoji7VMU+nlqAmxxxw7LL/T/mD8GA2n3S+wW2VIPZA2G6z3Xt59HYw
neZJXsk/JaamauA4iIRAHi1nnOVSPVO2O0BE16tO+ALL/r7HJxUzgwjExmkEQHu6
5lrtTA1XVqxWPndB0ODL/YTtzROZ5r7mCKC0uSVAMz8LEb1mggY=
=ENUC
-----END PGP SIGNATURE-----

--kj5s4had2x4icus2--
