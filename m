Return-Path: <linux-media+bounces-26749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D216A411E6
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F9811894728
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2B723F439;
	Sun, 23 Feb 2025 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts6My25l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BC20ADF8;
	Sun, 23 Feb 2025 21:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345708; cv=none; b=vF+UMI9h2MZ6Oa2LjJXeyCYb2KgIEWwvk3BNUJIN3X6uiZONW3W4Aq080N0AxuMvbObCGyxDvnxjbeXUAPznNBYq8xvZTaWZZf2QmVCHdIHGK+D2dC7AVKb5Uaomn5j0S6IrQaUDSgj5tnndZZH7i+OSJcdFvMvqscpt3ItBTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345708; c=relaxed/simple;
	bh=4MPyHLg1PUiEgT+/eV9nkN34BEBnWtZpbAaAvTGCLSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnur+VEQA9SQD2hkas0quuZx1s32242HXIH6iMA29sjFsQ4OEKwFy4Vj5Wig6Bz9SC6muXXgvutghFNh0tnE6gpDlOD4BC5Y0BJLtgtm3t8nswsub59yxOd08OSCnoLC5aOBRV/e3GMhwyENjUOFQqqS4mO/lfGidnh/uGtfU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts6My25l; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2771985e0c.3;
        Sun, 23 Feb 2025 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740345705; x=1740950505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBuXrfUVfKwZXTUYtgJPlx2Gd+bNM+T6uLhpE4q8yOQ=;
        b=Ts6My25lMA8ZMkCybd6RPHqH1CPdiKSaUv9j35JOAHIRlPJCh9yiWlzM8XY0cN5dMM
         SW5wTnBF45/M7uFqVkMhoOoKI//F1Y4zh4LzAiv+LSlqv4nK1z5lbIO+oyJOTf2sc+SH
         GuaZvKuC0+O3Hm/3VFGawevNE/Xgnlcwe57yG8pmTXSUSNA+U4K5LKE4g4xV2K2JCIhN
         wNVyaEHfZ1MhXrQ9MWCalcuM74i+tCgLOH6dT3Ej9zt5ZBwYcE8H7V/NF36ODTkw5eql
         3wgjONxrUnzRGaMYufWRSxfGu25uo8yKBk1b2RBCkR5iQYGrsxk8umC9qTWxXQTpRG4Y
         4vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740345705; x=1740950505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBuXrfUVfKwZXTUYtgJPlx2Gd+bNM+T6uLhpE4q8yOQ=;
        b=rLuO1Z0rLAo4GRSfAXZd+UVj+s+tKM0UZRsoqtQ9erghg5EjNsgzYg5HKrD7bEe0pR
         gJ04WGshL6bQa6Ft85SXDiJ16jVs8Ip9HyvwWOh+IfnuDVG6m/TXGq0h+god8wNKR8CB
         6pitldxTq0p550q0R1bpBDDY2Fp1Ay1TJFPkhghQ+rXVGHouW6Ann+ADBJPVd03iZPX0
         LstfjhLtsamgEVD0KMVJ3PbYxPV7qdqWGo9DNYmKtwtc28t7ua1vaNxvn5ooWFDX29WR
         cQa8BeqLhmK4Geqnk6bdaGOeOi6wRjk1R5dNM6/XTKC8ksc7LQvlynOehpPWVs2j4Ixq
         QNGw==
X-Forwarded-Encrypted: i=1; AJvYcCVYGrfXM+QJByBLMlJ/DwY89CUIRWp5CES6Bxpc1DnORR4Fmtzrk7p0IfbBhjRNdX11yFA4cCfuohRW9pOP3WkyVqg=@vger.kernel.org, AJvYcCWPrK47UE0Ut+NQdXWdTOqS1s8cigZmBfkFdeGpcmraP2bnmebvEM3n6BW4tU0fWBnGzQ07XS2Pi99utds=@vger.kernel.org, AJvYcCWoxTB62vI5PAJec2mgc+nIgcIM38p5ygae6ioLoVrG1VuqKeDVwBlfozav2p4//1OC1hjEDNZb5B2o4UAb@vger.kernel.org, AJvYcCXG7d+rkPUN2vIp35ki8NgFW1j5YWYeWv4B0xLoaak/vPw5s7C7Hx2Jz2i9iXw17S8Vy6iZxrEc+ief@vger.kernel.org
X-Gm-Message-State: AOJu0YyzUZJ10GgXFq2P/WXGiyrQuuusIDvCcpVa8dLUWiLKxE3uT8FD
	iTvdTqvnuQPT6xkOk8LfQmbwf3TG20K+FfzqE+huVjuU8EUUkxo5bb+IaAiw2koYU4QVzOZXjho
	dagdF9yI/ytkiTo4XnISC6cqdq3c=
X-Gm-Gg: ASbGnctvd6dImDClS4aDDkcmxp8BoTfSfLPak0XAtjvpef74yPiYrzq0tBk50tY/X2H
	7kWugkJxdMaaKYUtoGhfICxJ/Zqqz+Se5WxRd2oRyWZR2gyE4qDaI/nLINQgznh675iWEhWx6Lb
	Mk8l3K7/Tn9m2HmMooNFgay4yw7X0kM1ZVhFOrsCuf
X-Google-Smtp-Source: AGHT+IEOs/xQxx2Tg76N4mJB7eD4q9K5mp6fsTe/dqlBC7qgszPTQemqpVKxg6o6oFTTe/Imh33pW0u1H2BiXvQlViI=
X-Received: by 2002:a05:6122:6589:b0:520:64ea:c474 with SMTP id
 71dfb90a1353d-521efbb5975mr5325014e0c.5.1740345705375; Sun, 23 Feb 2025
 13:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-9-tommaso.merciai.xr@bp.renesas.com> <20250223181754.GC8330@pendragon.ideasonboard.com>
In-Reply-To: <20250223181754.GC8330@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 21:21:18 +0000
X-Gm-Features: AWEUYZmsnButfBYwSu61ebuC9L_6y38ami8pS7K43TCQiuqIXpWn5k8A5Gu7hGo
Message-ID: <CA+V-a8sMLC6f2-1tL9cRdLLPsJtv82TiW8MzJ5+1QKnppCSJ_A@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] media: rzg2l-cru: csi2: Introduce SoC-specific
 D-PHY handling
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Sun, Feb 23, 2025 at 6:18=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tommaso,
>
> Thank you for the patch.
>
> On Fri, Feb 21, 2025 at 04:55:22PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for the RZ/V2H(P) SoC, where the D-PH=
Y
> > differs from the existing RZ/G2L implementation, introduce a new
> > rzg2l_csi2_info structure. This structure provides function pointers fo=
r
> > SoC-specific D-PHY enable and disable operations.
> >
> > Modify rzg2l_csi2_dphy_setting() to use these function pointers instead=
 of
> > calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly=
.
> > Update the device match table to store the appropriate function pointer=
s
> > for each compatible SoC.
> >
> > This change prepares the driver for future extensions without affecting
> > the current functionality for RZ/G2L.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 4ccf7c5ea58b..3a4e720ba732 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -107,6 +107,7 @@ struct rzg2l_csi2 {
> >       void __iomem *base;
> >       struct reset_control *presetn;
> >       struct reset_control *cmn_rstb;
> > +     const struct rzg2l_csi2_info *info;
> >       struct clk *sysclk;
> >       struct clk *vclk;
> >       unsigned long vclk_rate;
> > @@ -123,6 +124,11 @@ struct rzg2l_csi2 {
> >       bool dphy_enabled;
> >  };
> >
> > +struct rzg2l_csi2_info {
> > +     int (*dphy_enable)(struct rzg2l_csi2 *csi2);
> > +     int (*dphy_disable)(struct rzg2l_csi2 *csi2);
> > +};
>
> Unless you'll need to add non-function fields later, I'd name the
> structure rzg2l_csi2_phy_ops.
>
As based on the feedback on patch 09/18 I will keep the struct name as is.

> > +
> >  struct rzg2l_csi2_timings {
> >       u32 t_init;
> >       u32 tclk_miss;
> > @@ -360,9 +366,9 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subd=
ev *sd, bool on)
> >       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
> >
> >       if (on)
> > -             return rzg2l_csi2_dphy_enable(csi2);
> > +             return csi2->info->dphy_enable(csi2);
> >
> > -     return rzg2l_csi2_dphy_disable(csi2);
> > +     return csi2->info->dphy_disable(csi2);
> >  }
> >
> >  static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> > @@ -772,6 +778,10 @@ static int rzg2l_csi2_probe(struct platform_device=
 *pdev)
> >       if (!csi2)
> >               return -ENOMEM;
> >
> > +     csi2->info =3D of_device_get_match_data(dev);
> > +     if (!csi2->info)
> > +             return dev_err_probe(dev, -EINVAL, "Failed to get OF matc=
h data\n");
> > +
> >       csi2->base =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(csi2->base))
> >               return PTR_ERR(csi2->base);
> > @@ -890,8 +900,16 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops =
=3D {
> >                      rzg2l_csi2_pm_runtime_resume, NULL)
> >  };
> >
> > +static const struct rzg2l_csi2_info rzg2l_csi2_info =3D {
> > +     .dphy_enable =3D rzg2l_csi2_dphy_enable,
> > +     .dphy_disable =3D rzg2l_csi2_dphy_disable,
> > +};
>
> I'd recommend moving this just below the definition of the
> rzg2l_csi2_dphy_enable() function.
>
Ok.

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +
> >  static const struct of_device_id rzg2l_csi2_of_table[] =3D {
> > -     { .compatible =3D "renesas,rzg2l-csi2", },
> > +     {
> > +             .compatible =3D "renesas,rzg2l-csi2",
> > +             .data =3D &rzg2l_csi2_info,
> > +     },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
>
> --
> Regards,
>
> Laurent Pinchart
>
Chers,
Prabhakar

