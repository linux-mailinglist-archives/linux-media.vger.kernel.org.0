Return-Path: <linux-media+bounces-38735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF7B18B63
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 10:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572241768CB
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 08:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFC31FE474;
	Sat,  2 Aug 2025 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sq0wK0UZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAB1F91E3;
	Sat,  2 Aug 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754124068; cv=none; b=NAEZLfnWBte3FGjVHcwHqUnDYDR30YLbWsUwlSxrZxcpf5ZI6BVIdDDQxkVs5EGDYXjHOcN6WKFOZ98beFYz3651BJeVZLV6XkizntWSe3tLZpev/wU8sr6VM31CFWUU0adal09NPdaQxsKlMYIUZGrh9XUSx/BRiqfJogGoxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754124068; c=relaxed/simple;
	bh=oU87yynY9OkNgePab14EjtA/FIdmNPBXak8v0Yc3ONw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Tmo5TZMUuY/oze16lWRY8pb70fZ0CrVIghwdOrui8foxU6RNa/syqR19q0dM0r7HQjZrR+0J7EeghTqitXpNnkF56b6SufAwjZ+AhUoe9miP4SNUWGK2Hpfnmc68l0dyHE+8IHcOk0rfOUHoSvpKZR0B0uO5hZzJM92wOz1WV4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sq0wK0UZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF8443DA;
	Sat,  2 Aug 2025 10:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754124015;
	bh=oU87yynY9OkNgePab14EjtA/FIdmNPBXak8v0Yc3ONw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Sq0wK0UZ1/OTJRLm9pXvJu54D1dPk8BwkywGBb+UMvI+mhZPlDYatUsOGJIOIE60y
	 ejjM1AmPtIgKuJlf0nn5fcldd2VyDVXdxAd8aTEy5pi6yFvWV6kKToQUBFdGWVhq99
	 FtF8A3AQmeHrwBoa5ua618nv+FmlJB/z8rGx1hOk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250620-camera-v4-3-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com> <20250620-camera-v4-3-0201a8ed5fae@bootlin.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, ~diederik/pine64-discuss@lists.sr.ht, Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
To: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Roth <nicholas@rothemail.net>, Olivier Benjamin <olivier.benjamin@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Sat, 02 Aug 2025 09:40:57 +0100
Message-ID: <175412405784.2356345.13601254650114566601@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Olivier,

I'm very pleased to see this support getting upstreamed!

Quoting Olivier Benjamin (2025-06-20 16:21:34)
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
> ---
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 93 ++++++++++++++++=
++++++
>  1 file changed, 93 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..b335d044138b413359ba54269=
ab646142254a55f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -114,6 +114,16 @@ vcc3v3_sys: regulator-vcc3v3-sys {
>                 vin-supply =3D <&vcc_sys>;
>         };
> =20
> +       avdd2v8_dvp: regulator-avdd2v8-dvp {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "avdd2v8_dvp";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +               vin-supply =3D <&vcc3v3_sys>;
> +       };
> +
>         vcca1v8_s3: regulator-vcc1v8-s3 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "vcca1v8_s3";
> @@ -136,6 +146,16 @@ vcc1v8_codec: regulator-vcc1v8-codec {
>                 vin-supply =3D <&vcc3v3_sys>;
>         };
> =20
> +       vcc1v2_dvp: regulator-vcc1v2-dvp {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc1v2_dvp";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <1200000>;
> +               regulator-max-microvolt =3D <1200000>;
> +               vin-supply =3D <&vcca1v8_s3>;
> +       };
> +
>         wifi_pwrseq: sdio-wifi-pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
>                 clocks =3D <&rk818 1>;
> @@ -312,6 +332,8 @@ vcc3v0_touch: LDO_REG2 {
> =20
>                         vcca1v8_codec: LDO_REG3 {
>                                 regulator-name =3D "vcca1v8_codec";
> +                               regulator-always-on;
> +                               regulator-boot-on;

Is regulator-boot-on needed when regulator-always-on is set? Doesn't
-always-on take precedence and ensure it's enabled if it's not on
anyway?

It seems odd to have (need?) both ...? but I'm no DT expert on this part
- it just stands out to me.


>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                         };
> @@ -420,6 +442,45 @@ regulator-state-mem {
>         };
>  };
> =20
> +&i2c1 {
> +       clock-frequency =3D <400000>;
> +       pinctrl-0 =3D <&i2c1_xfer &cif_clkouta>;
> +       assigned-clocks =3D <&cru SCLK_CIF_OUT>;
> +       assigned-clock-rates =3D <24000000>;
> +       status =3D "okay";
> +
> +       wcam: camera@1a {
> +               compatible =3D "sony,imx258";
> +               reg =3D <0x1a>;
> +               clocks =3D <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived fr=
om CIF_CLKO */
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&camera_rst>;
> +               /* Note: both cameras also depend on vcca1v8_codec to pow=
er the I2C bus. */

Should that be represented by the i2c1 bus then?

> +               vif-supply =3D <&vcc1v8_dvp>;
> +               vana-supply =3D <&avdd2v8_dvp>;
> +               vdig-supply =3D <&vcc1v2_dvp>; /* DVDD_DVP is the same as=
 VCC1V2_DVP */
> +               reset-gpios =3D <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
> +               orientation =3D <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
> +               rotation =3D <270>;
> +               lens-focus =3D <&wcam_lens>;
> +
> +               port {
> +                       wcam_out: endpoint {
> +                               remote-endpoint =3D <&mipi_in_wcam>;
> +                               data-lanes =3D <1 2 3 4>;
> +                               link-frequencies =3D /bits/ 64 <636000000=
>;
> +                       };
> +               };
> +       };
> +
> +       wcam_lens: camera-lens@c {
> +               compatible =3D "dongwoon,dw9714";
> +               reg =3D <0x0c>;
> +               /* Same I2c bus as both cameras, depends on vcca1v8_codec=
 for power. */
> +               vcc-supply =3D <&vcc1v8_dvp>;
> +       };
> +};
> +
>  &i2c3 {
>         i2c-scl-rising-time-ns =3D <450>;
>         i2c-scl-falling-time-ns =3D <15>;
> @@ -462,6 +523,28 @@ &io_domains {
>         status =3D "okay";
>  };
> =20
> +&isp1 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       mipi_in_wcam: endpoint@0 {
> +                               reg =3D <0>;
> +                               remote-endpoint =3D <&wcam_out>;
> +                               data-lanes =3D <1 2 3 4>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mipi_dphy_rx0 {
> +       status =3D "okay";
> +};
> +
> +&isp1_mmu {
> +       status =3D "okay";
> +};
> +
>  &mipi_dsi {
>         status =3D "okay";
>         clock-master;
> @@ -495,6 +578,10 @@ mipi_in_panel: endpoint {
>         };
>  };
> =20
> +&mipi_dsi1 {
> +       status =3D "okay";
> +};
> +

Is this an unrelated change? The Camera should be on CSI - not DSI?

>  &pmu_io_domains {
>         pmu1830-supply =3D <&vcc_1v8>;
>         status =3D "okay";
> @@ -507,6 +594,12 @@ pwrbtn_pin: pwrbtn-pin {
>                 };
>         };
> =20
> +       camera {
> +               camera_rst_l: camera-rst-l {
> +                       rockchip,pins =3D <1 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
>         leds {
>                 red_led_pin: red-led-pin {
>                         rockchip,pins =3D <4 RK_PD2 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
>=20
> --=20
> 2.49.0
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

