Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059E518A881
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 23:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgCRWmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 18:42:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42704 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgCRWmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 18:42:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id a2so374194otq.9;
        Wed, 18 Mar 2020 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xmDtlPZZt6AhkIa9RNZ63X94d3qxtY/pBeuqTxtM6B8=;
        b=b7nNzbOXPtnvlE3gG1PJ0B6/TDG5+2bsj66N8oWRaWt+djk+gNRA8ueaW1TI6ofTIi
         Dv3DBijbD4E6cWOZT9jT7J2AjcCLp7qxEdmfvs35qp8VSBkLgeuD7+FdXReOQHsFlulT
         tFICkBCaM3fwRoF8rlvtkXP6Jgt0PQIxVv0vzYdfigRS+BQVKMCSxh9/JIDU4vpW7wTk
         Lv+O5O31N0BTBOeJVK60H5HnMazVMh1LWfXvZisI5fNIw4fuM8B9IM0DWcgt2K6npEJS
         MenqtwxHDFLS3kjlniGTDeld7jBtod/fnDZiAm6H9yD9AvqFuY6Pz+akI9ujCi6cNBKo
         Sc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xmDtlPZZt6AhkIa9RNZ63X94d3qxtY/pBeuqTxtM6B8=;
        b=cCgpZz7yBYArzXHINuwD4MoJtaycC9ukp53GHLXTomwEB0ZWgr7lF93lhJYGr+alQy
         6jQBtxh2+U0xNfh8TV57wVhmZY3t4A/cPB8K/xL87tWO/TpkAlrKNaTGHVMRkYoerDOs
         mN1dVCbpMKh/lis75fghfbSe0Z6wEB+B9TPds8Y2DTKNSvcT/RLXySLp2N3nN3KAH4Ps
         UH1xHYjbSLjAgreWqx5paaNtma9rs66rM3r//uLq82DIVdG3Rl2ORi1WhQ7/Gx7Xatrc
         rPn6yTGQLmCzPTy/U8fet/JLyFk3LACF36t8/+5ShDKaxajo/M/4c5ggH6LX1WfABDZW
         Y8LA==
X-Gm-Message-State: ANhLgQ2jXkJmWqkjg6X7/gRWUnt6NkC8ZsgRHMMKNi1RwfQ/jVToMFd/
        qa9RSqGJm0igCc9InI+ZK93EEr31gHIXjpZ+pZc=
X-Google-Smtp-Source: ADFU+vsvjgAClOIMqrGGIb7SpXqS1gb1iFF33qVcEpJgyK0wGZvK+9LgyP8Z7Vpzi0hvGvTCOziEP0Qb1UkSCWhgSCQ=
X-Received: by 2002:a9d:6ac6:: with SMTP id m6mr6155284otq.198.1584571343441;
 Wed, 18 Mar 2020 15:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212345.GM4751@pendragon.ideasonboard.com> <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 18 Mar 2020 22:41:57 +0000
Message-ID: <CA+V-a8t-rA-6AmZry63QeXN6pvGWVtcEEuHaDA1jsS-x+30oiQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 13, 2020 at 9:31 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Hi Laurent,
>
> Thank you for the review.
>
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 13 March 2020 21:24
> > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Shawn Guo
> > <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Rob Herring
> > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Sakari
> > Ailus <sakari.ailus@linux.intel.com>; NXP Linux Team <linux-imx@nxp.com=
>;
> > Magnus Damm <magnus.damm@gmail.com>; Ezequiel Garcia
> > <ezequiel@collabora.com>; Geert Uytterhoeven <geert@linux-m68k.org>;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-renesas=
-
> > soc@vger.kernel.org; Fabio Estevam <festevam@gmail.com>; linux-
> > media@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
> > external clock frequency to 24480000
> >
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > On Fri, Mar 13, 2020 at 09:12:33PM +0000, Lad Prabhakar wrote:
> > > While testing on Renesas RZ/G2E platform, noticed the clock frequency
> > > to be 24242424 as a result the probe failed. However increasing the
> > > maximum leverage of external clock frequency to 24480000 fixes this
> > > issue. Since this difference is small enough and is insignificant set
> > > the same in the driver.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov5645.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index 4fbabf3..b49359b 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -1107,8 +1107,10 @@ static int ov5645_probe(struct i2c_client *cli=
ent)
> > >  }
> > >
> > >  xclk_freq =3D clk_get_rate(ov5645->xclk);
> > > -/* external clock must be 24MHz, allow 1% tolerance */
> > > -if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > > +/* external clock must be 24MHz, allow a minimum 1% and a
> > maximum of 2%
> > > + * tolerance
> >
> > So where do these numbers come from ? I understand that 2% is what you
> > need to make your clock fit in the range, but why -1%/+2% instead of -
> > 2%/+2% ? And why not 2.5 or 3% ? The sensor datasheet documents the
> > range of supported xvclk frequencies to be 6MHz to 54MHz. I understand
> > that PLL parameters depend on the clock frequency, but could they be
> > calculated instead of hardcoded, to avoid requiring an exact 24MHz inpu=
t
> > frequency ?
> >
> To be honest I don't have the datasheet for ov5645, the flyer says 6-54Mh=
z but the
> logs/comment says 24Mhz.
>
Comparing to ov5640 datasheet [1] (which I am assuming might be
similar to ov5645), this change should affect the driver.

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datashe=
et.pdf

Cheers,
--Prabhakar

> Cheers,
> --Prabhakar
>
> > > + */
> > > +if (xclk_freq < 23760000 || xclk_freq > 24480000) {
> > >  dev_err(dev, "external clock frequency %u is not
> > supported\n",
> > >  xclk_freq);
> > >  return -EINVAL;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
> Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jau=
ch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10=
, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseld=
orf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./=
WEEE reg. no.: DE 14978647
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
