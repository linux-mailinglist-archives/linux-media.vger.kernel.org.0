Return-Path: <linux-media+bounces-16341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C068952E1E
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD186B266BC
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 12:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87A11A7060;
	Thu, 15 Aug 2024 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YKEEVooE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I6oa638F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358119F473;
	Thu, 15 Aug 2024 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723940; cv=none; b=WEe+tFWjBi6gm2a/lS7mqKmU65Q9ehknQvdGnw90z4hwZ4B9fODFh7acVdAJJEWXX5sOh+A4t4lXFLvZW9A6hSUBVTTr2ng0+k/JQ0NnJrd8+/j3jSXQPA4wAZ0IMB/h4M+KYsXnX4VKxtQYPOvMfHTp62kHLG1W6ABveK9ylFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723940; c=relaxed/simple;
	bh=ZKq/ZXvi7kfEOZMDZTfLeYMFPIRJfWJBYIKMbg2p9k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAHdKpgb8rayofGOEDVYtQzXlRYwiPz7Ls9eJGSJ0BzDqf6iqKQaqxIO5p5pHKxKms4ORXtAjz+v8Wb0MEJWKOhYCSVrFo6vPK9Zj2cja3b7b2HhM01kmd16B0KVXmhNuOFzZfjYKgfulZ5CwA0gIrIJMPqQWQeUntJxF0KT/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YKEEVooE; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I6oa638F reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723723937; x=1755259937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9D+2rypUggQXyQCCNb9SWDH40qqIYWmodLE4T9gK9Y=;
  b=YKEEVooENsQxufn6vS6LslqHKmrw3pAW9l6fldrfhLSe4qEw9lJhBP4V
   KjNxX/3cy+YZ5rDyJW1jPcQcOX+r7URnP48wRt0P+6aBuMxLwDMBvTp2I
   Mz8vw52miW+pVm89/mvJ7C3uuRSX3IvTozwfrNm82useZg70i2EwbN6t4
   BHvZVKlBJOlUucb5p/lWH2ZE0zCRwVfSWXxEmSkNBNJ08VEAeAmkFj3Fa
   ItXrxmugquXXcpI/oe3vgBcZ/JqRcg0KEJ6fczOlx+AyhBMu76xLTXdcs
   FryscatazqQTfeaL4427dR3A0UeIPmzez3/LWf19EKYy6mEkF1r9X2Cve
   Q==;
X-CSE-ConnectionGUID: /lPyrB3ESIedpFesxTG8YA==
X-CSE-MsgGUID: tjUkXX/ITvW6iPnoog42Ww==
X-IronPort-AV: E=Sophos;i="6.10,148,1719871200"; 
   d="scan'208";a="38423965"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Aug 2024 14:12:15 +0200
X-CheckPoint: {66BDF09F-4-2C7A84BB-EFCBC4CF}
X-MAIL-CPID: 416F4E9E68642B27621A8D6ADD9E109C_2
X-Control-Analysis: str=0001.0A782F26.66BDF09F.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBB6D168034;
	Thu, 15 Aug 2024 14:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723723930;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z9D+2rypUggQXyQCCNb9SWDH40qqIYWmodLE4T9gK9Y=;
	b=I6oa638FK62CURZIXyyt7XWbCsYoPducWxYdtmzzu2LyXzXfpVSeH3Sg1c2hwf9bWYbpNJ
	dy4bf9eGTZiZ11/P+bmnCJsA3pbbHXVt4IlUEYBjGLm2rWHcwYMxpXFlGqB8hb6yhukPcC
	PvMAHj00KZnuch5iVi/uUCF7Q2XGHDk8k0Ob90cieh34z3JYrRuGGtMkSjK0eZmQImXL4z
	K8P9bCUgE4108UJGza2atpMMUzi/2fPcPOqswYo3M72n0OqhfKpePzfknUbEFc+2IF5lsT
	kyJE+EorV3D7H0I+PKWh8sSRNUne2xqWNywQbWFx3UMWbnOBE0jlBY8Oya8RKw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Paul Elder <paul.elder@ideasonboard.com>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Clarify csis clock frequency
Date: Thu, 15 Aug 2024 14:12:09 +0200
Message-ID: <3314370.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
References: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

thanks for the patch.

Am Mittwoch, 14. August 2024, 01:40:10 CEST schrieb Laurent Pinchart:
> The DT nodes for the MIPI CSI-2 receivers (MIPI_CSI) configure the
> CAM1_PIX and CAM2_PIX clocks to 266 MHz through the assigned-clock-rates
> property, and report that frequency in the clock-frequency property. The
> i.MX8MP reference manual and datasheet list 266 MHz as a nominal
> frequency when using both CSI-2 receivers, so all looks normal.
>=20
> In reality, the clock is actually set to 250 MHz, as the selected
> parent, IMX8MP_SYS_PLL2_1000M, has a 1/4 output that is selected as the
> closest frequency to 266 MHz. This doesn't break operation of the
> device, but is clearly misleading.
>=20
> Clarify the clock configuration by selecting the IMX8MP_SYS_PLL2_250M
> parent, dropping the redundant assigned-clock-rates, and setting
> clock-frequency to 250 MHz. This doesn't cause any functional change.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 603dfe80216f..d9b5c40f6460 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1687,7 +1687,7 @@ mipi_csi_0: csi@32e40000 {
>  				compatible =3D "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
>  				reg =3D <0x32e40000 0x10000>;
>  				interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> -				clock-frequency =3D <266000000>;
> +				clock-frequency =3D <250000000>;

This doesn't seem to be necessary, no? I can't be read from
IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT. But oh well, that's what we have right now.

Despite that:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>  				clocks =3D <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> @@ -1695,9 +1695,8 @@ mipi_csi_0: csi@32e40000 {
>  				clock-names =3D "pclk", "wrap", "phy", "axi";
>  				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>,
>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> -				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
> -				assigned-clock-rates =3D <266000000>;
>  				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
>  				status =3D "disabled";
> =20
> @@ -1723,7 +1722,7 @@ mipi_csi_1: csi@32e50000 {
>  				compatible =3D "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
>  				reg =3D <0x32e50000 0x10000>;
>  				interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> -				clock-frequency =3D <266000000>;
> +				clock-frequency =3D <250000000>;
>  				clocks =3D <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> @@ -1731,9 +1730,8 @@ mipi_csi_1: csi@32e50000 {
>  				clock-names =3D "pclk", "wrap", "phy", "axi";
>  				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>,
>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> -				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
> -				assigned-clock-rates =3D <266000000>;
>  				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
>  				status =3D "disabled";
> =20
>=20
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



