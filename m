Return-Path: <linux-media+bounces-1385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7987FE0D8
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 21:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67424B211C3
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 20:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480CC60ECA;
	Wed, 29 Nov 2023 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TZ021HKV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D5A131;
	Wed, 29 Nov 2023 12:14:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9735B6F0;
	Wed, 29 Nov 2023 21:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701288849;
	bh=uJx2WyhfAxcEwQ+ee41/z9G2InAvJw4jSMa05qDKaAs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TZ021HKV3henHtehwczYCqsqTxFs1KZRgdIoYtxe64lWfIZh/UwEa3vOWl/1G2spW
	 yt1cy9gKg0as1rKOs5K869+XC4R3yks5V5eFYbFChameoMDnTeJdPvZznKhFGdixRB
	 rTXms0JuWC3kud3Yr5Am3954wtVSGcxSIShacVnw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231129105536.GE24293@pendragon.ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com> <20230417055627.16482-2-laurent.pinchart@ideasonboard.com> <CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com> <20231129105536.GE24293@pendragon.ideasonboard.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To: Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 29 Nov 2023 20:14:42 +0000
Message-ID: <170128888298.3048548.2160913449516998097@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2023-11-29 10:55:36)
> Hi Adam,
>=20
> (CC'ing Kieran)
>=20
> On Tue, Nov 28, 2023 at 09:17:51PM -0600, Adam Ford wrote:
> > On Mon, Apr 17, 2023 at 1:01=E2=80=AFAM Laurent Pinchart wrote:
> > >
> > > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> >=20
> > Laurent,
> >=20
> > Sorry to dig up an old thread, but I have a concern about the clock
> > ratings and nominal mode vs overdrive mode.  I started investigating
> > the different data sheets amongst the various imx8m[mnp] families to
> > make the default device trees run at nominal mode while also creating
> > a separate dtsi file with settings for overdrive so boards who use it
> > can include them without having to duplicate the clock settings for
> > everyone who supports overdrive.
> >=20
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++++=
++
> > >  1 file changed, 60 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 2dd60e3252f3..2a374a4c14a2 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> > >                                 };
> > >                         };
> > >
> > > +                       mipi_csi_0: csi@32e40000 {
> > > +                               compatible =3D "fsl,imx8mp-mipi-csi2"=
, "fsl,imx8mm-mipi-csi2";
> > > +                               reg =3D <0x32e40000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 17 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clock-frequency =3D <500000000>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_APB=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_CAM1_=
PIX_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_=
PHY1_REF_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>;
> > > +                               clock-names =3D "pclk", "wrap", "phy"=
, "axi";
> > > +                               assigned-clocks =3D <&clk IMX8MP_CLK_=
MEDIA_CAM1_PIX>;
> > > +                               assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_1000M>;
> > > +                               assigned-clock-rates =3D <500000000>;
> >=20
> > According to Rev 2.1 of the Data sheet (IMX8MPCEC), dated July 2023,
> > 500MHz is listed as single-camera, overdrive mode.  Single-camera,
> > nominal mode is 400MHz, but there is more...
> > If configured for dual cameras, both CSI can only support up to
> > 266MHz, but we have partially configured both albeit without the
> > actual camera sensors connected.
> >=20
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@0 {
> > > +                                               reg =3D <0>;
> > > +                                       };
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > > +                       mipi_csi_1: csi@32e50000 {
> > > +                               compatible =3D "fsl,imx8mp-mipi-csi2"=
, "fsl,imx8mm-mipi-csi2";
> > > +                               reg =3D <0x32e50000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 80 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clock-frequency =3D <266000000>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_APB=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_CAM2_=
PIX_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_=
PHY1_REF_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>;
> > > +                               clock-names =3D "pclk", "wrap", "phy"=
, "axi";
> > > +                               assigned-clocks =3D <&clk IMX8MP_CLK_=
MEDIA_CAM2_PIX>;
> > > +                               assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_1000M>;
> > > +                               assigned-clock-rates =3D <266000000>;
> >=20
> > 266MHz is correct for dual camera, but in single camera, the second
> > CSI is capable of 277MHz.
> >=20
> > At a minimum, I'd like to fix the overdrive frequency to nominal, but
> > since we're plumbing in both cameras, I wonder if it would be better
> > to run both at 266MHz with a note on CSI0 that states it could run at
> > 400 or 500 if the second CSI is disabled and a note on the second CSI
> > that it could run at 277 when the first one is disabled? What are your
> > thoughts?
>=20
> My thoughts is that this all should be selected at runtime, based on how
> many cameras are used. That won't be trivial to do though :-S Kieran,
> you've been working with two cameras, any opinion ?

Well I've been seeing issues like dropped packets and various issues on
the CSI2 receiver that could be because of badly configured clocks ...
so there's definitely some things to check and validate here still.

I don't know how the clocking would be adapted at runtime yet either ...
but it might be something interesting to look at. It's likely more
difficult as it's two separate nodes that would have to know about each
other at some level.

--
Kieran


>=20
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@0 {
> > > +                                               reg =3D <0>;
> > > +                                       };
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > >                         pcie_phy: pcie-phy@32f00000 {
> > >                                 compatible =3D "fsl,imx8mp-pcie-phy";
> > >                                 reg =3D <0x32f00000 0x10000>;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

