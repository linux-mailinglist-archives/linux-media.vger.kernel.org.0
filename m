Return-Path: <linux-media+bounces-16462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E695956754
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16287282903
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 09:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C381D15D5B8;
	Mon, 19 Aug 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gjKz1Y87";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mM/hx4w/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500514A605;
	Mon, 19 Aug 2024 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724060607; cv=none; b=k8zSfrRvq9e8/RJQ4nEVCCDjfZnj3tVBkgKRCkS0oummJzrcMku+MSaNE307wFkJvLygvtF4bfLugFWcPRtn0Fygy9xxO+s1Uh4kEp/Cv+e0Ny/luBhPoVRZrg+t8f1r6iT5jxlkilaW/riko8jsaL/2xc7PAG7mkjwSAaRePCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724060607; c=relaxed/simple;
	bh=NuALwXLlNACH10f9q7aUKSvhkhlZvwj/eQ08rQrF0nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0R1bmfypAV2pG+NcIMG/GxM/Cn8d3Bx6Ygzyqh5/bIOdgQDg88WkkXUfAg/c40U9x6dRwx2H+0Wtw+OWOy2MpXGrYlDCJfZWuybsIrzc3jwM1crS9Jv15VYz5LEQAraoHeRfsEojpJqmsLukNPQdy/T4ptQFWMAxVAP8xmACQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gjKz1Y87; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mM/hx4w/ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724060604; x=1755596604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U1TkSphNSMxHD50Xsko/faoS7VqgPaYacMBOlxn4LoU=;
  b=gjKz1Y87ziS3rk7LXG5eXYOTNYlv4VjyzKm1en9KrEbqbIJo2cbOFkpp
   zmFqOYhhsuMquM5mQqt6ibGL8LbJpdhqLBdRJvlDAtLetntmYekJGE4DC
   354pK+ZwDnC8S/v5N1cGt36tcLhJtr4CsoSkgiBoQZm2bW+T4yErWPPfY
   Nzq5ayje7sTwQFMLwi5G6hFPSnzufp3NwOvB/Dm8YAixPBDQOXiH4pIJP
   JDEX206nsz2JJVROpcHchZaC4dhXbATvlNkNwkqqX5GISggytovI300BO
   lDzYJ5QMTTJOVqE3x8AJCRtffvhpx9Uq03KDJioQv/XkkKBP67n1MotKX
   g==;
X-CSE-ConnectionGUID: tvWOwWTcQnqMHmoHS8qSww==
X-CSE-MsgGUID: Ln+xExcaRKqzaCI87k2+NA==
X-IronPort-AV: E=Sophos;i="6.10,158,1719871200"; 
   d="scan'208";a="38463626"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2024 11:42:11 +0200
X-CheckPoint: {66C31373-34-45EF2B36-F6E28480}
X-MAIL-CPID: 79A054C457F1C023EE635B3C6EFBB172_0
X-Control-Analysis: str=0001.0A782F21.66C31373.0156,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27474166864;
	Mon, 19 Aug 2024 11:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724060527;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U1TkSphNSMxHD50Xsko/faoS7VqgPaYacMBOlxn4LoU=;
	b=mM/hx4w/Ss+K1azF1RpUUSF1uJGn+6ihKSN2MiJVwRB2/zvHpOpkKqY0Luhzoo2nIYo9Ry
	ogm0bc6CwOUuRWwG23V4cOfbPDPzI758uzJbDuaIF2OTcWFS2YFwbk2bfEnACFwOGvsM+2
	YmvEwoFTM4SgYDKumtqOaMgaGBL4MtHgIpt6aJyb7xhnC9/OtFYPSOwsTKvULt1a3LT47u
	sdP/r6H4BckcH+WwHoXi63RptMMJnGnO3wpPKe4NNaePveP3Z6Ff2bMbnjXbZSxA8utqQi
	P/f/4P3K6bHQmDrTv1vvmVU/zw3DLaduVvmKkIQppLmXjm9ZKHsIXB3xAlWHxQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Paul Elder <paul.elder@ideasonboard.com>, Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Mon, 19 Aug 2024 11:42:04 +0200
Message-ID: <6077383.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240817182546.GC29320@pendragon.ideasonboard.com>
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com> <13578505.uLZWGnKmhe@steina-w> <20240817182546.GC29320@pendragon.ideasonboard.com>
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

Am Samstag, 17. August 2024, 20:25:46 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Thu, Aug 15, 2024 at 02:05:39PM +0200, Alexander Stein wrote:
> > Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >=20
> > > The ISP supports both CSI and parallel interfaces, where port 0
> > > corresponds to the former and port 1 corresponds to the latter. Since
> > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > receiver, set them both to port 1.
> > >=20
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v3:
> > >=20
> > > - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> > > - Fix assigned-clock-rates
> > > - Dropping Tested-by as the clock configuration has changed
> > >=20
> > > Changes since v2:
> > >=20
> > > - Assign clock parent and frequency in blk-ctrl
> > >=20
> > > Changes since v1:
> > >=20
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 +++++++++++++++++++++=
+-
> > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index d9b5c40f6460..f3531cfb0d79 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > >  				};
> > >  			};
> > > =20
> > > +			isp_0: isp@32e10000 {
> > > +				compatible =3D "fsl,imx8mp-isp";
> > > +				reg =3D <0x32e10000 0x10000>;
> > > +				interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > +				clock-names =3D "isp", "aclk", "hclk";
> > > +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > +				fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > +				status =3D "disabled";
> > > +
> > > +				ports {
> > > +					#address-cells =3D <1>;
> > > +					#size-cells =3D <0>;
> > > +
> > > +					port@1 {
> > > +						reg =3D <1>;
> > > +					};
> > > +				};
> > > +			};
> > > +
> > > +			isp_1: isp@32e20000 {
> > > +				compatible =3D "fsl,imx8mp-isp";
> > > +				reg =3D <0x32e20000 0x10000>;
> > > +				interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > +				clock-names =3D "isp", "aclk", "hclk";
> > > +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > +				fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > +				status =3D "disabled";
> > > +
> > > +				ports {
> > > +					#address-cells =3D <1>;
> > > +					#size-cells =3D <0>;
> > > +
> > > +					port@1 {
> > > +						reg =3D <1>;
> > > +					};
> > > +				};
> > > +			};
> > > +
> > >  			dewarp: dwe@32e30000 {
> > >  				compatible =3D "nxp,imx8mp-dw100";
> > >  				reg =3D <0x32e30000 0x10000>;
> > > @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >  				clock-names =3D "apb", "axi", "cam1", "cam2",
> > >  					      "disp1", "disp2", "isp", "phy";
> > > =20
> > > +				/*
> > > +				 * The ISP maximum frequency is 400MHz in normal mode
> > > +				 * and 500MHz in overdrive mode. The 400MHz operating
> > > +				 * point hasn't been successfully tested yet, so set
> > > +				 * IMX8MP_CLK_MEDIA_ISP to 500MHz for the time being.
> > > +				 */
> > >  				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_AXI>,
> > >  						  <&clk IMX8MP_CLK_MEDIA_APB>,
> > >  						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> > >  						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> > > +						  <&clk IMX8MP_CLK_MEDIA_ISP>,
> > >  						  <&clk IMX8MP_VIDEO_PLL1>;
> > >  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> > >  							 <&clk IMX8MP_SYS_PLL1_800M>,
> > >  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > -							 <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > > +							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > +							 <&clk IMX8MP_SYS_PLL2_500M>;
> > >  				assigned-clock-rates =3D <500000000>, <200000000>,
> > > -						       <0>, <0>, <1039500000>;
> > > +						       <0>, <0>, <500000000>,
> > > +						       <1039500000>;
> >=20
> > Unfortunately for some reason this reparenting doesn't work (on my plat=
form).
> > 'media_isp' is still below IMX8MP_CLK_24M.
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >     mipi_dsi_esc_rx                  0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id        =20
> >     media_isp                        0       0        0        24000000=
    0          0     50000      N      deviceless                      no_c=
onnection_id        =20
> >        media_isp_root_clk            0       0        0        24000000=
    0          0     50000      N         32e10000.isp                    i=
sp
>=20
> Hmmm... I get
>=20
>                 sys_pll2_500m        3       3        0        500000000 =
  0          0     50000      Y                  deviceless                =
      no_connection_id
>                    media_isp         0       0        0        500000000 =
  0          0     50000      N                     deviceless             =
         no_connection_id
>                       media_isp_root_clk 0       0        0        500000=
000   0          0     50000      N                        32e10000.isp    =
                isp
>=20
> > I have to add this diff for isp_0 (and isp_1 if you use it):
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
> >                                 clock-names =3D "isp", "aclk", "hclk";
> >                                 power-domains =3D <&media_blk_ctrl IMX8=
MP_MEDIABLK_PD_ISP>;
> >                                 fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > +                               assigned-clocks =3D <&clk IMX8MP_CLK_ME=
DIA_ISP>;
> > +                               assigned-clock-parents =3D <&clk IMX8MP=
_SYS_PLL2_500M>;
> > +                               assigned-clock-rates =3D <500000000>;
> >                                 status =3D "disabled";
> > =20
> >                                 ports {
> >=20
> > Now clock is setup properly:
> > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> >                 sys_pll2_500m        3       3        0        50000000=
0   0          0     50000      Y                  deviceless              =
        no_connection_id        =20
> >                    media_isp         0       0        0        50000000=
0   0          0     50000      N                     deviceless           =
           no_connection_id        =20
> >                       media_isp_root_clk 0       0        0        5000=
00000   0          0     50000      N                        32e10000.isp  =
                  isp
>=20
> I'm not sure why that's the case, I don't have assigned-clock*
> properties in the ISP nodes in my device tree and things still work
> properly. Would you be able to investigate ?

I had a local board-specific overwrite in place for node 'media_blk_ctrl'
I forgot about... So this patch does what it is supposed to do:

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



