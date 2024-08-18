Return-Path: <linux-media+bounces-16426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80157955EA6
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 21:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1993CB20AC7
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E94B14EC44;
	Sun, 18 Aug 2024 19:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBghhA6w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB7D51C;
	Sun, 18 Aug 2024 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724008648; cv=none; b=dweEE2kLYrLY+ZxHWfFuox+126SgUV8/iTTbpcpXhHLhAjyMBcMIsqn5rhwfwNxHbpVFjolYmhhTxOJ7u/tZwm9dbxH+w2BXt9kIx+bo/NBjhhDDrcQ3DF/HVbUVNiTs2XChUE7BNoXl5giB9vPr8Tha8RH7cVMIkSBxvuHy20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724008648; c=relaxed/simple;
	bh=/ZYG8t+3hi5zuFYN6jVlAC9keLvLYY6R0ZctQySQtgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYkWJFD+7h0ETExgPOFYbU4rAE9ctz+yBgPCsvV4On+/AadQw0C0oyrrXkLdCX19p/RKF56AVbMRWe9IItVngB0zs82AiTX9bmJXtjpLvG6GV/p+s7qXprMuUfpmiq0W/LuhKdx5B4ahHhqZ9VLeFq85tXHPtvcwYk0M/w8AVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBghhA6w; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7b8884631c4so1424657a12.2;
        Sun, 18 Aug 2024 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724008646; x=1724613446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx+Zq4vdIq9k1ggzqz9SNl8byZkyOrOwHc6OFT3XW+8=;
        b=VBghhA6wJaon5jAktjs7c/baanS1kGUnO2ALzmaX1RxpAc74talR9g7ME+ZU8JAIFm
         vl6zyoSM4K6WUqzfEEq8mEE+Vb+STnCzkIwUpK04HyH3yr8G/J/NihTRNDJP9Z86Yrkz
         b+D1eYg1vgHGytkRJcnEN2B/gBbsfHT8GTPSstn/dZ7Ig4EHfXRdeB46proBGiF4k56T
         n9kIjrIYmOdro3CJTlx6tOdwdgEJvbsIvSJhAuKUUiAtPcBi/acuGYvKd4YJFpK7MPVx
         SZGpwooP0cTiEnvbI+Bc6IwEA+Z/SwEO3punuN+rH8Ff3kWeUq5xY6KHcEG0Prx/bDHD
         kuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724008646; x=1724613446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx+Zq4vdIq9k1ggzqz9SNl8byZkyOrOwHc6OFT3XW+8=;
        b=fKMh7WRtQbMgY0PI0+GLRPI9WltRHR09XvVNceypeuGqxvnm6F9x1inLR/tYKA8M7G
         wK4xdhsHaCM9X9IBnBpiEsaYb5IFcw7NH60epyOQzuLq5H7RfhVW8ETmuc7cCWSCZql2
         yLsNa++057zqAuxJ8og43QUG3Fz95oVRJtGsmp92No+ohpKWT53+sk2jiYQeICzZ7sh7
         KlJfnYtBLu1eGw7+b8c8xtU+OE5qLN7mPRsGKaUrlXGiwPhKibYecX24vjIeBTRpfs6o
         kJUTu0bgoMzz8HW3XZKhsFCCcLRcwGyKCA8Gh0BT1/IV0kO5eZpz8k1PgNXnhE96gjo3
         QSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVyLzbZN/pTyGQN+HRAi3b1VqjSYHfcAfLO1SzRD8e4r3aDpt2cqYyczkfUigGO/RH+25tozrCTOaRx@vger.kernel.org, AJvYcCWVEUdMuulueDhrzEU7w7A7XVCSRwtDrEQUJFsZQkP11w0x0EIFOjYGHG4orsNWydW8cUH0XpqBnGrGmpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4Sh0lyxcidt55YVX2kQTwpRsAnZ2VzV60S1wDV+4TthKSJqb
	iMbFvfhTFZJKHJaOPdQZDAc0w/0MsUFYeiDUEdwkiY3YbUPvMh3eIu3Bnq2mjLqTyV3PlGsb5Xl
	cA9sf1TVOrg2XNW60m+AtmxweXUE=
X-Google-Smtp-Source: AGHT+IH8WepLSlH2NluePgXdNT6MiLUadEguZpClD0fmOW02SP4032jbu+wR8bEzJSMxjARp2HuF0+gK/X7067xVhoo=
X-Received: by 2002:a17:90a:d703:b0:2d3:b821:ba78 with SMTP id
 98e67ed59e1d1-2d3dfc79dfdmr10372924a91.22.1724008646482; Sun, 18 Aug 2024
 12:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com> <20240818190703.GA1148@pendragon.ideasonboard.com>
In-Reply-To: <20240818190703.GA1148@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 18 Aug 2024 14:17:15 -0500
Message-ID: <CAHCN7x+Xrg969j20jANdB6c3Xz5UV22=hNunfoBi_HmSGDAAwg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 2:07=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Aug 18, 2024 at 01:24:01PM -0500, Adam Ford wrote:
> > On Tue, Aug 13, 2024 at 6:40=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > >
> > > The ISP supports both CSI and parallel interfaces, where port 0
> > > corresponds to the former and port 1 corresponds to the latter. Since
> > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > receiver, set them both to port 1.
> > >
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> > > ---
> > > Changes since v2:
> > >
> > > - Assign clock parent and frequency in blk-ctrl
> > >
> > > Changes since v1:
> > >
> > > - Fix clock ordering
> > > - Add #address-cells and #size-cells to ports nodes
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 +++++++++++++++++++++=
+-
> > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index d9b5c40f6460..09f1e27ee220 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > >                                 };
> > >                         };
> > >
> > > +                       isp_0: isp@32e10000 {
> > > +                               compatible =3D "fsl,imx8mp-isp";
> > > +                               reg =3D <0x32e10000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 74 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > +                               clock-names =3D "isp", "aclk", "hclk"=
;
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > +                               fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > > +                       isp_1: isp@32e20000 {
> > > +                               compatible =3D "fsl,imx8mp-isp";
> > > +                               reg =3D <0x32e20000 0x10000>;
> > > +                               interrupts =3D <GIC_SPI 75 IRQ_TYPE_L=
EVEL_HIGH>;
> > > +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP=
_ROOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_R=
OOT>,
> > > +                                        <&clk IMX8MP_CLK_MEDIA_APB_R=
OOT>;
> > > +                               clock-names =3D "isp", "aclk", "hclk"=
;
> > > +                               power-domains =3D <&media_blk_ctrl IM=
X8MP_MEDIABLK_PD_ISP>;
> > > +                               fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> > > +                               status =3D "disabled";
> > > +
> > > +                               ports {
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +
> > > +                                       port@1 {
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > >                         dewarp: dwe@32e30000 {
> > >                                 compatible =3D "nxp,imx8mp-dw100";
> > >                                 reg =3D <0x32e30000 0x10000>;
> > > @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_APB>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP1_PIX>,
> > >                                                   <&clk IMX8MP_CLK_ME=
DIA_DISP2_PIX>,
> > > +                                                 <&clk IMX8MP_CLK_ME=
DIA_ISP>,
> > >                                                   <&clk IMX8MP_VIDEO_=
PLL1>;
> > >                                 assigned-clock-parents =3D <&clk IMX8=
MP_SYS_PLL2_1000M>,
> > >                                                          <&clk IMX8MP=
_SYS_PLL1_800M>,
> > >                                                          <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > -                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>;
> > > +                                                        <&clk IMX8MP=
_VIDEO_PLL1_OUT>,
> > > +                                                        <&clk IMX8MP=
_SYS_PLL2_500M>;
> > >                                 assigned-clock-rates =3D <500000000>,=
 <200000000>,
> > > -                                                      <0>, <0>, <103=
9500000>;
> > > +                                                      <0>, <0>, <0>,=
 <500000000>,
> >
> > Is the insertion of the extra <0> here correct?  You inserted one
> > clock above for IMX8MP_CLK_MEDIA_ISP, but it appears you inserted two
> > here.
> > I think this might break the IMX8MP_VIDEO_PLL1 rate and not set the
> > IMX8MP_CLK_MEDIA_ISP as expected.
> >
> > Am I missing something?
>
> You're missing v4 :-)

Sorry.  I was traveling in Europe, so I was going through the backlog
in the order they arrived.  :-)

adam

>
> > > +                                                      <1039500000>;
> > >                                 #power-domain-cells =3D <1>;
> > >
> > >                                 lvds_bridge: bridge@5c {
> > >
> > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>
> --
> Regards,
>
> Laurent Pinchart

