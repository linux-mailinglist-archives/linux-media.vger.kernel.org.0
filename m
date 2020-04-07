Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA821A0880
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgDGHke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:40:34 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38210 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgDGHkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:40:33 -0400
Received: by mail-ot1-f66.google.com with SMTP id t28so2129968ott.5;
        Tue, 07 Apr 2020 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wxx6OlhiR+h9ms32GkBM7ZWBPZ4G+uFx6VWz+Zv0PTA=;
        b=D9gztiIVWfLTyMwY9pRqGBK81vBdNlLpluKWmhYh0n69JJQ0RSrlPCzrCmGtfkygcp
         8wqCMEQ6VaUShxIpKWCiZlUx3+MqmfZ5UY0qoVnTwxE8A+4ZgECIh491lbEyvX18oGyT
         9DDSo0G0yhaasTNXbUhk8fk07SdBIYaAm4uvwfCaPf/dDhCiUbKqPWhnkjGn6MSz7dSQ
         AiaCuolC7Qv6FCYDHngg+kUPBv41ImdVWFsDFVV7Ani27T2lGgUtW+yVSeQpbZd6jb0T
         RRJKKU1J9HjCeVVfsgJJmnr43vBVc9Bc1GX+9W8ngaP0LNP39/nun/tEvngE/cJO+QJ3
         xC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wxx6OlhiR+h9ms32GkBM7ZWBPZ4G+uFx6VWz+Zv0PTA=;
        b=sVvcazyY8vq4YMAnOQS8v0s/R14AYv/3mueGfAJfTvI1tx7vK/JqXiWvsAVDsknYjf
         zCZtvpG9I6IzjeCvf1Nlvqn5gHZ10r1tVc2DyeE8ZyevAYGY5BX1aoUQsjBPYYGTWn26
         4TeJcxHSV9gFb81skTgKMzun+uenKp/9Bjyjl0soGCG+MgDVy/W+6CS6iCJHkt7qfqpr
         aqmSdwabWtgw055OiDK0Q7hswfdauG/aqRqbA6YEeakU6F23DoVXv9LHoJxcDArj4YlZ
         iD+FP3/YhA/QHls4+Y+hLZLqYkvEEKpbN0E+auRE3B0BI80IAKGFjTc7QMqL0lzHCO0D
         aj8A==
X-Gm-Message-State: AGi0PuY5AlY0SaGOjtNd8hNm+dU84gxz6+kN7pvKztWbGAxPuLJoLKwP
        uaAje+U2Cm7Ot7ZzvU4lSiuURW7B8efu/iCFB44=
X-Google-Smtp-Source: APiQypK8SGsEPq42GhfF0Dfe/vf+FBubxyorRMxV73nV35Eh0GJOOxbn8GdFE9fSkj1azHzzH6p7KtGVItJOhKwXWdM=
X-Received: by 2002:a9d:220e:: with SMTP id o14mr504851ota.88.1586245232626;
 Tue, 07 Apr 2020 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWiVLt23a0JBDX6ZiKDiru9-ecgt3XF4Y5qzVOWXhLcCw@mail.gmail.com>
In-Reply-To: <CAMuHMdWiVLt23a0JBDX6ZiKDiru9-ecgt3XF4Y5qzVOWXhLcCw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 7 Apr 2020 08:40:06 +0100
Message-ID: <CA+V-a8tHb1OomhfdsWV5duyuypTKC_EWT4o=mMjWVsxu+aOnBQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency dt-property
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thank you for the review.

On Tue, Apr 7, 2020 at 8:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Apr 6, 2020 at 6:43 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > 24MHz. So instead making clock-frequency as dt-property just let the
> > driver enforce the required clock frequency.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, still wondering about the "xvclk" name above and in the definition
> below.  Is this the naming from the datasheet?
> The DT bindings nor the driver use the "xvclk" naming.
>
xvclk naming is from the datasheet, although the 0v5645 datasheet on
publicly available I have referred [1]/[2].
If I am not wrong all the ov sensors have the same naming convention as xvclk.

[1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
[2] https://www.ovt.com/download/sensorpdf/126/OmniVision_OV5645.pdf

Cheers,
--Prabhakar

> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -61,6 +61,8 @@
> >  #define OV5645_SDE_SAT_U               0x5583
> >  #define OV5645_SDE_SAT_V               0x5584
> >
> > +#define OV5645_XVCLK_FREQ              24000000
> > +
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
