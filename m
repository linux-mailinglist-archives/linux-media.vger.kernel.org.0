Return-Path: <linux-media+bounces-16340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBC8952DD9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20CC1F24AD8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 12:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A280146A6D;
	Thu, 15 Aug 2024 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JYFrX8HI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YtmPj9UG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8E1714AB;
	Thu, 15 Aug 2024 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723723551; cv=none; b=h5BGLUxOTEQ7grDr8P2om8E3vynuMStId7l8GnYkXK7DXpvD6Dctl7S0nn66RitlmuJBHqeht6jCPap2HLKpWgisa8fCN4b64aIycOeyfvHJ5SE4PEsdDqFvydLd0HiQHx/r6SSi37qo0bKgVLeBb9K2PiOo0eJskq2AEjwIQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723723551; c=relaxed/simple;
	bh=ckRq0TLO0i5Upq8xeQfXzcsTcs6KI/clF0rL95AkbYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEJuP8MQiboP1MMU/BX7jU1gKDeiVu5Iphmg5m3tlNb0ZAn9+yiuy5QuTZv41LW2brxZi7/0iGZS7PeDLmmP6omLoL1Fi8qwZVZbRD4F3g/t2wZxMRA347tykJiY+2G7HkRrRxrPkFtEYGgEZGUK0q6eBOcROXAC3GiGL9QPmbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JYFrX8HI; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YtmPj9UG reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723723548; x=1755259548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rpbg9sWZr+ct+0Kk2dlFNhgnP7os4HT3fguvZNyOGa4=;
  b=JYFrX8HI8B9bK8bt1XX0Bj/jArVFrWJ01DWKaQCPJiR3ULSpwDICYkXG
   mTlIrYUltTz8P4Zweh6LuXtDCLSLG07fBJEli0uKV3a2JeF3+hiSrEhzC
   LhlyQlpU+5qNxynKOqEYB4e9jVuYp3IGIXHJJ2ZIIAmcI5Tiu83v0rdJs
   URFuowbMshYDBJJ8UPobxJ+KNUgbsB0setd+IopNC9gzqhELepQqLimBl
   CAMqnDk1p3i9b+XppkJP2GU6bLem+OYqJBySbtomYA+9K7lmrmcX+hVDA
   vp+KO2A7Dpztcgu8DKGT8t7Zp5hpFOVdsKdrDN4l/1rM8knNRuTMlFpW1
   Q==;
X-CSE-ConnectionGUID: zgvx9BNzR5uo/wo0vaCS0A==
X-CSE-MsgGUID: j8EwgRkETb+qjhqlYwM++g==
X-IronPort-AV: E=Sophos;i="6.10,148,1719871200"; 
   d="scan'208";a="38423877"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Aug 2024 14:05:45 +0200
X-CheckPoint: {66BDEF19-8-78509F09-E532FC2E}
X-MAIL-CPID: 53426003EF02D311BE2F5EF2B27E137B_1
X-Control-Analysis: str=0001.0A782F1A.66BDEF19.010F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDB0A167BBC;
	Thu, 15 Aug 2024 14:05:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723723541;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rpbg9sWZr+ct+0Kk2dlFNhgnP7os4HT3fguvZNyOGa4=;
	b=YtmPj9UGUz4vEfUy/K3H1ZUXmHmkonosyvwz5S6itYvjCSS8KW7/5psOZ1Xahr2XfZMw33
	5PIittL9R6ftPh6NiwX096JRuDyWZ3qivtNwmETjRVLFUGzS9fV8E2HHnmZuDAIMKKerCa
	1s9Smt6Y7/P2xwxq+DF83SKQSzGrW+L7ksw60tgvxhTrcrmceppfW1wLA8WlaFkbfgiDc0
	SIrcpT74haPFMnvCNkjpsU0WFi3E3sJh2L1QYDVv695+zuC80wfS5EiiQjf7F8/NPz1YKc
	P3H9ASaUeMbtskUcVngrq5ozQNINsCuilHR56HT9J8WU7Hm18wRJz1vQbWS3LQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Thu, 15 Aug 2024 14:05:39 +0200
Message-ID: <13578505.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
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

thanks for the updated patch.

Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
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
> Changes since v3:
>=20
> - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> - Fix assigned-clock-rates
> - Dropping Tested-by as the clock configuration has changed
>=20
> Changes since v2:
>=20
> - Assign clock parent and frequency in blk-ctrl
>=20
> Changes since v1:
>=20
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 ++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index d9b5c40f6460..f3531cfb0d79 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
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
>  			dewarp: dwe@32e30000 {
>  				compatible =3D "nxp,imx8mp-dw100";
>  				reg =3D <0x32e30000 0x10000>;
> @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>  				clock-names =3D "apb", "axi", "cam1", "cam2",
>  					      "disp1", "disp2", "isp", "phy";
> =20
> +				/*
> +				 * The ISP maximum frequency is 400MHz in normal mode
> +				 * and 500MHz in overdrive mode. The 400MHz operating
> +				 * point hasn't been successfully tested yet, so set
> +				 * IMX8MP_CLK_MEDIA_ISP to 500MHz for the time being.
> +				 */
>  				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_AXI>,
>  						  <&clk IMX8MP_CLK_MEDIA_APB>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> +						  <&clk IMX8MP_CLK_MEDIA_ISP>,
>  						  <&clk IMX8MP_VIDEO_PLL1>;
>  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_SYS_PLL1_800M>,
>  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> -							 <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> +							 <&clk IMX8MP_SYS_PLL2_500M>;
>  				assigned-clock-rates =3D <500000000>, <200000000>,
> -						       <0>, <0>, <1039500000>;
> +						       <0>, <0>, <500000000>,
> +						       <1039500000>;

Unfortunately for some reason this reparenting doesn't work (on my platform=
).
'media_isp' is still below IMX8MP_CLK_24M.
$ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
    mipi_dsi_esc_rx                  0       0        0        24000000    =
0          0     50000      N      deviceless                      no_conne=
ction_id        =20
    media_isp                        0       0        0        24000000    =
0          0     50000      N      deviceless                      no_conne=
ction_id        =20
       media_isp_root_clk            0       0        0        24000000    =
0          0     50000      N         32e10000.isp                    isp

I have to add this diff for isp_0 (and isp_1 if you use it):
=2D-- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
                                clock-names =3D "isp", "aclk", "hclk";
                                power-domains =3D <&media_blk_ctrl IMX8MP_M=
EDIABLK_PD_ISP>;
                                fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
+                               assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_=
ISP>;
+                               assigned-clock-parents =3D <&clk IMX8MP_SYS=
_PLL2_500M>;
+                               assigned-clock-rates =3D <500000000>;
                                status =3D "disabled";
=20
                                ports {

Now clock is setup properly:
$ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
                sys_pll2_500m        3       3        0        500000000   =
0          0     50000      Y                  deviceless                  =
    no_connection_id        =20
                   media_isp         0       0        0        500000000   =
0          0     50000      N                     deviceless               =
       no_connection_id        =20
                      media_isp_root_clk 0       0        0        50000000=
0   0          0     50000      N                        32e10000.isp      =
              isp


Best regards,
Alexander

>  				#power-domain-cells =3D <1>;
> =20
>  				lvds_bridge: bridge@5c {
>=20
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



