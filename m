Return-Path: <linux-media+bounces-32422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA736AB5C39
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 20:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 874D916298D
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 18:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CBF2BF979;
	Tue, 13 May 2025 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mfGTVucp"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67D19F416;
	Tue, 13 May 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160634; cv=none; b=jZiO14GRrK+XI+TcKgZnkeiFMTqiIqpjN6Ai9TZRwDwqa6YHY4Wh+N3aYLg1/+++cTsyz2FDMCRm3V0ltT/jwjNqMF2lSgm2Sp1x6F55ECKBBVk+1WmKi42Ln1ZpWlbaAX+bJankJx/oDX3+ubjSGd9vLv9Y9r8SLp8qxemDvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160634; c=relaxed/simple;
	bh=xJS9qQrP4zFrvKwyr0ewbwd1eNc66Qv01dQ9Ct1/AsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VB+GoC5N5ucFEJ0HD2WglMxFmG0yf12utlB3lCBczKg6DpZAjE48hRpy/tkg/tkG2ufRENAEfmC26W/AWsBMb8/scNVqf4FwtVlM9q1gOx5w+ZOkIIjgdcqnsajt7oPBn8R4QOFr5r4fjqsKO9Sxlyp5yQ8EhDHwVkAZfri/KVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mfGTVucp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Iwn/kA0O8CAD/ThWddzWQf+59NgObuDjwWI8/h+K/jQ=; b=mfGTVucpq7HrMiOG310MZExm24
	a2PHQpc2cZYjgQ9T/uFPXjtCeE/cxbVtmxzBJmrWoniJ1DBsk548oBUZG3MAPnhdUydoji7XVwbBv
	ejnYHcgOhXUnhzTmfifID7w8e0r5/pYGqsiEuFKtlBFYAqe1S5PdUhgzhliR8xEiY92KCVy33Odut
	EVQX/bcUZlGG4ld1scWlBGQ+0fQn4xV7JYULNWrechX53cTznos72AXSEbqm2ROewq2LVA0rSEvfx
	2BIoFQMainpHwQlLFThQu0QNkufNqqt8weIqnHm2vhM/WkL/lJ5stSp81xIjnfx0yzjJktrme6EuS
	nJy7QN5A==;
Received: from [61.8.147.169] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEuI2-0003RT-CU; Tue, 13 May 2025 20:23:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject:
 Re: [PATCH v3 3/4] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world
 camera on PinePhone Pro
Date: Tue, 13 May 2025 20:23:40 +0200
Message-ID: <3359896.e9J7NaK4W3@phil>
In-Reply-To: <20250509-camera-v3-3-dab2772d229a@bootlin.com>
References:
 <20250509-camera-v3-0-dab2772d229a@bootlin.com>
 <20250509-camera-v3-3-dab2772d229a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Olivier,

Am Freitag, 9. Mai 2025, 23:51:39 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Olivier Benjamin:
> Add the description of the rear/world camera (IMX258) on the PinePhone Pro
> to the device dts file.
> It receives commands on the I2C Bus 1 at address 0x1a and transmits data
> over CSI-MIPI.
>=20
> The I2C address for IMX258 can be found in the IMX258-0AQH5 Software
> Reference Manual, page 24, section 2.3.1: 0b0011010 =3D 0x1a.
> Section 3 indicates the module has 4 pairs of data lines. While 4-lane
> mode is nominal, 2-lane mode should also be supported.
>=20
> The pin muxing info was extracted from the PinePhone Pro schematic v1.0
> as well as the RK3399 datasheet revision 1.8.
>=20
> Table 2-3 in section 2.8 of the RK3399 datasheet contains the mapping
> of IO functions for the SoC pins. Page 52 shows GPIO1_A0, page 54 shows
> GPIO2_D4.
>=20
> For I2C power, the PinePhone Pro schematic page 11 quadrants A4 and A5:
> RK3399_J.AA8 and RK3399_J.Y8 get power from vcaa1v8_codec, so turn it on
>=20
> The IMX258 also uses the following regulators, expected by its driver:
>  - vana (2.8V analog), called AVDD2V8_DVP on P.18 q.C1 and derived from
>    VCC1V8_S3 on P.13 q.B2
>  - vdig (1.2V digital core), called DVDD_DVP on P.18 q.C1 and shown on
>    P.18 q.D3 to be equivalent to VCC1V2_DVP derived from VCC3V3_SYS on
>    P.13 q.B3. Note that this regulator's voltage is inconsistently
>    labeled either 1.2V or 1.5V
>=20
> RK3399_J.AG1 is GPIO4_A1/I2C1_SDA, RK3399_J.Y6 is GPIO4_A2/I2C1_SCL
> This is the default pinctrl "i2c1_xfer" for i2c1 from rk3399-base.
>=20
> For the reset (RESET) signal:
> page 11 quadrant D2             | p.18 q.C3-4 | p.18 q.C2
> RK3399_E.R25 -> GPIO1_A0 -> Camera_RST -> MIPI_RST0 -> IMX258.12
>=20
> For the powerdown (PWDN) signal:
> page 11 quadrants B4-5          | p.18 q.C2
> RK3399_G.AF8 -> GPIO2_D4 -> DVP_PDN1_H -> IMX258.14
>=20
> Helped-by: Dragan Simic <dsimic@manjaro.org>
> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

how independent are the devicetree changes from the binding changes?
As the binding change "only" includes other properties.

Heiko


> ---
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 94 ++++++++++++++++=
++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..588e2d8a049cc649aa227c7a8=
85bd494f23fbdf8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -114,6 +114,16 @@ vcc3v3_sys: regulator-vcc3v3-sys {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> +	avdd2v8_dvp: regulator-avdd2v8-dvp {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "avdd2v8_dvp";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&vcc3v3_sys>;
> +	};
> +
>  	vcca1v8_s3: regulator-vcc1v8-s3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcca1v8_s3";
> @@ -136,6 +146,16 @@ vcc1v8_codec: regulator-vcc1v8-codec {
>  		vin-supply =3D <&vcc3v3_sys>;
>  	};
> =20
> +	vcc1v2_dvp: regulator-vcc1v2-dvp {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc1v2_dvp";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		vin-supply =3D <&vcca1v8_s3>;
> +	};
> +
>  	wifi_pwrseq: sdio-wifi-pwrseq {
>  		compatible =3D "mmc-pwrseq-simple";
>  		clocks =3D <&rk818 1>;
> @@ -312,6 +332,8 @@ vcc3v0_touch: LDO_REG2 {
> =20
>  			vcca1v8_codec: LDO_REG3 {
>  				regulator-name =3D "vcca1v8_codec";
> +				regulator-always-on;
> +				regulator-boot-on;
>  				regulator-min-microvolt =3D <1800000>;
>  				regulator-max-microvolt =3D <1800000>;
>  			};
> @@ -420,6 +442,46 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-0 =3D <&i2c1_xfer &cif_clkouta>;
> +	assigned-clocks =3D <&cru SCLK_CIF_OUT>;
> +	assigned-clock-rates =3D <24000000>;
> +	status =3D "okay";
> +
> +	wcam: camera@1a {
> +		compatible =3D "sony,imx258";
> +		reg =3D <0x1a>;
> +		clocks =3D <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
> +		clock-names =3D "xvclk";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wcam_rst>;
> +		/* Note: both cameras also depend on vcca1v8_codec to power the I2C bu=
s. */
> +		vif-supply =3D <&vcc1v8_dvp>;
> +		vana-supply =3D <&avdd2v8_dvp>;
> +		vdig-supply =3D <&vcc1v2_dvp>; /* DVDD_DVP is the same as VCC1V2_DVP */
> +		reset-gpios =3D <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
> +		orientation =3D <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
> +		rotation =3D <270>;
> +		lens-focus =3D <&wcam_lens>;
> +
> +		port {
> +			wcam_out: endpoint {
> +				remote-endpoint =3D <&mipi_in_wcam>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <636000000>;
> +			};
> +		};
> +	};
> +
> +	wcam_lens: camera-lens@c {
> +		compatible =3D "dongwoon,dw9714";
> +		reg =3D <0x0c>;
> +		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
> +		vcc-supply =3D <&vcc1v8_dvp>;
> +	};
> +};
> +
>  &i2c3 {
>  	i2c-scl-rising-time-ns =3D <450>;
>  	i2c-scl-falling-time-ns =3D <15>;
> @@ -462,6 +524,28 @@ &io_domains {
>  	status =3D "okay";
>  };
> =20
> +&isp1 {
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_in_wcam: endpoint@0 {
> +				reg =3D <0>;
> +				remote-endpoint =3D <&wcam_out>;
> +				data-lanes =3D <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_dphy_rx0 {
> +	status =3D "okay";
> +};
> +
> +&isp1_mmu {
> +	status =3D "okay";
> +};
> +
>  &mipi_dsi {
>  	status =3D "okay";
>  	clock-master;
> @@ -495,6 +579,10 @@ mipi_in_panel: endpoint {
>  	};
>  };
> =20
> +&mipi_dsi1 {
> +	status =3D "okay";
> +};
> +
>  &pmu_io_domains {
>  	pmu1830-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
> @@ -507,6 +595,12 @@ pwrbtn_pin: pwrbtn-pin {
>  		};
>  	};
> =20
> +	camera {
> +		wcam_rst: wcam-rst {
> +			rockchip,pins =3D <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	leds {
>  		red_led_pin: red-led-pin {
>  			rockchip,pins =3D <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
>=20





