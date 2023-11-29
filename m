Return-Path: <linux-media+bounces-1345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 872297FD3E9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A617B21AB0
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5911A72B;
	Wed, 29 Nov 2023 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kYIGOJf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203A619BC;
	Wed, 29 Nov 2023 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701253068; x=1732789068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTnVkFfWKUdm2qh0fpbqtR+pAnlFpnKuhuB2nJV91Uk=;
  b=kYIGOJf7h1YkACgM02M2DRcQ0n7aQuPxJSbW7SFNmf1/CzLtYm8NBW0H
   uq1hxYymdDKnw6/tGDYrH14k2MNqyRBRxvpeu1LWYrDFyCN7EcVvdYyTd
   tzfv51wGXeDinukyqXj7+WTTTvDf7SBdhK6iFhaMR5guIxtbFHXiXddUg
   rqO/ECqD/jTG/8+2V89wgjCpjjQv9dFDlwy1+yH0qkBIDSMRNdEyAx9A7
   SOpQGX/4JqmCCy1zV8PV3B491ojnwrIN6ajDMrR/X4LErHfIXheZR6iNP
   jm5T+rNJR32TPxR52ePKLaMwBeXM5KYvBenGKdHMn60z28Vv8qyPAnIq6
   w==;
X-IronPort-AV: E=Sophos;i="6.04,235,1695679200"; 
   d="scan'208";a="34234189"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Nov 2023 11:17:45 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6612D280075;
	Wed, 29 Nov 2023 11:17:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Wed, 29 Nov 2023 11:17:44 +0100
Message-ID: <7150709.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231129093113.255161-2-paul.elder@ideasonboard.com>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com> <20231129093113.255161-2-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Paul,

Am Mittwoch, 29. November 2023, 10:31:12 CET schrieb Paul Elder:
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Thanks for the patch. I'm running with for a while now.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> c9a610ba4836..25579d4c58f2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1604,6 +1604,56 @@ isi_in_1: endpoint {
>  				};
>  			};
>=20
> +			isp_0: isp@32e10000 {
> +				compatible =3D "fsl,imx8mp-isp";
> +				reg =3D <0x32e10000 0x10000>;
> +				interrupts =3D <GIC_SPI 74=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				assigned-clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_ISP>;
> +				assigned-clock-parents =3D <&clk=20
IMX8MP_SYS_PLL2_500M>;
> +				assigned-clock-rates =3D <500000000>;
> +				power-domains =3D <&media_blk_ctrl=20
IMX8MP_MEDIABLK_PD_ISP>;
> +				fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@1 {
> +						reg =3D <1>;
> +					};
> +				};
> +			};
> +
> +			isp_1: isp@32e20000 {
> +				compatible =3D "fsl,imx8mp-isp";
> +				reg =3D <0x32e20000 0x10000>;
> +				interrupts =3D <GIC_SPI 75=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				assigned-clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_ISP>;
> +				assigned-clock-parents =3D <&clk=20
IMX8MP_SYS_PLL2_500M>;
> +				assigned-clock-rates =3D <500000000>;
> +				power-domains =3D <&media_blk_ctrl=20
IMX8MP_MEDIABLK_PD_ISP>;
> +				fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@1 {
> +						reg =3D <1>;
> +					};
> +				};
> +			};
> +
>  			dewarp: dwe@32e30000 {
>  				compatible =3D "nxp,imx8mp-dw100";
>  				reg =3D <0x32e30000 0x10000>;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



