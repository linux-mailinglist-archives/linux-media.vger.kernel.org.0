Return-Path: <linux-media+bounces-33488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 228CFAC5FD7
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 05:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3C93AF299
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 03:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1921DE4EF;
	Wed, 28 May 2025 03:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWfPuf7B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37E1C5D4B;
	Wed, 28 May 2025 03:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401537; cv=none; b=kUprHy7EfOM0yMR8XNKU/gEoFMLk8xKs88rJQfa6ibrOLfO3WpcHMrjO2CsoaXQgiWiWnF1LHOnonwFGDTNfNgjMyoGFNQW4oBetT3gbPnscFt3w7rKYYhuVYeFKmowL9mxrfbxX26W8fMptdjsYeQ+bZwMYoBoFajQI1V2lOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401537; c=relaxed/simple;
	bh=P4NoW3ykcOBCx61JzkfeuKAq1Yv3n1sxMGQ2EH9VqOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxssXA0mAvfVGExtsqN2J3C+tUiH38nJyaFF0IQXXyLxKBQumEE7Hy/SzTR9SBjjZUBrtWQ6Xtpg8AGR3odkj8SI2EmNUmu22Qli+6SbjUf3NB1MDutlAdkQQng7D4nK57vdUJAqvLZEu/5WaXP/nlPhv8Fo2KeulVgn9m20kF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWfPuf7B; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30e542e4187so2752384a91.3;
        Tue, 27 May 2025 20:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748401535; x=1749006335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=EWfPuf7BTjqds9ETG4srdJlyoPexcmMpHsT9O9HBa1inQxPMwWpOJNbygMuwksPb+D
         zjEhRNiyP/oyD20cD/62OmfbMt8M+7nRGkKkaUn/kLoXmZcqH98cO/42YcNc5tzcummf
         mh3HU7XHWpb//mF1sK8GIk1MjGMJmEpIDDmG0T7Ad1CAedBj4/kd3l29P4EzvqPWNe26
         7jUN2gPQ2GSNLAaQEZrKL4C7ObYTcUCdmvCN1rLcwyWFLceEJ+LkfFdf0iVs0n0J5DoT
         3R6mOST2fHEkZxtWCgU2b/LB3cs0Xi6Y9O/E3X4KluPsKMbzh7CE4Qt9qyxKVy0YfCjv
         r2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748401535; x=1749006335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=MrrM/S5evkORqaANYEe4GVN5v0atJbrQP5AGWgJExUYZzhHvT1NllEHE8tx63yaZ4H
         Zu5F8IIKbQ7WSxKBU3Fla/S1kJpxYqJlkpXK2yMcPlIGK+oDTlOXVu3uVxlJXDYQ74v0
         PKdIQkTdWZMZWnb8MVUe1rw07H7kDQ9ju/IkGupUMAMYb0lGSDCzsbJR+KDY+h7JotBr
         HA9CxJWOaspn27cta7vyUG15wlCF6WX0EeBoLYaK1reL+rB13Id0lkf0jViXKero0srX
         CqStKAiWYpXSV1bhFgtbRBzg5P3NOyvkU2g2cBA+on5mUI/eoaYks+dx4YNe94TlMMT9
         QhVA==
X-Forwarded-Encrypted: i=1; AJvYcCWIRKlLvecXwWZ0mPExQCeC66kKKW+9D8pSxnJPNy7SLKCXpFCBZkSDJBid4LNdw/iLHfWXRWZGuNaK@vger.kernel.org, AJvYcCWZ66UL4VjaAfm3B2ImSWMbiAtRJvx/XXnm1DpXmlVLmU7QGbDcsCInjXtHyP5xi3DU4ZM3KnftEiLgd/w5@vger.kernel.org, AJvYcCWz3oUSlOOHAZE0Ngct7/+EK+LdgxS5HjqZEwXsGwv6xzFti3IglnR3b8ytV3cRtIwWVcxA1bAfWeXrrkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEU1+Us27Ca9Cc/UVbh7/SvANot1bmCilRwOX58krdvcEfX3AD
	4kxmzKBdb6yjIL1pcTsZoZ6RlmqUfJXC+C5xFIR95pIXdVZbVljiCiFPOgmM5kJbWWXZh/Ljzt3
	p6Md8cDRxlpC/1MSr8UCUwVF45yRnQKw=
X-Gm-Gg: ASbGnct+dVMWCJ5/B7i5I8bRDO3IgNp+DpYxZ8MowAfl+EMef7fBK2tVO3y4rb6zRf7
	MfS76rr0FKsO/oUIYOHWtdWMIoIU5kKRgAYUeW9tGhN4/ijm9K0iPPWveCKzQlTA9GO01zIdeKO
	SS3IA/uo+p6695SY/1jlATBzMe8aRNfQKkxaT4V/dRxhI=
X-Google-Smtp-Source: AGHT+IEZ6LkUmKwlZlKmCgrqaa17DjFrtDszVlcH7RcGvuUieg+Ee25K0BY70YK/3VI5vchDvPkcpByMtCn4N3Ku04o=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr2330419a91.21.1748401535339; Tue, 27 May 2025
 20:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
In-Reply-To: <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 22:05:23 -0500
X-Gm-Features: AX0GCFu8yyPWk2ODj0OO3w1sV1GGZuj2FPHpU_Gczh74crcCq6_GDYUbvmDndvY
Message-ID: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
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

On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 25-05-02, Adam Ford wrote:
> > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > The VPU_PLL clock must be set before the VPU_BUS clock which is deriv=
ed
> > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MH=
z.

I did verify the current clock rate ends up at 300MHz instead of the
desired 600 or 800MHz, so we should do something.

> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 97b09b647ec7..7f4bdefb3480 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>=
, <&clk IMX8MP_VPU_PLL>;
> > > -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_P=
LL_OUT>;
> > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&=
clk IMX8MP_CLK_VPU_BUS>;
> > > +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_=
VPU_PLL_OUT>;
> > >                         assigned-clock-rates =3D <600000000>, <600000=
000>;
> >
> > I think there was a move to make the default be overdrive [1]  and [2]
> > and use a 'nominal' device tree for those who are not in overdrive
> > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > values here should be 800MHz and if we should add the nominal values
> > of 600MHz to the imx8m-nominal.dtsi file.
>
> You're right, Ahamd and Lucas did change this. I will adapt it later on.

I updated my device tree to run in overdrive mode and ran fluster at
the higher rates:
VPU_G1 - 800MHz,
VPU-G2 - 700MHz
VPU-Bus - 800MHz

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 5.922 secs
(vs 7.059 secs at nominal speed)

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 40.107 secs
(vs 45.741 secs at nominal speed)

If you want, I can submit the clock updates I have for overdrive or
send them to you to save you some time.

adam

>
> Regards,
>   Marco

