Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 084909C55A
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2019 20:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbfHYSDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 14:03:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfHYSDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 14:03:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF662AF;
        Sun, 25 Aug 2019 20:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566756213;
        bh=1Q058tBEVFNz0oj7mzIRn2sYZAYh3nuKORaYJqr0xMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uohLVMfrsXM5ElYTJDSVaKA8+hrdINvI+3aMjryBhlOMf64W3GpTmVXIR9ru0kHBG
         OwySWWjwKyzZbnh2oFeZ2WdhR3DBPtGA+6V6fyOHuHjyqFGY02ZkTQ7uY3BjW/aUYb
         pEAeoMYgzbyWYIfUaE36jeD5O1W/XmC9BpSFSfCU=
Date:   Sun, 25 Aug 2019 21:03:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas Soderlund <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: bindings: video-interfaces: Update the example
Message-ID: <20190825180325.GA5436@pendragon.ideasonboard.com>
References: <20190822210433.767-1-jacopo+renesas@jmondi.org>
 <20190823155117.GF28351@bigcity.dyn.berto.se>
 <20190825141111.rdzn4p2zjkufbt4w@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825141111.rdzn4p2zjkufbt4w@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Sun, Aug 25, 2019 at 04:11:11PM +0200, Jacopo Mondi wrote:
> On Fri, Aug 23, 2019 at 05:51:17PM +0200, Niklas Soderlund wrote:
> > On 2019-08-22 23:04:33 +0200, Jacopo Mondi wrote:
> > > The example provided by the video-interface.txt file uses compatible
> > > values for drivers which are have been removed a long time ago. To avoid
> > > generating confusion, replace the existing example with a new one using
> > > upstream maintained and more modern devices.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > ---
> > > This patch has been triggered by Simon's attempt to rename the bindings
> > > for the now removed soc-camera based sh-mobile-ceu device, which is used in
> > > this example:
> > > https://patchwork.kernel.org/patch/11101079/
> > >
> > > As soon as that driver is not mentioned in the example anymore, its
> > > bindings documentation could be removed as well.
> > > ---
> > >  .../bindings/media/video-interfaces.txt       | 223 ++++++++++--------
> > >  1 file changed, 130 insertions(+), 93 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > index f884ada0bffc..cce80fd0ea13 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -153,123 +153,160 @@ Optional endpoint properties
> > >  Example
> > >  -------
> > >
> > > -The example snippet below describes two data pipelines.  ov772x and imx074 are
> > > -camera sensors with a parallel and serial (MIPI CSI-2) video bus respectively.
> > > -Both sensors are on the I2C control bus corresponding to the i2c0 controller
> > > -node.  ov772x sensor is linked directly to the ceu0 video host interface.
> > > -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 has a
> > > -(single) DMA engine writing captured data to memory.  ceu0 node has a single
> > > -'port' node which may indicate that at any time only one of the following data
> > > -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > > -
> > > -	ceu0: ceu@fe910000 {
> > > -		compatible = "renesas,sh-mobile-ceu";
> > > -		reg = <0xfe910000 0xa0>;
> > > -		interrupts = <0x880>;
> > > -
> > > -		mclk: master_clock {
> > > -			compatible = "renesas,ceu-clock";
> > > -			#clock-cells = <1>;
> > > -			clock-frequency = <50000000>;	/* Max clock frequency */
> > > -			clock-output-names = "mclk";
> > > -		};
> > > +Te example snippet below describes two data pipelines connected to a video
> >
> > s/Te/The/
> 
> Ups... fixed thanks
> 
> >
> > > +DMA engine (VIN4) which has a direct parallel video bus connection to an HDMI
> > > +video decoder at port@0 and a data path to a CSI-2 receiver connected to an
> > > +image sensor (imx074) at port@1.
> > >
> > > -		port {
> > > -			#address-cells = <1>;
> > > -			#size-cells = <0>;
> > > +The parallel HDMI video decoder links directly to the VIN input port 0, and the
> > > +bus configuration at both ends is specified in each endpoint.
> > >
> > > -			/* Parallel bus endpoint */
> > > -			ceu0_1: endpoint@1 {
> > > -				reg = <1>;		/* Local endpoint # */
> > > -				remote = <&ov772x_1_1>;	/* Remote phandle */
> > > -				bus-width = <8>;	/* Used data lines */
> > > -				data-shift = <2>;	/* Lines 9:2 are used */
> > > +The imx074 sensor connects to the CSI-2 receiver and the MIPI CSI-2 serial bus
> > > +configuration is specified in the respective endpoints as well. The CSI-2
> > > +receiver is then linked to the DMA engine through a direct data path which does
> > > +not require any endpoint configuration.
> > >
> > > -				/* If hsync-active/vsync-active are missing,
> > > -				   embedded BT.656 sync is used */
> > > -				hsync-active = <0>;	/* Active low */
> > > -				vsync-active = <0>;	/* Active low */
> > > -				data-active = <1>;	/* Active high */
> > > -				pclk-sample = <1>;	/* Rising */
> > > -			};
> > > +i2c0: i2c@e6500000 {
> > > +
> > > +	hdmi-decoder@4c {
> > > +		compatible = "adi,adv7612";
> > > +		reg = <0x4c>;
> > >
> > > -			/* MIPI CSI-2 bus endpoint */
> > > -			ceu0_0: endpoint@0 {
> > > +		ports {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +
> > > +			port@0 {
> > >  				reg = <0>;
> > > -				remote = <&csi2_2>;
> > > +				adv7612_in: endpoint {
> > > +					remote-endpoint = <&hdmi_con_in>;
> > > +				};
> > >  			};
> > > -		};
> > > -	};
> > >
> > > -	i2c0: i2c@fff20000 {
> > > -		...
> > > -		ov772x_1: camera@21 {
> > > -			compatible = "ovti,ov772x";
> > > -			reg = <0x21>;
> > > -			vddio-supply = <&regulator1>;
> > > -			vddcore-supply = <&regulator2>;
> > > -
> > > -			clock-frequency = <20000000>;
> > > -			clocks = <&mclk 0>;
> > > -			clock-names = "xclk";
> > > -
> > > -			port {
> > > -				/* With 1 endpoint per port no need for addresses. */
> > > -				ov772x_1_1: endpoint {
> > > +			port@2 {
> > > +				reg = <2>;
> > > +				adv7612_out: endpoint {
> > > +					bus-type = 5;
> > >  					bus-width = <8>;
> > > -					remote-endpoint = <&ceu0_1>;
> > > -					hsync-active = <1>;
> > > -					vsync-active = <0>; /* Who came up with an
> > > +					pclk-sample = <0>;
> > > +					hsync-active = <0>;
> > > +					vsync-active = <1>; /* Who came up with an
> > >  							       inverter here ?... */
> > > -					data-active = <1>;
> > > -					pclk-sample = <1>;
> > > +					remote-endpoint = <&vin4_digital_in>;
> > >  				};
> > >  			};
> > >  		};
> > > + 	};
> > >
> > > -		imx074: camera@1a {
> > > -			compatible = "sony,imx074";
> > > -			reg = <0x1a>;
> > > -			vddio-supply = <&regulator1>;
> > > -			vddcore-supply = <&regulator2>;
> > > -
> > > -			clock-frequency = <30000000>;	/* Shared clock with ov772x_1 */
> > > -			clocks = <&mclk 0>;
> > > -			clock-names = "sysclk";		/* Assuming this is the
> > > -							   name in the datasheet */
> > > -			port {
> > > -				imx074_1: endpoint {
> > > -					clock-lanes = <0>;
> > > -					data-lanes = <1 2>;
> > > -					remote-endpoint = <&csi2_1>;
> > > -				};
> > > +
> > > +	imx074: camera@1a {
> > > +		compatible = "sony,imx074";
> > > +		reg = <0x1a>;
> > > +
> > > +		rotation = <180>; /* The camera is mounted upside down! */
> > > +
> > > +		/* With a single port, use 'port' and not 'ports'. */
> > > +		port {
> > > +			/* With 1 endpoint per port no need for addresses. */
> > > +			imx074_1: endpoint {
> > > +				bus-type = 4;
> > > +				/* If lane re-ordering is not supported, no
> > > +				   need to tell where the clock lane is! */
> > > +				/* clock-lanes = <0>; */
> > > +				/* But the number of data lanes is important! */
> > > +				data-lanes = <1 2>;
> > > +				remote-endpoint = <&csi20_in>;
> > >  			};
> > >  		};
> > >  	};
> > > +};
> > >
> > > -	csi2: csi2@ffc90000 {
> > > -		compatible = "renesas,sh-mobile-csi2";
> > > -		reg = <0xffc90000 0x1000>;
> > > -		interrupts = <0x17a0>;
> > > +csi20: csi2@fea80000 {
> > > +	compatible = "renesas,r8a7795-csi2";
> > > +	reg = <0 0xfea80000 0 0x10000>;
> > > +	interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> > > +	clocks = <&cpg CPG_MOD 714>;
> > > +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > > +	resets = <&cpg 714>;
> >
> > Do we need all reg, interrupts, clocks, power-domains and resets in the
> > example?
> 
> Probably not, but they were present in the previous example, so I kept
> it. I would be fine by dropping them anyway...

We actually need them. When moving to yaml the example will be compiled,
so they must be valid. Let's ensure they are already.

Bonus points if you can convert this file to yaml schema :-)

> > > +
> > > +	ports {
> > >  		#address-cells = <1>;
> > >  		#size-cells = <0>;
> > >
> > > -		port@1 {
> > > -			compatible = "renesas,csi2c";	/* One of CSI2I and CSI2C. */
> > > -			reg = <1>;			/* CSI-2 PHY #1 of 2: PHY_S,
> > > -							   PHY_M has port address 0,
> > > -							   is unused. */
> > > -			csi2_1: endpoint {
> > > -				clock-lanes = <0>;
> > > -				data-lanes = <2 1>;
> > > +		port@0 {
> > > +			reg = <0>;
> > > +
> > > +			csi20_in: endpoint {
> > > +				bus-type = 4;
> > > +				/* Use the same number of data lanes as the
> > > +				   one used by the remote endpoint! */
> >
> > nit: Do this comment bring value, or is it confusing?
> 
> Maybe it does not bring much value, but why is it confusing ?
> 
> > > +				data-lanes = <1 2>;
> > >  				remote-endpoint = <&imx074_1>;
> > >  			};
> > >  		};
> > > -		port@2 {
> > > -			reg = <2>;			/* port 2: link to the CEU */
> > >
> > > -			csi2_2: endpoint {
> > > -				remote-endpoint = <&ceu0_0>;
> > > +		port@1 {
> > > +			reg = <1>;
> > > +
> > > +			/* Data path to the VIN4 DMA engine. */
> >
> > Needed?
> 
> Not really...
> 
> > > +			csi20vin4: endpoint {
> > > +				remote-endpoint = <&vin4csi20>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +vin4: video@e6ef4000 {
> > > +	compatible = "renesas,vin-r8a7795";
> > > +	reg = <0 0xe6ef4000 0 0x1000>;
> > > +	interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > +	clocks = <&cpg CPG_MOD 807>;
> > > +	power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > > +	resets = <&cpg 807>;
> > > +	renesas,id = <4>;
> >
> > Same comment as above, is all properties needed in the example?
> > Specially renesas,id can be confusing as it's a driver specific binding
> > needed to workaround a fun hardware design.
> 
> I agree, but I'm debated.. one looks at the example and it doesn't
> match the actual VIN bindings, and then might be even more confused.
> I'm find dropping all of this. Maybe we can add a line in the intro
> that says the example is fictional and does not report all the
> required properties for a device to work.
> 
> > > +
> > > +	ports {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		/* Parallel input port: HDMI decoder */
> > > +		port@0 {
> > > +			reg = <0>;
> > > +
> > > +			vin4_digital_in: endpoint {
> > > +				bus-type = 5;
> > > +				bus-width = <8>;	/* Used data lines */
> > > +				data-shift = <2>;	/* Lines 9:2 are used */
> > > +				data-active = <1>;	/* Active high */
> > > +				pclk-sample = <0>;	/* Falling */
> > > +				/* If hsync-active/vsync-active are missing,
> > > +				 * embedded BT.656 sync is used */
> >
> > I feel if this comment is to be kept it should be expanded.
> 
> I copied it from the existing example. How would you expand it?
> 
> > > +				hsync-active = <0>;
> > > +				vsync-active = <0>;
> > > +				remote-endpoint = <&adv7612_out>;
> > > +			};
> > > +		};
> > > +
> > > +
> > > +		/* Data path to the MIPI CSI-2 receiver. */
> > > +		port@1 {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +
> > > +			reg =<1>;
> > > +
> > > +			/* Need endpoint numbers when multiple endpoints are
> > > +			   present. */
> >
> > I think this can be dropped.
> 
> Ok
> 
> Thanks for review
> 
> > > +			vin4csi20: endpoint@0 {
> > > +				reg = <0>;
> > > +				remote-endpoint = <&csi20vin4>;
> > > +			};
> > > +
> > > +			/* Not connected in this example. */
> > > +			vin4csi41: endpoint@3 {
> > > +				reg = <3>;
> > > +				remote-endpoint = <&csi41vin4>;
> > >  			};
> > >  		};
> > >  	};
> > > +};

-- 
Regards,

Laurent Pinchart
