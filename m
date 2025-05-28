Return-Path: <linux-media+bounces-33531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44294AC6C37
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A0F1C00487
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62B928C2B5;
	Wed, 28 May 2025 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRWJecfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5A28BA86;
	Wed, 28 May 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443650; cv=none; b=Mp2GSfG/RFkczWSdeFw+Rt7r9KF1iWF6sSsTtSBbt+TWBfOhymQmbDthLCDzsVDnDtbcfXrAMjx67Z0pnnrNDGudYmzYhBbeCwN6q/ZYSyCN4SDU84zQOsCj5zBAKTxIh3JX0UP2UhGIH3q6NO9G5seXjbuSxV1m1Gf65sHKdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443650; c=relaxed/simple;
	bh=QVusH8ytRFHR18qIeA5nN1QKmrPz1Ltl6HMFW3sfcwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkxUX43hOXzY245A9UyuIqWCS76acINSYdhn1b99jCsak14Ht8Dp+90CfrTwsuAOkY29a6/jrToFpSh7jNlRp4pR2jgInoAVDhYGE5+k4QNdMUQekpEKCSeKnzvGvWnRhjvtYGfdqoD6M5sH04C5jSfQG49o157MkQ8uSWxJd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRWJecfb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1551947a12.3;
        Wed, 28 May 2025 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748443648; x=1749048448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=TRWJecfbYd0AHt/YA12UK44Aapl8RgHFBBb3rV1YDdWZk6Om1bXoHg40Rlkez6SExf
         0Gtk3GbnR2GVCch3rfqu4WA00CQa04nA78LUHJyGo/g7qkh5mCifXKsVJHNNAECXzRnp
         DEtXZz63KfopmcVT6aFKDa/KL3jAESS6Ghla215BPBr3FPOX9Oek4fzT0OdyhNbazRhz
         QYboeLpbT07qAbZNfYpXq5EP5obHXw3GWE76MqL/xL3QyrQCFqqU3N3rWMOECrPBkXV2
         IHpJ9hJbVf5RkkpTxua0lMxi0m78/4pBQXlpxFWb+Nowll9peyDwr5r1YDJzahG3mLxz
         9QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443648; x=1749048448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=uctRh/ge9l807Onh0VAg56i5TFSjoElW+4j4aFgOsYi/1Ws7jfomscmdzJDYXMWxPk
         P/DwkUk7MEDIqw4sMdOgRfRJkAiKIe6NT7zF3+sbHKWnSfDNFUkX8m5kvpbTIhjU+gXR
         36olv6xH1+zRYA9DttTeqdSiAYQYZFlz3kfQxdNbgyowQQlYMlbz7AFQkqklyxrYGOyv
         85RszpK2Ryh0S3pJA9lFDiuGgR6I9ZS4ljMjB4wEJt9hoNTGoBlv7bBlxoYFjRA3YOmB
         t7bE89zefwWb3mhpBZlKdJfjiVnHPiJdYOl6V73rUGn4rA5hn3GJ58i+fwjsQNEV6XQe
         ryzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+1oQbXSXOQ+GPq+hdFcX/lq9n5i8F+2TMjELSVNJEPUhw/oUplTDZLLHSseORhx1lp47ek8GT553H@vger.kernel.org, AJvYcCUZwIfpW0lpO77dDZySzVnsqhJshRIPInPscQrfQ3QuFFCfEoPAAgZfGc4BxbWSTnUy769JzMM77V9ugVA=@vger.kernel.org, AJvYcCXB+BV9CCLsQl7MBGoxsaCG5ZGvWA4JKJzAEy0rzh+VtLRtTWGjxIGNMrZ8fj63K7lVPow69tZ4Ojs9Wh9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zyp2Txt+B2XNIy2/jR/hjR0vK7+8bl/unPx1cvEWibavKCVh
	EsvWWDIRdNGAZaq/bOvDpFlaY7lWxAICjlwCQEzeS4a6bBNxQBDIbf7Orn6cUyUmJm+/1I2cdeX
	HQPFTZLmMhX1W0Lq+YpXpoO/BwiHZFtkCu9IgoH8=
X-Gm-Gg: ASbGncuNiMzZZv0jRxZFZtuDbaG677HDMx2FHfWa9BEcFWkSZ+xKDLdkOH0wZUG/BBP
	tK8UiRFLSqAhOVdX1Thgd+S/0Scjmjf5Ix2+22yptt9yjHyZoqfprGMWTgSHIFh2hkhGfP2e9L4
	T8m4bfrqzb+eTbMQ4JMeFB/09Usle6OYVY
X-Google-Smtp-Source: AGHT+IHQJXU3p+rSsWqzxaLHSULaSjkoRZugP1vvKeH7LmxHkr7nUsvjweRVqC9eZYhDskDFMsLev7oBi7HQV+tKXmM=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr4555012a91.21.1748443647809; Wed, 28 May 2025
 07:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de> <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
 <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
In-Reply-To: <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 28 May 2025 09:47:14 -0500
X-Gm-Features: AX0GCFs7evzjkWRmfqngQQTZHj2yQaZWL0ja3DzZVNAah62H09qmX0qG_o41Jko
Message-ID: <CAHCN7xJJz2cOHBbyT0mr3QTndiB4Z6_Gtgy4k2giJt5qg4fH6A@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 9:14=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le mardi 27 mai 2025 =C3=A0 22:05 -0500, Adam Ford a =C3=A9crit :
> > On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 25-05-02, Adam Ford wrote:
> > > > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@peng=
utronix.de> wrote:
> > > > >
> > > > > The VPU_PLL clock must be set before the VPU_BUS clock which is d=
erived
> > > > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 6=
00MHz.
> >
> > I did verify the current clock rate ends up at 300MHz instead of the
> > desired 600 or 800MHz, so we should do something.
> >
>
> This reminded me of:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20250217-b4-hantr=
o-av1-clock-rate-v2-1-e179fad52641@collabora.com/
>
> Which also made me discover that this patch wasn't picked despite being m=
ark accepted. We
> will favour DT clock settings from here, since its not really managable o=
therwise, old board
> will stay like this, otherwise we face backward compatibility issues.
>
> Note that G2 and VC8K can be run at higher rate, but to be stable, you ne=
ed
> to also control voltage and proper cooling, not something we want "by def=
ault".

From what I can tell, imx8m_vpu_hw.c doesn't actually set the clock
rates.  It looks like it just enables and disables them.  I think the
clocks are all set via the device tree.  The 8MP datasheets list the
clock rates based on what they call 'nominal' and 'overdrive' which
determined by some SoC voltages.  600MHz seems reasonable for what NXP
states as Nominal.  I didn't see any NXP downstream voltage or cooling
options.

adam

>
> Nicolas
>
> >
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mp.dtsi
> > > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>=
;
> > > > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_=
BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > > -                       assigned-clock-parents =3D <&clk IMX8MP_V=
PU_PLL_OUT>;
> > > > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>=
, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > > +                       assigned-clock-parents =3D <0>, <&clk IMX=
8MP_VPU_PLL_OUT>;
> > > > >                         assigned-clock-rates =3D <600000000>, <60=
0000000>;
> > > >
> > > > I think there was a move to make the default be overdrive [1]  and =
[2]
> > > > and use a 'nominal' device tree for those who are not in overdrive
> > > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > > > values here should be 800MHz and if we should add the nominal value=
s
> > > > of 600MHz to the imx8m-nominal.dtsi file.
> > >
> > > You're right, Ahamd and Lucas did change this. I will adapt it later =
on.
> >
> > I updated my device tree to run in overdrive mode and ran fluster at
> > the higher rates:
> > VPU_G1 - 800MHz,
> > VPU-G2 - 700MHz
> > VPU-Bus - 800MHz
> >
> > ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 57/61 tests successfully               in 5.922 secs
> > (vs 7.059 secs at nominal speed)
> >
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 129/135 tests successfully               in 40.107 secs
> > (vs 45.741 secs at nominal speed)
> >
> > If you want, I can submit the clock updates I have for overdrive or
> > send them to you to save you some time.
> >
> > adam
> >
> > >
> > > Regards,
> > >   Marco

