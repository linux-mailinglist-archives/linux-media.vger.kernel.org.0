Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 876D31A086B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgDGHgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:36:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35716 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgDGHgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:36:46 -0400
Received: by mail-ot1-f68.google.com with SMTP id v2so2136585oto.2;
        Tue, 07 Apr 2020 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXkFKK0nBYOjUan987EYuLjdzpEpfg2o9ahd6UADeAM=;
        b=qVlGe6IVUK5d+MeTkjvvVNqA01YUQYDIfau+P2843flDckaJGhAAGphCCUVY48NpV1
         zOBmqIUAIIOh1d+nEi4tgqLbws2/5KtESiEZoyq03SKkA/DyCt0i+BGcmCAj848JscnE
         IsUEEsvrh7efftHE4LzY3tfEq89fvTbdu00JKh/FlKrVp4Av6SVY6qsm1BKpDLxyrPk4
         JVRDIkYBdLRotogkW57VWTW0/zeg065JlstGIq8fSNInXip5woEf6Uuwt5I9hpzptriS
         xeOkHj8gFW3cJd1rpX9OoK/SV8+IwtQYM/TPoVvbd1QX/dzABm9kyRe8OrKU2s/XyrY6
         VAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXkFKK0nBYOjUan987EYuLjdzpEpfg2o9ahd6UADeAM=;
        b=STHBWWZDr8T+ZsqWDfkOBuj0rutTHQNJAIuqwbe+XdyIzfyc0kSd0fcC91bz1tBwxu
         vOHFYHzWCVI4F9f1ouY8Oz66aCJ+Q6c1uCukQmX+BGmIdssR5RG66of/LMV2pbdrnTHZ
         HU0fDrUG0yBolWhhAf5g1euKKsGQefMzECE99yCr/Sp8DGODDQHLbxd0/UMnnks8MlzN
         rSKwcbq8Uf2e6ONB31jLfYq3jthhD5nIP1CJYaO//BcLvIjnbdZOjSfjtywQnJvlqi1t
         dYRsGhywY+1Ebrx3UFzmdVukEdLBNBXeHZchqsC6KqDYpNbncgqKOABKY2KuGkS7vLGt
         XPgg==
X-Gm-Message-State: AGi0PuZlrSdeKiE2F1CYbr+X3h1/5yJuzHHySBVQFh9dTh5yCwFTVjAo
        mFEAvf6CqYVGPRToiZhi8pZMb37IeY4uJQ9SyUs=
X-Google-Smtp-Source: APiQypJqyGDzl5VXE9Pp5Imd+j7wp2mMXSOcontkXnZYyqlWKTlr+lV+SmLAlDscNrlVYewbyYf/dBRu+iPg9yHiALI=
X-Received: by 2002:a4a:7555:: with SMTP id g21mr840337oof.46.1586245005099;
 Tue, 07 Apr 2020 00:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200406173425.GE16885@pendragon.ideasonboard.com>
In-Reply-To: <20200406173425.GE16885@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 7 Apr 2020 08:36:19 +0100
Message-ID: <CA+V-a8tmj0SDpJWPL1B3GQ6FA=fLN-4-oCj5p4L0vAZSBg29vw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency dt-property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Mon, Apr 6, 2020 at 6:34 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> > Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > 24MHz. So instead making clock-frequency as dt-property just let the
> > driver enforce the required clock frequency.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index a6c17d15d754..52848fff8a08 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -61,6 +61,8 @@
> >  #define OV5645_SDE_SAT_U             0x5583
> >  #define OV5645_SDE_SAT_V             0x5584
> >
> > +#define OV5645_XVCLK_FREQ            24000000
> > +
> >  /* regulator supplies */
> >  static const char * const ov5645_supply_name[] = {
> >       "vdddo", /* Digital I/O (1.8V) supply */
> > @@ -1094,25 +1096,19 @@ static int ov5645_probe(struct i2c_client *client)
> >               return PTR_ERR(ov5645->xclk);
> >       }
> >
> > -     ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> > +     ret = clk_set_rate(ov5645->xclk, OV5645_XVCLK_FREQ);
> >       if (ret) {
> > -             dev_err(dev, "could not get xclk frequency\n");
> > +             dev_err(dev, "could not set xclk frequency\n");
> >               return ret;
> >       }
> > -
>
> I think you can keep the blank line here.
>
Oops my bad will drop that in next version.

Cheers,
--Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >       /* external clock must be 24MHz, allow 1% tolerance */
> > +     xclk_freq = clk_get_rate(ov5645->xclk);
> >       if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> >               dev_err(dev, "external clock frequency %u is not supported\n",
> >                       xclk_freq);
> >               return -EINVAL;
> >       }
> >
> > -     ret = clk_set_rate(ov5645->xclk, xclk_freq);
> > -     if (ret) {
> > -             dev_err(dev, "could not set xclk frequency\n");
> > -             return ret;
> > -     }
> > -
> >       for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
> >               ov5645->supplies[i].supply = ov5645_supply_name[i];
> >
>
> --
> Regards,
>
> Laurent Pinchart
