Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB08251B06
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 16:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgHYOkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 10:40:33 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50599 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726617AbgHYOk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 10:40:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 70A0D5805C6;
        Tue, 25 Aug 2020 10:40:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 10:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=w
        MzjRVZ2eQmnRLOWtihVl3tYEELP/S8Nb3EyoLwdO9Q=; b=ZGu+1EFvpMlJgGP/h
        7q33zmEHNWl1PX8uKISBMLxwVqQwdmrDUwPBbwH8tEfaBbTxRaWqi/QIyAzk4Ap2
        PlmBLwPBNEE34nqXb3i+8BdD6Ya4sDE2wbOjjtkOjHANE1rtTW89BWbb5xxYCEO7
        ELX/yCqNSL9wDWUD7e6gtVX38OXPrb6k/ZyKLf/XJAlgUo0i0veHxuSpPc/oZTOy
        JQGhDMuVTv8eoztbFGgocgx4GO6RlzoOlEF8o3sh5/xCsKMTmFi2AhjylGjV4vZl
        ggcSuRhEYSQgtR57lr0T/8Jvxp2VlhP6POBYmfhTd+ztFFFprdu8yHrI1BtpIdNW
        Sk2jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=wMzjRVZ2eQmnRLOWtihVl3tYEELP/S8Nb3EyoLwdO
        9Q=; b=VlDRMj6dBtQg08iBd10GaVK5O3M7B+0mCO0wZduK7cIMoVzhn9/pSI3eq
        0RKJtAlxoF9AX0UbffAxcCf8gXgnJAyLO6hENEQF0WGRa0pxe82x27bsv4d1NFQU
        oAZ/T91/XTefiJGVa2SNFlRCobjJflJavbAYVcIE97926YRW5vtFFCxN/k7F5kFd
        RBtsr3pygiGTaCHTLRDcb6w1Y+TgHWKN8U6eQSwHNBM+07wbLlGU0dgK15JkPMT9
        3BbIuVnnjxxKdK1AWK0AqcJ6U/Iq6zhMIgekyGDQrXrmny8ShWPZ9s/Y/i/GlHB/
        tu4QX61Oy2ZLXK27K1oDaBRjW5yjg==
X-ME-Sender: <xms:2CJFX4pX79xgkgrQW1NbaOfBzTAl_u3mzl1LDaB1-upMlEi6KgMdYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
    jeevtdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2CJFX-pdvMGRNKPeQbmAqGMelw_PWcWrPKji7sz0Z0HqGA55PsUdHQ>
    <xmx:2CJFX9OQrDCtzePv3h8UXa-XRIx98lP2HeImaFSk-wu_aMRWf-vPsQ>
    <xmx:2CJFX_6n_oSOO04vY4S1Gd-0BjB2__ZVLvE5_e21FL2DlMYC-aSflw>
    <xmx:2iJFX0HEJT5ve-0Ac8oI61oKCtRX7NdjBnDwErAMJHMjDJgAWn7t3g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4B6EF30600B7;
        Tue, 25 Aug 2020 10:40:24 -0400 (EDT)
Date:   Tue, 25 Aug 2020 16:40:22 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 7/7] [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3:
 Enable OV8865 camera
Message-ID: <20200825144022.mwkcqaqny7l5bab4@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
 <20200821145935.20346-8-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200821145935.20346-8-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Aug 21, 2020 at 04:59:35PM +0200, K=E9vin L'h=F4pital wrote:
> The Bananapi M3 supports a camera module which includes an
> OV8865 sensor connected via the parallel CSI interface and
> an OV8865 sensor connected via MIPI CSI-2.
>=20
> The I2C2 bus is shared by the two sensors as well as active-low
> reset signal but each sensor has it own shutdown line.
>=20
> The I2c address for the OV8865 is 0x36.
>=20
> The bus type is hardcoded to 4 due to the lack of available
> define usable in the device-tree.
>=20
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
>
> ---
>  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 99 ++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot=
/dts/sun8i-a83t-bananapi-m3.dts
> index 9d34eabba121..f7839094695e 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> @@ -85,6 +85,38 @@
>  		};
>  	};
> =20
> +	reg_ov8865_avdd: ov8865-avdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-avdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	reg_ov8865_dovdd: ov8865-dovdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dovdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	reg_ov8865_afvdd: ov8865-afvdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-afvdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	reg_ov8865_vdd2: ov8865-vdd2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-vdd2";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		vin-supply =3D <&reg_eldo1>;
> +	};
> +
>  	reg_usb1_vbus: reg-usb1-vbus {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1-vbus";
> @@ -115,10 +147,59 @@
>  	cpu-supply =3D <&reg_dcdc3>;
>  };
> =20
> +&ccu {
> +	assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +	assigned-clock-parents =3D <&osc24M>;
> +	assigned-clock-rates =3D <24000000>;
> +};

Why do you need to use assigned-clocks here?

> +&csi {
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

pinctrl-names alone is useless

> +
> +&csi_in {
> +	mipi_csi2_from_ov8865: endpoint {
> +		remote-endpoint =3D <&ov8865_to_mipi_csi2>;
> +		clock-lanes =3D <0>;
> +		data-lanes =3D <1 2 3 4>;
> +		bus-type =3D <4>;
> +	};
> +};
> +
>  &de {
>  	status =3D "okay";
>  };
> =20
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pe_pins>;
> +	status =3D "okay";
> +
> +	ov8865: camera@36 {
> +		compatible =3D "ovti,ov8865";
> +		reg =3D <0x36>;
> +		clocks =3D <&ccu CLK_CSI_MCLK>;
> +		clock-names =3D"xclk";
> +		AVDD-supply =3D <&reg_ov8865_avdd>;
> +		DOVDD-supply =3D <&reg_ov8865_dovdd>;
> +		VDD2-supply =3D <&reg_ov8865_vdd2>;
> +		AFVDD-supply =3D <&reg_ov8865_afvdd>;
> +		powerdown-gpios =3D <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +		reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +		rotation =3D <180>;
> +
> +		port {
> +			ov8865_to_mipi_csi2: endpoint {
> +				remote-endpoint =3D <&mipi_csi2_from_ov8865>;
> +				data-lanes =3D <1 2 3 4>;
> +				clock-lanes =3D <0>;
> +				bus-type =3D <4>; /* V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
> +			};
> +		};
> +	};
> +};
> +
>  &ehci0 {
>  	/* Terminus Tech FE 1.1s 4-port USB 2.0 hub here */
>  	status =3D "okay";
> @@ -191,6 +272,11 @@
>  	status =3D "okay";
>  };
> =20
> +&pio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&csi_mclk_pin>;
> +};

I'm not sure why you'd need to use the MCLK pin as a hog, assigning it
to the camera device should be enough?

Maxime
