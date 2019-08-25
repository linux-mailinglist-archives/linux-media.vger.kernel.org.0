Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23ADD9C449
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2019 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbfHYOJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 10:09:52 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:49305 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfHYOJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 10:09:52 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1F27640005;
        Sun, 25 Aug 2019 14:09:45 +0000 (UTC)
Date:   Sun, 25 Aug 2019 16:11:11 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas Soderlund <niklas.soderlund@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: bindings: video-interfaces: Update the example
Message-ID: <20190825141111.rdzn4p2zjkufbt4w@uno.localdomain>
References: <20190822210433.767-1-jacopo+renesas@jmondi.org>
 <20190823155117.GF28351@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ju5tryhcm7zjjbcx"
Content-Disposition: inline
In-Reply-To: <20190823155117.GF28351@bigcity.dyn.berto.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ju5tryhcm7zjjbcx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Aug 23, 2019 at 05:51:17PM +0200, Niklas Soderlund wrote:
> Hi Jacopo,
>
> Thanks for your patch.
>
> On 2019-08-22 23:04:33 +0200, Jacopo Mondi wrote:
> > The example provided by the video-interface.txt file uses compatible
> > values for drivers which are have been removed a long time ago. To avoid
> > generating confusion, replace the existing example with a new one using
> > upstream maintained and more modern devices.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > This patch has been triggered by Simon's attempt to rename the bindings
> > for the now removed soc-camera based sh-mobile-ceu device, which is use=
d in
> > this example:
> > https://patchwork.kernel.org/patch/11101079/
> >
> > As soon as that driver is not mentioned in the example anymore, its
> > bindings documentation could be removed as well.
> > ---
> >  .../bindings/media/video-interfaces.txt       | 223 ++++++++++--------
> >  1 file changed, 130 insertions(+), 93 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.t=
xt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..cce80fd0ea13 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -153,123 +153,160 @@ Optional endpoint properties
> >  Example
> >  -------
> >
> > -The example snippet below describes two data pipelines.  ov772x and im=
x074 are
> > -camera sensors with a parallel and serial (MIPI CSI-2) video bus respe=
ctively.
> > -Both sensors are on the I2C control bus corresponding to the i2c0 cont=
roller
> > -node.  ov772x sensor is linked directly to the ceu0 video host interfa=
ce.
> > -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 =
has a
> > -(single) DMA engine writing captured data to memory.  ceu0 node has a =
single
> > -'port' node which may indicate that at any time only one of the follow=
ing data
> > -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > -
> > -	ceu0: ceu@fe910000 {
> > -		compatible =3D "renesas,sh-mobile-ceu";
> > -		reg =3D <0xfe910000 0xa0>;
> > -		interrupts =3D <0x880>;
> > -
> > -		mclk: master_clock {
> > -			compatible =3D "renesas,ceu-clock";
> > -			#clock-cells =3D <1>;
> > -			clock-frequency =3D <50000000>;	/* Max clock frequency */
> > -			clock-output-names =3D "mclk";
> > -		};
> > +Te example snippet below describes two data pipelines connected to a v=
ideo
>
> s/Te/The/

Ups... fixed thanks

>
> > +DMA engine (VIN4) which has a direct parallel video bus connection to =
an HDMI
> > +video decoder at port@0 and a data path to a CSI-2 receiver connected =
to an
> > +image sensor (imx074) at port@1.
> >
> > -		port {
> > -			#address-cells =3D <1>;
> > -			#size-cells =3D <0>;
> > +The parallel HDMI video decoder links directly to the VIN input port 0=
, and the
> > +bus configuration at both ends is specified in each endpoint.
> >
> > -			/* Parallel bus endpoint */
> > -			ceu0_1: endpoint@1 {
> > -				reg =3D <1>;		/* Local endpoint # */
> > -				remote =3D <&ov772x_1_1>;	/* Remote phandle */
> > -				bus-width =3D <8>;	/* Used data lines */
> > -				data-shift =3D <2>;	/* Lines 9:2 are used */
> > +The imx074 sensor connects to the CSI-2 receiver and the MIPI CSI-2 se=
rial bus
> > +configuration is specified in the respective endpoints as well. The CS=
I-2
> > +receiver is then linked to the DMA engine through a direct data path w=
hich does
> > +not require any endpoint configuration.
> >
> > -				/* If hsync-active/vsync-active are missing,
> > -				   embedded BT.656 sync is used */
> > -				hsync-active =3D <0>;	/* Active low */
> > -				vsync-active =3D <0>;	/* Active low */
> > -				data-active =3D <1>;	/* Active high */
> > -				pclk-sample =3D <1>;	/* Rising */
> > -			};
> > +i2c0: i2c@e6500000 {
> > +
> > +	hdmi-decoder@4c {
> > +		compatible =3D "adi,adv7612";
> > +		reg =3D <0x4c>;
> >
> > -			/* MIPI CSI-2 bus endpoint */
> > -			ceu0_0: endpoint@0 {
> > +		ports {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			port@0 {
> >  				reg =3D <0>;
> > -				remote =3D <&csi2_2>;
> > +				adv7612_in: endpoint {
> > +					remote-endpoint =3D <&hdmi_con_in>;
> > +				};
> >  			};
> > -		};
> > -	};
> >
> > -	i2c0: i2c@fff20000 {
> > -		...
> > -		ov772x_1: camera@21 {
> > -			compatible =3D "ovti,ov772x";
> > -			reg =3D <0x21>;
> > -			vddio-supply =3D <&regulator1>;
> > -			vddcore-supply =3D <&regulator2>;
> > -
> > -			clock-frequency =3D <20000000>;
> > -			clocks =3D <&mclk 0>;
> > -			clock-names =3D "xclk";
> > -
> > -			port {
> > -				/* With 1 endpoint per port no need for addresses. */
> > -				ov772x_1_1: endpoint {
> > +			port@2 {
> > +				reg =3D <2>;
> > +				adv7612_out: endpoint {
> > +					bus-type =3D 5;
> >  					bus-width =3D <8>;
> > -					remote-endpoint =3D <&ceu0_1>;
> > -					hsync-active =3D <1>;
> > -					vsync-active =3D <0>; /* Who came up with an
> > +					pclk-sample =3D <0>;
> > +					hsync-active =3D <0>;
> > +					vsync-active =3D <1>; /* Who came up with an
> >  							       inverter here ?... */
> > -					data-active =3D <1>;
> > -					pclk-sample =3D <1>;
> > +					remote-endpoint =3D <&vin4_digital_in>;
> >  				};
> >  			};
> >  		};
> > + 	};
> >
> > -		imx074: camera@1a {
> > -			compatible =3D "sony,imx074";
> > -			reg =3D <0x1a>;
> > -			vddio-supply =3D <&regulator1>;
> > -			vddcore-supply =3D <&regulator2>;
> > -
> > -			clock-frequency =3D <30000000>;	/* Shared clock with ov772x_1 */
> > -			clocks =3D <&mclk 0>;
> > -			clock-names =3D "sysclk";		/* Assuming this is the
> > -							   name in the datasheet */
> > -			port {
> > -				imx074_1: endpoint {
> > -					clock-lanes =3D <0>;
> > -					data-lanes =3D <1 2>;
> > -					remote-endpoint =3D <&csi2_1>;
> > -				};
> > +
> > +	imx074: camera@1a {
> > +		compatible =3D "sony,imx074";
> > +		reg =3D <0x1a>;
> > +
> > +		rotation =3D <180>; /* The camera is mounted upside down! */
> > +
> > +		/* With a single port, use 'port' and not 'ports'. */
> > +		port {
> > +			/* With 1 endpoint per port no need for addresses. */
> > +			imx074_1: endpoint {
> > +				bus-type =3D 4;
> > +				/* If lane re-ordering is not supported, no
> > +				   need to tell where the clock lane is! */
> > +				/* clock-lanes =3D <0>; */
> > +				/* But the number of data lanes is important! */
> > +				data-lanes =3D <1 2>;
> > +				remote-endpoint =3D <&csi20_in>;
> >  			};
> >  		};
> >  	};
> > +};
> >
> > -	csi2: csi2@ffc90000 {
> > -		compatible =3D "renesas,sh-mobile-csi2";
> > -		reg =3D <0xffc90000 0x1000>;
> > -		interrupts =3D <0x17a0>;
> > +csi20: csi2@fea80000 {
> > +	compatible =3D "renesas,r8a7795-csi2";
> > +	reg =3D <0 0xfea80000 0 0x10000>;
> > +	interrupts =3D <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks =3D <&cpg CPG_MOD 714>;
> > +	power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > +	resets =3D <&cpg 714>;
>
> Do we need all reg, interrupts, clocks, power-domains and resets in the
> example?
>

Probably not, but they were present in the previous example, so I kept
it. I would be fine by dropping them anyway...
> > +
> > +	ports {
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <0>;
> >
> > -		port@1 {
> > -			compatible =3D "renesas,csi2c";	/* One of CSI2I and CSI2C. */
> > -			reg =3D <1>;			/* CSI-2 PHY #1 of 2: PHY_S,
> > -							   PHY_M has port address 0,
> > -							   is unused. */
> > -			csi2_1: endpoint {
> > -				clock-lanes =3D <0>;
> > -				data-lanes =3D <2 1>;
> > +		port@0 {
> > +			reg =3D <0>;
> > +
> > +			csi20_in: endpoint {
> > +				bus-type =3D 4;
> > +				/* Use the same number of data lanes as the
> > +				   one used by the remote endpoint! */
>
> nit: Do this comment bring value, or is it confusing?
>

Maybe it does not bring much value, but why is it confusing ?

> > +				data-lanes =3D <1 2>;
> >  				remote-endpoint =3D <&imx074_1>;
> >  			};
> >  		};
> > -		port@2 {
> > -			reg =3D <2>;			/* port 2: link to the CEU */
> >
> > -			csi2_2: endpoint {
> > -				remote-endpoint =3D <&ceu0_0>;
> > +		port@1 {
> > +			reg =3D <1>;
> > +
> > +			/* Data path to the VIN4 DMA engine. */
>
> Needed?
>

Not really...

> > +			csi20vin4: endpoint {
> > +				remote-endpoint =3D <&vin4csi20>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +vin4: video@e6ef4000 {
> > +	compatible =3D "renesas,vin-r8a7795";
> > +	reg =3D <0 0xe6ef4000 0 0x1000>;
> > +	interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks =3D <&cpg CPG_MOD 807>;
> > +	power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > +	resets =3D <&cpg 807>;
> > +	renesas,id =3D <4>;
>
> Same comment as above, is all properties needed in the example?
> Specially renesas,id can be confusing as it's a driver specific binding
> needed to workaround a fun hardware design.

I agree, but I'm debated.. one looks at the example and it doesn't
match the actual VIN bindings, and then might be even more confused.
I'm find dropping all of this. Maybe we can add a line in the intro
that says the example is fictional and does not report all the
required properties for a device to work.

>
> > +
> > +	ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		/* Parallel input port: HDMI decoder */
> > +		port@0 {
> > +			reg =3D <0>;
> > +
> > +			vin4_digital_in: endpoint {
> > +				bus-type =3D 5;
> > +				bus-width =3D <8>;	/* Used data lines */
> > +				data-shift =3D <2>;	/* Lines 9:2 are used */
> > +				data-active =3D <1>;	/* Active high */
> > +				pclk-sample =3D <0>;	/* Falling */
> > +				/* If hsync-active/vsync-active are missing,
> > +				 * embedded BT.656 sync is used */
>
> I feel if this comment is to be kept it should be expanded.
>

I copied it from the existing example. How would you expand it?

> > +				hsync-active =3D <0>;
> > +				vsync-active =3D <0>;
> > +				remote-endpoint =3D <&adv7612_out>;
> > +			};
> > +		};
> > +
> > +
> > +		/* Data path to the MIPI CSI-2 receiver. */
> > +		port@1 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			reg =3D<1>;
> > +
> > +			/* Need endpoint numbers when multiple endpoints are
> > +			   present. */
>
> I think this can be dropped.
>

Ok

Thanks for review
   j


> > +			vin4csi20: endpoint@0 {
> > +				reg =3D <0>;
> > +				remote-endpoint =3D <&csi20vin4>;
> > +			};
> > +
> > +			/* Not connected in this example. */
> > +			vin4csi41: endpoint@3 {
> > +				reg =3D <3>;
> > +				remote-endpoint =3D <&csi41vin4>;
> >  			};
> >  		};
> >  	};
> > +};
> > --
> > 2.22.0
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--ju5tryhcm7zjjbcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1ilvsACgkQcjQGjxah
Vjx55A/8D2UYgmziaUfVgkW8VbrY/FZUqUeKGBlDRJMpNTypR66wRaEtWN4UwDhI
icDQ9axSFONbuI/l86/TkTgxDSahMgGqIc7xeoEfLKWTx+wdAtsg6a4i33v13KF4
UDpzzD/oeTXGfxVxf/Ie+DclK93JZG8cgfufx3VNMy4tIfmCuLTayVpi73v9MbWl
a949QEMgH20ZJWEi+PcNf++Nmq6sKDKBjn+C1nH91LLIaD/MdMdoW8DDRjXAN69+
KXI2V1PTcxHG+16+IiwFVJ74oi0BXwaVO92jsVAOhcX97B4xO9FIGcCiY31kLqIT
MPp1rKm03IzNWSA/Tvx8fYBorDy6b6HBNYlkIdXP9+pv6vXX4LIUCRU2AD+PTam/
OAMe0Vxc/fY2zv8pDb9f168VF/Hzmup+TCkjdH0Zp2DYx2mkPN4nrtFUaMtCKNfx
SukIT5yZuaF5Mllx56XF0szmgFvfpm/TVuLd5+7Fhxw4elc2zTAFCedGoPB4Sto0
yfd2/yGkj8vEs4tPshh80CdgoKHLrD+rrjXbouaSJrbq2aURmREeJDBJPfB3V59j
UClidyx5Cs1deEaxjcaDXDt7hwL+vKMZpFmQX36aaDKGhnPEoXPtFjkP1Es+rcg7
rJvMNZCzM5dqIwIBW36+Gxuly4qg9wMdsUPYPHvc6Bpe/G9ETqE=
=3ZgN
-----END PGP SIGNATURE-----

--ju5tryhcm7zjjbcx--
