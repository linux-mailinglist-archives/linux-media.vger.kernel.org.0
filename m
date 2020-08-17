Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605732465E1
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 14:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgHQMCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 08:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgHQMCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 08:02:06 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9327FC061389;
        Mon, 17 Aug 2020 05:02:06 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id i10so9250222ybt.11;
        Mon, 17 Aug 2020 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxRidtqTJZxsnyP/VJcn7SNgQ0dz+XTTIf17qAFdPJc=;
        b=awhBwa2aT6BRqhVtTQ5nnJElwmFFZra1onE01YkKxV/aBUSDSyxC1qh8yTtxqPwh1Y
         pDsHFnyvgSFr0fPC7uRN+j6r69z534HiB1Dltue1fXDweD3HPi8cyAkkcZM9jimTDMef
         ApJ3Xr3rWj6MBdqWYMt0Y7ic6tl6PuEsvUAx/n12DsVKSzCf92ldUPe+eVvjULttUnGN
         MwmM4VBfjcie6wnbUCNXzPUWLWlK0fJsgai4Scdqti0J1EMNpLoY2ZR7xj/Ol49AiKL4
         ocYUJGjxOioM3QzhdfeAYJSqRa6VBSG9bfYJ3kW0nvdU8vfCc07RjCLU4TOkelSXJZG8
         G2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxRidtqTJZxsnyP/VJcn7SNgQ0dz+XTTIf17qAFdPJc=;
        b=ddrEX5GZOoJT+s+ZlUk+eAd6sqXlDpjbK6D6K7OWbli0ksDAnj5FsAf907Am0HCP8o
         sqcCsxpB1vNusdGhDL4ruMUACZ/iSHNDfxzZubS0UxbfLsNJ4Pv+UETzeUfCvfcCS4A0
         rbCqRNPhJj5UxWNadHnAsla5+HY8r2V4DFQLYEIkN+D6Nj14B88PEMe0+41X783gpdwI
         6m+l4g5sYwzA/KvZvokOwgXfcVdmcBy0alkmLbxwjuNewj6Ura5n9kNJ+zKWvUawaM9L
         b3NoVbeD0LQ/pEFRg4UyeVkKDCOLMpz6LY60EEq6WbIV+GdEd/pTgxL982itfRqeNVQT
         lLyQ==
X-Gm-Message-State: AOAM532dM8bJse3tvvYrBUJ3c0lgteKQhpU6Cz6XgStCmniR1EGze8EK
        7fk9BUMR8tDBPY30151AUyIgb9L7WBj60bMNXI0=
X-Google-Smtp-Source: ABdhPJzms5oyfzBddhiXIrnkMH3VJAH4rKNcaynQbHrGDBdR4XoCCNXSlnaOFiFrynU3r0QU4+rlXq8699aOgeWlW8g=
X-Received: by 2002:a25:86cf:: with SMTP id y15mr2007481ybm.25.1597665725063;
 Mon, 17 Aug 2020 05:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sjxL-rbYAti8Djj2ch2+Zf+88_wNjbZHzKVBB66aZJ0g@mail.gmail.com> <20200817081138.dog5lhpmszbu2mgc@uno.localdomain>
In-Reply-To: <20200817081138.dog5lhpmszbu2mgc@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 17 Aug 2020 13:01:38 +0100
Message-ID: <CA+V-a8ur7cODjXAe1s+jLSd4G9je3YR_Tr6B4mPvB4tWOCna7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: ov772x: Document endpoint properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 9:07 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello Prabhakar,
>
> On Sat, Aug 15, 2020 at 11:34:33AM +0100, Lad, Prabhakar wrote:
> > Hi Jacopo,
> >
> > On Mon, Aug 3, 2020 at 12:39 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > Document endpoint properties required for parallel interface
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ov772x.txt     | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > I see you already have a patch for YAML conversion for OV772x binding
> > [1], if you plan to post a v2 would you be OK to pick these changes as
> > part of your conversion changes ?
>
> Sure thing, I'll add the following properties to the series!
>
Thank you Jacopo. I'll get on with the v3 version of the series.

Cheers,
Prabhakar

> Thanks
>   j
>
> >
> > [1] https://www.spinics.net/lists/linux-media/msg173201.html
> >
> > Cheers,
> > Prabhakar
> >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > index 0b3ede5b8e6a..1f4153484717 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > @@ -21,6 +21,22 @@ subnode for its digital output video port, in accordance with the video
> > >  interface bindings defined in Documentation/devicetree/bindings/media/
> > >  video-interfaces.txt.
> > >
> > > +Endpoint node required properties for parallel connection are:
> > > +- remote-endpoint: a phandle to the bus receiver's endpoint node.
> > > +- bus-width: shall be set to <8> for 8 bits parallel bus
> > > +            or <10> for 10 bits parallel bus
> > > +- data-shift: shall be set to <2> for 8 bits parallel bus
> > > +             (lines 9:2 are used) or <0> for 10 bits parallel bus
> > > +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > > +               (Not required for bus-type equal 6)
> > > +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> > > +               (Not required for bus-type equal 6)
> > > +- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> > > +              signal. (Not required for bus-type equal 6)
> > > +- bus-type: data bus type. Possible values are:
> > > +           5 - Parallel
> > > +           6 - Bt.656
> > > +
> > >  Example:
> > >
> > >  &i2c0 {
> > > --
> > > 2.17.1
> > >
