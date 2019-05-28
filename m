Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8D32C5A8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfE1Lq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 07:46:56 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53115 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfE1Lq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 07:46:56 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 300A94000A;
        Tue, 28 May 2019 11:46:48 +0000 (UTC)
Date:   Tue, 28 May 2019 13:47:58 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Message-ID: <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
References: <20190520201812.7937-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sxscfq2uey2wyh53"
Content-Disposition: inline
In-Reply-To: <20190520201812.7937-1-marex@denx.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sxscfq2uey2wyh53
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,
   thanks for the patch

On Mon, May 20, 2019 at 10:18:11PM +0200, Marek Vasut wrote:
> Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> ---
>  .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.=
txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/D=
ocumentation/devicetree/bindings/media/i2c/isl7998x.txt
> new file mode 100644
> index 000000000000..c21703983360
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> @@ -0,0 +1,37 @@
> +Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
> +
> +The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
> +receiving up to four analog stream and multiplexing them into up to four
> +MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> +

The documentation is not public, so I can only read what's reported on
the website and the short public datasheet at [1]

=46rom my understanding of the product page, both the ISL79987 and
ILS79988 devices support up to 4 analog inputs, and provide a CSI-2
output and a BT656 output respectively.

What am I reading wrong ?

[1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encod=
ers/video-decoders/device/ISL79987.html

> +Required Properties:
> +- compatible: value should be "isil,isl79987"
> +- pd-gpios: a GPIO spec for the Power Down pin (active high)
> +
> +Option Properties:
> +- isil,num-inputs: Number of connected inputs (1, 2 or 4)

Can't you derive this from the number of connected input endpoints
instead of providing a custom property?

> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +

I think a description of the supported ports and their intended
usages is required here. You have up to 4 inputs and 1 output port,
how do you expect them to be numbered? is port@4 the last input or the
output one?

> +Example:
> +
> +	i2c_master {
> +		isl7998x_mipi@44 {
> +			compatible =3D "isil,isl79987";
> +			reg =3D <0x44>;
> +			isil,num-inputs =3D <4>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_videoadc>;
> +			pd-gpios =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +			status =3D "okay";
> +
> +			port {
> +				isl79987_to_mipi_csi2: endpoint {
> +					remote-endpoint =3D <&mipi_csi2_in>;
> +					clock-lanes =3D <0>;
> +					data-lanes =3D <1 2>;
> +				};

I see from the example you only support one output port? How do you
model the input ones.

Thanks
   j

> +			};
> +		};
> +	};
> --
> 2.20.1
>

--sxscfq2uey2wyh53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztH+4ACgkQcjQGjxah
Vjw+cw/3ex/iCAHHMg+krBaQOQOuLQnDcPPcLJkQaDcDxmX7Kjc/ufmlGPyzGu8O
+Cv9kdHRCSyuMQTWkqI7C6LmW2J6JT0bDaX9QkZbeuq6fx5B8J8LUFC36aSXro+X
eju/4laNijDD4Atvc/eULQi1NG7d1Xnn94RfJ2HFrwfbwset6NnuHc1k6d7BfF7D
kjKs91c6HH4nxP/A7heXnYGULx3bDVrXzWXn1iXJYnbj85zqXxbCyb2TbHi4BNek
hv6RScO2ONJil2NzIudOxYVbmtqpIuVLdYKeCFC8EBkDVNa1FXRRW9acTza46qD1
bEjmrs2/4F9BarTjibJ/54kP9gaw9Xs+2utEGe9J7U25ZKPp9+qaPlWghyk6YZVh
NzqQTMePBwNRquCMU5VHBuQHwl0MmC8HeLHFLnH0waQEYqwZkXTeJEyMfoX2GyYt
W3sChXGk/O1D2qTTRHN3casQSUFLgCdi0pdBzZppckq//QANRH9iUep4QF4acoG1
gu2tTrFPJ0x2u1r33lgWxdyTMKjVxmcWX6N4i0pl7OD5oHD7nd/9+GiRRMviRuxx
Z/VQzGd3kAkmIAlAlpAathr4WsZVgjBDvarvFXqAC3kWds05dqYMDHmHawhPXQ/P
l6KCzIqjJDqmhjrUZuE5Ght3C55j39R1x57H0JC2CU4RoVA1Ug==
=cjvk
-----END PGP SIGNATURE-----

--sxscfq2uey2wyh53--
