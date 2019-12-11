Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D05511B983
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 18:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbfLKRCW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 12:02:22 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48003 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbfLKRCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 12:02:22 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E0793E0005;
        Wed, 11 Dec 2019 17:02:14 +0000 (UTC)
Date:   Wed, 11 Dec 2019 18:04:23 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: bindings: video-interfaces: Update the example
Message-ID: <20191211170408.66dk3z4qqfp2yvlb@uno.localdomain>
References: <20191111140055.88054-1-jacopo+renesas@jmondi.org>
 <20191111170230.GQ18424@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bn3dcm2p6npado5x"
Content-Disposition: inline
In-Reply-To: <20191111170230.GQ18424@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bn3dcm2p6npado5x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,
    thanks for review

On Mon, Nov 11, 2019 at 07:02:30PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Nov 11, 2019 at 03:00:55PM +0100, Jacopo Mondi wrote:
> > The example provided by the video-interface.txt file uses compatible
> > values for drivers which are have been removed a long time ago. To avoid
> > generating confusion, replace the existing example with a new one using
> > upstream maintained and more modern devices.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >
> > Re-proposing the example update, taking into account Niklas' comments about
> > removing most of the commits there.
> >
> > Laurent suggested to move the example to json-schema, but being this file mostly
> > used as reference for the common video properties description, I'm not sure
> > bindings in yaml format make sense here.
>
> I think the proposal makes sense as such, but this patch is just updating
> the example. The two seem unrelated.
>

With your and Rob's ack, I'll resubmit the example update. Let's
address yaml conversion later.

> >
> >
> > ---
> >  .../bindings/media/video-interfaces.txt       | 210 ++++++++++--------
> >  1 file changed, 116 insertions(+), 94 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..955bd6f52cda 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -153,123 +153,145 @@ Optional endpoint properties
> >  Example
> >  -------
> >
> > -The example snippet below describes two data pipelines.  ov772x and imx074 are
> > -camera sensors with a parallel and serial (MIPI CSI-2) video bus respectively.
> > -Both sensors are on the I2C control bus corresponding to the i2c0 controller
> > -node.  ov772x sensor is linked directly to the ceu0 video host interface.
> > -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 has a
> > -(single) DMA engine writing captured data to memory.  ceu0 node has a single
> > -'port' node which may indicate that at any time only one of the following data
> > -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > -
> > -	ceu0: ceu@fe910000 {
> > -		compatible = "renesas,sh-mobile-ceu";
> > -		reg = <0xfe910000 0xa0>;
> > -		interrupts = <0x880>;
> > -
> > -		mclk: master_clock {
> > -			compatible = "renesas,ceu-clock";
> > -			#clock-cells = <1>;
> > -			clock-frequency = <50000000>;	/* Max clock frequency */
> > -			clock-output-names = "mclk";
> > -		};
> > +The example snippet below describes two data pipelines connected to a video
> > +DMA engine (VIN4) which has a direct parallel video bus connection to an HDMI
> > +video decoder at port@0 and a data path to a CSI-2 receiver connected to an
> > +image sensor (imx074) at port@1.
> >
> > -		port {
> > +The parallel HDMI video decoder links directly to the VIN input port 0, and the
> > +bus configuration at both ends is specified in each endpoint.
> > +
> > +The imx074 sensor connects to the CSI-2 receiver and the MIPI CSI-2 serial bus
> > +configuration is specified in the respective endpoints as well. The CSI-2
> > +receiver is then linked to the DMA engine through a direct data path which does
> > +not require any endpoint configuration.
> > +
> > +i2c0: i2c@e6500000 {
> > +
> > +	hdmi-decoder@4c {
> > +		compatible = "adi,adv7612";
> > +		reg = <0x4c>;
> > +
> > +		ports {
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> >
> > -			/* Parallel bus endpoint */
> > -			ceu0_1: endpoint@1 {
> > -				reg = <1>;		/* Local endpoint # */
> > -				remote = <&ov772x_1_1>;	/* Remote phandle */
> > -				bus-width = <8>;	/* Used data lines */
> > -				data-shift = <2>;	/* Lines 9:2 are used */
> > -
> > -				/* If hsync-active/vsync-active are missing,
> > -				   embedded BT.656 sync is used */
> > -				hsync-active = <0>;	/* Active low */
> > -				vsync-active = <0>;	/* Active low */
> > -				data-active = <1>;	/* Active high */
> > -				pclk-sample = <1>;	/* Rising */
> > -			};
> > -
> > -			/* MIPI CSI-2 bus endpoint */
> > -			ceu0_0: endpoint@0 {
> > +			port@0 {
> >  				reg = <0>;
> > -				remote = <&csi2_2>;
> > +				adv7612_in: endpoint {
> > +					remote-endpoint = <&hdmi_con_in>;
> > +				};
> >  			};
> > -		};
> > -	};
> >
> > -	i2c0: i2c@fff20000 {
> > -		...
> > -		ov772x_1: camera@21 {
> > -			compatible = "ovti,ov772x";
> > -			reg = <0x21>;
> > -			vddio-supply = <&regulator1>;
> > -			vddcore-supply = <&regulator2>;
> > -
> > -			clock-frequency = <20000000>;
> > -			clocks = <&mclk 0>;
> > -			clock-names = "xclk";
> > -
> > -			port {
> > -				/* With 1 endpoint per port no need for addresses. */
> > -				ov772x_1_1: endpoint {
> > +			port@2 {
> > +				reg = <2>;
> > +				adv7612_out: endpoint {
> > +					bus-type = 5;
> >  					bus-width = <8>;
> > -					remote-endpoint = <&ceu0_1>;
> > -					hsync-active = <1>;
> > -					vsync-active = <0>; /* Who came up with an
> > -							       inverter here ?... */
> > -					data-active = <1>;
> > -					pclk-sample = <1>;
> > +					pclk-sample = <0>;
> > +					hsync-active = <0>;
> > +					vsync-active = <1>;
> > +					remote-endpoint = <&vin4_digital_in>;
> >  				};
> >  			};
> >  		};
> > +	};
> >
> > -		imx074: camera@1a {
> > -			compatible = "sony,imx074";
> > -			reg = <0x1a>;
> > -			vddio-supply = <&regulator1>;
> > -			vddcore-supply = <&regulator2>;
> > -
> > -			clock-frequency = <30000000>;	/* Shared clock with ov772x_1 */
> > -			clocks = <&mclk 0>;
> > -			clock-names = "sysclk";		/* Assuming this is the
> > -							   name in the datasheet */
> > -			port {
> > -				imx074_1: endpoint {
> > -					clock-lanes = <0>;
> > -					data-lanes = <1 2>;
> > -					remote-endpoint = <&csi2_1>;
> > -				};
> > +	imx074: camera@1a {
>
> Could you use a different sensor? There are no bindings for imx074 and the
> SoC camera driver for it is about to be removed.
>

Right, I'll use a supported sensor.

> > +		compatible = "sony,imx074";
> > +		reg = <0x1a>;
> > +
> > +		rotation = <180>;
> > +
> > +		port {
> > +			imx074_1: endpoint {
> > +				bus-type = 4;
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&csi20_in>;
> >  			};
> >  		};
> >  	};
> > +};
> > +
> > +csi20: csi2@fea80000 {
> > +	compatible = "renesas,r8a7795-csi2";
> > +	reg = <0 0xfea80000 0 0x10000>;
> > +	interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks = <&cpg CPG_MOD 714>;
> > +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > +	resets = <&cpg 714>;
> >
> > -	csi2: csi2@ffc90000 {
> > -		compatible = "renesas,sh-mobile-csi2";
> > -		reg = <0xffc90000 0x1000>;
> > -		interrupts = <0x17a0>;
> > +	ports {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >
> > -		port@1 {
> > -			compatible = "renesas,csi2c";	/* One of CSI2I and CSI2C. */
> > -			reg = <1>;			/* CSI-2 PHY #1 of 2: PHY_S,
> > -							   PHY_M has port address 0,
> > -							   is unused. */
> > -			csi2_1: endpoint {
> > -				clock-lanes = <0>;
> > -				data-lanes = <2 1>;
> > +		port@0 {
> > +			reg = <0>;
> > +
> > +			csi20_in: endpoint {
> > +				bus-type = 4;
>
> bus-type isn't defined for renesas,r8a7795-csi2. Do you need it here?
>

No, I could drop it.

> > +				data-lanes = <1 2>;
> >  				remote-endpoint = <&imx074_1>;
> >  			};
> >  		};
> > -		port@2 {
> > -			reg = <2>;			/* port 2: link to the CEU */
> >
> > -			csi2_2: endpoint {
> > -				remote-endpoint = <&ceu0_0>;
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			csi20vin4: endpoint {
> > +				remote-endpoint = <&vin4csi20>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +vin4: video@e6ef4000 {
> > +	compatible = "renesas,vin-r8a7795";
> > +	reg = <0 0xe6ef4000 0 0x1000>;
> > +	interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks = <&cpg CPG_MOD 807>;
> > +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > +	resets = <&cpg 807>;
> > +	renesas,id = <4>;
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		/* Parallel input port: HDMI decoder */
> > +		port@0 {
> > +			reg = <0>;
> > +
> > +			vin4_digital_in: endpoint {
> > +				bus-type = 5;
>
> Does this device support other kinds of busses on this interface? If not,
> you can move it to the driver (the bindings don't document this either).
>

No, I could drop it from here.

> > +				bus-width = <8>;
> > +				data-shift = <2>;
> > +				data-active = <1>;
> > +				pclk-sample = <0>;
> > +				hsync-active = <0>;
> > +				vsync-active = <0>;
>
> None of these seem to be documented for renesas,vin-r8a7795 . I guess they
> should be.
>

They are. Quoting renesas,vin.txt:

      Endpoint nodes of port@0 support the optional properties listed in
      the Gen2 per-board settings description.

Some of the properties above are not listed though. I'll drop the
unsupported ones.

Thanks
   j

> > +				remote-endpoint = <&adv7612_out>;
> > +			};
> > +		};
> > +
> > +
> > +		/* Data path to the MIPI CSI-2 receiver. */
> > +		port@1 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			reg =<1>;
> > +
> > +			vin4csi20: endpoint@0 {
> > +				reg = <0>;
> > +				remote-endpoint = <&csi20vin4>;
> > +			};
> > +
> > +			/* Not connected in this example. */
> > +			vin4csi41: endpoint@3 {
> > +				reg = <3>;
> > +				remote-endpoint = <&csi41vin4>;
> >  			};
> >  		};
> >  	};
> > +};
>
> --
> Kind regards,
>
> Sakari Ailus

--bn3dcm2p6npado5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3xIZcACgkQcjQGjxah
VjzVRA/+Kv+8EARSACUsV9syHQQUFiDatDV9/CLaAIN8kJsDxvPO27XUx6pCh3Ih
JCPFFwLVFBg2fRzEPxjn9tGjntAjrRMG3C0nA2damj44FW+Fv3iulzdr6HjCCLIg
fq3d2aXylDZakNl77gR/0Z6ZQE03r0KGADV294JW2lebVfwOeuuk5e0TH1y+A/IY
QNu5TupoTarEE1kDjIQTHObJYeHdcJpQc7HJ5CGp2yIcb2zsmqPSL4RIvYdzINOi
AaN5GKeZt5VwJnIussZQqDXNbePzkvfZ7j85eXSIyHciZrVx+YE/QP2gErpTDaZ1
n4tjHbP4jSaX+OLqnVfcEvUKvEF6Tuof2eaqQmv1OaQ3BdZeUnfjL6cOwjzLsbHk
tmTvA5JdQUCOXE2cpDmmLFr0vi25V60PwmSRtH47AG387obRGev8O+GtXVCiq1pG
5K0B/NC6kyrgbLOx5Et8+KE+uyqPajJzfq8K6GJRPTUk1cAJ8xbm4590ugls5jXU
12/QmA2uvU8iDKTnsFIETHoIaDOyhGsdg05Es7ULLYmOt2jKk+6ks765U2I4RY/S
qG1fwT6/wcrR9o1kN0lPWnh0P4zDXc1NFPD3nXbZw66LvuCGk0T0LQ+JgNzdLRA+
+bXmTb2Y9SjPZSHy6ZD4Gi/oAEAOzaPZ0BuiKlRRVSxG/1hkWbs=
=w+6B
-----END PGP SIGNATURE-----

--bn3dcm2p6npado5x--
