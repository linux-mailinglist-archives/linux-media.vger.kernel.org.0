Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BEC40858A
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237717AbhIMHpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:45:52 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:45969 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237599AbhIMHpv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:45:51 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6AD0F100018;
        Mon, 13 Sep 2021 07:44:23 +0000 (UTC)
Date:   Mon, 13 Sep 2021 09:44:22 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 09/22] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
Message-ID: <YT8BVo61qL1jq/er@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-10-paul.kocialkowski@bootlin.com>
 <483288cb-d9fa-4581-7986-d15c4aa27769@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QZVQzP+VTAJydr5U"
Content-Disposition: inline
In-Reply-To: <483288cb-d9fa-4581-7986-d15c4aa27769@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--QZVQzP+VTAJydr5U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Fri 10 Sep 21, 21:32, Samuel Holland wrote:
> On 9/10/21 1:41 PM, Paul Kocialkowski wrote:
> > MIPI CSI-2 is supported on the V3s with an A31-based MIPI CSI-2 bridge
> > controller. The controller uses a separate D-PHY, which is the same
> > that is otherwise used for MIPI DSI, but used in Rx mode.
> >=20
> > On the V3s, the CSI0 controller is dedicated to MIPI CSI-2 as it does
> > not have access to any parallel interface pins.
> >=20
> > Add all the necessary nodes (CSI0, MIPI CSI-2 bridge and D-PHY) to
> > support the MIPI CSI-2 interface.
> >=20
> > Note that a fwnode graph link is created between CSI0 and MIPI CSI-2
> > even when no sensor is connected. This will result in a probe failure
> > for the controller as long as no sensor is connected but this is fine
> > since no other interface is available.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sun8i-v3s.dtsi | 72 ++++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i=
-v3s.dtsi
> > index a77b63362a1d..ec7fa6459547 100644
> > --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> > @@ -612,6 +612,34 @@ spi0: spi@1c68000 {
> >  			#size-cells =3D <0>;
> >  		};
> > =20
> > +		csi0: camera@1cb0000 {
> > +			compatible =3D "allwinner,sun8i-v3s-csi";
> > +			reg =3D <0x01cb0000 0x1000>;
> > +			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&ccu CLK_BUS_CSI>,
> > +				 <&ccu CLK_CSI1_SCLK>,
> > +				 <&ccu CLK_DRAM_CSI>;
> > +			clock-names =3D "bus", "mod", "ram";
> > +			resets =3D <&ccu RST_BUS_CSI>;
> > +			status =3D "disabled";
> > +
> > +			assigned-clocks =3D <&ccu CLK_CSI1_SCLK>;
> > +			assigned-clock-parents =3D <&ccu CLK_PLL_ISP>;
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@1 {
> > +					reg =3D <1>;
> > +
> > +					csi0_in_mipi_csi2: endpoint {
> > +						remote-endpoint =3D <&mipi_csi2_out_csi0>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  		csi1: camera@1cb4000 {
> >  			compatible =3D "allwinner,sun8i-v3s-csi";
> >  			reg =3D <0x01cb4000 0x3000>;
>=20
> All of the new nodes should be added above this one, to maintain unit
> address order.

Good catch, this was an overlook on my side.

Thanks,

Paul

> Regards,
> Samuel
>=20
> > @@ -637,5 +665,49 @@ gic: interrupt-controller@1c81000 {
> >  			#interrupt-cells =3D <3>;
> >  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_=
HIGH)>;
> >  		};
> > +
> > +		mipi_csi2: csi@1cb1000 {
> > +			compatible =3D "allwinner,sun8i-v3s-mipi-csi2",
> > +				     "allwinner,sun6i-a31-mipi-csi2";
> > +			reg =3D <0x01cb1000 0x1000>;
> > +			interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&ccu CLK_BUS_CSI>,
> > +				 <&ccu CLK_CSI1_SCLK>;
> > +			clock-names =3D "bus", "mod";
> > +			resets =3D <&ccu RST_BUS_CSI>;
> > +			status =3D "disabled";
> > +
> > +			phys =3D <&dphy>;
> > +			phy-names =3D "dphy";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				mipi_csi2_in: port@0 {
> > +					reg =3D <0>;
> > +				};
> > +
> > +				mipi_csi2_out: port@1 {
> > +					reg =3D <1>;
> > +
> > +					mipi_csi2_out_csi0: endpoint {
> > +						remote-endpoint =3D <&csi0_in_mipi_csi2>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		dphy: d-phy@1cb2000 {
> > +			compatible =3D "allwinner,sun6i-a31-mipi-dphy";
> > +			reg =3D <0x01cb2000 0x1000>;
> > +			clocks =3D <&ccu CLK_BUS_CSI>,
> > +				 <&ccu CLK_MIPI_CSI>;
> > +			clock-names =3D "bus", "mod";
> > +			resets =3D <&ccu RST_BUS_CSI>;
> > +			allwinner,direction =3D "rx";
> > +			status =3D "disabled";
> > +			#phy-cells =3D <0>;
> > +		};
> >  	};
> >  };
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--QZVQzP+VTAJydr5U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmE/AVYACgkQ3cLmz3+f
v9EFwAgAlLhO92v/X6G6gs1EKL/Ve3k5WVgSYDcp38cxhVkn9TYIx+u97xSfyDLC
P5PABn2O8tERf6e7U1NBmqr64vSzvziaRmeLo6co6sdLEJuNvk4wrp3/9U7+dp/Q
9Pp/tPxadAO4SKID7BW5UKTEzWqzGlsGJf/6p83oKzwWtBCTBXTfK0PjkmESPFy8
kTX1gqi9/Pe0oiWH0PRZJIZzPYDP8PpRNPQNxhPlXivuSnDLFwNAhaSXrMvqOnl2
/Y+tpSRPXTKGPqjIAzRn3G2fTveiHMw0fTLwVgcZqqNIK4dACeQLJYNdSxjTMORZ
J1xWZQdStHkESCp9DRxlxV8TLbiItg==
=95oz
-----END PGP SIGNATURE-----

--QZVQzP+VTAJydr5U--
