Return-Path: <linux-media+bounces-38251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA380B0F1E6
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E152B584218
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCEB2E5B0E;
	Wed, 23 Jul 2025 12:07:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBA62E54CB;
	Wed, 23 Jul 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272420; cv=none; b=hAGfrc6Pc8vyIAxfFoTlGgYT5bhokOlKyNEX76FnVBQmOiEhg9ohQpbAugMuUoDkAlObsdSdNy3CJsZHYO9ckSzcA/66WOnexbmGMtBhjSf9eIO1iIiLsloQYBWI5+VtXvf+TOhsHi51kI1R7rIyFwbgvNC9Irq3HX7THc+emhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272420; c=relaxed/simple;
	bh=z1VzJkWumDQceH/olOfLQlpzbpgz5CqVIBb3ybbjh5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sde+MuwKk45vnKJsHTgf8rYon75RfR37bDD+UT7/7YhskH6uKuKRymNHL/EhlBuCYPZBo850OmaUdB4Sg9HTh3CAxuLMnYQagjPEZyXjevT1MyqWXhie+JUfAH04yaCBm0I5WowV8VIMuuTLvE4TWBy1AculH3TAKla2qy4eHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id BF790C3E4DE9;
	Wed, 23 Jul 2025 14:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl BF790C3E4DE9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <175326599663.2811177.16620980968274114885@localhost> (Stefan
	Klug's message of "Wed, 23 Jul 2025 12:19:56 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
Sender: khalasa@piap.pl
Date: Wed, 23 Jul 2025 14:06:43 +0200
Message-ID: <m3seinw1po.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Klug <stefan.klug@ideasonboard.com> writes:

> Just a quick heads up. I ran the tester and so far no unexpected
> results. I'll run it from time to time after a reboot to see if I ever
> hit that condition.
>
> How does your device tree look like? Any chance the ISP is clocked for
> overdrive but the device is not or something similar? Although I have a
> hard time imagining how that would lead to such effects.

Interesting.
I tested it on two different devices (a Compulab UCM-based camera and
a Solidrun Hummingboard Mate) and it's the same on both. I think the
first one uses 1600 MHz industrial CPU:

(U-boot) CPU: i.MX8MP[8] rev1.1 at 1200 MHz

Not sure about the Hummingboard.

Both cameras apparently are connected to the second MIPI.

Well... maybe if it's only the second ISP, and there is only one camera,
then we could reroute the data to the first ISP? The MIPI receiver has
a crossbar I think.
And the other way around: for a test, one could reroute MIPI0 to ISP1.
Will have a look.

The DT has the usual stuff (for the second MIPI/ISP):

&i2c6 {
	clock-frequency =3D <400000>;
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_i2c6>;
	single-master;
	status =3D "okay";

	imx462_camera@1a {
		compatible =3D "sony,imx462";
		reg =3D <0x1a>;
		clocks =3D <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
		clock-names =3D "xclk";
		clock-frequency =3D <37125000>;
		reset-gpios =3D <&gpio2 1 GPIO_ACTIVE_HIGH>;
		status =3D "okay";

		port {
			imx462_mipi_ep: endpoint {
				data-lanes =3D <1 2 3 4>;
				clock-lanes =3D <0>;
				link-frequencies =3D /bits/ 64 <222750000 148500000>;
				remote-endpoint =3D <&mipi_csi_1_in>;
			};
		};
	};

};

&mipi_csi_1 {
    status =3D "okay";

    ports {
        port@0 {
            reg =3D <0>;
            mipi_csi_1_in: endpoint {
                remote-endpoint =3D <&imx462_mipi_ep>;
                data-lanes =3D <1 2 3 4>;
            };
        };

        port@1 {
            reg =3D <1>;
            mipi_csi_1_out: endpoint {
                remote-endpoint =3D <&isp_1_in>;
            };
        };
    };
};

&isp_1 {
    status =3D "okay";

    ports {
        port@1 {
            isp_1_in: endpoint {
                bus-type =3D <MEDIA_BUS_TYPE_PARALLEL>;
                remote-endpoint =3D <&mipi_csi_1_out>;
            };
        };
    };
};

The CCM registers show basically (p. 229 in i.MX8MP ref manual):
  8 MEDIA_ISP           mux 7       post 0 SYSTEM_PLL2_DIV2 =3D 500 MHz
 20 MEDIA_AXI           mux 1 pre 1 post 0 SYSTEM_PLL2_CLK / 2 =3D 500 MHz
 21 MEDIA_APB           mux 2 pre 3 post 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
123 MEDIA_MIPI_PHY1_REF mux 0 pre 0 post 0 24M_REF_CLK =3D 24 MHz
125 MEDIA_CAM2_PIX      mux 2 pre 0 post 0 SYSTEM_PLL2_DIV4 =3D 250 MHz

The first 3 are at the max values, MEDIA_MIPI_PHY1_REF max is 125 MHz,
MEDIA_CAM2_PIX max is 266 MHz. Maybe I should try changing these clocks,
but not sure how do I do that (any change causes rkisp1 driver loading
to fail). Will look at it.

BTW the double read and double write in NXP driver (isp-vvcam) were
introduced by (in their repo):

Author: hexing <Xing.He@verisilicon.com>  2022-08-05 10:19:49
Committer: Robby Cai <robby.cai@nxp.com>  2022-08-08 04:50:48

M865SW-1031: the second isp port jump frames

Reason:mi read or write reg occasionally it does not take effect

WorkAround:read or write twice of mi reg

---------------------------- vvcam/isp/isp_ioctl.c ------------------------=
----
index 60741bd..e0d3048 100644
@@ -118,5 +118,8 @@ void isp_write_reg(struct isp_ic_dev *dev, u32 offset, =
u32 val)
 	if (offset >=3D ISP_REG_SIZE)
 		return;
-	__raw_writel(val, dev->base + offset);
+	writel(val, dev->base + offset);
+	if ((offset >=3D REG_ADDR(mi_mp_y_base_ad_init))
+		&& (offset <=3D REG_ADDR(mi_mp_y_pic_size)))
+		writel(val, dev->base + offset);
 //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
 }
@@ -128,5 +131,8 @@ u32 isp_read_reg(struct isp_ic_dev *dev, u32 offset)
 	if (offset >=3D ISP_REG_SIZE)
 		return 0;
-	val =3D __raw_readl(dev->base + offset);
+	val =3D readl(dev->base + offset);
+	if ((offset >=3D REG_ADDR(mi_mp_y_base_ad_init))
+		&& (offset <=3D REG_ADDR(mi_mp_y_pic_size)))
+		val =3D readl(dev->base + offset);
 //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
 	return val;

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

