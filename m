Return-Path: <linux-media+bounces-7816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E888BB01
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 08:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 754001F32131
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 07:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0081F130498;
	Tue, 26 Mar 2024 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="mfpSFtL7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QGOFVlBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B21272BB;
	Tue, 26 Mar 2024 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711437259; cv=none; b=UiPB8PKEioIPv2FKFWsp9Obch5etjGAfOKNULQuqI+4zKX6msv6xzJbJ/s0xqs1QDOEiBieS4ZXSr/5qih/Ic6aFirnbBij5x7dSVbfRyIEp5gmIRVTo3ctjNslQmaz9D+5pDrKLqc3p7S7LyVIa0MCNciPOxjGdAGG1pksVkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711437259; c=relaxed/simple;
	bh=R/PF6zodIjJNrkWgq/pzQEcDa7T/S8aNQeuBGFJxGLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjfW1b9f722Wng6AlAFWQmWobYikjVGAkhTPU1OG/kzorIvDbLmpGmlLxzG6Fv4s9qSPJNaQ0uTYmL0c0TtTvULOmWpnE75XSfAqFVf049VYEc8IZWg7AL7fe/E9Iw4HSQUxl5UQPrnoDKsCwP1JmpNEGwttYK9K9YIKqixvtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=mfpSFtL7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QGOFVlBM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1711437256; x=1742973256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00WgOmyzkRllaoUEEu1uoP3kJXxqshi5oJasmpbz0Ts=;
  b=mfpSFtL7Osfx8ILSOCUR+Ah0mCgp/2aTKMEbohdLC6z2VCvQYu6afoUV
   M+mAjpIS65z1ru+NZ0GhZ7QI0f3bzMy4UnVNZj10vwwtZfdKs3Q+OS9Ic
   BVc1+LUPrboTR8vSpKfN4L1mCV+rFiRMXy3ocM0shOlgYRTCFVZQAh4PE
   sxsbj2O6pfJoeiEEd4m5hdWmlO/5cvDlprGjaIczNR0f3qXW+GitbYCjB
   b8kyLV3styzHAbW+AnsXzTQDfzpYe6nvPFnwbq1t0NvXfH5HHe/5R8F09
   qCZuYfHR1zd3dTYhBPivDvJEjVSx+eNP2fnIEsZIn7bn+nc9NuCDc+2H/
   g==;
X-IronPort-AV: E=Sophos;i="6.07,155,1708383600"; 
   d="scan'208";a="36094014"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Mar 2024 08:14:12 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D4F716EDC7;
	Tue, 26 Mar 2024 08:14:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1711437248;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=00WgOmyzkRllaoUEEu1uoP3kJXxqshi5oJasmpbz0Ts=;
	b=QGOFVlBMdZoRZjKwDMSLJZIEbnb9InlFc4QS7xXIRFSfRqN2aMkk4QDZ5brjVC4d9QU+iR
	tu3C8x+13iQqTrv/MIfOysn7fRaEetW8+YEi8T6CInel22Ol7DAJcI/N835Q94Lx6z7Vj7
	MQS1Vxm/iDP2OWZF11pl2KOYBnk5YBHw+0pcj/usj64sn7ooM9lRlx0Sbq2sS6AU39+z5t
	FdmCiKAFE5MFyBiN8/wiV+ANaWMa8b3fuHALyoneIkDytV/ePnwpuaSCMqBCRbmwAvKApv
	BrfdTqRumIdBxo4u1VlCv/cV7Ab8UQi/vHCFD63qNNjUv7B6uGTrzAkHeTz1xQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Paul Elder <paul.elder@ideasonboard.com>, Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Tue, 26 Mar 2024 08:14:13 +0100
Message-ID: <2929432.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240325204924.GY18799@pendragon.ideasonboard.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com> <4879631.GXAFRqVoOG@steina-w> <20240325204924.GY18799@pendragon.ideasonboard.com>
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

Am Montag, 25. M=E4rz 2024, 21:49:24 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Mon, Mar 25, 2024 at 04:52:21PM +0100, Alexander Stein wrote:
> > Am Montag, 25. M=E4rz 2024, 16:13:39 CET schrieb Laurent Pinchart:
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
> > > Changes since v1:
> > >=20
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++=
++
> > >  1 file changed, 50 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index bfc5c81a5bd4..1d2670b91b53 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
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
> > > +				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP>;
> > > +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> > > +				assigned-clock-rates =3D <500000000>;
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
> > > +				assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP>;
> > > +				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> > > +				assigned-clock-rates =3D <500000000>;
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
> >=20
> > The patch itself is okay. But you might not be able to
> > configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled befor=
e.
> > This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_ispdwp'
> > power domain. Reparenting is not possible anymore in this case.
>=20
> Good point.=20
>=20
> > Something like
> > ---8<---
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> >                                                   <&clk IMX8MP_CLK_MEDI=
A_APB>,
> >                                                   <&clk IMX8MP_CLK_MEDI=
A_DISP1_PIX>,
> >                                                   <&clk IMX8MP_CLK_MEDI=
A_DISP2_PIX>,
> > +                                                 <&clk IMX8MP_CLK_MEDI=
A_ISP>,
> >                                                   <&clk IMX8MP_VIDEO_PL=
L1>;
> >                                 assigned-clock-parents =3D <&clk IMX8MP=
_SYS_PLL2_1000M>,
> >                                                          <&clk IMX8MP_S=
YS_PLL1_800M>,
> >                                                          <&clk IMX8MP_V=
IDEO_PLL1_OUT>,
> > -                                                        <&clk IMX8MP_V=
IDEO_PLL1_OUT>;
> > +                                                        <&clk IMX8MP_V=
IDEO_PLL1_OUT>,
> > +                                                        <&clk IMX8MP_S=
YS_PLL2_500M>;
> >                                 assigned-clock-rates =3D <500000000>, <=
200000000>,
> >                                                        <0>, <0>, <10395=
00000>;
>=20
> With an assigned clock rate here too then ?

You are right. This posted diff is what I was using for a while now though.
Apparently the clock frequency was still correct.

Best regards,
Alexander

> >                                 #power-domain-cells =3D <1>;
> > ---8<---
> > is needed.
>=20
> Sascha, are you OK with this approach ?
>=20
> > >  			dewarp: dwe@32e30000 {
> > >  				compatible =3D "nxp,imx8mp-dw100";
> > >  				reg =3D <0x32e30000 0x10000>;
> > >=20
> > > base-commit: 4cece764965020c22cff7665b18a012006359095
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



