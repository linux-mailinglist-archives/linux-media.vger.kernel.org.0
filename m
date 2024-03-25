Return-Path: <linux-media+bounces-7774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AA88AB16
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6AF51C3E436
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D531509A1;
	Mon, 25 Mar 2024 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Fi0zXIT8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bAOTpY5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AFB130E2F;
	Mon, 25 Mar 2024 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711381951; cv=none; b=TE3mk1WRn8o9AScObLaMoP3Yl6cEQO50sbNLsrQxGgSgewZfD3EbXIANr6ZxCpjeVEnE6rAp/I62QQVTxG9MFY70U6qRRYraoSxB5AIphvg/MDTI+k64wXzKF97uT0cpM7Fvo8sBDbxbAh8HlJ7aSQmyruvB0AsSIMVXY+JN2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711381951; c=relaxed/simple;
	bh=lRJ4A79DygCuqxWRqDnD+NNRnkayTPbDzZFwZb4A6oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YyKsSmW5EAs0M5NaFW11OTfKJpELlQ7vsnPiI1xXWU2STvt1uoWlabz5/WPl1Di2HTVVbDAjsf92qhWO84ZD2wttJGKxCjkWodKpHMEU83m8182vgDauoY3nM3gwGUfAJM8EtvD9Q9zBDcdxw5KW4kLElH7QfCWMdYvFAqpYBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Fi0zXIT8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bAOTpY5j reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1711381948; x=1742917948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QtCjA8jF6LdIH1jHhbsQNsROhaw0D6l+AUhvNB1YUh4=;
  b=Fi0zXIT82DvQGKlnO600+MC1pqsMCSbZKuE1pzDo4OZvs3xUXKjfZnDd
   NrXNpXn5cEDalnbi3e83w5uP+yx3LHpwjNg6it7GLOLdNAXBzN1Zs81B1
   Jh88qJJ6LXcuuiMwaoVhAssduZejeJur9/Ipp0ybhJOXqXI7vCQx2F+Qv
   xevYlQCm5SfOFKWPVpmmUI8LgdAyEKurTUfi7f5RRahz3ZPq9zAZTBP8X
   n/hm1PzEtCciNEXtrYe03wn+kQhiNv53CGtrSEeP5sROYIRBbEKfrresY
   5ZR2HdND4T0bN1SbkNODk2ob2Og3FBXLL2cappox/TY9u5yz1Yi9fFrVD
   A==;
X-IronPort-AV: E=Sophos;i="6.07,153,1708383600"; 
   d="scan'208";a="36084202"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Mar 2024 16:52:20 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43E5B160A85;
	Mon, 25 Mar 2024 16:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1711381936;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QtCjA8jF6LdIH1jHhbsQNsROhaw0D6l+AUhvNB1YUh4=;
	b=bAOTpY5jeZxEyk1N5ffRgkuPA+mQKdjnHFCeTHgLr26+KFrqRQ3Vr141ZwYVr41U4oRcuO
	St+eFfnSAypOBgpZXiFxGQuVOY6/M31vwbD/bjAaN2DlTeQQcbjU5pZwWH8fB/E+8evECo
	BlbUwvf6XxHCOgI5/vP3wV4NE76RK8OsGDXVgQPowYs86Ckn3B9Fz6WsIAxTIKMeHdjLQW
	p0uJi/AbRclSTD26bxDrTaAGBDilGnqB0BATMPmPfutN/KnKX+KXhNfcimuyMbWpylI3sJ
	xqo7itoUJI5XzHxYZwS0wUzk15TxJisYMDjXX3yzBQcFHHhdeO3cBtPT3LLCRQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Mon, 25 Mar 2024 16:52:21 +0100
Message-ID: <4879631.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
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

Am Montag, 25. M=E4rz 2024, 16:13:39 CET schrieb Laurent Pinchart:
> From: Paul Elder <paul.elder@ideasonboard.com>
>=20
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index bfc5c81a5bd4..1d2670b91b53 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
>  				};
>  			};
> =20
> +			isp_0: isp@32e10000 {
> +				compatible =3D "fsl,imx8mp-isp";
> +				reg =3D <0x32e10000 0x10000>;
> +				interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP>;
> +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> +				assigned-clock-rates =3D <500000000>;
> +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
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
> +				interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP>;
> +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> +				assigned-clock-rates =3D <500000000>;
> +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
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

The patch itself is okay. But you might not be able to
configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled before.
This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_ispdwp'
power domain. Reparenting is not possible anymore in this case.

Something like
=2D--8<---
=2D-- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
                                                  <&clk IMX8MP_CLK_MEDIA_AP=
B>,
                                                  <&clk IMX8MP_CLK_MEDIA_DI=
SP1_PIX>,
                                                  <&clk IMX8MP_CLK_MEDIA_DI=
SP2_PIX>,
+                                                 <&clk IMX8MP_CLK_MEDIA_IS=
P>,
                                                  <&clk IMX8MP_VIDEO_PLL1>;
                                assigned-clock-parents =3D <&clk IMX8MP_SYS=
_PLL2_1000M>,
                                                         <&clk IMX8MP_SYS_P=
LL1_800M>,
                                                         <&clk IMX8MP_VIDEO=
_PLL1_OUT>,
=2D                                                        <&clk IMX8MP_VID=
EO_PLL1_OUT>;
+                                                        <&clk IMX8MP_VIDEO=
_PLL1_OUT>,
+                                                        <&clk IMX8MP_SYS_P=
LL2_500M>;
                                assigned-clock-rates =3D <500000000>, <2000=
00000>,
                                                       <0>, <0>, <103950000=
0>;
                                #power-domain-cells =3D <1>;
=2D--8<---
is needed.

Best regards,
Alexander

>  			dewarp: dwe@32e30000 {
>  				compatible =3D "nxp,imx8mp-dw100";
>  				reg =3D <0x32e30000 0x10000>;
>=20
> base-commit: 4cece764965020c22cff7665b18a012006359095
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



