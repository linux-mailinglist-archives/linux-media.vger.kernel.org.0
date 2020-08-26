Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8C25299F
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgHZI6m convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 26 Aug 2020 04:58:42 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59043 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgHZI6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 04:58:41 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E21B21BF218;
        Wed, 26 Aug 2020 08:58:34 +0000 (UTC)
Date:   Wed, 26 Aug 2020 10:58:34 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 7/7] [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3:
 Enable OV8865 camera
Message-ID: <20200826105834.0100d4a7@lhopital-XPS-13-9360>
In-Reply-To: <20200825144022.mwkcqaqny7l5bab4@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200821145935.20346-8-kevin.lhopital@bootlin.com>
        <20200825144022.mwkcqaqny7l5bab4@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Le Tue, 25 Aug 2020 16:40:22 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> Hi,
> 
> On Fri, Aug 21, 2020 at 04:59:35PM +0200, Kévin L'hôpital wrote:
> > The Bananapi M3 supports a camera module which includes an
> > OV8865 sensor connected via the parallel CSI interface and
> > an OV8865 sensor connected via MIPI CSI-2.
> > 
> > The I2C2 bus is shared by the two sensors as well as active-low
> > reset signal but each sensor has it own shutdown line.
> > 
> > The I2c address for the OV8865 is 0x36.
> > 
> > The bus type is hardcoded to 4 due to the lack of available
> > define usable in the device-tree.
> > 
> > Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> >
> > ---
> >  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 99
> > ++++++++++++++++++++ 1 file changed, 99 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> > b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts index
> > 9d34eabba121..f7839094695e 100644 ---
> > a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts +++
> > b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts @@ -85,6 +85,38 @@
> >  		};
> >  	};
> >  
> > +	reg_ov8865_avdd: ov8865-avdd {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ov8865-avdd";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +		vin-supply = <&reg_dldo4>;
> > +	};
> > +
> > +	reg_ov8865_dovdd: ov8865-dovdd {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ov8865-dovdd";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +		vin-supply = <&reg_dldo4>;
> > +	};
> > +
> > +	reg_ov8865_afvdd: ov8865-afvdd {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ov8865-afvdd";
> > +		regulator-min-microvolt = <2800000>;
> > +		regulator-max-microvolt = <2800000>;
> > +		vin-supply = <&reg_dldo4>;
> > +	};
> > +
> > +	reg_ov8865_vdd2: ov8865-vdd2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "ov8865-vdd2";
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +		vin-supply = <&reg_eldo1>;
> > +	};
> > +
> >  	reg_usb1_vbus: reg-usb1-vbus {
> >  		compatible = "regulator-fixed";
> >  		regulator-name = "usb1-vbus";
> > @@ -115,10 +147,59 @@
> >  	cpu-supply = <&reg_dcdc3>;
> >  };
> >  
> > +&ccu {
> > +	assigned-clocks = <&ccu CLK_CSI_MCLK>;
> > +	assigned-clock-parents = <&osc24M>;
> > +	assigned-clock-rates = <24000000>;
> > +};  
> 
> Why do you need to use assigned-clocks here?

I could do it in the ov8865 node, does it sound good to you ?

> 
> > +&csi {
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};  
> 
> pinctrl-names alone is useless
> 
> > +
> > +&csi_in {
> > +	mipi_csi2_from_ov8865: endpoint {
> > +		remote-endpoint = <&ov8865_to_mipi_csi2>;
> > +		clock-lanes = <0>;
> > +		data-lanes = <1 2 3 4>;
> > +		bus-type = <4>;
> > +	};
> > +};
> > +
> >  &de {
> >  	status = "okay";
> >  };
> >  
> > +&i2c2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pe_pins>;
> > +	status = "okay";
> > +
> > +	ov8865: camera@36 {
> > +		compatible = "ovti,ov8865";
> > +		reg = <0x36>;
> > +		clocks = <&ccu CLK_CSI_MCLK>;
> > +		clock-names ="xclk";
> > +		AVDD-supply = <&reg_ov8865_avdd>;
> > +		DOVDD-supply = <&reg_ov8865_dovdd>;
> > +		VDD2-supply = <&reg_ov8865_vdd2>;
> > +		AFVDD-supply = <&reg_ov8865_afvdd>;
> > +		powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /*
> > PE17 */
> > +		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16
> > */
> > +		rotation = <180>;
> > +
> > +		port {
> > +			ov8865_to_mipi_csi2: endpoint {
> > +				remote-endpoint =
> > <&mipi_csi2_from_ov8865>;
> > +				data-lanes = <1 2 3 4>;
> > +				clock-lanes = <0>;
> > +				bus-type = <4>; /*
> > V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >  &ehci0 {
> >  	/* Terminus Tech FE 1.1s 4-port USB 2.0 hub here */
> >  	status = "okay";
> > @@ -191,6 +272,11 @@
> >  	status = "okay";
> >  };
> >  
> > +&pio {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&csi_mclk_pin>;
> > +};  
> 
> I'm not sure why you'd need to use the MCLK pin as a hog, assigning it
> to the camera device should be enough?

Yes you are right, I will put it in the ov8865 node.
> 
> Maxime

Thank you very much for the review.
Kévin


-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
