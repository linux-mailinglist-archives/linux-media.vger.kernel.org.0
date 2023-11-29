Return-Path: <linux-media+bounces-1386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E287FE16D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 21:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 144081C20966
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 20:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538E961669;
	Wed, 29 Nov 2023 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/WStUCw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216FFD7F;
	Wed, 29 Nov 2023 12:55:46 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c6001ec920so183715a12.0;
        Wed, 29 Nov 2023 12:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701291345; x=1701896145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCNLz0W3pK8+rHCupmjeoATMH5+LWZm/5E4W9tL03+k=;
        b=C/WStUCwwqO9Ee2K612d0VAmXXoXeRugqDFzXoZAb7E/+ZlAeMZiaBAnqj8rBnhBA1
         wYDFrWaupuezuP+LUu2rfZp1Kg5dfcY/pfCeD3No0fuxAHmcsEHazEENw1jCKAIeppx6
         K9VO5+9XX6FnQ98ksRi2q5aYYkZC72pD38Ab2tsVY4PufTqxkPlMhScfmWrki/MGN2k7
         BuDfsW9Zp9z87vntvw0SCYIIa9j5k8asXs+w9giDLQnP1mPd4+yPH+P1kojS8listCFo
         FICHYMfzGmeFMZR98RmaCdfvL/KkZTFOw1k+69bS1fR62zd21/W03eQJhO+M47Smi0rp
         v6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701291345; x=1701896145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCNLz0W3pK8+rHCupmjeoATMH5+LWZm/5E4W9tL03+k=;
        b=kwal42AndhFSvMlq30CdTHqKmUsjHqPMEOVhb7VIO6u2yslyoCgHjjZH2mp6uahTLD
         Y/uWKt7BXQ/EzWnJAsXpTuwhkaTWA8nUMbWGrymaMfmYLDxvueY2CjRatvQG8yE8UKYs
         pYjr03mAY3oPEB/1lVkQxGwsohAUvFbahQp5fs70haDWJu/vEzUVA7IvBt/Mch4Rmw6/
         FZ02ydh6rxEXHcASpc1fMNQ4FigxElvZq04wue8XP68hCLt/jFiGw47fcB6mw/tZWihW
         k5hpuTBHrV8FtTESc5F2Cemc9Bb7wxYm7qBhRClBUZNCDH439p0FcPd4RDQFbn1dA1hS
         160A==
X-Gm-Message-State: AOJu0YwTvDVaVOkoNVmvLuY0iFiUfp2Oe23QskLDyDWwssZpfJtDm8i7
	svWOorQ6jtgNgGbqLhhbWb0qsddO0Bo467IpwBEQH7HL
X-Google-Smtp-Source: AGHT+IHjuy8gd7uCvMEQyWc8fS1XmEctPuEkHFgZFl3h6yQ8TGuA3ZxC60Doil+vbBAHeRMHD+pQ0DbIuGWzeSNNLZo=
X-Received: by 2002:a17:90b:8d6:b0:285:8aa4:2ed8 with SMTP id
 ds22-20020a17090b08d600b002858aa42ed8mr17574038pjb.15.1701291345189; Wed, 29
 Nov 2023 12:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417055627.16482-2-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com>
 <20231129105536.GE24293@pendragon.ideasonboard.com> <170128888298.3048548.2160913449516998097@ping.linuxembedded.co.uk>
In-Reply-To: <170128888298.3048548.2160913449516998097@ping.linuxembedded.co.uk>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 29 Nov 2023 14:55:33 -0600
Message-ID: <CAHCN7xK-DqY=gKT6LF0pkcsvM9Affpvnvmvgj0EozP9ONL5Bsw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, 
	Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 2:14=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Laurent Pinchart (2023-11-29 10:55:36)
> > Hi Adam,
> >
> > (CC'ing Kieran)
> >
> > On Tue, Nov 28, 2023 at 09:17:51PM -0600, Adam Ford wrote:
> > > On Mon, Apr 17, 2023 at 1:01=E2=80=AFAM Laurent Pinchart wrote:
> > > >
> > > > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > >
> > > Laurent,
> > >
> > > Sorry to dig up an old thread, but I have a concern about the clock
> > > ratings and nominal mode vs overdrive mode.  I started investigating
> > > the different data sheets amongst the various imx8m[mnp] families to
> > > make the default device trees run at nominal mode while also creating
> > > a separate dtsi file with settings for overdrive so boards who use it
> > > can include them without having to duplicate the clock settings for
> > > everyone who supports overdrive.
> > >
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++=
++++
> > > >  1 file changed, 60 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mp.dtsi
> > > > index 2dd60e3252f3..2a374a4c14a2 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> > > >                                 };
> > > >                         };
> > > >
> > > > +                       mipi_csi_0: csi@32e40000 {
> > > > +                               compatible =3D "fsl,imx8mp-mipi-csi=
2", "fsl,imx8mm-mipi-csi2";
> > > > +                               reg =3D <0x32e40000 0x10000>;
> > > > +                               interrupts =3D <GIC_SPI 17 IRQ_TYPE=
_LEVEL_HIGH>;
> > > > +                               clock-frequency =3D <500000000>;
> > > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_A=
PB_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_CAM=
1_PIX_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_MIP=
I_PHY1_REF_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI=
_ROOT>;
> > > > +                               clock-names =3D "pclk", "wrap", "ph=
y", "axi";
> > > > +                               assigned-clocks =3D <&clk IMX8MP_CL=
K_MEDIA_CAM1_PIX>;
> > > > +                               assigned-clock-parents =3D <&clk IM=
X8MP_SYS_PLL2_1000M>;
> > > > +                               assigned-clock-rates =3D <500000000=
>;
> > >
> > > According to Rev 2.1 of the Data sheet (IMX8MPCEC), dated July 2023,
> > > 500MHz is listed as single-camera, overdrive mode.  Single-camera,
> > > nominal mode is 400MHz, but there is more...
> > > If configured for dual cameras, both CSI can only support up to
> > > 266MHz, but we have partially configured both albeit without the
> > > actual camera sensors connected.
> > >
> > > > +                               power-domains =3D <&media_blk_ctrl =
IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > > > +                               status =3D "disabled";
> > > > +
> > > > +                               ports {
> > > > +                                       #address-cells =3D <1>;
> > > > +                                       #size-cells =3D <0>;
> > > > +
> > > > +                                       port@0 {
> > > > +                                               reg =3D <0>;
> > > > +                                       };
> > > > +
> > > > +                                       port@1 {
> > > > +                                               reg =3D <1>;
> > > > +                                       };
> > > > +                               };
> > > > +                       };
> > > > +
> > > > +                       mipi_csi_1: csi@32e50000 {
> > > > +                               compatible =3D "fsl,imx8mp-mipi-csi=
2", "fsl,imx8mm-mipi-csi2";
> > > > +                               reg =3D <0x32e50000 0x10000>;
> > > > +                               interrupts =3D <GIC_SPI 80 IRQ_TYPE=
_LEVEL_HIGH>;
> > > > +                               clock-frequency =3D <266000000>;
> > > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_A=
PB_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_CAM=
2_PIX_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_MIP=
I_PHY1_REF_ROOT>,
> > > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI=
_ROOT>;
> > > > +                               clock-names =3D "pclk", "wrap", "ph=
y", "axi";
> > > > +                               assigned-clocks =3D <&clk IMX8MP_CL=
K_MEDIA_CAM2_PIX>;
> > > > +                               assigned-clock-parents =3D <&clk IM=
X8MP_SYS_PLL2_1000M>;
> > > > +                               assigned-clock-rates =3D <266000000=
>;
> > >
> > > 266MHz is correct for dual camera, but in single camera, the second
> > > CSI is capable of 277MHz.
> > >
> > > At a minimum, I'd like to fix the overdrive frequency to nominal, but
> > > since we're plumbing in both cameras, I wonder if it would be better
> > > to run both at 266MHz with a note on CSI0 that states it could run at
> > > 400 or 500 if the second CSI is disabled and a note on the second CSI
> > > that it could run at 277 when the first one is disabled? What are you=
r
> > > thoughts?
> >
> > My thoughts is that this all should be selected at runtime, based on ho=
w
> > many cameras are used. That won't be trivial to do though :-S Kieran,
> > you've been working with two cameras, any opinion ?
>
> Well I've been seeing issues like dropped packets and various issues on
> the CSI2 receiver that could be because of badly configured clocks ...
> so there's definitely some things to check and validate here still.
>
> I don't know how the clocking would be adapted at runtime yet either ...
> but it might be something interesting to look at. It's likely more
> difficult as it's two separate nodes that would have to know about each
> other at some level.

Any objections if I slow them both to 266Mhz and add a note that
indicates what they're each capable of doing based on the datasheet?
This way, regardless of whether or not people have one or two cameras
it won't violate a spec.  Adding the note at least tells people they
have options to increase the clock speeds if they choose.

adam

>
> --
> Kieran
>
>
> >
> > > > +                               power-domains =3D <&media_blk_ctrl =
IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > > > +                               status =3D "disabled";
> > > > +
> > > > +                               ports {
> > > > +                                       #address-cells =3D <1>;
> > > > +                                       #size-cells =3D <0>;
> > > > +
> > > > +                                       port@0 {
> > > > +                                               reg =3D <0>;
> > > > +                                       };
> > > > +
> > > > +                                       port@1 {
> > > > +                                               reg =3D <1>;
> > > > +                                       };
> > > > +                               };
> > > > +                       };
> > > > +
> > > >                         pcie_phy: pcie-phy@32f00000 {
> > > >                                 compatible =3D "fsl,imx8mp-pcie-phy=
";
> > > >                                 reg =3D <0x32f00000 0x10000>;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

